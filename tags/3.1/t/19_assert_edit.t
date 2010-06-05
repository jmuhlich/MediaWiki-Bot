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

my $bot = MediaWiki::Bot->new('MediaWiki::Bot tests', 'admin');

if(defined($ENV{'PWPMakeTestSetWikiHost'})) {
    $bot->set_wiki($ENV{'PWPMakeTestSetWikiHost'}, $ENV{'PWPMakeTestSetWikiDir'});
}

SKIP: {
#   skip("Skipping edit test for now",2);

    my $rand = rand();
    print STDERR "\rYou should receive another error message here regarding a failed assertion.\n";
    my $status = $bot->edit('User:ST47/test', $rand, 'false');
    is($status->{'edit'}->{'result'}, 'Failure', 'Intentionally bad assertion');
}