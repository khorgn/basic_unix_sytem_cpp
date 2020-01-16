module Blob (Blob(..)) where


data Blob = Blob {getHunger :: Int, getEnergy :: Int, getValue :: Int}

setHunger b h = b {getHunger = h}
setEnergy b e = b {getEnergy = e}
setValue b e = b {getValue = e}

gainHunger b = b {getHunger = (getHunger b) + 1}
loseEnergy b = b {getEnergy = (getEnergy b) - 1}

