module Jobs exposing (page)

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
    [ h2 [Spacing.mt5] [ text "Jobs" ]
    , Grid.row []
        [ Grid.col []
            [ h4 [] [ text "Job Board"]]
        ]
    , ListGroup.ul
        [ ListGroup.li [] [ text "Job 1" ]
        , ListGroup.li [] [ text "Job 2" ]
        , ListGroup.li [] [ text "Job 3" ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.my3] [ text " "]]
        ]
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
            [ h4 [Spacing.mt5] [ text "Resume Clinic"]]
        ]
    , Grid.row []
        [ Grid.col []
            [ a [href "https://emilyham.github.io/NYH/Examples/Accordion/"] [ text "Example resume template"]]
        ]
    , Grid.row []
        [ Grid.col []
            [ h4 [Spacing.mt5] [ text "Interview Clinic"]]
        ]
    ]
