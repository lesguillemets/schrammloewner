import Haste
import Haste.DOM
import Haste.Graphics.Canvas
import Control.Arrow ((***))

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
        render canv . translate (r,r) . stroke . path $ randWalk seed n


randWalk :: Seed -> Int -> [(Double,Double)]
randWalk seed n = scanl1 addVect . map (fromIntegral *** fromIntegral) .
        toMoves . take n . randomRs ((-2,2)::(Int,Int)) $ seed

toMoves :: [Int] -> [(Int,Int)]
toMoves [] = []
toMoves [_] = []
toMoves (x:y:ss) = (x,y) : toMoves ss

addVect :: Num a => (a,a) -> (a,a) -> (a,a)
addVect (x0,y0) (x1,y1) = (x0+x1, y0+y1)
