use strict;
use warnings;
use utf8;
use Path::Tiny;
use Time::Moment;

my $no = shift // die;

my $t = Time::Moment->now;


# locked => 1 だと、opena_utf8()時点で排他がかかる
my $wfh = path("log.txt")->opena_utf8({locked => 1});

printf "%s 1\n", $no;
printf $wfh "%s %s\n", Time::Moment->now->strftime("%Y/%m/%d %H:%M:%S"), $no;


# 何でも良いがある程度大きなファイルを読み込ませる
# ORLite.pm            49080 2012/10/01 7:48:41
my $path = path('c:\strawberry\perl\site\lib\ORLite.pm');
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

