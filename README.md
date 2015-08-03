# Elm-Css
---

This library allows you to use composable functions to construct your Css.

## Quick Start
---
1. Clone the repository

    git clone https://github.com/adam-r-kowalski/Elm-Css.git

2. Navigate to the proper directory

    cd Elm-Css/

3. Run the reactor

    elm-reactor

4. Open [the example](http://localhost:8000/Example.elm) and read through the tutorial.

Inspired by [React: CSS in JS](https://speakerdeck.com/vjeux/react-css-in-js) by vjeux

## Features
---

* Composable styles
* Type checking
* Automatic vendor prefixing
* Easily use device width instead of pixel width

## Overview
---

Elm-Css aims to provide you with the building blocks you need to create styles within Elm.
A key takeaway is that each style is composable and as a result is very easy to extend with further functionality.
The code you do write is also much simpler to test and refactor, as well as guaranteed type safety and cross browser support.

## Example
---
### Centering Content
    centered : Styles -> Styles
    centered styles =
        display Display.Flex
        <| Flex.justifyContent Flex.JCCenter
        <| Flex.alignItems Flex.AICenter styles

    view : Html
    view =
        div [ style <| centered [] ] [ setViewport, text "Hello World" ]

As you can see the code is very declarative but is not quite a one to one mapping of CSS.
For this reason I strongly encourage you to read the documentation and learn how to use everything Elm-Css has to offer.
I also recommend that each of your style functions takes in a list of styles and returns a list of styles.
This allows you to have very composable styles that can build off one another to create more useful functionality.

## Further Reading
---
Read the source code or the generated documentation!
It provides you with all you need to know to get started as well as an overview of all the completed functions.
