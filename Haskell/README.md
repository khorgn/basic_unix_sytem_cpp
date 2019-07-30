# Installation
## Cabal
`cabal update`  
`cabal install cabal-install`  

basic install `sudo apt install cabal-install`  
run ghci for interactive shell  

## [stack](https://docs.haskellstack.org/en/stable/README/)  
`sudo apt install haskell-stack`  
`stack upgrade`  
`stack setup`


# Links

## Officials
* [main site](https://www.haskell.org/)  
* [Hoogle](https://hoogle.haskell.org/)  
* [Documentation on haskell](https://www.haskell.org/documentation/)
* [central package archive/package documentation](https://hackage.haskell.org/)  
* [example documentation](https://hackage.haskell.org/package/base/docs/Data-Maybe.html)  
* [index for the standard library](https://downloads.haskell.org/~ghc/latest/docs/html/libraries/)  
* [GHC manual](https://downloads.haskell.org/~ghc/latest/docs/html/)
  [example page](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html?highlight=typeclass%20extensions#extension-FlexibleInstances)


## Wiki
* [Wiki](https://wiki.haskell.org/Haskell)  
* [meta-tutorial](https://wiki.haskel.org/meta-tutorial)
* [Typeclassopedia](https://wiki.haskel.org/Typeclassopedia)
* [liquid haskell](https://wiki.haskel.org/liquid_haskell)
* [Idioms](https://wiki.haskell.org/Category:Idioms)  
* [Tools to write a haskell program](https://wiki.haskell.org/How_to_write_a_Haskell_program)
  * Documentation: [Haddock](https://www.haskell.org/haddock/)
  * Tests
    * pure: [QuickCheck](https://hackage.haskell.org/package/QuickCheck), [SmallCheck](https://www.mail-archive.com/haskell@haskell.org/msg19215.html)
    * impure: [Hspec](https://hspec.github.io/), [HUnit](https://hackage.haskell.org/package/HUnit)
  * Build tools: [Stack](https://docs.haskellstack.org/en/stable/README/) [Nix](https://cah6.github.io/technology/nix-haskell-1/)
* [Argument handling in CLI with System.Console.GetOpt](https://wiki.haskell.org/Tutorials/Programming_Haskell/Argument_handling)

## Wikibooks
* [Wikibook](https://en.wikibooks.org/wiki/Haskell)

## Miscellaneous
* [learn you a haskell](http://learnyouahaskell.com/chapters)  
* [Why functional programming matters](https://github.com/rust-lang/rustlings)  
* <http://conal.net/blog/posts/semantic-editor-combinators>  
* [state of haskell ecosystem](https://github.com/Gabriel439/post-rfc/blob/master/sotu.md)  
* [haskell trainings google](https://github.com/google/haskell-trainings)  
* [haskell codelab google](https://github.com/google/haskell-codelab)  
* [functors, applicatives and monads in pictures](adit.io)  
* ["what I wish I knew when learning haskell"](http://dev.stephendiehl.com/hask/) 
* <http://www-cs-students.stanford.edu/~blynn/haskell/>  
* [haskell pitfalls](lorepub.com/post/2016-12-17-Haskell-Pitfalls)
* [DataHaskell: Current environment](www.datahaskell.org/docs/community/current-environment.html)
* [Rosetta-code](Rosettacode.org/wiki/100_door#Haskell)
* [view-patterns](gitlab.haskell.org/ghc/wikis/view-patterns)
* [liquid-haskell tutorial](ucsd-progsys.github.io/liquidhaskell-tutorial)
* [Understanding Haskell's error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)
* [explanations State, StateT and MonadState](https://stackoverflow.com/questions/43438875/confusion-about-statet-state-and-monadstate/43441289#43441289)
* [Four months of Haskell](https://lexi-lambda.github.io/blog/2016/06/12/four-months-with-haskell/)

# books
* [Learn me a haskell](http://learnyouahaskell.com/chapters)  
* [haskell first principle](haskellbook.com)  
* [real world haskell](book.realworldhaskell.org)  
* thinking functionally with haskell  

# videos
* "Dependent Types in Haskell" by _Stephanie Weirich_ on youtube

# concepts
* [foldable/traversable](https://wiki.haskell.org/Foldable_and_Traversable)
* functors
* applicative
* monads (IO, State, Maybe, Either, Reader, Writer)
* [monad transformers](https://wiki.haskell.org/Monad_Transformers_Explained)
  [wikibooks chapter](https://en.wikibooks.org/wiki/Haskell/Monad_transformers)
* [Generalised algebraic datatype](https://wiki.haskell.org/Generalised_algebraic_datatype)
  [stack overflow answer on the topic](https://stackoverflow.com/questions/8245288/what-does-data-where-mean-in-haskell)  
  [Wikibooks chapter](https://en.wikibooks.org/wiki/Haskell/GADT)  
* category theory (math)
* [lens](http://lens.github.io/tutorial.html)
* dependent types
* [constraint trick](https://www.reddit.com/r/haskell/comments/3afi3t/the_constraint_trick_for_instances/) (a way to be stricter in instance constraints)
* [Existentially Quantified Types](https://en.m.wikibooks.org/wiki/Haskell/Existentially_quantified_types) (a way to qualify types by their typeclasses constraint (similar to Box<> in Rust))

# toolset
* [stack](https://docs.haskellstack.org/en/stable/README/)
* Nix
* [Haskell-ci](https://hackage.haskell.org/package/haskell-ci) (script generator for continuous integration with [Travis-CI](https://travis-ci.org/))

# libraries
## Standard libraries
* [Base](https://hackage.haskell.org/package/base)
  * [Prelude](https://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html)
  * [System.Console.GetOpt](https://hackage.haskell.org/package/base-4.12.0.0/docs/System-Console-GetOpt.html) (handle argument parsing)
## External libraries
> [Practical libraries](https://guide.aelve.com/haskell)  
* [Safe](https://hackage.haskell.org/package/safe) (contains safe version of classic functions like `head` or `tail`)
* [Containers](https://hackage.haskell.org/package/containers) (contains multiple efficient containers)
* [SubHask](https://hackage.haskell.org/package/subhask) (a library to rewrite the prelude using subcategories in category theories)
* [dlist](https://hackage.haskell.org/package/dlist) (difference lists are list-like types supporting O(1) append)
* [criterion](http://hackage.haskell.org/package/criterion) (provide ways to measure software performances)
* [statistics](http://hackage.haskell.org/package/statistics) (provide tools for stats)
* [test-framework](http://hackage.haskell.org/package/test-framework) (organize tests from [QuickCheck](https://hackage.haskell.org/package/QuickCheck) or [HUnit](http://hackage.haskell.org/package/HUnit))
* [Software Transactional Memory](http://hackage.haskell.org/package/stm) (for concurrent communication)
* [mtl](https://hackage.haskell.org/package/mtl) (monad classes and monad transformers)
* [extensible-effects](https://hackage.haskell.org/package/extensible-effects) (an alternative to monad transformers)
* [prettyprinter](https://hackage.haskell.org/package/prettyprinter) (a printer to display info in a more readable way)
* [Haskeline](https://hackage.haskell.org/package/haskeline) (for interactive CLI interface)
* [potparse-applicative](https://hackage.haskell.org/package/optparse-applicative) (for powerful parsing CL options)

## UI
* GUI
  * [Gloss](https://hackage.haskell.org/package/gloss) (simple 2D vector graphics)
  * [Miso](https://haskell-miso.org/) (a framework for front-end single web-page)
* TUI
  * [Brick](https://hackage.haskell.org/package/brick)
* CLI
  * [cli](https://hackage.haskell.org/package/cli)
  * [Structured\_cli](https://hackage.haskell.org/package/structured-cli) (interactive cli)
* WEB
  * [Electron](https://electronjs.org/) (to use the app on desktop)
  * [Elm](https://elm-lang.org/) (a simple FP language)
  * [PureScript](http://www.purescript.org/) (<https://mmhaskell.com/purescript>) (a FP language strongly inspired by Haskell)
  * [Reflex-Dom](https://hackage.haskell.org/package/reflex-dom) (WEB framework based on the Reflex engine)
* Functional Reactive Programing
  * [Reflex](https://hackage.haskell.org/package/reflex) (a FRP interface and engine) (note: uses nix)

# ghci
## set/unset
* `:set` list the options currently set
* `:set +t` print type after evaluation
* `:set +m` allow multiline commands
* `:set +s` gives the execution time and memory usage after each evaluation (note: functions tend to run slower in ghci than in direct execution)

# ghc
## GHC options
* `{-# OPTION_GHC -Wall #-}`
## language options
* [Interesting extensions](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/guide-to-ghc-extensions/basic-syntax-extensions)
* [Interesting extensions](https://mmhaskell.com/blog/2019/3/4/extending-haskells-syntax)
* [Good extensions](https://stackoverflow.com/questions/10845179/which-haskell-ghc-extensions-should-users-use-avoid)
* `{-# LANGUAGE FlexibleInstances #-}` (allows to instancie concrete subtypes (ex: Maybe Int))
  can also be passed as compiler argument as `-XFlexibleInstances`
* `{-# LANGUAGE BangPatterns #-}` (allows an easier way to use strictness)
* `{-# LANGUAGE TupleSections #-}` (makes it easier to make functions returning partial tuples)
* `{-# LANGUAGE PackageImports #-}` (allows to specify the package where the module come from, to prevent conflicts)
* `{-# LANGUAGE OverloadedStrings #-}` (make strings literal acts like number literals (they can be Int, Factional, ... depending on context). This way literals can be Text or ByteString or any type being an instance of IsString)
* `{-# LANGUAGE LambdaCase, EmptyCase #-}` (make `case x of` more comfortable. LambdaCase allows `\case ...` instead of `\x -> case x of ...`)
* `{-# LANGUAGE MultiWayIf #-}` (make `if ... then ... else if ... then ... else ...` more confortable by making it look like guards `if | ... -> ...; | ... -> ...; | otherwise -> ...`)
* `{-# LANGUAGE ScopedTypeVariables #-}` (allows to reuse free type variables in sub-functions)
* `{-# LANGUAGE MultiParamTypeClasses #-}` (allows to have typeclasses with multiple type parameters
  often used in tandem with `{-# LANGUAGE FlexibleContext #-}`  (allows to define concrete types in typeclasses constraints for functions)
* Easier `newtype` handling
  * `{-# LANGUAGE GeneralizedNewtypeDeriving #-}` allows to derive typeclass instancied by the original type of the newtype, to reduce boilerplate and code copy
  * `{-# LANGUAGE StandaloneDeriving #-}` allows to precise a particular type of a generalized type (ex: `deriving instance ToText (Id User)`)

## pragmas
* `instance {-# OVERLAPPING #-} <typeclass> <type> where ...` (design this instance as overlapping another)
   connected pragmas: `OVERLAPPABLE` and `OVERLAPS`

