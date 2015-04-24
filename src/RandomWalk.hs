import Haste
import Haste.DOM
import Haste.Graphics.Canvas

steps :: Int
steps = 10000

main = do
    Just canv <- getCanvasById "field"
    render canv . stroke . path $
        [
        (0,0),(20,40), (40,64), (70,70), (150,100),
        (200,200), (300,220), (400,450)
        ]
    return ()
