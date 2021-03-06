# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MediaWiki::Bot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use Test::More tests => 4;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use MediaWiki::Bot;

my $bot = MediaWiki::Bot->new();

if(defined($ENV{'PWPMakeTestSetWikiHost'})) {
    $bot->set_wiki($ENV{'PWPMakeTestSetWikiHost'}, $ENV{'PWPMakeTestSetWikiDir'});
}

my $wikitext = $bot->get_text('Main Page');
like($wikitext, qr/Main Page/, 'Main Page found');
$wikitext = $bot->get_text('User:Mike.lifeguard/12 get text.t');

$wikitext = $bot->get_text('God');
my $section_wikitext = $bot->get_text('God', '', 3);
isnt($section_wikitext, undef, 'Section load pass/fail');
isnt($wikitext, $section_wikitext, 'Section loaded content correctly');

$wikitext = $bot->get_text('egaP niaM');
is($wikitext, undef, 'No page found');
