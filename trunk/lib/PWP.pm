use strict;
use warnings;

use MediaWiki::Bot;
BEGIN {
    warnings::warn('deprecated', 'PWP is a deprecated alias for MediaWiki::Bot. '
        . 'Please use the modern name; this one will be removed in a future release');
    *PWP:: = \%MediaWiki::Bot::
}
our $VERSION = $PWP::VERSION;

=head1 NAME

PWP - Alias for MediaWiki::Bot, previously known as perlwikipedia or PWP

=head1 SYNOPSIS

    use MediaWiki::Bot;
    my $bot = MediaWiki::Bot->new();

=head1 DESCRIPTION

This is a B<deprecated> alias for L<MediaWiki::Bot>, and will be removed in
a future release. Please use the module's modern name.

=cut

1;
