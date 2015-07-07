use 5.006;    # our
use strict;
use warnings;

package BeastForm::Reader::SQLT::Proc;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use BeastForm::Proc;

with 'BeastForm::Role::Process';

has in_proc => (
  is => 'ro', required => 1,
  handles => [ qw( sql name order owner comment params ) ],
);
has in_schema => ( is => 'ro', required => 1 );

sub go {
  my ($self) = @_;
  BeastForm::Proc->new(
    sql  => $self->sql,  order => $self->order, comment => $self->comment,
    name => $self->name, owner => $self->owner, params  => [$self->params],
  );
}
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT::Proc

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
