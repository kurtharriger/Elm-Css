module Css where

{-| This module provides a few helper functions that make dealing with
css in Elm more pleasant and concise.

#Definition
@docs Styles

#String
@docs colorString

#Functions
@docs px, url, setViewport, webkit, style
-}

-- Native Imports
import Color exposing (toRgb, Color, rgba)

-- Third Party Imports
import Html exposing (Html, Attribute, div, code, text, pre, node)
import Html.Attributes exposing (style, content, name)


-- This type alias allows us to be more expressive.
type alias Styles = List (String, String)


{-- This is the one and only infix operator used in this library.
It is only used internally but is also available for you if it is convenient.

It allows you to write tuples slightly differently

[ ("color", "rgba(0, 0, 0, 1)") ] -> [ "color" ::: "rgba(0, 0, 0, 1)" ]
--}
(:::) = (,)


{-| Convert a color type to string form so it works with css.

    import Css exposing (colorString)

    colorString (rgba 0 0 0 1) -- "rgba(0, 0, 0, 1)"
-}
colorString : Color -> String
colorString color =
  let rgba = toRgb color
      r   = "rgba(" ++ (toString rgba.red) ++ ", "
      g   = (toString rgba.green) ++ ", "
      b   = (toString rgba.blue) ++ ", "
      a   = (toString rgba.alpha) ++ ")"
  in r ++ g ++ b ++ a


{-| Add a px post fix to the end of any integer.

    import Css exposing (px)

    px 5 -- "5px"
-}
px : Int -> String
px num =
  (toString num) ++ "px "


{-| Add a url prefix to a string.

    import Css exposing (url)

    url "smiley.gif" -- "url(\"smiley.gif\")"
-}
url : String -> String
url path =
  "url(\"" ++ path ++ "\")"


{-| Set the proper width and scaling to allow for responsive design -}
setViewport : Html
setViewport =
  node "meta"
    [ name "viewport"
    , content "width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
    ]
    []


{-| Add a webkit prefix to a value.

    import Css

    [ ("cursor", "-webkit-zoom-out") ]
    Css.webkit "cursor" "zoom-out" []
-}
webkit : String -> String -> Styles -> Styles
webkit name value styles =
  style name ("-webkit-" ++ value) styles


{-| Add a webkit prefix to a name.

    import Css

    [ ("-webkit-box-orient", "horizontal") ]
    Css.webkitName "box-orient" "horizontal" []
-}
webkitName : String -> String -> Styles -> Styles
webkitName name value styles =
  style ("-webkit-" ++ name) value styles


{-| Add a ms prefix to a value.

    import Css

    [ ("display", "-ms-flexbox") ]
    Css.ms "display" "flexbox" []
-}
ms : String -> String -> Styles -> Styles
ms name value styles =
  style name ("-ms-" ++ value) styles


{-| Add a ms prefix to a name.

    import Css

    [ ("-ms-flex-direction", "row") ]
    Css.msName "flex-direction" "row" []
-}
msName : String -> String -> Styles -> Styles
msName name value styles =
  style ("-ms-" ++ name) value styles


{-| Add a moz prefix to a value.

    import Css

    [ ("display", "-moz-flexbox") ]
    Css.moz "display" "flexbox" []
-}
moz : String -> String -> Styles -> Styles
moz name value styles =
  style name ("-moz-" ++ value) styles


{-| Add a moz prefix to a name.

    import Css

    [ ("-moz-flex-direction", "row") ]
    Css.mozName "flex-direction" "row" []
-}
mozName : String -> String -> Styles -> Styles
mozName name value styles =
  style ("-moz-" ++ name) value styles


{-| Add a o prefix to a value.

    import Css

    [ ("display", "-o-flexbox") ]
    Css.o "display" "flexbox" []
-}
o : String -> String -> Styles -> Styles
o name value styles =
  style name ("-o-" ++ value) styles


{-| Add a o prefix to a name.

    import Css

    [ ("-o-flex-direction", "row") ]
    Css.oName "flex-direction" "row" []
-}
oName : String -> String -> Styles -> Styles
oName name value styles =
  style ("-o-" ++ name) value styles

  
{-| Add a css style to a list of styles.

    import Css

    [ ("cursor", "zoom-out") ]
    Css.style "cursor" "zoom-out" []
-}
style : String -> String -> Styles -> Styles
style name value styles =
  List.append styles [ name ::: value ]
