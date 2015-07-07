package BeastForm::Table;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

# ABSTRACT: The useful information we know about a table

use Moo;

has pk      => ( is => 'ro', required => 1 );
# has fks     => ( is => 'ro', required => 1 );
# has checks  => ( is => 'ro', required => 1 );
has name    => ( is => 'ro', required => 1 );
has fields  => ( is => 'ro', required => 1 );
# has indices => ( is => 'ro', required => 1 );
# has uniques => ( is => 'ro', required => 1 );

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Table - The useful information we know about a table

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
