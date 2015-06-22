module Css.Util (toCss) where

import Html exposing (Html, Attribute, div, code, text, pre)
import Html.Attributes exposing (style)

import Css exposing (Styles)
import Css.Flex as Flex
import Css.Display as Display exposing (display)
import Css.Margin as Margin
import Css.Padding as Padding
import Css.Font as Font

columnStyle : Styles -> Styles
columnStyle styles =
  display Display.Flex
  <| Flex.direction Flex.Column styles

codeStyle : Styles -> Styles
codeStyle styles =
  Margin.all 0 0 0 0
  <| Padding.all 0 0 0 0
  <| Font.size 24 styles

containerStyle : Styles -> Styles
containerStyle styles =
  columnStyle
  <| Margin.bottom 20 styles

getCode : (String, String) -> Html
getCode (name, value) =
  pre
    [ style <| codeStyle [] ]
    [ code
      [ style <| codeStyle [] ]
      [ text ("  " ++ name ++ ": " ++ value ++ ";") ]
    ]

toCss : String -> Styles -> Html
toCss className styles =
  div
    [ style <| containerStyle [] ]
    [ code [ style <| codeStyle [] ] [ text ("." ++ className ++ " {") ]
    , div [ style <| columnStyle [] ] <| List.map (\s -> getCode s ) styles
    , code [ style <| codeStyle [] ] [ text "}" ]
    ]
