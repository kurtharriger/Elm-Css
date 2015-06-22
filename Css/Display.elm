module Css.Display where

import Css exposing (Styles, (:::))

type Display
    = Inline
    | Block
    | Flex
    | InlineBlock
    | InlineFlex
    | InlineTable
    | ListItem
    | RunIn
    | Table
    | TableCaption
    | TableColumnGroup
    | TableHeaderGroup
    | TableFooterGroup
    | TableRowGroup
    | TableCell
    | TableColumn
    | TableRow
    | None

displayString : Display -> String
displayString display =
  case display of
    Inline ->
        "inline"

    Block ->
        "block"

    Flex ->
        "flex"

    InlineBlock ->
        "inline-block"

    InlineFlex ->
        "inline-flex"

    InlineTable ->
        "inline-table"

    ListItem ->
        "list-item"

    RunIn ->
        "run-in"

    Table ->
        "table"

    TableCaption ->
        "table-caption"

    TableColumnGroup ->
        "table-column-group"

    TableHeaderGroup ->
        "table-header-group"

    TableFooterGroup ->
        "table-footer-group"

    TableRowGroup ->
        "table-row-group"

    TableCell ->
        "table-cell"

    TableColumn ->
        "table-column"

    TableRow ->
        "table-row"

    None ->
        "none"


display : Display -> Styles -> Styles
display d styles =
  List.append styles [ "display" ::: displayString d ]
