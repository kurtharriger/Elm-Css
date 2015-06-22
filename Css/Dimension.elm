module Css.Dimension where

import Css exposing (Styles, (:::))

height : Int -> Styles -> Styles
height h styles =
  List.append styles [ "height" ::: ((toString h) ++ "px") ]

maxHeight : Int -> Styles -> Styles
maxHeight h styles =
  List.append styles [ "max-height" ::: ((toString h) ++ "px") ]

maxWidth : Int -> Styles -> Styles
maxWidth h styles =
  List.append styles [ "max-width" ::: ((toString h) ++ "px") ]

minHeight : Int -> Styles -> Styles
minHeight h styles =
  List.append styles [ "min-height" ::: ((toString h) ++ "px") ]

minWidth : Int -> Styles -> Styles
minWidth h styles =
  List.append styles [ "min-width" ::: ((toString h) ++ "px") ]

width : Int -> Styles -> Styles
width h styles =
  List.append styles [ "width" ::: ((toString h) ++ "px") ]
