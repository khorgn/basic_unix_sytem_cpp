use v6;

start { sleep 1.5; print "hi" }
await Supply.from-list(<A B C D E F>).throttle: 2, {
	sleep 0.5;
	.print
}

# OUTPUT: ABCDhiEF
