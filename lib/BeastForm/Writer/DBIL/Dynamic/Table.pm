use 5.006;    # our
use strict;
use warnings;

package DBIx::BeastForm::Writer::DBIL::Dynamic::Table;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

# ABSTRACT: Configures a table in the DBIx::Lite Schema

use Moo;

with 'DBIx::BeastForm::Role::Writer::Table';

has table => ( is => 'lazy' );

sub _build_table {
  my ($self) = @_;
  $self->schema->table($self->in_table->name);
}

sub pk {
  my ($self, @fields) = @_;
  $self->table->_set_primary_key(map $_->name, @fields);
}

sub fks {
  my ($self, $fk_fields, $fk_constraints) = @_;
  foreach my $f (@$fk_fields) {}
  foreach my $f (@$fk_constraints) {}
}

sub uniques {
  my ($self, $unique_fields, $unique_constraints) = @_;
}

sub indices {
  my ($self, @indices) = @_;
}

sub fields {
  my ($self, @fields) = @_;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::Writer::DBIL::Dynamic::Table - Configures a table in the DBIx::Lite Schema

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
