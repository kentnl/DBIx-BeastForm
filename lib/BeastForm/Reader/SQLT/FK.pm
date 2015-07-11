use 5.006;    # our
use strict;
use warnings;

package BeastForm::Reader::SQLT::FK;

use Moo;
use BeastForm::FK;
use BeastForm::Fieldset;
use BeastForm::Key;
use Hash::Ordered;
use Data::Dumper 'Dumper'; # REMOVEME

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

with 'BeastForm::Role::Process';

has in_constraint => (is => 'ro', required => 1);

has schema  => ( is => 'ro', required => 1 );

sub _from {
  my ($self) = @_;
  my $from = $self->schema->table($self->in_constraint->table->name);
  my $fields = Hash::Ordered->new;
  foreach my $f (sort $self->in_constraint->field_names) {
    $fields->set($f, $from->field($f));
  }
  BeastForm::Fieldset->new(
    table => $from,
    fields => $fields,
  );
}

sub _to {
  my ($self) = @_;
  my $to = $self->schema->table($self->in_constraint->reference_table);
  my $fields = Hash::Ordered->new;
  foreach my $f (sort $self->in_constraint->reference_fields) {
    $fields->set($f, $to->field($f));
  }
  BeastForm::Key->new(
    table => $self->schema->table($self->in_constraint->table),
    fields => $fields,
  );
}

sub _on_delete {
  my ($self) = @_;
  my $od = $self->in_constraint->on_delete;
  ($od =~ /\Ano action\Z/i) ? '' : $od;
}

sub _on_update {
  my ($self) = @_;
  my $ou = $self->in_constraint->on_update;
  ($ou =~ /\Ano action\Z/i) ? '' : $ou;
}

sub go {
  my ($self) = @_;
  BeastForm::FK->new(
    from => $self->_from,
    to => $self->_to,
    on_delete => $self->_on_delete,
    on_update => $self->_on_update,
  );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT::FK

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
