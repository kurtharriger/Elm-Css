module Css.Text where

{-| Change the way that text is displayed on the screen.

#Definitions
@docs Direction, Align, Decoration, Transform, UnicodeBidi, WhiteSpace

#Strings
@docs directionString, alignString, decorationString, shadowString, transformString, unicodeBidiString, whiteSpaceString

#Functions
@docs color, direction, letterSpacing, lineHeight, align, decoration, indent, shadow, transform, unicodeBidi, whiteSpace, wordSpacing
-}

-- Native Imports
import Color exposing (Color, rgba)

-- My Imports
import Css exposing ((:::), Styles, colorString, px)


{-| Represent the text direction/writing direction.

Ltr -
  The writing direction is left-to-right.

Rtl -
  The writing direction is right-to-left.
-}
type Direction
    = Ltr
    | Rtl


{-| Specifies the horizontal alignment of text.

Left -
  Aligns the text to the left.

Right -
  Aligns the text to the right.

Center -
  Centers the text.

Justify -
  Stretches the lines so that each line has equal width
  (like in newspapers and magazines).
-}
type Align
    = Left
    | Right
    | Center
    | Justify


{-| Represent the decoration added to text.

NoDecoration -
  Defines a normal text.

Underline -
  Defines a line below the text.

Overline -
  Defines a line above the text.

LineThrough -
  Defines a line through the text.
-}
type Decoration
    = NoDecoration
    | Underline
    | Overline
    | LineThrough


{-| Represent the capitalization of text.

NoTransform -
  No capitalization. The text renders as it is.

Capitalize -
  Transforms the first character of each word to uppercase.

Uppercase -
  Transforms all characters to uppercase.

Lowercase -
  Transforms all characters to lowercase.
-}
type Transform
    = NoTransform
    | Capitalize
    | Uppercase
    | Lowercase


{-| The unicode-bidi property is used together with the direction property to
set or return whether the text should be overridden to support multiple
languages in the same document.

NormalUnicodeBidi -
  - Does not use an additional level of embedding.

Embed -
  Creates an additional level of embedding.

BidiOverride -
  Creates an additional level of embedding. Reordering depends on the direction
  property.
-}
type UnicodeBidi
    = NormalUnicodeBidi
    | Embed
    | BidiOverride


{-| Represent how white space inside an element is handled.

NormalWhiteSpace -
  Sequences of whitespace will collapse into a single whitespace. Text will
  wrap when necessary.

NoWrap -
  Sequences of whitespace will collapse into a single whitespace.  Text will
  never wrap to the next line. The text continues on the same line until
  a <br> tag is encountered.

Pre -
  Whitespace is preserved by the browser. Text will only wrap on line breaks.
  Acts like the <pre> tag in HTML.

PreLine -
  Sequences of whitespace will collapse into a single whitespace.
  Text will wrap when necessary, and on line breaks.

PreWrap -
  Whitespace is preserved by the browser. Text will wrap when necessary,
  and on line breaks.
-}
type WhiteSpace
    = NormalWhiteSpace
    | NoWrap
    | Pre
    | PreLine
    | PreWrap


{-| Convert a direction type to string form so it works with css.

    import Css.Text as Text

    Text.directionString Text.Ltr -- "ltr"
-}
directionString : Direction -> String
directionString direction =
  case direction of
    Ltr ->
        "ltr"

    Rtl ->
        "Rtl"


{-| Convert an align type to string form so it works with css.

    import Css.Text as Text

    Text.alignString Text.Left -- "left"
-}
alignString : Align -> String
alignString align =
  case align of
    Left ->
        "left"

    Right ->
        "right"

    Center ->
        "center"

    Justify ->
        "justify"


{-| Convert an decoration type to string form so it works with css.

    import Css.Text as Text

    Text.decorationString Text.Underline -- "underline"
-}
decorationString : Decoration -> String
decorationString decoration =
  case decoration of
    NoDecoration ->
        "none"

    Underline ->
        "underline"

    Overline ->
        "overline"

    LineThrough ->
        "line-through"


{-| Convert an shadow to string form so it works with css.

    import Css.Text as Text

    Text.shadowString 10 10 10 (rgba 0 0 0 1) -- "10px 10px 10px rgba(0, 0, 0, 1)"
-}
shadowString : Int -> Int -> Int -> Color -> String
shadowString h v b c =
  ((toString h) ++ "px ")
  ++ ((toString v) ++ "px ")
  ++ ((toString b) ++ "px ")
  ++ (colorString c)


{-| Convert an transform type to string form so it works with css.

    import Css.Text as Text

    Text.transformString Text.Capitalize -- "capitalize"
-}
transformString : Transform -> String
transformString transform =
  case transform of
    NoTransform ->
        "none"

    Capitalize ->
        "capitalize"

    Uppercase ->
        "uppercase"

    Lowercase ->
        "lowercase"


{-| Convert an unicode bidi type to string form so it works with css.

    import Css.Text as Text

    Text.unicodeBidiString Text.Embed -- "embed"
-}
unicodeBidiString : UnicodeBidi -> String
unicodeBidiString unicodeBidi =
  case unicodeBidi of
    NormalUnicodeBidi ->
        "normal"

    Embed ->
        "embed"

    BidiOverride ->
        "bidi-override"


{-| Convert an white space type to string form so it works with css.

    import Css.Text as Text

    Text.whiteSpaceString Text.Pre -- "pre"
-}
whiteSpaceString : WhiteSpace -> String
whiteSpaceString whiteSpace = case whiteSpace of
    NormalWhiteSpace ->
        "normal"

    NoWrap ->
        "nowrap"

    Pre ->
        "pre"

    PreLine ->
        "pre-line"

    PreWrap ->
        "pre-wrap"


{-| Set the color of text.

    import Css.Text as Text

    -- [ ("color", "rgba(255, 0, 0, 1)") ]
    Text.color (rgba 255 0 0 1) []
-}
color : Color -> Styles -> Styles
color c styles =
  List.append styles [ "color" ::: colorString c ]


{-| Set the text direction/writing direction.

    import Css.Text as Text

    -- [ ("direction", "ltr") ]
    Text.direction Text.Ltr []
-}
direction : Direction -> Styles -> Styles
direction d styles =
  List.append styles [ "direction" ::: directionString d ]


{-| Increases or decreases the space between characters in a text.

    import Css.Text as Text

    -- [ ("letter-spacing", "2px") ]
    Text.letterSpacing 2 []
-}
letterSpacing : Int -> Styles -> Styles
letterSpacing length styles =
  List.append styles [ "letter-spacing" :::  px length ]


{-| Set the line height.

    import Css.Text as Text

    -- [ ("line-height", "14px") ]
    Text.lineHeight 14 []
-}
lineHeight : Int -> Styles -> Styles
lineHeight length styles =
  List.append styles [ "line-height" ::: px length ]


{-| Set the horizontal alignment of text.

    import Css.Text as Text

    -- [ ("text-align", "left") ]
    Text.align Text.Left []
-}
align : Align -> Styles -> Styles
align a styles =
  List.append styles [ "text-align" ::: alignString a ]


{-| Set the decoration added to text.

    import Css.Text as Text

    -- [ ("text-decoration", "underline") ]
    Text.decoration Text.Underline []
-}
decoration : Decoration -> Styles -> Styles
decoration d styles =
  List.append styles [ "text-decoration" ::: decorationString d ]


{-| Set the indentation of the first line in a text-block.

    import Css.Text as Text

    -- [ ("text-indent", "20px") ]
    Text.indent 20 []
-}
indent : Int -> Styles -> Styles
indent length styles =
  List.append styles [ "text-indent" ::: px length ]


{-| Set the shadow effect added to text.

    import Css.Text as Text

    -- [ ("text-shadow", "10px 10px 10px rgba(0, 0, 0, 1)") ]
    Text.shadow 10 10 10 (rgba 0 0 0 1) []
-}
shadow : Int -> Int -> Int -> Color -> Styles -> Styles
shadow h v b c styles =
  List.append styles [ "text-shadow" ::: shadowString h v b c ]


{-| Set the capitalization of text.

    import Css.Text as Text

    -- [ ("text-transform", "capitalize") ]
    Text.transform Text.Capitalize []
-}
transform : Transform -> Styles -> Styles
transform t styles =
  List.append styles [ "text-transform" ::: transformString t ]


{-| Used together with the direction property to set or return whether
the text should be overridden to support multiple languages
in the same document.

    import Css.Text as Text

    -- [ ("unicode-bidi", "bidi-override") ]
    Text.unicodeBidi Text.BidiOverride []
-}
unicodeBidi : UnicodeBidi -> Styles -> Styles
unicodeBidi u styles =
  List.append styles [ "unicode-bidi" ::: unicodeBidiString u]


{-| Set how white space inside an element is handled.

    import Css.Text as Text

    -- [ ("white-space", "pre") ]
    Text.whiteSpace Text.Pre []
-}
whiteSpace : WhiteSpace -> Styles -> Styles
whiteSpace ws styles =
  List.append styles [ "white-space" ::: whiteSpaceString ws ]


{-| Increases or decreases the space between words in a text.

    import Css.Text as Text

    -- [ ("word-spacing", "2px") ]
    Text.wordSpacing 2 []
-}
wordSpacing : Int -> Styles -> Styles
wordSpacing length styles =
  List.append styles [ "word-spacing" ::: px length ]
