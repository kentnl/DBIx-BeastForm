use strict;
use warnings;

package DBIx::BeastForm::Util;

our $VERSION = '0.000000';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use parent 'Exporter';

our @EXPORT_OK = qw(map_sth modulify make_dsn);

sub modulify {
  my ( $path, $namespace ) = @_;
  $path =~ s/[[^:lower:]]//gi;
  return $namespace . q[::] . $path;
}

sub map_sth {
  my ($self, $sth, $handler) = @_;
  my @results;
  while (my $hr = $sth->fetchrow_hashref) {
    push @results, $handler->(%$hr);
  }
  croak($sth->err) if $sth->err;
  @results;
}

sub make_dsn {
  my ($self, $driver, %opts) = @_;
  delete @opts{qw(username password user pass)};
  my $dsn = "dbi:${driver}:";
  foreach my $name (sort keys %opts) {
    $dsn .= sprintf('%s=%s;', $name, $opts{$name});
  }
  $dsn =~ s/;\z//; # Trim the last semi if present
  $dsn;
}

1

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::Util

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
