package BeastForm::Writer::DBIL::Dynamic::Schema;

use Moo;
use DBIx::Lite::Schema;
use BeastForm::Writer::DBIL::Dynamic::Table;
with 'BeastForm::Role::Writer::Schema';

has schema => (is => 'lazy');

sub _build_schema { DBIx::Lite::Schema->new; }

sub tables {
  my ($self, @tables) = @_;
  map {
	BeastForm::Writer::DBIL::Dynamic::Table->new(
      schema => $self->schema,
      in_table => $_,
    )->go;
  } @tables
}
sub views {
  my ($self, @views) = @_;
  map {
    warn "Treating view '@{[$v->name]}' as a table\n";
	BeastForm::Writer::DBIL::Dynamic::Table->new(
      schema => $self->schema,
      table => $_,
    )->go;
  } @views;
  1;
}
sub procs {
  my ($self, @procs) = @_;
  warn "Sorry, we don't support procedures yet\n"
    if @procs;
}
sub triggers {
  my ($self, @triggers) = @_;
  warn "Sorry, we don't support triggers yet\n"
    if @triggers;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Writer::DBIL::Dynamic::Schema

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
