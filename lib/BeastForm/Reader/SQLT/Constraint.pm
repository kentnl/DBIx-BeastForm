package BeastForm::Reader::SQLT::Constraint;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use BeastForm::Key;
use BeastForm::Check;
use BeastForm::FK;
use Hash::Ordered;

has table => ( is => 'ro', required => 1 );
has in_constraint => (
  is => 'ro', required => 1,
  handles => [ qw( type ) ],
);

sub _fields {
  my ($self) = @_;
  my $h = Hash::Ordered->new(
    map {
      $_->name => BeastForm::
    } $self->_in_constraint->fields
  );
}
sub _pk {
  BeastForm::Key->new(
    table => $self->table,
    fields => $self->fields,
    unique => 1,
  );
}
sub _unique {
  BeastForm::Key->new(
    table => $self->table,
    fields => $self->fields,
    unique => 1,
  );
}
sub _check {
  BeastForm::Check->new(
    table => $self->table,
    fields => $self->fields,
  );
}
sub _fk {
  BeastForm::FK->new(
    from => BeastForm::Key->new(
      table => $self->table,
      fields => $self->fields,
      # This could feasibly be unique if you're doing funky things with 1-1 joins`
      unique => 0,
    ),
    to => BeastForm::Key->new(
      table => $self->table,
      fields => $self->fields,
      unique => 1, # Well, I bloody hope so or your database is shit
    ),
  );
}
sub _not_null {
  die("I have no idea how you got here. Please file a bug");
}
sub go {
  my ($self) = @_;
  return $self->_pk if $self->type eq 'PRIMARY_KEY';
  return $self->_unique if $self->type eq 'UNIQUE';
  return $self->_check if $self->type eq 'CHECK_C';
  return $self->_fk if $self->type eq 'FOREIGN_KEY';
  return $self->_not_null if $self->type eq 'NOT_NULL';
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT::Constraint

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
