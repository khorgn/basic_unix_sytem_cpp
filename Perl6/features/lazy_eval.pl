

# Infinite list of primes:
my @primes = ^Inf .grep: *.is-prime;
say "1001ˢᵗ prime is @primes[1000]";
#
# # Lazily read words from a file
.say for '50TB.file.txt'.IO.words;
#
#
