module Css where

import Html exposing (Html, Attribute, div, code, text, pre)
import Html.Attributes exposing (style)
import Color exposing (toRgb, Color, rgba)

type alias Styles = List (String, String)

(:::) = (,)

colorString : Color -> String
colorString color =
  let rgba = toRgb color
      r   = "rgba(" ++ (toString rgba.red) ++ ", "
      g   = (toString rgba.green) ++ ", "
      b   = (toString rgba.blue) ++ ", "
      a   = (toString rgba.alpha) ++ ")"
  in r ++ g ++ b ++ a
