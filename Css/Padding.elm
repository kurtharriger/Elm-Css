module Css.Padding where

{-| Padding defines the space between the element border and the element content.

#Functions
@docs bottom, left, right, top, all
-}

-- My Imports
import Css exposing (Styles, (:::), px)


{-| Set the bottom padding of an element

    import Css.Padding as Padding

    -- [ ("padding-bottom", "20px") ]
    Padding.bottom 20 []
-}
bottom : Int -> Styles -> Styles
bottom b styles =
  List.append styles [ "padding-bottom" ::: px b ]


{-| Set the left padding of an element

    import Css.Padding as Padding

    -- [ ("padding-left", "20px") ]
    Padding.left 20 []
-}
left : Int -> Styles -> Styles
left l styles =
  List.append styles [ "padding-left" ::: px l ]


{-| Set the right padding of an element

    import Css.Padding as Padding

    -- [ ("padding-right", "20px") ]
    Padding.right 20 []
-}
right : Int -> Styles -> Styles
right r styles =
  List.append styles [ "padding-right" ::: px r ]


{-| Set the top padding of an element

    import Css.Padding as Padding

    -- [ ("padding-top", "20px") ]
    Padding.top 20 []
-}
top : Int -> Styles -> Styles
top t styles =
  List.append styles [ "padding-top" ::: px t ]


{-| Set all the padding an element has

    import Css.Padding as Padding

    {-- [ ("padding-top", "10px")
        , ("padding-right", "20px")
        , ("padding-bottom", "16px")
        , ("padding-left", "8px")]
    --}
    Padding.all 10 20 16 8 []
-}
all : Int -> Int -> Int -> Int -> Styles -> Styles
all t r b l styles =
  top t
  <| right r
  <| bottom b
  <| left l styles
