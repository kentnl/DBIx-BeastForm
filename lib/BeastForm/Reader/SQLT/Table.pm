package BeastForm::Reader::SQLT::Table;

use Moo;
use BeastForm::Reader::SQLT::Field;
use BeastForm::Table;
use Hash::Ordered;

with 'BeastForm::Role::Process';

has in_table  => (
  is => 'ro', required => 1,
  handles => [ qw( name ) ],
);
has in_schema => ( is => 'ro', required => 1 );
has fields => ( is => 'lazy' );

sub pk {
  my ($self) = @_;
  Hash::Ordered->new(
    map (
      $_ => $self->fields->get($_)
    ), $self->in_table->pkey_fields
  );
}
sub fks {
  my ($self) = @_;
  # TODO: 
  # my @fields = $self->table->fkey_fields;
  # my @constraints = $self->table->fkey_constraints;
  # return (\@fields, \@constraints);
}
sub uniques {
  my ($self) = @_;
  # my @fields = $self->table->unique_fields;
  # my @constraints = $self->table->unique_constraints;
  # return [\@fields, \@constraints];
}
sub indices {
  my ($self) = @_;
#  $self->table->get_indices;
}
sub _build_fields {
  my ($self) = @_;
  Hash::Ordered->new(
    map @{$_},
    sort { $a->[0] cmp $b->[0] }
    map [
      $_ => BeastForm::Reader::SQLT::Field->new(
        in_field => $self->in_table->get_field($_), table => $self,
      )->go
    ], ($self->in_table->pkey_fields, $self->in_table->data_fields)
  );
}

sub go {
  my ($self) = @_;
  BeastForm::Table->new(
    pk => $self->pk, fields => $self->fields, name => $self->name,
#    uniques => $self->uniques, indices => $self->indices, fks => $self->fks
  );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT::Table

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
