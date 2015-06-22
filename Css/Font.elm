module Css.Font where

import Css exposing ((:::), Styles)

type Style
    = NormalStyle
    | Italic
    | Oblique

type Variant
    = NormalVariant
    | SmallCaps

styleString : Style -> String
styleString style =
  case style of
    NormalStyle ->
        "normal"

    Italic ->
        "italic"

    Oblique ->
        "oblique"


variantString : Variant -> String
variantString variant =
  case variant of
    NormalVariant ->
        "normal"

    SmallCaps ->
        "small-caps"


family : String -> Styles -> Styles
family f styles =
  List.append styles [ "font-family" ::: f ]

size : Int -> Styles -> Styles
size length styles =
  List.append styles [ "font-size" ::: ((toString length) ++ "px") ]

style : Style -> Styles -> Styles
style s styles =
  List.append styles [ "font-style" ::: styleString s ]

variant : Variant -> Styles -> Styles
variant v styles =
  List.append styles [ "font-variant" ::: variantString v ]

weight : Int -> Styles -> Styles
weight w styles =
  let ub = if w > 9 then 9 else w
      lb = if ub < 1 then 1 else ub
  in
    List.append styles [ "font-weight" ::: toString (lb * 100) ]

all : String -> Int -> Style -> Variant -> Int -> Styles -> Styles
all f l s v w styles =
  family f
  <| size l
  <| style s
  <| variant v
  <| weight w styles
