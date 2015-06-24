module Css.Position where

{-| Positioning allows you to position an element.  It can also place
and element behind another, and specify what should happen when an
element's content is too big.

#Definitions
@docs Clip, Cursor, Overflow, Position

#Strings
@docs clipString, cursorString, overflowString, positionString

#Functions
@docs bottom, cursor, left, overflow, position, right, top, zIndex
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


{-| Represent the type of cursor to be displayed when pointing on an element.

Alias -
  The cursor indicates an alias of something is to be created.

AllScroll -
  The cursor indicates that something can be scrolled in any direction.

AutoCursor -
  The browser sets a cursor.

Cell -
  The cursor indicates that a cell (or set of cells) may be selected.

ContextMenu -
  The cursor indicates that a context-menu is available.

ColResize -
  The cursor indicates that the column can be resized horizontally.

Copy -
  The cursor indicates something is to be copied.

Crosshair -
  The cursor render as a crosshair.

Default -
  The default cursor.

EResize -
  The cursor indicates that an edge of a box is to be moved right (east).

EwResize -
  Indicates a bidirectional resize cursor.

Grab -
  The cursor indicates that something can be grabbed.

Grabbing -
  The cursor indicates that something can be grabbed.

Help -
  The cursor indicates that help is available.

Move -
  The cursor indicates something is to be moved.

NResize -
  The cursor indicates that an edge of a box is to be moved up (north).

NeResize -
  The cursor indicates that an edge of a box is to be moved up
  and right (north/east).

NeswResize -
  Indicates a bidirectional resize cursor.

NsResize -
  Indicates a bidirectional resize cursor.

NwResize -
  The cursor indicates that an edge of a box is to be moved up
  and left (north/west).

NwseResize -
  Indicates a bidirectional resize cursor.

NoDrop -
  The cursor indicates that the dragged item cannot be dropped here.

None -
  No cursor is rendered for the element.

NotAllowed -
  The cursor indicates that the requested action will not be executed.

Pointer -
  The cursor is a pointer and indicates a link.

Progress -
  The cursor indicates that the program is busy (in progress).

RowResize -
  The cursor indicates that the row can be resized vertically.

SResize -
  The cursor indicates that an edge of a box is to be moved down (south).

SeResize -
  The cursor indicates that an edge of a box is to be moved down
  and right (south/east).

SwResize -
  The cursor indicates that an edge of a box is to be moved down
  and left (south/west).

Text -
  The cursor indicates text that may be selected.

Url String -
  A comma separated list of URLs to custom cursors.
  Note: Always specify a generic cursor at the end of the list,
  in case none of the URL-defined cursors can be used.

VerticalText -
  The cursor indicates vertical-text that may be selected.

WResize -
  The cursor indicates that an edge of a box is to be moved left (west).

Wait -
  The cursor indicates that the program is busy.

ZoomIn -
  The cursor indicates that something can be zoomed in.

ZoomOut -
  The cursor indicates that something can be zoomed out.
-}
type Cursor
    = Alias
    | AllScroll
    | AutoCursor
    | Cell
    | ContextMenu
    | ColResize
    | Copy
    | Crosshair
    | Default
    | EResize
    | EwResize
    | Grab
    | Grabbing
    | Help
    | Move
    | NResize
    | NeResize
    | NeswResize
    | NsResize
    | NwResize
    | NwseResize
    | NoDrop
    | None
    | NotAllowed
    | Pointer
    | Progress
    | RowResize
    | SResize
    | SeResize
    | SwResize
    | Text
    | Url String
    | VerticalText
    | WResize
    | Wait
    | ZoomIn
    | ZoomOut


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


{-| Convert a cursor type to string form so it works with css.

    import Css.Position as Position

    Position.cursorString Position.Cell -- "cell"
-}
cursorString : Cursor -> String
cursorString cursor =
  case cursor of
    Alias ->
        "alias"

    AllScroll ->
        "all-scroll"

    AutoCursor ->
        "auto"

    Cell ->
        "cell"

    ContextMenu ->
        "context-menu"

    ColResize ->
        "col-resize"

    Copy ->
        "copy"

    Crosshair ->
        "crosshair"

    Default ->
        "default"

    EResize ->
        "e-resize"

    EwResize ->
        "ew-resize"

    Grab ->
        "grab"

    Grabbing ->
        "grabbign"

    Help ->
        "help"

    Move ->
        "move"

    NResize ->
        "n-resize"

    NeResize ->
        "ne-resize"

    NeswResize ->
        "nesw-resize"

    NsResize ->
        "ns-resize"

    NwResize ->
        "nw-resize"

    NwseResize ->
        "nwse-resize"

    NoDrop ->
        "no-drop"

    None ->
        "none"

    NotAllowed ->
        "not-allowed"

    Pointer ->
        "pointer"

    Progress ->
        "progress"

    RowResize ->
        "row-resize"

    SResize ->
        "s-resize"

    SeResize ->
        "se-resize"

    SwResize ->
        "sw-resize"

    Text ->
        "text"

    Url path ->
        url path

    VerticalText ->
        "vertical-text"

    WResize ->
        "w-resize"

    Wait ->
        "wait"

    ZoomIn ->
        "zoom-in"

    ZoomOut ->
        "zoom-out"


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


{-| Set the type of cursor to be displayed.

    import Css.Position as Position

    -- [ ("cursor", "crosshair") ]
    Position.cursor Position.CrossHair []
-}
cursor : Cursor -> Styles -> Styles
cursor c styles =
  List.append styles [ "cursor" ::: cursorString c ]


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
