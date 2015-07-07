package BeastForm::Reader::SQLT::View;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use BeastForm::View;

with 'BeastForm::Role::Process';

has in_view => (
  is => 'ro', required => 1,
  handles => [ qw( sql name order ) ], # Cheap getters
);
has in_schema => ( is => 'ro', required => 1 );

sub fields  { [ shift->in_view->fields  ]; }
sub tables  { [ shift->in_view->tables  ]; }
sub options { [ shift->in_view->options ]; }

sub go {
  my ($self) = @_;
  BeastForm::View->new(
    sql  => $self->sql,  order  => $self->order,  tables  => $self->tables,
    name => $self->name, fields => $self->fields, options => $self->options,
  );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Reader::SQLT::View

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
