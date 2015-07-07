use strict;
use warnings;

package DBIx::BeastForm::Role::Introspective;

our $VERSION = '0.000000';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo::Role;
use SQL::Translator;

with 'DBIx::BeastForm::Role::Connected';

has schema => ( is => 'lazy' );

sub _build_schema {
  my ($self) = @_;
  my $s = SQL::Translator->new( parser => 'DBI', parser_args => { dbh => $self->connector->dbh } );
  $s->translate;
  $s->schema;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::Role::Introspective

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
