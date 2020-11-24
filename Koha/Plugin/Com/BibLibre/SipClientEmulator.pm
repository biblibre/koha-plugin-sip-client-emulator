package Koha::Plugin::Com::BibLibre::SipClientEmulator;

use base qw(Koha::Plugins::Base);

use Modern::Perl;

use C4::Context;

our $VERSION = '0.1';

our $metadata = {
    name            => 'SIP client emulator',
    author          => 'BibLibre',
    description     => 'SIP client emulator',
    date_authored   => '2020-11-24',
    date_updated    => '2020-11-24',
    minimum_version => '19.11',
    maximum_version => undef,
    version         => $VERSION,
};

sub new {
    my ( $class, $args ) = @_;

    $args->{'metadata'} = $metadata;
    $args->{'metadata'}->{'class'} = $class;

    my $self = $class->SUPER::new($args);

    return $self;
}

# Mandatory even if does nothing
sub install {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub upgrade {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub uninstall {
    my ( $self, $args ) = @_;

    return 1;
}

# Do the job
sub tool {
    my ( $self, $args ) = @_;

    my $template = $self->get_template({ file => 'tmpl/home.tt' });
    my $query = $self->{'cgi'};

    my $op = $query->param('op') || '';
    my $result;
    if ( $op eq 'send' ) {
        ## TODO hardcoder ~/src -> misc/sip_cli_emulator.pl
        $result = qx{/home/koha/src/misc/sip_cli_emulator.pl -a localhost -p 6001 -su test -sp test -l SITE 2>&1};
    }

    $template->param(
        op          => $op,
        result      => $result,
    );

    return $self->output_html( $template->output() );
}

1;
