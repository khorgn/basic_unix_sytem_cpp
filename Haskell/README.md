# Installation
## Cabal
`cabal update`  
`cabal install cabal-install`  

basic install `sudo apt install cabal-install`  
run ghci for interactive shell  

## [stack](https://docs.haskellstack.org/en/stable/README/)  
`sudo apt install haskell-stack`  
`stack upgrade` upgrade stack   
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
* [Literate Programming](https://wiki.haskell.org/Literate_programming)
* [Lambdabot](https://wiki.haskell.org/Lambdabot)

## Wikibooks
* [Wikibook](https://en.wikibooks.org/wiki/Haskell)

## FP-complete
* [Exceptions Best Practices](https://www.fpcomplete.com/blog/2016/11/exceptions-best-practices-haskell)
  [Safe exception handling](https://www.fpcomplete.com/blog/2016/11/exceptions-best-practices-haskell)
  [Async exception handling](https://www.fpcomplete.com/blog/2018/04/async-exception-handling-haskell)
* [The rio standard library](https://haskell.fpcomplete.com/library/rio)

## General use
* [state of haskell ecosystem](https://github.com/Gabriel439/post-rfc/blob/master/sotu.md)  
* ["what I wish I knew when learning haskell"](http://dev.stephendiehl.com/hask/) 
* [haskell pitfalls](lorepub.com/post/2016-12-17-Haskell-Pitfalls)


## Miscellaneous
* [learn you a haskell](http://learnyouahaskell.com/chapters)  
* [Why functional programming matters](https://github.com/rust-lang/rustlings)  
* <http://conal.net/blog/posts/semantic-editor-combinators>  
* [haskell trainings google](https://github.com/google/haskell-trainings)  
* [haskell codelab google](https://github.com/google/haskell-codelab)  
* [functors, applicatives and monads in pictures](adit.io)  
* <http://www-cs-students.stanford.edu/~blynn/haskell/>  
* [DataHaskell: Current environment](www.datahaskell.org/docs/community/current-environment.html)
* [Rosetta-code](Rosettacode.org/wiki/100_door#Haskell)
* [view-patterns](gitlab.haskell.org/ghc/wikis/view-patterns)
* [liquid-haskell tutorial](ucsd-progsys.github.io/liquidhaskell-tutorial)
* [Understanding Haskell's error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)
* [explanations State, StateT and MonadState](https://stackoverflow.com/questions/43438875/confusion-about-statet-state-and-monadstate/43441289#43441289)
* [Four months of Haskell](https://lexi-lambda.github.io/blog/2016/06/12/four-months-with-haskell/)
* [Fundamental Haskell-Notes](https://blog.latukha.com/haskell-notes)
* [Haskell-study-plan](https://github.com/soupi/haskell-study-plan)
* [Haskell explained](https://haskell-explained.gitlab.io/blog/index.html)
* [A cheatsheet to the time library](https://www.williamyaoh.com/posts/2019-09-16-time-cheatsheet.html)
* [Why "Functor" doesn't matter](https://www.parsonsmatt.org/2019/08/30/why_functor_doesnt_matter.html)
* [The These datatype](https://fintanh.github.io/posts/these-changes.html)
* [Why haskell is important](https://www.tweag.io/posts/2019-09-06-why-haskell-is-important.html)
* [Descriptive variables name: a code smell](http://degoes.net/articles/insufficiently-polymorphic)
* [When x, y, and z are great variables name](https://blog.ploeh.dk/2015/08/17/when-x-y-and-z-are-great-variable-names/)
* [Diagrams quick start tutorial](https://archives.haskell.org/projects.haskell.org/diagrams/doc/quickstart.html)
* [What is good about haskell?](https://doisinkidney.com/posts/2019-10-02-what-is-good-about-haskell.html)

## News
* [Haskell weekly](https://haskellweekly.news/)
* [GHC news](https://www.haskell.org/ghc/blog.html)

## [Communities](https://www.haskell.org/community/)
* [IRC](https://www.haskell.org/irc/)
  [Wiki entry](https://wiki.haskell.org/IRC_channel)

# books
## References
* [Programming in haskell 2nd edition](https://www.amazon.com/Programming-Haskell-Graham-Hutton/dp/1316626229)

## Starting
* [Haskell Phrasebook](https://typeclasses.com/phrasebook) (a book of examples to learn haskell)
* [Learn me a haskell](http://learnyouahaskell.com/chapters)  
* [haskell first principle](haskellbook.com)  

## Specialized
* [Parallel and concurrent programming in Haskell](https://www.oreilly.com/library/view/parallel-and-concurrent/9781449335939/)
* [real world haskell](book.realworldhaskell.org)  
* thinking functionally with haskell  

# videos
* "Dependent Types in Haskell" by _Stephanie Weirich_ on youtube
* [list of good haskell videos](https://www.reddit.com/r/haskell/comments/cwo96l/what_is_your_favorite_video_with_haskell/) (posted 2019-09-01)

# concepts
* [foldable/traversable](https://wiki.haskell.org/Foldable_and_Traversable)
* functors
* applicative
* monads (IO, State, Maybe, Either, Reader, Writer)
* [monad transformers](https://wiki.haskell.org/Monad_Transformers_Explained)
  [wikibooks chapter](https://en.wikibooks.org/wiki/Haskell/Monad_transformers)
* [Generalised Algebraic DataType](https://wiki.haskell.org/Generalised_algebraic_datatype)
  [stack overflow answer on the topic](https://stackoverflow.com/questions/8245288/what-does-data-where-mean-in-haskell)  
  [Wikibooks chapter](https://en.wikibooks.org/wiki/Haskell/GADT)  
* category theory (math)
* [lens](http://lens.github.io/tutorial.html)
* dependent types
* [constraint trick](https://www.reddit.com/r/haskell/comments/3afi3t/the_constraint_trick_for_instances/) (a way to be stricter in instance constraints)
* [Existentially Quantified Types](https://en.m.wikibooks.org/wiki/Haskell/Existentially_quantified_types) (a way to qualify types by their typeclasses constraint (similar to Box<> in Rust))
* [TypeFamilies and FunctionalDependencies](https://wiki.haskell.org/Functional_dependencies_vs._type_families)
  * [TypeFamilies](https://wiki.haskell.org/GHC/Type_families)
  * [Functional Dependencies](https://wiki.haskell.org/Functional_dependencies)
    [GHC chapter](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#functional-dependencies)
* [DataKinds](https://stackoverflow.com/questions/20558648/what-is-the-datakinds-extension-of-haskell)
* PolyKinds
* [HRT and HKT](https://www.stephanboyer.com/post/115/higher-rank-and-higher-kinded-types)
  * [Rank-N Types / Higher rank types](http://sleepomeno.github.io/blog/2014/02/12/Explaining-Haskell-RankNTypes-for-all/)
  * Higher Kindred Types
* [GHC.Generics](https://wiki.haskell.org/GHC.Generics)
* [Commonads](https://hackage.haskell.org/package/comonad-5.0.5)
  ["commonads are objects](http://www.haskellforall.com/2013/02/you-could-have-invented-comonads.html)
  Commonads can be used to model [co-effects](http://tomasp.net/coeffects/)
  [Questions about co-monads](https://stackoverflow.com/questions/8428554/what-is-the-comonad-typeclass-in-haskell)

# toolset
* [stack](https://docs.haskellstack.org/en/stable/README/)
* Nix
* [Haskell-ci](https://hackage.haskell.org/package/haskell-ci) (script generator for continuous integration with [Travis-CI](https://travis-ci.org/))
* [hlint](https://hackage.haskell.org/package/hlint) (tool to suggest possible improvements to Haskell code)
* [argon](https://hackage.haskell.org/package/argon) (tool to measure [cyclomatic complexity](https://en.wikipedia.org/wiki/Cyclomatic_complexity))
* Code formatters
  * [stylish-haskell](https://hackage.haskell.org/package/stylish-haskell) (a tool to clean-up import statements and other things not part of the main code)
  * [brittany](https://hackage.haskell.org/package/brittany) (a tool to optimize the use of vertical space, and reorder expressions)
    Makes more changes than hindent, but may be more context sensitive
  * [hindent](https://hackage.haskell.org/package/hindent) ( a tool to reorganize code to be more readable)
  * [Ormolu](https://github.com/tweag/ormolu) (a tool keeping the existing style)
    Still young for now
* [ghcid](https://hackage.haskell.org/package/ghcid) (a file-watcher to automatically rebuild when any has changed)
* [Haskell IDE Engine](https://github.com/haskell/haskell-ide-engine#using-hie-with-spacemacs) (Language-Server-Protocol for Haskell)
* [pointfree.io](pointfree.io) (website to convert code to pointfree) (exists as client-side program)
* [ghcide](https://hackage.haskell.org/package/ghcide) (a core to build IDE's on top of GHC) 

# libraries
## Standard libraries
* [Base](https://hackage.haskell.org/package/base)
  * [Prelude](https://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html)
  * [System.Console.GetOpt](https://hackage.haskell.org/package/base-4.12.0.0/docs/System-Console-GetOpt.html) (handle argument parsing)
  * [Debug.Trace](https://hackage.haskell.org/package/base-4.12.0.0/docs/Debug-Trace.html) (allow printf debugging)
  * [GHC.Generics](https://hackage.haskell.org/package/base-4.11.1.0/docs/GHC-Generics.html) (allow the use of the Generic typeclass for datatype-generic functions)


## External libraries
> [Practical libraries](https://guide.aelve.com/haskell)  
### Standards
#### Basics
* [Safe](https://hackage.haskell.org/package/safe) (contains safe version of classic functions like `head` or `tail`)
* [These](http://hackage.haskell.org/package/these) (a type `data These a b = This a | That b | These a b`)
* [Containers](https://hackage.haskell.org/package/containers) (contains multiple efficient containers)
* [statistics](http://hackage.haskell.org/package/statistics) (provide tools for stats)
* [test-framework](http://hackage.haskell.org/package/test-framework) (organize tests from [QuickCheck](https://hackage.haskell.org/package/QuickCheck) or [HUnit](http://hackage.haskell.org/package/HUnit))
* [Data.Array](https://hackage.haskell.org/package/array) (the standard Haskell arrays)
* [Vector: Efficient Arrays](https://hackage.haskell.org/package/vector) (a library to use boxed and unboxed vectors instead of single-linked lists)
* [Bifunctor](https://hackage.haskell.org/package/bifunctors)
* [Profunctor](https://hackage.haskell.org/package/profunctors)
  used for example with functions as the type (one function called before the profunctor, and one function called after)
  [video on the subject](https://www.youtube.com/watch?v=OJtGECfksds)
#### Advanced
* [Software Transactional Memory](http://hackage.haskell.org/package/stm) (for concurrent communication)
* [mtl](https://hackage.haskell.org/package/mtl) (monad classes and monad transformers)
* [criterion](http://hackage.haskell.org/package/criterion) (provide ways to measure software performances)
* [Operational](http://hackage.haskell.org/package/operational) (a library to implement monads with tricky control flow, like DSL)
  [operational monad tutorial](https://apfelmus.nfshost.com/articles/operational-monad.html?_sm_au_=iVV2WlMqr48BBmkVJ6F3jKH7c2fV2)
* [generic-deriving](https://hackage.haskell.org/package/generic-deriving) (a library to generalize the deriving mechanics in haskell)
* [polysemy](https://hackage.haskell.org/package/polysemy) (an alternative to mtl, considered better by some)
  [Polysemy is fun!](https://haskell-explained.gitlab.io/blog/posts/2019/07/28/polysemy-is-cool-part-1/)

### Specialized
#### Basics
* [dlist](https://hackage.haskell.org/package/dlist) (difference lists are list-like types supporting O(1) append)
* [prettyprinter](https://hackage.haskell.org/package/prettyprinter) (a printer to display info in a more readable way)
#### Advanced
* [Haskeline](https://hackage.haskell.org/package/haskeline) (for interactive CLI interface)
* [derive](http://hackage.haskell.org/package/derive) (a library to derive instances)
* [SubHask](https://hackage.haskell.org/package/subhask) (a library to rewrite the prelude using subcategories in category theories)
* [extensible-effects](https://hackage.haskell.org/package/extensible-effects) (an alternative to monad transformers)
* [potparse-applicative](https://hackage.haskell.org/package/optparse-applicative) (for powerful parsing CL options)
* [repa](https://hackage.haskell.org/package/repa) (high-performance arrays) ([tutorial](https://wiki.haskell.org/Numeric_Haskell:_A_Repa_Tutorial))

## Frameworks
### Web server
* [Yesod](https://www.yesodweb.com/)

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

## Debugging
* `:break <function name>` sets a breakpoint at the start of the function
* `:step` steps into the function, it also allows to access inner functions
```
foo x = g (x + 2)
  where g y = x^y

: break foo
:step
:t g
g 2
```

# ghcid
`stack build ghcid && stack exec -- ghcid`  
runs ghci with a file as daemon  

# stack
`stack install <package>` install the given package  
`stack build <executable>` builds and setup in the project the exec  
`stack exec -- <executable>` execute the executable  

`stack run <args>` runs the main of the project with the given arguments

# ghc
## GHC options
> The arguments can also be given when calling ghc
* `{-# OPTION_GHC -Wall #-}`
* `{-# OPTION_GHC -Wno-tabs #-}`
* `{-# OPTION_GHC -Wunused-imports #-}`
## language options
> Can also be given as `-X<extension>`
* [Reference](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html)
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
* `{-# LANGUAGE DefaultSignatures #-}` (allows the definition of default signatures, used along-side GHC.Generics)
* Easier `newtype` handling
  * `{-# LANGUAGE GeneralizedNewtypeDeriving #-}` allows to derive typeclass instancied by the original type of the newtype, to reduce boilerplate and code copy
  * `{-# LANGUAGE StandaloneDeriving #-}` allows to precise a particular type of a generalized type (ex: `deriving instance ToText (Id User)`)
* Deriving
  * `{#- LANGUAGE RoleAnnotations #-}` allows to use roles annotations ([link](https://gitlab.haskell.org/ghc/ghc/wikis/roles))
  * `{-# LANGUAGE Derive<...> #-}` adds deriving for some typeclasses, is a group of extensions
    Ex: `{-# LANGUAGE DeriveFoldable #-}`
  * `{-# LANGUAGE <...>Deriving #-}` adds a deriving strategy, is a group of extensions
    Ex: `{-# LANGUAGE GeneralizedNewTypeDeriving #-}` allows deriving of newtypes from there mother type
  * `{-# LANGUAGE DirivingStrategies #-}` allows to select the strategy to use when deriving ([infos](https://typeclasses.com/ghc/deriving-strategies))

## language features
* [Generic programming](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#generic-programming)

## pragmas
> [GHC reference](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#pragmas)
* `instance {-# OVERLAPPING #-} <typeclass> <type> where ...` (design this instance as overlapping another)
   connected pragmas: `OVERLAPPABLE` and `OVERLAPS`
   [Reference 1](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#overlapping-overlappable-overlaps-and-incoherent-pragmas)
   [Reference 2](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#instance-overlap)

