module Chat exposing (page)

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

import Model exposing (Model,Msg(..))


page : Model -> List (Html Msg)
page model =
    [ h2 [] [ text "Chat" ]

    , ListGroup.ul
        [ ListGroup.li  [ ListGroup.primary ] [ text "Well"]
        , ListGroup.li [ ListGroup.light ] [ text "Great" ]
        , ListGroup.li [ ListGroup.primary ] [ text "Good" ]
        , ListGroup.li [ ListGroup.light ] [ text "How are you?" ]
        , ListGroup.li [ ListGroup.primary ] [ text "How are you?" ]
        , ListGroup.li [ ListGroup.light ] [ text "Hey" ]
        , ListGroup.li [ ListGroup.primary ] [ text "Hi" ]
        ]
    , Form.group []
        [ Textarea.textarea
            [ Textarea.id "myarea"
            , Textarea.rows 3
            ]
        ]
    , Button.button [Button.secondary] [text "Send"]
    ]
