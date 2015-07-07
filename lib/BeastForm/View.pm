package BeastForm::View;

# ABSTRACT: The useful information we know about a view

use Moo;

has sql     => ( is => 'ro', required => 1 );
has name    => ( is => 'ro', required => 1 );
has order   => ( is => 'ro', required => 1 );
has fields  => ( is => 'ro', required => 1 );
has tables  => ( is => 'ro', required => 1 );
has options => ( is => 'ro', required => 1 );

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::View - The useful information we know about a view

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
