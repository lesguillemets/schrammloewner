module Basal where
import Haste
import Control.Arrow

randWalk :: Seed -> Int -> [(Double,Double)]
randWalk = randWalkN (-2,2)

randWalkN :: (Int,Int) -> Seed -> Int -> [(Double,Double)]
randWalkN (low, high) seed n =
        scanl1 addVect . map (fromIntegral *** fromIntegral) .
            toMoves . take n . randomRs (low,high) $ seed

toMoves :: [Int] -> [(Int,Int)]
toMoves [] = []
toMoves [_] = []
toMoves (x:y:ss) = (x,y) : toMoves ss

addVect :: Num a => (a,a) -> (a,a) -> (a,a)
addVect (x0,y0) (x1,y1) = (x0+x1, y0+y1)
