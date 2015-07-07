use 5.006;    # our
use strict;
use warnings;

package BeastForm::Reader::SQLT;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

# ABSTRACT: Uses L<SQL::Translator> to introspect a database

use Moo;
use SQL::Translator;
use BeastForm::Reader::SQLT::Schema;

with 'BeastForm::Role::Process';

has connector => ( is => 'ro', required => 1 );

sub _sqlt {
  my ($self) = @_;
  my $sqlt = SQL::Translator->new(
    parser => 'DBI', parser_args => { dbh => $self->connector->dbh },
  );
  $sqlt->translate;
  $sqlt;
}

sub go {
  my ($self) = @_;
  BeastForm::Reader::SQLT::Schema->new(
    in_schema => $self->_sqlt->schema
  )->go;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT - Uses L<SQL::Translator> to introspect a database

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
