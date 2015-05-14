import Haste
import Haste.DOM
import Haste.Graphics.Canvas

import Basal

steps :: Int
steps = 20000

size :: Int
size = 500

main = do
    Just canv <- getCanvasById "field"
    Just button <- elemById "button"
    _ <- onEvent button OnClick (onButtonClick canv steps)
    seed <- newSeed
    renderRW canv seed steps

onButtonClick :: Canvas -> Int -> Int -> (Int,Int) -> IO ()
onButtonClick canv n _ _ = do
    seed <- newSeed
    renderRW canv seed n

renderRW :: Canvas -> Seed -> Int -> IO ()
renderRW canv seed n = let
    r = fromIntegral (size `div` 2)
    in
        render canv . translate (r,r) . stroke . path $ randomWalkNPol 6 seed n
