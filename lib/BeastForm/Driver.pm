package BeastForm::Driver;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

# ABSTRACT: Represents a DBD. Can make a connector

use Moo;
use Carp qw(croak);
use DBI;
use BeastForm::DB;

has name => (
  is => 'ro',
  required => 1,
  isa => sub {local $_ = shift; croak("Expected string, got: $_") if ref $_},
);

sub connect {
  my ($self, $db, $user, $pass, %extra) = @_;
  BeastForm::DB->new(
    driver => $self, name => $db,
    user => $user,   pass => $pass,
   
  );
}

sub human_name {
  my ($self) = @_;
  return "PostgreSQL" if $self->driver eq 'Pg';
  return $self->driver;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Driver - Represents a DBD. Can make a connector

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
