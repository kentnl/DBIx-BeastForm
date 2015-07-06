use strict;
use warnings;

package DBIx::BeastForm;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use DBI;
use DBIx::BeastForm::Driver;

# ABSTRACT: Introspect a database and dynamically generate models






















# sub from_dsn {
#   # my ($self, $dsn, %extra) = @_;
#   # my $fields = DBI->
#   # my $host = $extra{host};
#   # my $port = $extra{port};
#   # $extra{
# }







sub find_drivers {
  my ($self) = @_;
  map {
    $_ => DBIx::BeastForm::Driver->new(name => $_)
  } DBI->available_drivers;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm - Introspect a database and dynamically generate models

=head1 VERSION

version 0.000001

=head1 INTRODUCTION

Because I want to distribute my next application as a single fatpacked script,
I can't use the L<DBIx::Class> (and the equally excellent L<DBIx::Class::Schema::Loader>)
which leaves me feeling like a sad panda. I know, I'll write some, I thought...

=head1 LIBRARY SUPPORT

Currently, we support L<DBIx::Lite> only, though it is hoped this will change
Database support is anything L<SQL::Translator> supports, which is most things.

=head1 MODES OF OPERATION

The primary mode of operation at the minute is 'dynamic'. This attempts to
introspect your database and generate a schema for DBIL

We'd like to generate static pm files like L<DBIx::Class::Schema::Loader> one day
We'd also like scripts to automate the generation of static files from the shell

=head2 find_drivers -> Hash[String -> DBIx::BeastForm::Driver]

Returns a hash of names to Driver objects

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 CONTRIBUTOR

=for stopwords Kent Fredric

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
