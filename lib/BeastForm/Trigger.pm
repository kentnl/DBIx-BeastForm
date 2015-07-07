package BeastForm::Trigger;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

# ABSTRACT: The useful information we know about a trigger

use Moo;

has sql      => ( is => 'ro', required => 1 );
has name     => ( is => 'ro', required => 1 );
has order    => ( is => 'ro', required => 1 );
has scope    => ( is => 'ro', required => 1 );
has table    => ( is => 'ro', required => 1 );
has fields   => ( is => 'ro', required => 1 );
has run_on   => ( is => 'ro', required => 1 );
has run_when => ( is => 'ro', required => 1 );

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Trigger - The useful information we know about a trigger

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
