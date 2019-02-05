module FAQ exposing (page)

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
import Bootstrap.Badge as Badge

import Model exposing (Model,Msg(..))


page : Model -> List (Html Msg)
page model =
    [ h2 [] [ text "FAQ" ]
    , Form.form []
        [ Form.group []
            [ Textarea.textarea
                [ Textarea.id "search"
                , Textarea.rows 1
                ]
            ]
        , Button.button [] [ text "Search" ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.my4] [text " "]]
        ]
    , ListGroup.ul
        [ ListGroup.li  [ ListGroup.primary ] [ text "Question"]
        , ListGroup.li [ ListGroup.light ]
            [ h6 [ style "font-weight" "700"] [ text "Person 1"]
            , text "Answer 1"
            ]
        , ListGroup.li [ ListGroup.light ]
            [ h6 [ style "font-weight" "700"] [ text "Person 2"]
            , text "Answer 2"
            ]
        , ListGroup.li [ ListGroup.light ]
            [ h6 [ style "font-weight" "700"] [ text "Person 3  ", Badge.badgePrimary [ ] [ text "Guidance Counsellor" ]]
            , text "Answer 3"
            ]
        ]
{-
    , Card.config []
        |> Card.header [ ]
            [ h3 [ ] [ text "Hi" ]
                ]
        |> Card.block []
            [ Block.text [] [ text "My message" ]
            ]
        |> Card.view
    , Card.config []
        |> Card.header [ ]
            [ h3 [ ] [ text "You" ]
                ]
        |> Card.block []
            [ Block.text [] [ text "Your message" ]
            ]
        |> Card.view -}
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.my4] [text " "]]
        ]
    , Form.group []
        [ Textarea.textarea
            [ Textarea.id "myarea"
            , Textarea.rows 3
            ]
        ]
    , Button.button [] [text "Send"]
    ]
