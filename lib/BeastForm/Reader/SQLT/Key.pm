use 5.006;    # our
use strict;
use warnings;

package BeastForm::Reader::SQLT::Key;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use BeastForm::Key;
use Hash::Ordered;

with 'BeastForm::Role::Process';

has in_constraint => ( is => 'ro', default => undef );
has in_field      => ( is => 'ro', default => undef );
has table         => ( is => 'ro', required => 1, weak_ref => 1 );

sub _go_constraint {
  my ($self) = @_;
  BeastForm::Key->new(
    table => $self->table,
    fields => Hash::Ordered->new(
      map (
        $_ => $self->table->field($_)
      ) $self->in_constraint->field_names
    )
  );
}

sub _go_field {
  my ($self) = @_;
  my $fname = $self->in_field->name;
  BeastForm::Key->new(
    table => $self->table,
    fields => Hash::Ordered->new(
      $fname => $self->table->field($fname),
    )
  );
}

sub go {
  my ($self) = @_;
  $self->in_constraint ? $self->_go_constraint : $self->_go_field;
}

sub BUILDARGS {
  my ($class, %args) = @_;
  my %copy = %args;
  die("You must provide either 'in_constraint' or 'in_field' but not both. Got: both.\n")
    if $args{in_constraint} && $args{in_field};
  die("You must provide either 'in_constraint' or 'in_field'. Got: neither.\n")
    if !$args{in_constraint} and !$args{in_field};
  return {%copy};
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT::Key

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
