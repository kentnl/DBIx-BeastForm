package DBIx::BeastForm::Reader::SQLT::Trigger;

our $VERSION = '0.000001';

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moo;
use BeastForm::Trigger;

with 'BeastForm::Role::Process';
has in_trigger => (
  is => 'ro', required => 1,
  handles => [ qw( name order scope table ) ], # Cheap getters
);
has in_schema => ( is => 'ro', required => 1 );

sub sql      { shift->in_trigger->action; }
sub run_when { shift->in_trigger->perform_action_when; }
sub run_on   { [shift->in_trigger->database_events]; }
sub fields   { [shift->in_trigger->fields] }

sub go {
  my ($self) = @_;
  BeastForm::Trigger->new(
    sql => $self->sql, name => $self->name, order => $self->order,
    scope => $self->scope, table => $self->table, run_when => $self->run_when,
    run_on => $self->run_on, fields => $self->fields,
  );
}
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

DBIx::BeastForm::Reader::SQLT::Trigger

=head1 VERSION

version 0.000001

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
