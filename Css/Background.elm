module Css.Background where

{-| Sets the background properties for the element.
You can set the color, image, position, size, repeat, and attachment.

#Definitions
@docs Repeat Attachment Size Position

#Strings
@docs repeatString, attachmentString, pointString

#Functions
@docs color, image, position, size, repeat, attachment
-}

-- Native Imports
import Color exposing (Color, rgba)

-- My Imports
import Css exposing ((:::), Styles, colorString)


{-| Represent how to repeat the background image

Repeat -
  The background image will be repeated both vertically and horizontally.

RepeatX -
  The background image will be repeated only horizontally.
  This is really usefull to repeat a gradient or some other thin
  background to save on storage space, and decrease loading time.

RepeatY -
  The background image will be repeated only vertically.

NoRepeat -
  The background image will not be repeated.
-}
type Repeat
    = Repeat
    | RepeatX
    | RepeatY
    | NoRepeat


{-| Represent whether the background image is fixed or scrolls
with the rest of the page.

Scroll -
  The background scrolls along with the element.

Fixed -
  The background is fixed with regard to the viewport.

Local -
  The background scrolls along with the element's contents
-}
type Attachment
    = Scroll
    | Fixed
    | Local


{-| Convert a repeat type to the string form so it works with css.

    import Css.Background as Background

    Background.repeatString Background.Repeat -- "repeat"
-}
repeatString : Repeat -> String
repeatString repeat =
  case repeat of
    Repeat ->
        "repeat"

    RepeatX ->
        "repeat-x"

    RepeatY ->
        "repeat-y"

    NoRepeat ->
        "no-repeat"


{-| Convert the attachment type to the string form so it works with css.

    import Css.Background as Background

    Background.attachmentString Background.Scroll -- "scroll"
-}
attachmentString : Attachment -> String
attachmentString attachment =
  case attachment of
    Scroll ->
        "scroll"

    Fixed ->
        "fixed"

    Local ->
        "local"


{-| Take two integers and append "px" so it works with css.

    import Css.Background as Background

    Background.pointString 5 10 -- "5px 10px"
-}
pointString : Int -> Int -> String
pointString x y =
  (toString x) ++ "px " ++ (toString y) ++ "px"


{-| Set the background color.


-}
color : Color -> Styles -> Styles
color c styles =
  List.append styles [ "background-color" ::: colorString c ]

image : String -> Styles -> Styles
image path styles =
  List.append styles [ "background-image" ::: path ]

position : Int -> Int -> Styles -> Styles
position x y styles =
  List.append styles [ "background-position" ::: pointString x y ]

size : Int -> Int -> Styles -> Styles
size width height styles =
  List.append styles [ "background-size" ::: pointString width height ]

repeat : Repeat -> Styles -> Styles
repeat r styles =
  List.append styles [ "background-repeat" ::: repeatString r ]

attachment : Attachment -> Styles -> Styles
attachment a styles =
  List.append styles [ "background-repeat" ::: attachmentString a ]
