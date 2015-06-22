module Css.Float where

import Css exposing (Styles, (:::))

type Clear
    = ClearLeft
    | ClearRight
    | ClearBoth
    | ClearNone

type FloatType
    = Left
    | Right
    | None

clearString : Clear -> String
clearString clear =
  case clear of
    ClearLeft ->
        "left"

    ClearRight ->
        "right"

    ClearBoth ->
        "both"

    ClearNone ->
        "none"

floatString : FloatType -> String
floatString float =
  case float of
    Left ->
        "left"

    Right ->
        "right"

    None ->
        "none"


clear : Clear -> Styles -> Styles
clear c styles =
  List.append styles [ "clear" ::: clearString c ]

float : FloatType -> Styles -> Styles
float f styles =
  List.append styles [ "float" ::: floatString f ]
