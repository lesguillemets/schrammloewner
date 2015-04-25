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
    walk = map (\(x,y) -> (x*2,y*2)) $ randWalkN (-1,1) seed n
    in do
        render canv . translate (r,r) . color backColor .  stroke . path $ walk
        renderOnTop canv . translate (r,r) .
             color mainColor .  stroke . path $ eraseWhole walk

mainColor :: Color
mainColor = RGB 0 0 250

backColor :: Color
backColor = RGBA 0 0 0 0.4

eraseLoop :: (Eq a) => [a] -> [a]
eraseLoop [] = []
eraseLoop (x:xs) = case dropWhile (/=x) xs of
                       [] -> x: eraseLoop xs
                       (h:rest) -> h : eraseLoop rest

eraseWhole :: (Eq a) => [a] -> [a]
eraseWhole xs = let xs' = eraseLoop xs in
    if length xs == length xs' then xs
                               else eraseWhole xs'
