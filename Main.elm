module Main where

import Html exposing (Html, div, text, ul, li)
import Html.Attributes as Attributes exposing (style)
import Color exposing (Color, rgba, complement)

import Css exposing (Styles, setViewport)
import Css.Border.Bottom as BorderBottom
import Css.Border.Left as BorderLeft
import Css.Border.Right as BorderRight
import Css.Border.Style as BorderStyle
import Css.Border.Top as BorderTop
import Css.Background as Background
import Css.Cursor as Cursor exposing (cursor)
import Css.Border as Border
import Css.Dimension as Dimension
import Css.Display as Display exposing (display)
import Css.Flex as Flex
import Css.Float as Float
import Css.Font as Font
import Css.ListStyle as ListStyle
import Css.Margin as Margin
import Css.Outline as Outline
import Css.Padding as Padding
import Css.Position as Position
import Css.Shadow as Shadow
import Css.Text as Text
import Css.Util as Util


shadows : List Shadow.Box
shadows =
  [ (10, 10, 10, 0, (rgba 0 0 255 1), False)
  , (-5, -5, 10, 0, (rgba 0 0 100 1), False)
  ]


squareStyle : Int -> Int -> Int -> Color -> Styles -> Styles
squareStyle num index width color styles =
  let w = (toFloat width) / 2
      n = (toFloat num)
      i = (toFloat index)
      segment1 = round ((w / n) * i)
      segment2 = round ((w / n) * (n - i))
  in
    display Display.Flex
    <| Flex.justifyContent Flex.JCCenter
    <| Flex.alignItems Flex.AICenter
    <| Border.radius segment1 segment2 segment1 segment2
    <| cursor Cursor.Cell
    <| Shadow.box shadows
    <| Margin.all 10 0 0 10
    <| Font.size (width // 4)
    <| Text.color (rgba 236 240 241 1)
    <| Background.color color
    <| Dimension.height width
    <| Dimension.width width styles


squaresStyle : Styles -> Styles
squaresStyle styles =
  display Display.Flex
  <| Flex.wrap Flex.Wrap styles


square : Int -> Int -> Int -> Color -> Html
square num index width color =
  div
    [ style <| squareStyle num index width color [] ]
    [ text <| toString index ]


squares : Int -> Int -> (Int -> Color) -> Html
squares num width color =
  div
    [ style <| squaresStyle [] ]
    <| List.map (\index -> square num index width (color index)) [1..num]


getColor : Int -> Color
getColor index =
  if | index % 3 == 0 ->
      rgba 26 188 156 1

     | index % 2 == 0 ->
      rgba 46 204 113 1

     | otherwise ->
      rgba 52 152 219 1


showStyles : Int -> Int -> (Int -> Color) -> List Html
showStyles num width colorFrom =
  let getStyleHtml =
        (\index ->
          Util.toCss ("square" ++ (toString index))
          <| squareStyle num index width (colorFrom index) [])
  in
    List.map getStyleHtml [1..num]


listStyle : Styles -> Styles
listStyle styles =
  Margin.left 100
  <| ListStyle.bulletType ListStyle.UpperRoman styles


listItem : Int -> Html
listItem index =
  li [] [ text ("item " ++ (toString index)) ]


listItems : Int -> List Html
listItems num =
  List.map listItem [1..num]


main : Html
main =
  let numSquares = 100
      squareWidth = 100
  in
    -- ul [ style <| listStyle [] ] <| listItems 1000
    div
      []
      [ setViewport
      , squares numSquares squareWidth getColor
      , div [] <| showStyles numSquares squareWidth getColor
      , Util.toCss "squares" <| squaresStyle []
      ]
