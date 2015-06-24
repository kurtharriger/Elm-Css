module Css.Border.Top where

{-| This library allows you to set the bottom border of any html element.
You can set the color, style, width, and radius of the top border.

# Functions
@docs color, style, width, rightRadius, leftRadius
-}

-- Native Imports
import Color exposing (Color, rgba)

-- My Imports
import Css exposing (Styles, (:::), colorString, px)
import Css.Border.Style as BorderStyle exposing (Style)


{-| Set the color of the top border

    -- Set the top border color to red
    import Css.Border.Top as BorderTop

    -- [ ("border-top-color", "rgba(255, 0, 0, 1)") ]
    BorderTop.color (rgba 255 0 0 1) []
-}
color : Color -> Styles -> Styles
color c styles =
  List.append styles [ "border-top-color" ::: colorString c ]


{-| Set the style of the top border

    -- Set the top border style to dashed
    import Css.Border.Style as BorderStyle
    import Css.Border.Top as BorderTop

    -- [ ("border-top-style, "dashed") ]
    BorderTop.style BorderStyle.Dashed []
-}
style : Style -> Styles -> Styles
style s styles =
  List.append styles [ "border-top-style" ::: BorderStyle.string s ]


{-| Set the width of the top border

    -- Set the top border width to 5 pixels
    import Css.Border.Top as BorderTop

    -- [ ("border-top-width, "5px") ]
    BorderTop.width 5 []
-}
width : Int -> Styles -> Styles
width w styles =
  List.append styles [ "border-top-width" ::: px w ]


{-| Set the top radius of the top border

    -- Set the top radius of the top border to 25 pixels
    import Css.Border.Top as BorderTop


    -- [ ("border-top-right-radius, "25px") ]
    BorderTop.rightRadius 25 []
-}
rightRadius : Int -> Styles -> Styles
rightRadius r styles =
  List.append styles [ "border-top-right-radius" ::: px r ]


{-| Set the top radius of the top border

    -- Set the top radius of the top border to 25 pixels
    import Css.Border.Top as BorderTop


    -- [ ("border-top-left-radius, "25px") ]
    BorderTop.leftRadius 25 []
-}
leftRadius : Int -> Styles -> Styles
leftRadius l styles =
  List.append styles [ "border-top-left-radius" ::: px l ]
