use strict;
use warnings;
use utf8;
use Path::Tiny;
use Time::Moment;
use LWP::Simple;

my $no = shift // die;

my $t = Time::Moment->now;

my $some_large_file = "xxx.txt";
if (not -e $some_large_file) {
    my $content = get 'http://cpansearch.perl.org/src/DAGOLDEN/Path-Tiny-0.072/lib/Path/Tiny.pm';
    path($some_large_file)->spew_utf8($content);
}


# locked => 1 だと、opena_utf8()時点で排他がかかる
my $wfh = path("log.txt")->opena_utf8({locked => 1});

printf "%s 1\n", $no;
printf $wfh "%s %s\n", Time::Moment->now->strftime("%Y/%m/%d %H:%M:%S"), $no;


my $path = path($some_large_file);
foreach my $line ($path->lines) {
    chomp $line;
    printf $wfh "%s %s %s\n", Time::Moment->now->strftime("%Y/%m/%d %H:%M:%S"), $no, $line;
}
printf "%s 2\n", $no;

#sleep ($t->millisecond % 5);
sleep 5;


printf "%s 3\n", $no;
printf $wfh "%s %s\n", Time::Moment->now->strftime("%Y/%m/%d %H:%M:%S"), $no;
printf "%s 4\n", $no;

