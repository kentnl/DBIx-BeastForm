package DBIx::BeastForm::DB;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use DBIx::Connector;
use BeastForm::Driver;
use BeastForm::Table;
use BeastForm::Util qw(map_sth);
use Carp qw(croak);
use feature ':5.10';

# ABSTRACT: Logical representation of a database

has driver => (
  is => 'ro', required => 1,
  coerce => sub { ref $_[0] ? shift : DBIx::BeastForm::Driver->new(name => shift); },
);

has name => ( is => 'ro', required => 1  );
has user => ( is => 'ro', default  => '' );
has pass => ( is => 'ro', default  => '' );

has mode => (
  is => 'ro', default => 'fixup',
  isa => sub {
    croak("Expected one of qw(fixup ping no_ping), got: '$_[0]'")
      unless $_[0] =~ /\A(?:fixup|(?:no_)?ping)\Z/;
  },
);

has options => (
  is => 'ro',
  default => sub { +{ RaiseError => 1, FetchHashKeyName => 'NAME_lc' } }
);


has dsn        => ( is => 'lazy' );
has schema     => ( is => 'lazy' );
has connector  => ( is => 'lazy' );
has procedures => ( is => 'lazy' );

sub _build_dsn {
  my ($self, $db, %extra) = @_;
  # I can see not doing this might cause confusion down the line
  # (there are hacks all over DBI et al to "DTRT")
  delete @extra{qw(db database)};
  $extra{dbname} = $db;
  sprintf(
    "dbi:%s:%s", $self->driver->name,
    # Keys are sorted for predictable ordering (which helps with tests)
    join( ";", map { sprintf( "%s=%s", $_, $extra{$_} ) } sort keys %extra ),
  );
}

sub _build_connector {
  my ($self) = @_;
  my $c = DBIx::Connector->new($self->dsn, $self->user, $self->pass, $self->options);
  $c->mode($self->mode);
  $c;
}

sub read_with {

}

sub write_with {

}


# sub dbs {
#   my ($self) = @_;
#   map {
#     DBIx::BeastForm::DB->new(
#       dsn => $self->dsn, user => $self->user, pass => $self->pass,
#       mode => $self->mode, connector => $self->connector,
#       options => $self->options,
#     );
#   } $self->connector->dbh->data_sources($self->name),
# }

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::DB - Logical representation of a database

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
