use 5.006;    # our
use strict;
use warnings;

package BeastForm::Role::DBIL;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo::Role;
use DBIx::Lite;
use BeastForm::DBIL::Schema;
use BeastForm::DBIL::Builder::Dynamic;
# use BeastForm::DBIL::Builder::Static;

with 'BeastForm::Role::Introspective';

has namespace   => ( is => 'ro', required => 1  );






















sub dynamic {
  my ($self) = @_;
  BeastForm::DBIL::Builder::Dynamic->new(
    connector => $self->connector,
    schema => $self->schema,
    namespace => $self->namespace,
  )->build;
}

sub static {
  die("Not yet implemented. Patches Welcome!");
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Role::DBIL

=head1 VERSION

version 0.000001

=head1 SYNOPSIS

    package My::BeastForm;
    use Moo;
    use My::Config qw(config);
    with 'BeastForm::Role::DBIL;
    has '+username' => ( default => sub { config('username') } );
    has '+password' => ( default => sub { config('password') } );
    has '+extra' => (
      default => sub { +{host => config('host'),
                         port => config('port')}; },
    );

=head1 METHODS

=head2 $bf->dynamic() -> Void

Introspects the database and returns a L<BeastForm::DBIL::DB>

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
