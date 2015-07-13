package # hide from PAUSE
    Starch::Plugin::Trace::Manager;

use Moo::Role;
use strictures 2;
use namespace::clean;

with qw(
    Starch::Plugin::ForManager
);

sub BUILD {
    my ($self) = @_;
    $self->log->trace( 'starch.manager.new' );
    return;
}

around state => sub{
    my $orig = shift;
    my $self = shift;
    my ($id) = @_;

    my $state = $self->$orig( @_ );

    $self->log->tracef(
        'starch.manager.state.%s.%s',
        defined($id) ? 'retrieved' : 'created',
        $state->id(),
    );

    return $state;
};

1;
