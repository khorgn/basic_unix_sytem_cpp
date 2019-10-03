> [Rust implementations](https://github.com/uutils)
* echo (prints a line of text)
* cat (prints the content of a file)
* ls (lists the contents of a directory)
* grep (searchs occurences in a file)
* wc (counts the lines, characters, and bytes in a file)
* sed 
* tee (reads from stdin and writes to both stdout and files)
* head, tail (prints the x first/last lines in a text file)
* column (columnate lists)
* tr (translates or deletes characters)
* strings (extracts plaintext strings from a binary file)
* nc (reads and writes bytes to network sockets)
* tree (prints a graphical representation of a directory tree)
* cal (prints a text calendar)
* cut (extracts delimited fields from linewise text records)
* sort (sorts lines)
* uniq (prints only unique lines)
* yes (print "y\n" or the given line forever)

# Games
* [Rock Paper Scissors](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors)
* [Tick Tack Toe](https://en.wikipedia.org/wiki/Tic-tac-toe)
* [Chess](https://en.wikipedia.org/wiki/Chess)
* [Go](https://en.wikipedia.org/wiki/Go_(game))
* [2048](https://en.wikipedia.org/wiki/2048_(video_game))
* [labyrinth](https://en.wikipedia.org/wiki/Labyrinth_(paper-and-pencil_game))

# Parsers
> [Parser Combinators](https://en.wikipedia.org/wiki/Parser_combinator)  
> [Context-Free Grammar](https://en.wikipedia.org/wiki/Context-free_grammar)  
> [Parsing Expression Grammer](https://en.wikipedia.org/wiki/Parsing_expression_grammar)  
* [Awk compiler](https://en.wikipedia.org/wiki/AWK)
* [A stack-based programming language](https://en.wikipedia.org/wiki/Stack-oriented_programming)
* [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck) ([example in Racket](https://beautifulracket.com/bf/intro.html))
* Imperative language parser ([example in haskell](https://wiki.haskell.org/Parsing_a_simple_imperative_language))
* [TOML parser](https://en.wikipedia.org/wiki/Toml)
* [YAML Parser](https://en.wikipedia.org/wiki/YAML)
* [Chip-8 Interpreter](http://devernay.free.fr/hacks/chip8/C8TECH10.HTM#0.0)

# Algorithms
* [Dijkstra](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)
* [A\*](https://en.wikipedia.org/wiki/A*_search_algorithm)
* [Alpha-Beta](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning)
* [Newton-raphson square roots](https://en.wikipedia.org/wiki/Newton's_method)
* [numerical differenciation](https://en.wikipedia.org/wiki/Numerical_differentiation)
* [numerical integration](https://en.wikipedia.org/wiki/Numerical_integration)
* [Hash](https://en.wikipedia.org/wiki/Hash_function) ([MD5](https://en.wikipedia.org/wiki/MD5))
* [Markov chain](https://en.wikipedia.org/wiki/Markov_chain)
* [Discrete intervale encoding tree](http://web.engr.oregonstate.edu/~erwig/papers/Diet_JFP98.pdf) ([Rust implementation](https://bitbucket.org/nikhilm/rust-diet/src/default/src/diet.rs))
* [Gradient Descent](http://andrew.gibiansky.com/blog/machine-learning/gradient-descent/)
  [Choice of variants](http://ruder.io/optimizing-gradient-descent/)

# Machine learning
## Supervised learning
* [Linear Regresion](https://en.wikipedia.org/wiki/Linear_regression)
* [K-Nearest Neighbors](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm)
* [Linear Discriminant Analysis / Quadratic Discriminant Analysis](https://en.wikipedia.org/wiki/Linear_discriminant_analysis) (also used to reduce dimensionality)
* [Decision tree](https://en.wikipedia.org/wiki/Decision_tree_learning)
## Clustering
* [K-Means](https://en.wikipedia.org/wiki/K-means_clustering)
* [Expectation-Maximization](https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm)

# Clients

# APIs / clients / Protocols
* [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
* [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) (note: REST is an architectural style)
  RESTful cient applications (<https://restfulapi.net/>) ([details about REST](https://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven)) ([cookbook](http://restcookbook.com/))
* [SOAP](https://en.wikipedia.org/wiki/SOAP)
  _Differences between REST and CRUD_  
  * <https://www.bmc.com/blogs/rest-vs-crud-whats-the-difference/>
  * <https://softwareengineering.stackexchange.com/questions/120716/difference-between-rest-and-crud>
* [Internet Message Access Protocol](https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol)
* [RSS](https://en.wikipedia.org/wiki/RSS)
* [Atom](https://en.wikipedia.org/wiki/Atom_(Web_standard))

# Sequences / Sets / Series
* [Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_number) (decimal sequence)
* [Fibonacci word](https://en.wikipedia.org/wiki/Fibonacci_word) (binary sequence)
* [Thue-Morse sequence](https://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence) (binary sequence)
* [Fare sequence](https://en.wikipedia.org/wiki/Farey_sequence) (frational sequence)
* [Look-and-say sequence](https://en.wikipedia.org/wiki/Look-and-say_sequence) (natural sequence)
* [Perfect number](https://en.wikipedia.org/wiki/Perfect_number) (natural sequence)
* [Prime number](https://en.wikipedia.org/wiki/Prime_number) (natural sequence)
* [Kolakosi sequence](https://en.wikipedia.org/wiki/Kolakoski_sequence) (set of naturals sequence)
* [Mandelbrot set](https://en.wikipedia.org/wiki/Mandelbrot_set)
* [Fourier series](https://en.wikipedia.org/wiki/Fourier_series) (series of rotating vectors)
  [3Blue1Brown's video on Fourier series](https://www.youtube.com/watch?v=r6sGWTCMz2k)  

# Databases
* [small database](http://birrell.org/andrew/papers/024-DatabasesPaper-SOSP.pdf) ([Rust implementation](http://nikhilism.com/post/2016/writing-simple-database-in-rust-part-1/))
  * implements a simple [Data Manipulation Language](https://en.wikipedia.org/wiki/Data_manipulation_language)
  * [ACID principles](https://en.wikipedia.org/wiki/ACID)

# simulations
* [the game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
  [implementing Conway's game of life with Haskell's comonads](https://chrispenner.ca/posts/conways-game-of-life)
* simulate natural selection (["simulating natural selection" from _primer_](https://www.youtube.com/watch?v=0ZGbIKd0XrM))

# UIs
* Command-Line Interface
  * Interactive Command-Line Interface
  * Piping between programs
* Terminal User Interface
* Graphical User Interface
* WEB front-end (also electron)

