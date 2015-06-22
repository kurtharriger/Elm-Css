module Css.Text where

import Color exposing (Color, rgba)
import Css exposing ((:::), Styles, colorString)

type Direction
    = Ltr
    | Rtl

type Align
    = Left
    | Right
    | Center
    | Justify

type Decoration
    = NoDecoration
    | Underline
    | Overline
    | LineThrough

type Transform
    = NoTransform
    | Capitalize
    | Uppercase
    | Lowercase

type UnicodeBidi
    = NormalUnicodeBidi
    | Embed
    | BidiOverride

type WhiteSpace
    = NormalWhiteSpace
    | NoWrap
    | Pre
    | PreLine
    | PreWrap

directionString : Direction -> String
directionString direction =
  case direction of
    Ltr ->
        "ltr"

    Rtl ->
        "Rtl"


alignString : Align -> String
alignString align =
  case align of
    Left ->
        "left"

    Right ->
        "right"

    Center ->
        "center"

    Justify ->
        "justify"


decorationString : Decoration -> String
decorationString decoration =
  case decoration of
    NoDecoration ->
        "none"

    Underline ->
        "underline"

    Overline ->
        "overline"

    LineThrough ->
        "line-through"


shadowString : Int -> Int -> Int -> Color -> String
shadowString h v b c =
  ((toString h) ++ "px ")
  ++ ((toString v) ++ "px ")
  ++ ((toString b) ++ "px ")
  ++ (colorString c)

transformString : Transform -> String
transformString transform =
  case transform of
    NoTransform ->
        "none"

    Capitalize ->
        "capitalize"

    Uppercase ->
        "uppercase"

    Lowercase ->
        "lowercase"


unicodeBidiString : UnicodeBidi -> String
unicodeBidiString unicodeBidi =
  case unicodeBidi of
    NormalUnicodeBidi ->
        "normal"

    Embed ->
        "embed"

    BidiOverride ->
        "bidi-override"


whiteSpaceString : WhiteSpace -> String
whiteSpaceString whiteSpace =
  case whiteSpace of
    NormalWhiteSpace ->
        "normal"

    NoWrap ->
        "nowrap"

    Pre ->
        "pre"

    PreLine ->
        "pre-line"

    PreWrap ->
        "pre-wrap"


color : Color -> Styles -> Styles
color c styles =
  List.append styles [ "color" ::: colorString c ]

direction : Direction -> Styles -> Styles
direction d styles =
  List.append styles [ "direction" ::: directionString d ]

letterSpacing : Int -> Styles -> Styles
letterSpacing length styles =
  List.append styles [ "letter-spacing" ::: ((toString length) ++ "px") ]

lineHeight : Int -> Styles -> Styles
lineHeight length styles =
  List.append styles [ "line-height" ::: ((toString length) ++ "px") ]

align : Align -> Styles -> Styles
align a styles =
  List.append styles [ "text-align" ::: alignString a ]

decoration : Decoration -> Styles -> Styles
decoration d styles =
  List.append styles [ "text-decoration" ::: decorationString d ]

indent : Int -> Styles -> Styles
indent length styles =
  List.append styles [ "text-indent" ::: ((toString length) ++ "px") ]

shadow : Int -> Int -> Int -> Color -> Styles -> Styles
shadow h v b c styles =
  List.append styles [ "text-shadow" ::: shadowString h v b c ]

transform : Transform -> Styles -> Styles
transform t styles =
  List.append styles [ "text-transform" ::: transformString t ]

unicodeBidi : UnicodeBidi -> Styles -> Styles
unicodeBidi u styles =
  List.append styles [ "unicode-bidi" ::: unicodeBidiString u]

whiteSpace : WhiteSpace -> Styles -> Styles
whiteSpace ws styles =
  List.append styles [ "white-space" ::: whiteSpaceString ws ]

wordSpacing : Int -> Styles -> Styles
wordSpacing length styles =
  List.append styles [ "word-spacing" ::: ((toString length) ++ "px") ]
