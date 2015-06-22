module Css.Shadow (box) where

import Css exposing (Styles, (:::), colorString)
import Color exposing (Color)

px : Int -> String
px x =
  (toString x) ++ "px "

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

box : Int -> Int -> Int -> Int -> Color -> Bool -> Styles -> Styles
box hShadow vShadow blur spread color inset styles =
  let string = boxString hShadow vShadow blur spread color inset
  in
    List.append styles [ "box-shadow" ::: string ]
