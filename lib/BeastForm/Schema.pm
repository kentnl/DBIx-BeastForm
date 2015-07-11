use 5.006;    # our
use strict;
use warnings;

package BeastForm::Schema;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

# ABSTRACT: Everything useful we know about a schema

use Moo;

# This we'll take immediately

has name     => ( is => 'ro', required => 1 );

# These will be modified during build

has procs    => ( is => 'ro', default => sub { Hash::Ordered->new; } );
has views    => ( is => 'ro', default => sub { Hash::Ordered->new; } );
has tables   => ( is => 'ro', default => sub { Hash::Ordered->new; } );
has triggers => ( is => 'ro', default => sub { Hash::Ordered->new; } );







sub table {
  my ($self, $name) = @_;
  $self->tables->get($name);
}







sub view {
  my ($self, $name) = @_;
  $self->views->get($name);
}







sub proc {
  my ($self, $name) = @_;
  $self->procs->get($name);
}







sub trigger {
  my ($self, $name) = @_;
  $self->triggers->get($name);
}

# DELIBERATELY UNDOCUMENTED TO PRESERVE THE ILLUSION OF IMMUTABILITY
# (People will not think through the consequences of abuse)

sub _add_table {
  my ($self, $t) = @_;
  $self->tables->set($t->name, $t);
}
sub _add_view {
  my ($self, $v) = @_;
  $self->views->set($v->name, $v);
}
sub _add_proc {
  my ($self, $p) = @_;
  $self->procs->set($p->name, $p);
}
sub _add_trigger {
  my ($self, $t) = @_;
  $self->triggers->set($t->name, $t);
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Schema - Everything useful we know about a schema

=head1 VERSION

version 0.000001

=head1 $s->table($name) -> BeastForm::Table | undef

Retrieves the named table from the schema and returns it

=head1 $s->view($name) -> BeastForm::View | undef

Retrieves the named view from the schema and returns it

=head1 $s->proc($name) -> BeastForm::Proc | undef

Retrieves the named procedure from the schema and returns it

=head1 $s->trigger($name) -> BeastForm::Trigger | undef

Retrieves the named trigger from the schema and returns it

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
