module Css.Dimension where

{-| Set the different dimensions an element can have.
You can set the height, maxHeight, maxWidth, minHeight, minWidth, and width.

#Height
@docs height, maxHeight, minHeight

#Width
@docs width, maxWidth, minWidth
-}

-- My Imports
import Css exposing (Styles, (:::), px)


{-| Set the height of an element.

    import Css.Dimension as Dimension

    -- [ ("height", "100px") ]
    Dimension.height 100 []
-}
height : Int -> Styles -> Styles
height h styles =
  List.append styles [ "height" ::: px h ]


{-| Set the max height of an element.

    import Css.Dimension as Dimension

    -- [ ("max-height", "50px") ]
    Dimension.maxHeight 50 []
-}
maxHeight : Int -> Styles -> Styles
maxHeight h styles =
  List.append styles [ "max-height" ::: px h ]


{-| Set the max width of an element.

    import Css.Dimension as Dimension

    -- [ ("max-width", "50px") ]
    Dimension.maxWidth 50 []
-}
maxWidth : Int -> Styles -> Styles
maxWidth w styles =
  List.append styles [ "max-width" ::: px w ]


{-| Set the min height of an element.

    import Css.Dimension as Dimension

    -- [ ("min-height", "50px") ]
    Dimension.minHeight 50 []
-}
minHeight : Int -> Styles -> Styles
minHeight h styles =
  List.append styles [ "min-height" ::: px h ]


{-| Set the min width of an element.

    import Css.Dimension as Dimension

    -- [ ("min-width", "50px") ]
    Dimension.minWidth 50 []
-}
minWidth : Int -> Styles -> Styles
minWidth w styles =
  List.append styles [ "min-width" ::: px w ]


{-| Set the width of an element.

    import Css.Dimension as Dimension

    -- [ ("width", "50px") ]
    Dimension.width 50 []
-}
width : Int -> Styles -> Styles
width w styles =
  List.append styles [ "width" ::: px w ]
