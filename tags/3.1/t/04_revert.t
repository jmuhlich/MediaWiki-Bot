# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MediaWiki::Bot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use Test::More tests => 1;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
use MediaWiki::Bot;

my $bot = MediaWiki::Bot->new();
$bot->set_wiki('localhost', 'wiki');

SKIP: {
    skip('Skipping revert() for now', 1);
    my $res = $bot->revert('MediaWiki::Bot test', 'MediaWiki::Bot tests', 'revid');
    ok($res->isa('HTTP::Response'));
}