# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MediaWiki::Bot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 5;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use strict;
use MediaWiki::Bot;
use utf8;

my $editor = MediaWiki::Bot->new;

#if(defined($ENV{'PWPMakeTestSetWikiHost'})) {
#	$editor->set_wiki($ENV{'PWPMakeTestSetWikiHost'}, $ENV{'PWPMakeTestSetWikiDir'});
#}

my $string = "éółŽć";
my $load=$editor->get_text("User:ST47/unicode1");
is($load, $string, "Is our string the same as what we load?");
my $old=$editor->get_text("User:ST47/unicode2");
my $rand=rand();
my $status=$editor->edit("User:ST47/unicode2", "$rand\n$string\n", "PWP test");
SKIP: {
	if ($status==3 and $editor->{error}->{code}==3) {
		skip "You are blocked, cannot use editing tests", 4;
	}
	my $rand2=rand();
	$editor->edit("User:ST47/unicode3", "$rand2\n$load\n", "PWP test");
	my $rand3=rand();
	sleep 1;
	$editor->edit("User:ST47/éółŽć", "$rand3\n$load\n", "PWP test");
	sleep 1;
	my $new=$editor->get_text("User:ST47/unicode2");
	isnt($new, $old, "Successfully saved test string");
	is($new, "$rand\n$string", "Loaded correct data");
	$new=$editor->get_text("User:ST47/unicode3");
	is($new, "$rand2\n$string", "Saved data from load correctly");
	$new=$editor->get_text("User:ST47/éółŽć");
	is($new, "$rand3\n$string", "Saved data from load correctly to page with unicode title");

}
