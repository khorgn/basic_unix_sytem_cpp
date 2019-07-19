type Name = String
type Data = String

data FSItem = File Name Data | Folder Name [FSItem] deriving (Show, Eq)

-- files are ordered
-- the first list is the items before the one currently focused
-- the second list is the items after the one currently focused
data FSCtx = FSCtx Name [FSItem] [FSItem] deriving (Show, Eq)

type FSZipper = (FSItem, [FSCtx])

defaultDisk :: FSItem
defaultDisk =
  Folder "root"
    [ File "goat.wmv" "baaaaa"
    , File "pope.avi" "god bless"
    , Folder "pics"
      [ File "ape.jpg" "bleargh"
      , File "watermelon.gif" "smash"
      , File "skull.bmp" "Yi"
      ]
    , File "dijon.doc" "best mustard"
    , Folder "programs"
      [ File "prog1.exe" "go"
      , File "owl.dmg" "h00t"
      , File "virtus.exe" "virus"
      , Folder "source code"
        [ File "best_prog.hs" "main = print (fix error)"
        , File "random.hs" "main = print 4"
        ]
      ]
    ]



fsUp :: FSZipper -> FSZipper
-- the inner parentheses for FSCtx are not necessary but make it easier to understand
fsUp (item, (FSCtx name lfiles rfiles):ctxs) = (Folder name (lfiles ++ [item] ++ rfiles), ctxs)

fsTo :: Name -> FSZipper -> FSZipper
fsTo name (Folder folderName items, ctxs) =
  -- break :: (a -> Bool) -> [a] -> ([a], [a])
  -- first element evaluate to false, second the first one to evaluate to true
  let (lfiles, item:rfiles) = break (nameIs name) items
  in (item, FSCtx folderName lfiles rfiles:ctxs)

nameIs :: Name -> FSItem -> Bool
nameIs name (Folder folderName _) = name == folderName
nameIs name (File fileName _) = name == fileName

fsRename :: Name -> FSZipper -> FSZipper
fsRename newName (Folder name items, ctxs) = (Folder newName items, ctxs)
fsRename newName (File name dat, ctxs) = (File newName dat, ctxs)

fsNewFile :: FSItem -> FSZipper -> FSZipper
fsNewFile item (Folder folderName items, bs) = (Folder folderName (item:items), bs)


exampleFilesystem1 = newFocus == newFocus
  where newFocus = (defaultDisk, []) -: fsTo "pics" -: fsTo "skull.bmp"
        newResult =
          (
          File "skull.bmp" "Yi"
          ,
          -- the list of context for each movement
          [FSCtx "pics"
            -- the elements before the chosen file in the list
            [File "ape.jpg" "bleargh"
            ,File "watermelon.gif" "smash"
            ]
            -- the elements after the chose file in the list
            []
          ,FSCtx "root"
            [File "goat.wmv" "baaaaa"
            ,File "pope.avi" "god bless"
            ]
            [File "dijon.doc" "best mustard"
            ,Folder "programs"
              [File "prog1.exe" "go"
              ,File "owl.dmg" "h00t"
              ,File "virtus.exe" "virus"
              ,Folder "source code"
                [File "best_prog.hs" "main = print (fix error)"
                ,File "random.hs" "main = print 4"
                ]
              ]
            ]
          ]
          )

exampleFilesystem2 = newFocus == newResult
  where newFocus = (defaultDisk, []) -: fsTo "pics" -: fsRename "cspi" -: fsUp
        newResult = 
          (Folder "root"
            [ File "goat.wmv" "baaaaa"
            , File "pope.avi" "god bless"
            , Folder "cspi"
              [ File "ape.jpg" "bleargh"
              , File "watermelon.gif" "smash"
              , File "skull.bmp" "Yi"
              ]
            , File "dijon.doc" "best mustard"
            , Folder "programs"
              [ File "prog1.exe" "go"
              , File "owl.dmg" "h00t"
              , File "virtus.exe" "virus"
              , Folder "source code"
                [ File "best_prog.hs" "main = print (fix error)"
                , File "random.hs" "main = print 4"
                ]
              ]
            ]
          ,
          []
          )

exampleFilesystem3 = newFocus == newResult
  where newFocus = (defaultDisk, []) -: fsTo "pics" -: fsNewFile (File "heh.jpg" "lol") -: fsUp
        newResult =
          (Folder "root"
            [ File "goat.wmv" "baaaaa"
            , File "pope.avi" "god bless"
            , Folder "pics"
              [ File "heh.jpg" "lol"
              , File "ape.jpg" "bleargh"
              , File "watermelon.gif" "smash"
              , File "skull.bmp" "Yi"
              ]
            , File "dijon.doc" "best mustard"
            , Folder "programs"
              [ File "prog1.exe" "go"
              , File "owl.dmg" "h00t"
              , File "virtus.exe" "virus"
              , Folder "source code"
                [ File "best_prog.hs" "main = print (fix error)"
                , File "random.hs" "main = print 4"
                ]
              ]
            ]
          ,
          []
          )


(-:) :: a -> (a -> b) -> b
x -: f = f x
