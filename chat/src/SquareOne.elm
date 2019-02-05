module SquareOne exposing (page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser.Navigation as Navigation
import Browser exposing (UrlRequest)
import Url exposing (Url)
import Url.Parser as UrlParser exposing ((</>), Parser, s, top)
import Bootstrap.Navbar as Navbar
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Form as Form
import Bootstrap.Form.Input as Input
import Bootstrap.Form.Select as Select
import Bootstrap.Form.Checkbox as Checkbox
import Bootstrap.Form.Radio as Radio
import Bootstrap.Form.Textarea as Textarea
import Bootstrap.Form.Fieldset as Fieldset
import Bootstrap.Button as Button
import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block
import Bootstrap.ListGroup as ListGroup
import Bootstrap.Utilities.Spacing as Spacing

import Model exposing (Model,Msg(..))


page : Model -> List (Html Msg)
page model =
    [ h2 [] [ text "World" ]
    , Grid.row []
        [ Grid.col []
            [ h4 [] [ text "Universities and Colleges"]
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.mt5] [ text "Apprenticeships"]
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ a [ href "#jobs"] [h4 [Spacing.mt5] [ text "Jobs"]]
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.mt5] [ text "Volunteering"]
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.mt5] [ text "Sports Hall"]
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.mt5] [ text "Language Street"]
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ a [ href "#faq"] [h4 [Spacing.mt5] [ text "Questions and Answers"]]
            ]
        ]

      , Grid.row []
        [Grid.col[] [a [href "#chat"] [img [style "width" "200px", src "img/mall.jpg"] []]]
        , Grid.col[] [a [href "http://www.sciod.ca/"] [img [style "width" "600px", src "img/globe.png"][]]]
        , Grid.col[] [a [href "#UniCol"] [img [style "width" "200px", src "img/gradcap.jpg"] []]]
        ]

    ]
