use strict;
use warnings;

package DBIx::BeastForm::Role::Builder;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo::Role;

has schema => ( is => 'ro', required => 1 );
requires qw(_table _view _procedure _trigger _pre _post);

sub build {
  my ($self) = @_;
  $self->_pre;
  $self->_table($self->schema->get_table($_))
    foreach $self->schema->get_tables;
  $self->_view($_)
    foreach $self->schema->get_views;
  $self->_procedure($_)
    foreach $self->schema->get_procedures;
  $self->_trigger($_)
    foreach $self->schema->get_triggers;
  $self->_post;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::Role::Builder

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
