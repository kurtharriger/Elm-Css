module Css.Flex where

{-| Set the layout of your elements using the flex layout system.

    #Definitions
    @docs Direction, Wrap, JustifyContent, AlignItem, AlignContent

    #Strings
    @docs directionString, wrapString, justifyContentString, alignItemString, alignContentString

    #Direction and Wrap
    @docs direction, wrap, flow

    #Alignment
    @docs justifyContent, alignItems, alignContent

    #Child Properties
    @docs order, grow, shrink, basis, alignSelf
-}

-- My Imports
import Css exposing (Styles, (:::), style, webkitName, msName)

{-| Represent the main-axis, thus defining the direction
flex items are placed in the flex container.

Row -
  Left to right in ltr; right to left in rtl.

RowReverse -
  Right to left in ltr; left to right in rtl.

Column -
  Same as row but top to bottom.

ColumnReverse -
  Same as row-reverse but bottom to top.
-}
type Direction
    = Row
    | RowReverse
    | Column
    | ColumnReverse


{-| Represent the wrap behavior of flex items.

NoWrap -
  Single line / left to right in ltr; right to left in rtl.

Wrap -
  Multi-line / left to right in ltr; right to left in rtl.

WrapReverse -
  Multi-line / right to left in ltr; left to right in rtl.
-}
type Wrap
    = NoWrap
    | Wrap
    | WrapReverse


{-| Represent the alignment along the main axis.

JCStart -
  Items are packed toward the start line.

JCEnd -
  Items are packed toward the end line.

JCCenter -
  Items are centered along the line.

JCBetween -
  Items are evenly distributed in the line;
  first item is on the start line, last item on the end line.

JCAround -
  Items are evenly distributed in the line with
  equal space around them.
-}
type JustifyContent
    = JCStart
    | JCEnd
    | JCCenter
    | JCBetween
    | JCAround


{-| Represent how the flex item is laid out along the
cross axis on the current line.

AIStart -
  Cross start margin edge of the items is placed on the cross start line.

AIEnd -
  Cross end margin edge of the items is placed on the cross end line.

AICenter -
  Items are centered in the cross axis.

AIStretch -
  Stretch to fill the container (still respect min and max width).

AIBaseline -
  Items are aligned such as their baselines align.
-}
type AlignItem
    = AIStart
    | AIEnd
    | AICenter
    | AIStretch
    | AIBaseline


{-| Represent how to align the flex container's lines within when
there is extra space in the cross axis.

ACStart -
  Lines packed to the start of the container.

ACEnd -
  Lines packed to the end of the container.

ACCenter -
  Lines packed to the center of the container.

ACStretch -
  Lines stretch to take up the remaining space.

ACBetween -
  Lines evenly distributed; the first line is at the start of the
  container while the last one is at the end.

ACAround -
  Lines evenly distributed with equal space around each line.
-}
type AlignContent
    = ACStart
    | ACEnd
    | ACCenter
    | ACStretch
    | ACBetween
    | ACAround


{-| Convert a direction type to string form so it works with css.

    import Css.Flex as Flex

    Flex.directionString Flex.Row -- "row"
-}
directionString : Direction -> String
directionString direction =
  case direction of
    Row ->
        "row"

    RowReverse ->
        "row-reverse"

    Column ->
        "column"

    ColumnReverse ->
        "column-reverse"


{-| Convert a wrap type to string form so it works with css.

    import Css.Flex as Flex

    Flex.wrapString Flex.NoWrap -- "nowrap"
-}
wrapString : Wrap -> String
wrapString wrap =
  case wrap of
    NoWrap ->
        "nowrap"

    Wrap ->
        "wrap"

    WrapReverse ->
        "wrap-reverse"


{-| Convert a justify content type to string form so it works with css.

    import Css.Flex as Flex

    Flex.justifyContentString Flex.JCStart -- "flex-start"
-}
justifyContentString : JustifyContent -> String
justifyContentString justify =
  case justify of
    JCStart ->
        "flex-start"

    JCEnd ->
        "flex-end"

    JCCenter ->
        "center"

    JCBetween ->
        "space-between"

    JCAround ->
        "space-around"


{-| Convert a align item type to string form so it works with css.

    import Css.Flex as Flex

    Flex.alignItemString Flex.AIStart -- "flex-start"
-}
alignItemString : AlignItem -> String
alignItemString align =
  case align of
    AIStart ->
        "flex-start"

    AIEnd ->
        "flex-end"

    AICenter ->
        "center"

    AIStretch ->
        "stretch"

    AIBaseline ->
        "baseline"


{-| Convert a align content type to string form so it works with css.

    import Css.Flex as Flex

    Flex.alignContentString Flex.ACStart -- "flex-start"
-}
alignContentString : AlignContent -> String
alignContentString align =
  case align of
    ACStart ->
        "flex-start"

    ACEnd ->
        "flex-end"

    ACCenter ->
        "center"

    ACStretch ->
        "stretch"

    ACBetween ->
        "space-between"

    ACAround ->
        "space-around"


{-| Set the main-axis, thus defining the direction flex items
are placed in the flex container.

    import Css.Flex as Flex

    -- [ ("flex-direction", "row") ]
    Flex.direction Flex.Row []
-}
direction : Direction -> Styles -> Styles
direction d styles =
  case d of
    Row ->
      style "flex-direction" "row"
      <| webkitName "box-orient" "horizontal"
      <| webkitName "box-direction" "normal"
      <| webkitName "flex-direction" "row"
      <| msName "flex-direction" "row" styles

    RowReverse ->
      style "flex-direction" "row-reverse"
      <| webkitName "box-orient" "horizontal"
      <| webkitName "box-direction" "reverse"
      <| webkitName "flex-direction" "row-reverse"
      <| msName "flex-direction" "row-reverse" styles

    Column ->
      style "flex-direction" "column"
      <| webkitName "box-orient" "vertical"
      <| webkitName "box-direction" "normal"
      <| webkitName "flex-direction" "column"
      <| msName "flex-direction" "column" styles

    ColumnReverse ->
      style "flex-direction" "column-reverse"
      <| webkitName "box-orient" "vertical"
      <| webkitName "box-direction" "reverse"
      <| webkitName "flex-direction" "column-reverse"
      <| msName "flex-direction" "column-reverse" styles


{-| Set the wrap behavior of flex items.

    import Css.Flex as Flex

    -- [ ("flex-wrap", "nowrap") ]
    Flex.wrap Flex.NoWrap []
-}
wrap : Wrap -> Styles -> Styles
wrap w styles =
  style "flex-wrap" (wrapString w)
  <| webkitName "flex-wrap" (wrapString w)
  <| msName "flex-wrap" (wrapString w) styles


{-| Set the direction and the wrap together.

    import Css.Flex as Flex

    -- [ ("flex-direction", "row")
       , ("flex-wrap", "nowrap")
       ]
    Flex.flow Flex.Row Flex.NoWrap []
-}
flow : Direction -> Wrap -> Styles -> Styles
flow d w styles =
  direction d
  <| wrap w styles


{-| Set the alignment along the main axis.

    import Css.Flex as Flex

    -- [ ("justify-content", "flex-start") ]
    Flex.justifyContent Flex.JCStart []
-}
justifyContent : JustifyContent -> Styles -> Styles
justifyContent j styles =
  case j of
    JCStart ->
      style "justify-content" "space-around"
      <| webkitName "box-pack" "start"
      <| webkitName "justify-content" "flex-start"
      <| msName "flex-pack" "start" styles

    JCEnd ->
      style "justify-content" "space-around"
      <| webkitName "box-pack" "end"
      <| webkitName "justify-content" "flex-end"
      <| msName "flex-pack" "end" styles

    JCCenter ->
      style "justify-content" "space-around"
      <| webkitName "box-pack" "center"
      <| webkitName "justify-content" "center"
      <| msName "flex-pack" "center" styles

    JCBetween ->
      style "justify-content" "space-around"
      <| webkitName "box-pack" "justify"
      <| webkitName "justify-content" "space-between"
      <| msName "flex-pack" "justify" styles

    JCAround ->
      style "justify-content" "space-around"
      <| webkitName "justify-content" "space-around"
      <| msName "flex-pack" "distribute" styles


{-| Set how the flex items are laid out along the
cross axis on the current line. Think of it as the justifyContent version
for the cross axis (perpendicular to the main axis).

    import Css.Flex as Flex

    -- [ ("align-items", "flex-start") ]
    Flex.alignItems Flex.AIStart []
-}
alignItems : AlignItem -> Styles -> Styles
alignItems a styles =
  case a of
    AIStart ->
      style "align-items" (alignItemString a)
      <| webkitName "box-align" "start"
      <| webkitName "align-items" "flex-start"
      <| msName "flex-align" "start" styles

    AIEnd ->
      style "align-items" (alignItemString a)
      <| webkitName "box-align" "end"
      <| webkitName "align-items" "flex-end"
      <| msName "flex-align" "end" styles

    _ ->
      style "align-items" (alignItemString a)
      <| webkitName "box-align" (alignItemString  a)
      <| webkitName "align-items" (alignItemString  a)
      <| msName "flex-align" (alignItemString a) styles


{-| Set how to align the flex container's lines within when
there is extra space in the cross axis.

    import Css.Flex as Flex

    -- [ ("align-content", "flex-start") ]
    Flex.alignContent Flex.ACStart []
-}
alignContent : AlignContent -> Styles -> Styles
alignContent a styles =
  case a of
    ACStart ->
      style "align-content" (alignContentString a)
      <| webkitName "align-content" "flex-start"
      <| msName "flex-line-pack" "start" styles

    ACEnd ->
      style "align-content" (alignContentString a)
      <| webkitName "align-content" "flex-end"
      <| msName "flex-line-pack" "end" styles

    ACBetween ->
      style "align-content" (alignContentString a)
      <| webkitName "align-content" "space-between"
      <| msName "flex-line-pack" "justify" styles

    ACAround ->
      style "align-content" (alignContentString a)
      <| webkitName "align-content" "space-around"
      <| msName "flex-line-pack" "distribute" styles

    _ ->
      style "align-content" (alignContentString a)
      <| webkitName "align-content" (alignContentString a)
      <| msName "flex-line-pack" (alignContentString a) styles


{-| Set the order in which items appear in the flex container.

    import Css.Flex as Flex

    -- [ ("order", "1") ]
    Flex.order 1 []
-}
order : Int -> Styles -> Styles
order o styles =
  style "order" (toString o)
  <| webkitName "box-ordinal-group" (toString (o + 1))
  <| webkitName "order" (toString o)
  <| msName "flex-order" (toString o) styles


{-| Set the ability for a flex item to grow if necessary.
It accepts a unit less value that serves as a proportion.
It dictates what amount of the available space inside the
flex container the item should take up.

    import Css.Flex as Flex

    -- [ ("flex-grow", "1") ]
    Flex.grow 1 []
-}
grow : Int -> Styles -> Styles
grow g styles =
  style "flex-grow" (toString g)
  <| webkitName "box-flex" (toString g)
  <| webkitName "flex-grow" (toString g)
  <| msName "flex-positive" (toString g) styles


{-| Set the ability for a flex item to shrink if necessary.

    import Css.Flex as Flex

    -- [ ("flex-shrink", "1") ]
    Flex.shrink 1 []
-}
shrink : Int -> Styles -> Styles
shrink s styles =
  style "flex-shrink" (toString s)
  <| webkitName "flex-shrink" (toString s)
  <| msName "flex-negative" (toString s) styles


{-| Set the default size of an element before the remaining space is distributed.

    import Css.Flex as Flex

    -- [ ("flex-basis", "1") ]
    Flex.basis 1 []
-}
basis : Int -> Styles -> Styles
basis b styles =
  style "flex-basis" (toString b)
  <| webkitName "flex-basis" (toString b)
  <| msName "flex-preferred-size" (toString b) styles


{-| Set the default alignment (or the one specified by align-items)
to be overridden for individual flex items.

    import Css.Flex as Flex

    -- [ ("align-self", "flex-start") ]
    Flex.alignSelf Flex.AIStart []
-}
alignSelf : AlignItem -> Styles -> Styles
alignSelf a styles =
  case a of
    AIStart ->
      style "align-self" "flex-start"
      <| webkitName "align-self" "flex-start"
      <| msName "flex-item-align" "start" styles

    AIEnd ->
      style "align-self" (alignItemString a)
      <| webkitName "align-self" "flex-end"
      <| msName "flex-item-align" "end" styles

    _ ->
      style "align-self" (alignItemString a)
      <| webkitName "align-self" (alignItemString a)
      <| msName "flex-item-align" (alignItemString a) styles
