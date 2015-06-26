module Css.Position where

{-| Positioning allows you to position an element.  It can also place
and element behind another, and specify what should happen when an
element's content is too big.

#Definitions
@docs Clip, Overflow, Position

#Strings
@docs clipString, overflowString, positionString

#Functions
@docs bottom, left, overflow, position, right, top, zIndex
-}

-- My Imports
import Css exposing (Styles, (:::), url, px)


{-| What happens if an image is larger than its containing element?
The clip property lets you specify a rectangle to clip an absolutely
positioned element.  The rectangle is specified as four coordinates,
all from the top-left corner of the element to be clipped.

Note: The clip property does not work if "overflow:visible".

Shape -
  Clips an element.

NoClip -
  No clipping will be applied.
-}
type Clip
    = Shape
    | NoClip


{-| Represent what happens if content overflows an element's box.

AutoOverflow -
  If overflow clipped, a scroll-bar should be added to see the
  rest of the content.

Hidden -
  The overflow is clipped, and the rest of the content will be invisible.

Scroll -
  The overflow is clipped, but a scroll-bar is added to see the
  rest of the content.

Visible -
  The overflow is not clipped. It renders outside the element's box.
-}
type Overflow
    = AutoOverflow
    | Hidden
    | Scroll
    | Visible


{-| Represent the type of positioning for an element.

Absolute -
  The element is positioned relative to its first positioned
  (not static) ancestor element.

Fixed -
  The element is positioned relative to the browser window.

Relative -
  The element is positioned relative to its normal position,
  so "left:20" adds 20 pixels to the element's LEFT position.

Static -
  Elements render in order, as they appear in the document flow.
-}
type Position
    = Absolute
    | Fixed
    | Relative
    | Static


{-| Convert a clip type to string form so it works with css.

    import Css.Position as Position

    Position.clipString Position.Shape -- "shape"
-}
clipString : Clip -> String
clipString clip =
  case clip of
    Shape ->
        "shape"

    NoClip  ->
        "auto"


{-| Convert a overflow type to string form so it works with css.

    import Css.Position as Position

    Position.overflowString Position.Hidden -- "hidden"
-}
overflowString : Overflow -> String
overflowString overflow =
  case overflow of
    AutoOverflow ->
        "auto"

    Hidden ->
        "hidden"

    Scroll ->
        "scroll"

    Visible ->
        "visible"


{-| Convert a position type to string form so it works with css.

    import Css.Position as Position

    Position.positionString Position.Absolute -- "absolute"
-}
positionString : Position -> String
positionString position =
  case position of
    Absolute ->
        "absolute"

    Fixed ->
        "fixed"

    Relative ->
        "relative"

    Static ->
        "static"


{-| Set the bottom margin edge for a positioned box.

    import Css.Position as Position

    -- [ ("bottom", "20px") ]
    Position.bottom 20 []
-}
bottom : Int -> Styles -> Styles
bottom b styles =
  List.append styles [ "bottom" ::: px b ]


{-| Set the left margin edge for a positioned box.

    import Css.Position as Position

    -- [ ("cursor", "crosshair") ]
    Position.cursor Position.CrossHair []
-}
left : Int -> Styles -> Styles
left l styles =
  List.append styles [ "left" ::: px l ]


{-| Set what happens if content overflows an element's box.

    import Css.Position as Position

    -- [ ("overflow", "hidden") ]
    Position.overflow Position.Hidden []
-}
overflow : Overflow -> Styles -> Styles
overflow o styles =
  List.append styles [ "overflow" ::: overflowString o ]


{-| Set the type of positioning for an element.

    import Css.Position as Position exposing (position)

    -- [ ("position", "fixed") ]
    position Position.Fixed []
-}
position : Position -> Styles -> Styles
position p styles =
  List.append styles [ "position" ::: positionString p ]


{-| Set the right margin edge for a positioned box.

    import Css.Position as Position

    -- [ ("right", "24px") ]
    Position.right 24 []
-}
right : Int -> Styles -> Styles
right r styles =
  List.append styles [ "right" ::: px r ]


{-| Set the top margin edge for a positioned box.

    import Css.Position as Position

    -- [ ("top", "24px") ]
    Position.top 24 []
-}
top : Int -> Styles -> Styles
top t styles =
  List.append styles [ "top" ::: px t ]


{-| Set the stack order of an element.

    import Css.Position as Position

    -- [ ("z-index", "2") ]
    Position.zIndex 2 []
-}
zIndex : Int -> Styles -> Styles
zIndex p styles =
  List.append styles [ "z-index" ::: (toString p) ]
