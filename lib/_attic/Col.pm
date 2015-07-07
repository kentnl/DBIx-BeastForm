use strict;
use warnings;

package DBIx::BeastForm::Col;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;

has name => (
  is => 'ro',
  isa => sub {
    local $_ = shift;
    croak("Expected string, got $_") if ref $_ || !$_;
  },
  required => 1,
);

has table => (
  is => 'ro',
  isa => sub {
    local $_ = shift;
    croak("Expected DBIx::BeastForm::Table, got: '$_'")
      unless $_->isa('DBIx::BeastForm::Table');
  },
  weak_ref => 1,
  required => 1,
);


sub new_from_table {
  my ($self, $table, %info) = @_;
  __PACKAGE__->new(
    table => $table,
    name => $info{COLUMN_NAME},
    sql_type => $info{SQL_DATA_TYPE},
    wtf_type => $info{DATA_TYPE}, # WTF is this?
    real_type => $info{TYPE_NAME},
    size => $info{COLUMN_SIZE},
    buffer_len => $info{BUFFER_LENGTH},
    decimal_digits => $info{DECIMAL_DIGITS},
    precision_radix => $info{NUM_PREC_RADIX},
    nullable => $info{NULLABLE},
    is_nullable => $info{IS_NULLABLE}, # WTF?
    default => $info{COLUMN_DEF}, # could be arbitrary expression
    datetime_subcode => $info{SQL_DATETIME_SUB},
    char_octet_length => $info{CHAR_OCTET_LENGTH},
    offset => $info{ORDINAL_POSITION},
  );
}
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::Col

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
