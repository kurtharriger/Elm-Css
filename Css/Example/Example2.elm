module Css.Example.Example2 where

import Color exposing (rgba)

import Html exposing (Html, div, text, code)
import Html.Attributes exposing (style)

import Css exposing (Styles)
import Css.Display as Display exposing (display)
import Css.Flex as Flex
import Css.Font as Font
import Css.Text as Text
import Css.Margin as Margin
import Css.Background as Background
import Css.Dimension as Dimension
import Css.Util as Util
import Css.Example.Util exposing (Example)


example2 : Example
example2 =
  ( "Example 2"
  , "Now that we know how to create styles, and view a snapshot of the generated Css,
     lets do something a little more practical. Lets see how we can create the
     \"Holy Grail\" layout with flexbox."
  , codeString
  , view
  , explanation
  )


codeString : String
codeString = """
main : Html
main =
  div
  [ style
    <| column
    <| Text.color (rgba 255 255 255 1 ) [] ]
  [ setViewport
  , div [ style <| end [] ] [ text "header" ]
  , div
    [ style <| flex [] ]
    [ div [ style <| side [] ] [ text "left" ]
    , div
      [ style <| content [] ]
      [ div [] [ text "content" ] ]
    , div [ style <| side [] ] [ text "right" ]
    ]
  , div [ style <| end [] ] [ text "footer" ]
  ]


flex : Styles -> Styles
flex styles =
  display Display.Flex styles


end : Styles -> Styles
end styles =
  Dimension.height 50
  <| Background.color (rgba 26 188 156 1)
  <| centered styles


side : Styles -> Styles
side styles =
  Dimension.width 50
  <| Background.color (rgba 52 152 219 1)
  <| centered styles


content : Styles -> Styles
content styles =
  Dimension.width 200
  <| Dimension.height 200
  <| Background.color (rgba 52 73 94 1)
  <| centered styles


column : Styles -> Styles
column styles =
  flex
  <| Flex.direction Flex.Column styles


centered : Styles -> Styles
centered styles =
  flex
  <| Flex.alignItems Flex.AICenter
  <| Flex.justifyContent Flex.JCCenter styles
"""


explanation : Html
explanation =
  div
  [ style <| column [] ]
  [ div
    [ style <| Margin.bottom 10 [] ]
    [ text """
Here we use the \"setViewport\" function to enable a meta tag which effectively
allows us to have a nice design regardless of the size of the screen.
""" ]
  ]


view : Html
view =
  div
  [ style
    <| column
    <| Text.color (rgba 255 255 255 1 ) [] ]
  [ div [ style <| end [] ] [ text "header" ]
  , div
    [ style <| flex [] ]
    [ div [ style <| side [] ] [ text "left" ]
    , div
      [ style <| content [] ]
      [ div [] [ text "content" ] ]
    , div [ style <| side [] ] [ text "right" ]
    ]
  , div [ style <| end [] ] [ text "footer" ]
  ]


flex : Styles -> Styles
flex styles =
  display Display.Flex styles


end : Styles -> Styles
end styles =
  Dimension.height 50
  <| Background.color (rgba 26 188 156 1)
  <| centered styles


side : Styles -> Styles
side styles =
  Dimension.width 50
  <| Background.color (rgba 52 152 219 1)
  <| centered styles


content : Styles -> Styles
content styles =
  Dimension.width 200
  <| Dimension.height 200
  <| Background.color (rgba 52 73 94 1)
  <| centered styles


column : Styles -> Styles
column styles =
  flex
  <| Flex.direction Flex.Column styles


centered : Styles -> Styles
centered styles =
  flex
  <| Flex.alignItems Flex.AICenter
  <| Flex.justifyContent Flex.JCCenter styles
