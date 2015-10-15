use strict;
use warnings;
use utf8;
use Path::Tiny;
use Data::Dumper;


my $path = path("log.txt");

my $exists = {};

my $prev = "";
foreach my $line ($path->lines) {
    chomp $line;
    my ($ymd, $hms, $char) = split / /, $line;

    if ($prev ne $char) {
        if (exists $exists->{$char}) {
            die Dumper [$line, $char, $prev, $exists];
        } else {
            $exists->{$char}++;
        }
    } else {
        $exists->{$char}++;
    }
    $prev = $char;
}
