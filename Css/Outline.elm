module Css.Outline where

import Color exposing (Color)
import Css exposing (Styles, (:::), colorString)

type Style
    = None
    | Hidden
    | Dotted
    | Dashed
    | Solid
    | Double
    | Groove
    | Ridge
    | Inset
    | Outset

styleString : Style -> String
styleString style =
  case style of
    None ->
        "none"

    Hidden ->
        "hidden"

    Dotted ->
        "dotted"

    Dashed ->
        "dashed"

    Solid ->
        "solid"

    Double ->
        "double"

    Groove ->
        "groove"

    Ridge ->
        "ridge"

    Inset ->
        "inset"

    Outset ->
        "outset"


color : Color -> Styles -> Styles
color c styles =
  List.append styles [ "outline-color" ::: colorString c ]

style : Style -> Styles -> Styles
style s styles =
  List.append styles [ "outline-style" ::: styleString s ]

width : Int -> Styles -> Styles
width w styles =
  List.append styles [ "outline-width" ::: ((toString w) ++ "px") ]

all : Color -> Style -> Int -> Styles -> Styles
all c s w styles =
  color c
  <| style s
  <| width w styles
