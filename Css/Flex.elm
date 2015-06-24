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
import Css exposing (Styles, (:::))

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
  List.append styles [ "flex-direction" ::: directionString d ]


{-| Set the wrap behavior of flex items.

    import Css.Flex as Flex

    -- [ ("flex-wrap", "nowrap") ]
    Flex.wrap Flex.NoWrap []
-}
wrap : Wrap -> Styles -> Styles
wrap w styles =
  List.append styles [ "flex-wrap" ::: wrapString w ]


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
  List.append styles [ "justify-content" ::: justifyContentString j ]


{-| Set how the flex items are laid out along the
cross axis on the current line. Think of it as the justifyContent version
for the cross axis (perpendicular to the main axis).

    import Css.Flex as Flex

    -- [ ("align-items", "flex-start") ]
    Flex.alignItems Flex.AIStart []
-}
alignItems : AlignItem -> Styles -> Styles
alignItems a styles =
  List.append styles [ "align-items" ::: alignItemString a ]


{-| Set how to align the flex container's lines within when
there is extra space in the cross axis.

    import Css.Flex as Flex

    -- [ ("align-content", "flex-start") ]
    Flex.alignContent Flex.ACStart []
-}
alignContent : AlignContent -> Styles -> Styles
alignContent a styles =
  List.append styles [ "align-content" ::: alignContentString a ]


{-| Set the order in which items appear in the flex container.

    import Css.Flex as Flex

    -- [ ("order", "1") ]
    Flex.order 1 []
-}
order : Int -> Styles -> Styles
order o styles =
  List.append styles [ "order" ::: toString o ]


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
  List.append styles [ "flex-grow" ::: toString g ]


{-| Set the ability for a flex item to shrink if necessary.

    import Css.Flex as Flex

    -- [ ("flex-shrink", "1") ]
    Flex.shrink 1 []
-}
shrink : Int -> Styles -> Styles
shrink s styles =
  List.append styles [ "flex-shrink" ::: toString s ]


{-| Set the default size of an element before the remaining space is distributed.

    import Css.Flex as Flex

    -- [ ("flex-basis", "1") ]
    Flex.basis 1 []
-}
basis : Int -> Styles -> Styles
basis b styles =
  List.append styles [ "flex-basis" ::: toString b ]


{-| Set the default alignment (or the one specified by align-items)
to be overridden for individual flex items.

    import Css.Flex as Flex

    -- [ ("align-self", "flex-start") ]
    Flex.alignSelf Flex.AIStart []
-}
alignSelf : AlignItem -> Styles -> Styles
alignSelf a styles =
  List.append styles [ "align-self" ::: alignItemString a ]
