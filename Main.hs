-- Brenda Emanuelle Scherer 

import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)

--user color option
greyPalette :: Int -> [(Int,Int,Int)]
greyPalette nShapes = [(i, i, i) | i <- [0..nShapes]]

greenPalette :: Int -> [(Int,Int,Int)]
greenPalette nShapes = [(i, i+i*2,i) | i <- [0..nShapes]]

purplePalette :: Int -> [(Int,Int,Int)]
purplePalette nShapes = [(i+i*2, i+20, i+i*2) | i <- [0..nShapes]]

pinkPalette :: Int -> [(Int,Int,Int)]
pinkPalette nShapes = [(i+150+i, i, i+100) | i <- [0..nShapes]]

bluePalette :: Int -> [(Int,Int,Int)]
bluePalette nShapes = [(i+30, i+i+50, i+200) | i <- [0..nShapes]]

yellowPalette :: Int -> [(Int,Int,Int)]
yellowPalette nShapes = [(i+200, i+150, i) | i <- [0..nShapes]]

redPalette :: Int -> [(Int,Int,Int)]
redPalette nShapes = [(i+120, i, i) | i <- [0..nShapes]]

--call user color option
rgbShape :: Int -> String -> [(Int,Int,Int)]
rgbShape nShapes colorUser 
                | colorUser == "grey" = greyPalette nShapes
                | colorUser == "pink" = pinkPalette nShapes
                | colorUser == "blue" = bluePalette nShapes
                | colorUser == "green" = greenPalette nShapes
                | colorUser == "yellow" = yellowPalette nShapes
                | colorUser == "purple" = purplePalette nShapes
                | colorUser == "red" = redPalette nShapes
                | otherwise = greyPalette nShapes

--end user color option


--calculate the size of the shapes
calculateSizeShapes :: String -> Float -> Float
calculateSizeShapes sizeShapes width
              | sizeShapes == "s"= width/150
              | sizeShapes == "m" = width/70
              | sizeShapes == "l" = width/20
              | otherwise = width/150
--end calculate the size of the shapes


---shapes generation

--square generation
genSquare:: Int -> (Float, Float) -> String -> [Rect]
genSquare nShapes (width,height) sizeShapes = [((startPositionX+((r*(m/pi)*(sin(m/pi)))), (startPositionY+(r*(m/pi)*((cos(m/pi)))))), w, h) | m <- [0..fromIntegral (nShapes-1)]]
  where (w,h) = (2*(calculateSizeShapes sizeShapes width), 2*(calculateSizeShapes sizeShapes width))
        r = calculateSizeShapes sizeShapes width
        startPositionX = width/2
        startPositionY = height/2

--circle generation
genCircles :: Int -> (Float, Float) -> String -> [Circle]
genCircles nShapes (width,height) sizeShapes = [((startPositionX+((r*(m/pi)*(sin(m/2)))), (startPositionY+(r*(m/pi)*((cos(m/2)))))), r) | m <- [0..fromIntegral (nShapes-1)]]
  where r = calculateSizeShapes sizeShapes width
        startPositionX = width/2
        startPositionY = height/2


--end shapes generation


--beginning svg pattern
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

svgEnd :: String
svgEnd = "</svg>"
--end svg pattern


--svg shapes
svgSquare :: Rect -> String -> String 
svgSquare ((x,y),w,h) style = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

svgCircle :: Circle -> String -> String 
svgCircle ((x,y),r) style = 
  printf "<circle cx='%.3f' cy='%.3f' r='%.3f' style='%s'/>\n" x y r style 

--end svg shapess


--styling shapes in svg
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d); mix-blend-mode: luminosity;" r g b


--all elements
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

main :: IO ()
main = do

  -- get user options in shell
  putStrLn "Informe o numero de formas"
  nShapes <- getLine
  putStrLn "Informe a largura da imagem"
  width <- getLine
  putStrLn"Informe a altura da imagem"
  height <- getLine
  putStrLn"Informe a paleta de cores"
  colorUser <- getLine
  putStrLn"Infome s, m ou l para small, medium ou large tamanho da forma"
  sizeShapes <- getLine
  putStrLn"Informe square ou circle para o tipo de forma"
  shapeOption <- getLine
  --end get user options in shell

  let svgstrs = svgBegin w h ++ shapeOptionUser  ++ svgEnd
      --general options
      colorScale = colorUser
      (w,h) = (read width,read height)   
      shapeOptionUser 
                    | shapeOption == "circle" = svgElements svgCircle circle (map svgStyle colorCircle)
                    | shapeOption == "square" =  svgElements svgSquare square (map svgStyle colorSquare) 
                    | otherwise = svgElements svgCircle circle (map svgStyle colorCircle)

      --cirle generation
      circle = genCircles nCircles (read width, read height)  sizeShapes 
      colorCircle = rgbShape nCircles colorScale 
      nCircles = read nShapes 

      --square generation
      square = genSquare nSquare (read width, read height) sizeShapes
      colorSquare = rgbShape nSquare colorScale
      nSquare = read nShapes 
    
      in writeFile "figs.svg" $ svgstrs