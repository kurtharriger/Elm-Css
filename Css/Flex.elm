module Css.Flex where

import Css exposing (Styles, (:::))

type Direction
    = Row
    | RowReverse
    | Column
    | ColumnReverse

type Wrap
    = NoWrap
    | Wrap
    | WrapReverse

type JustifyContent
    = JCStart
    | JCEnd
    | JCCenter
    | JCBetween
    | JCAround

type AlignItem
    = AIStart
    | AIEnd
    | AICenter
    | AIStretch
    | AIBaseline

type AlignContent
    = ACStart
    | ACEnd
    | ACCenter
    | ACStretch
    | ACBetween
    | ACAround

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


wrapString : Wrap -> String
wrapString wrap =
  case wrap of
    NoWrap ->
        "no-wrap"

    Wrap ->
        "wrap"

    WrapReverse ->
        "wrap-reverse"


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


direction : Direction -> Styles -> Styles
direction d styles =
  List.append styles [ "flex-direction" ::: directionString d ]

wrap : Wrap -> Styles -> Styles
wrap w styles =
  List.append styles [ "flex-wrap" ::: wrapString w ]

flow : Direction -> Wrap -> Styles -> Styles
flow d w styles =
  direction d
  <| wrap w styles

justifyContent : JustifyContent -> Styles -> Styles
justifyContent j styles =
  List.append styles [ "justify-content" ::: justifyContentString j ]

alignItems : AlignItem -> Styles -> Styles
alignItems a styles =
  List.append styles [ "align-items" ::: alignItemString a ]

alignContent : AlignContent -> Styles -> Styles
alignContent a styles =
  List.append styles [ "align-content" ::: alignContentString a ]

order : Int -> Styles -> Styles
order o styles =
  List.append styles [ "order" ::: toString o ]

grow : Int -> Styles -> Styles
grow g styles =
  List.append styles [ "flex-grow" ::: toString g ]

shrink : Int -> Styles -> Styles
shrink s styles =
  List.append styles [ "flex-shrink" ::: toString s ]

basis : Int -> Styles -> Styles
basis b styles =
  List.append styles [ "flex-basis" ::: toString b ]

alignSelf : AlignItem -> Styles -> Styles
alignSelf a styles =
  List.append styles [ "align-self" ::: alignItemString a ]
