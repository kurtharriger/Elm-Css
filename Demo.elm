module Demo where

import Window
import Signal exposing ((<~), (~), foldp)
import Color exposing (Color, rgba)
import Time exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)

import Css exposing (Styles, setViewport)
import Css.Transform3 exposing (..)
import Css.Dimension as Dimension
import Css.Util as Util
import Css.Background as Background
import Css.Display as Display exposing (display)
import Css.Flex as Flex
import Css.Text as Text
import Css.Font as Font
import Css.Gradient as Gradient


demoStyles : Float -> Styles -> Styles
demoStyles time styles =
  let max = if time > 500 then 500 else time
  in
    Dimension.width 100
    <| Dimension.height 100
    <| transform3
      [ translate3 (100 + max) 100 0
      , rotate3 1 1 1 time
      , scale3 (max / 100) (max / 100) (max / 100)
      ]
    <| Background.color (rgba 255 0 0 1) styles


demo : Float -> Html
demo time =
  div
  [ style <| demoStyles time [] ]
  [ ]


view : Float -> Html
view time =
  div
  []
  [ setViewport
  , Util.toCss "demo" <| demoStyles time []
  , demo time
  ]


timeDelta : Signal number
timeDelta =
  foldp (\x a -> a + (x / 20)) 0 (fps 60)


main : Signal Html
main =
  view <~ timeDelta
