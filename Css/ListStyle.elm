module Css.ListStyle where

import Css exposing (Styles, (:::))

type Position
    = Inside
    | Outside

type Type
    = Disc
    | Armenian
    | Circle
    | CjkIdeographic
    | Decimal
    | DecimalLeadingZero
    | Georgian
    | Hebrew
    | Hiragana
    | HiraganaIroha
    | Katakana
    | KatakanaIroha
    | LowerAlpha
    | LowerGreek
    | LowerLatin
    | LowerRoman
    | None
    | Square
    | UpperAlpha
    | UpperLatin
    | UpperRoman

positionString : Position -> String
positionString position =
  case position of
    Inside ->
        "inside"

    Outside ->
        "outside"


typeString : Type -> String
typeString t =
  case t of
    Disc ->
        "disc"

    Armenian ->
        "armenian"

    Circle ->
        "circle"

    CjkIdeographic ->
        "cjk-ideographic"

    Decimal ->
        "decimal"

    DecimalLeadingZero ->
        "decimal-leading-zero"

    Georgian ->
        "georgian"

    Hebrew ->
        "hebrew"

    Hiragana ->
        "hiragana"

    HiraganaIroha ->
        "hiragana-iroha"

    Katakana ->
        "katakana"

    KatakanaIroha ->
        "katakana-iroha"

    LowerAlpha ->
        "lower-alpha"

    LowerGreek ->
        "lower-greek"

    LowerLatin ->
        "lower-latin"

    LowerRoman ->
        "lower-roman"

    None ->
        "none"

    Square ->
        "square"

    UpperAlpha ->
        "upper-alpha"

    UpperLatin ->
        "upper-latin"

    UpperRoman ->
        "upper-roman"


image : String -> Styles -> Styles
image path styles =
  List.append styles [ "list-style-image" ::: path ]

position : Position -> Styles -> Styles
position p styles =
  List.append styles [ "list-style-position" ::: positionString p ]

bulletType : Type -> Styles -> Styles
bulletType t styles =
  List.append styles [ "list-style-type" ::: typeString t ]

all : String -> Position -> Type -> Styles -> Styles
all path p t styles =
  image path
  <| position p
  <| bulletType t styles
