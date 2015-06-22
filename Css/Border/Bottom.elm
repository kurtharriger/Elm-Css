module Css.Border.Bottom where

{-| This library allows you to set the bottom border of any html element.
You can set the color, style, width, and radius of the bottom border.

# Functions
@docs color, style, width, rightRadius, leftRadius

-}

-- Native Imports
import Color exposing (Color)

-- My Imports
import Css exposing (Styles, (:::), colorString)
import Css.Border.Style as BorderStyle exposing (Style)


{-| Sets the color of the bottom border

    -- Sets the bottom border color to red
    import Css.Border.Bottom as BorderBottom


    -- [ ("border-bottom-color", "rgba(255, 0, 0, 1)") ]
    BorderBottom.color (rgba 255 0 0 1) []
-}
color : Color -> Styles -> Styles
color c styles =
  List.append styles [ "border-bottom-color" ::: colorString c ]


{-| Sets the style of the bottom border

    -- Sets the bottom border style to dashed
    import Css.Border.Style as BorderStyle
    import Css.Border.Bottom as BorderBottom


    -- [ ("border-bottom-style, "dashed") ]
    BorderBottom.style BorderStyle.Dashed []
-}
style : Style -> Styles -> Styles
style s styles =
  List.append styles [ "border-bottom-style" ::: BorderStyle.string s ]


{-| Sets the width of the bottom border

    -- Sets the bottom border width to 5 pixels
    import Css.Border.Bottom as BorderBottom

    -- [ ("border-bottom-width, "5px") ]
    BorderBottom.width 5 []
-}
width : Int -> Styles -> Styles
width w styles =
  List.append styles [ "border-bottom-width" ::: ((toString w) ++ "px") ]


{-| Sets the right radius of the bottom border

    -- Sets the right radius of the bottom border to 25 pixels
    import Css.Border.Bottom as BorderBottom


    -- [ ("border-bottom-right-radius, "25px") ]
    BorderBottom.rightRadius 25 []
-}
rightRadius : Int -> Styles -> Styles
rightRadius r styles =
  List.append styles [ "border-bottom-right-radius" ::: ((toString r) ++ "px") ]


{-| Sets the left radius of the bottom border

    -- Sets the left radius of the bottom border to 25 pixels
    import Css.Border.Bottom as BorderBottom


    -- [ ("border-bottom-left-radius, "25px") ]
    BorderBottom.leftRadius 25 []
-}
leftRadius : Int -> Styles -> Styles
leftRadius r styles =
  List.append styles [ "border-bottom-left-radius" ::: ((toString r) ++ "px") ]
