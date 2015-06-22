module Css.Padding where

import Css exposing (Styles, (:::))

bottom : Int -> Styles -> Styles
bottom p styles =
  List.append styles [ "padding-bottom" ::: ((toString p) ++ "px") ]

left : Int -> Styles -> Styles
left p styles =
  List.append styles [ "padding-left" ::: ((toString p) ++ "px") ]

right : Int -> Styles -> Styles
right p styles =
  List.append styles [ "padding-right" ::: ((toString p) ++ "px") ]

top : Int -> Styles -> Styles
top p styles =
  List.append styles [ "padding-top" ::: ((toString p) ++ "px") ]

all : Int -> Int -> Int -> Int -> Styles -> Styles
all t r b l styles =
  top t
  <| right r
  <| bottom b
  <| left l styles
