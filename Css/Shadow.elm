module Css.Shadow (box) where

{-| With CSS3 you can add shadow to text and to elements.

#Strings
@docs boxString

#Functions
@docs box
-}

-- Native Imports
import Color exposing (Color)

-- My Imports
import Css exposing (Styles, (:::), colorString, px)


{-| Convert a shadow to string form so it works with css.

    import Css.Shadow as Shadow

    -- "10px 10px 10px 5px rgba(0, 0, 0, 1)"
    shadow.boxString 10 10 10 5 (rgba 0 0 0 1) false
-}
boxString : Int -> Int -> Int -> Int -> Color -> Bool -> String
boxString hShadow vShadow blur spread color inset =
  let h = px hShadow
      v = px vShadow
      b = px blur
      s = px spread
      c = colorString color
      i = if inset then "inset" else ""
  in
    h ++ v ++ b ++ s ++ c ++ i


{-| Attach a shadow to an element.

    import Css.Shadow as Shadow

    -- [ ("box-shadow", "10px 10px 10px 5px rgba(0, 0, 0, 1)") ]
    Shadow.box 10 10 10 5 (rgba 0 0 0 1) false
-}
box : Int -> Int -> Int -> Int -> Color -> Bool -> Styles -> Styles
box hShadow vShadow blur spread color inset styles =
  let string = boxString hShadow vShadow blur spread color inset
  in
    List.append styles [ "box-shadow" ::: string ]
