use strict;
use warnings;

package DBIx::BeastForm::ResultSet;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use overload '""' => sub { "<DBIx::BeastForm::Resultset object>"; };
use Moo;

extends 'DBIx::Lite::ResultSet';

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::ResultSet

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
