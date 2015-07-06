package DBIx::BeastForm::DBIL::Schema;

use DBIx::Lite::Schema;
use strict;
use warnings;

sub _table {
  my ($self, $schema, $s, $table);
  
}

sub new {
  my ($self, $schema) = @_;
  my $s = DBIx::Lite::Schema->new;
  $self->_table($schema, $s, $_)
    foreach $schema->get_tables;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::DBIL::Schema

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
