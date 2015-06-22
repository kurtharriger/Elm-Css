module Css.Position where

import Css exposing (Styles, (:::))

type Clip
    = Shape
    | AutoClip

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
    | Initial

type Overflow
    = AutoOverflow
    | Hidden
    | Scroll
    | Visible

type Position
    = Absolute
    | Fixed
    | Relative
    | Static

clipString : Clip -> String
clipString clip =
  case clip of
    Shape ->
        "shape"

    AutoClip  ->
        "auto"

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
        "url(" ++ path ++ ")"

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

    Initial ->
        "initial"


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


bottom : Int -> Styles -> Styles
bottom p styles =
  List.append styles [ "bottom" ::: ((toString p) ++ "px") ]

cursor : Cursor -> Styles -> Styles
cursor c styles =
  List.append styles [ "cursor" ::: cursorString c ]

left : Int -> Styles -> Styles
left p styles =
  List.append styles [ "left" ::: ((toString p) ++ "px") ]

overflow : Overflow -> Styles -> Styles
overflow o styles =
  List.append styles [ "overflow" ::: overflowString o ]

position : Position -> Styles -> Styles
position p styles =
  List.append styles [ "position" ::: positionString p ]

right : Int -> Styles -> Styles
right p styles =
  List.append styles [ "right" ::: ((toString p) ++ "px") ]

top : Int -> Styles -> Styles
top p styles =
  List.append styles [ "top" ::: ((toString p) ++ "px") ]

zIndex : Int -> Styles -> Styles
zIndex p styles =
  List.append styles [ "z-index" ::: (toString p) ]
