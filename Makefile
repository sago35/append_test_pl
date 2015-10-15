all: del_log A B C D E F
	perl check.pl

.PHONEY: del_log check_log
del_log:
	perl -e "unlink 'log.txt'"

A:
	perl -e "sleep 1"
	perl append_test.pl A

B:
	perl -e "sleep 2"
	perl append_test.pl B

C:
	perl append_test.pl C

D:
	perl append_test.pl D

E:
	perl append_test.pl E

F:
	perl append_test.pl F
