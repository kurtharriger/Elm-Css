module Css.Margin where

import Css exposing (Styles, (:::))

bottom : Int -> Styles -> Styles
bottom m styles =
  List.append styles [ "margin-bottom" ::: ((toString m) ++ "px") ]

left : Int -> Styles -> Styles
left m styles =
  List.append styles [ "margin-left" ::: ((toString m) ++ "px") ]

right : Int -> Styles -> Styles
right m styles =
  List.append styles [ "margin-right" ::: ((toString m) ++ "px") ]

top : Int -> Styles -> Styles
top m styles =
  List.append styles [ "margin-top" ::: ((toString m) ++ "px") ]

all : Int -> Int -> Int -> Int -> Styles -> Styles
all t r b l styles =
  top t
  <| right r
  <| bottom b
  <| left l styles
