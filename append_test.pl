use strict;
use warnings;
use utf8;
use Path::Tiny;
use Time::Moment;

my $no = shift // die;

my $t = Time::Moment->now;


#my $wfh = path("log.txt")->opena_utf8({locked => 0});

open my $wfh, ">>", "log.txt" or die $!;
printf "%s 1\n", $no;
printf $wfh "%s %s\n", Time::Moment->now->strftime("%Y/%m/%d %H:%M:%S"), $no;
printf "%s 2\n", $no;

#sleep ($t->millisecond % 5);
sleep 5;


printf "%s 3\n", $no;
printf $wfh "%s %s\n", Time::Moment->now->strftime("%Y/%m/%d %H:%M:%S"), $no;
printf "%s 4\n", $no;

close $wfh;

__END__
# Makefile

all: A B C D E F

A:
	perl -e "sleep 1"
	perl asdf.pl A

B:
	perl -e "sleep 2"
	perl asdf.pl B

C:
	perl asdf.pl C

D:
	perl asdf.pl D

E:
	perl asdf.pl E

F:
	perl asdf.pl F
