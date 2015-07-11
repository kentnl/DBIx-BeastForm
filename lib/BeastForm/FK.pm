use 5.006;    # our
use strict;
use warnings;

package BeastForm::FK;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;

# These should be weak, but doing so breaks the tests. WTF?
has from      => (is => 'ro', required => 1 ); #, weak_ref => 1);
has to        => (is => 'ro', required => 1 ); #, weak_ref => 1);

# These are simple strings
has on_delete => (is => 'ro', required => 1);
has on_update => (is => 'ro', required => 1);

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::FK

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
