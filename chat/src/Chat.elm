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

import Model exposing (Model,Msg(..))
--import Model exposing(Model,Page(..),Msg(..))


page : Model -> List (Html Msg)
page model =
    [ h2 [] [ text "Chat" ]
    , Card.config []
        |> Card.header [ ]
            [ h3 [ ] [ text "Me" ]
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
        |> Card.view
    , Form.group []
        [ Textarea.textarea
            [ Textarea.id "myarea"
            , Textarea.rows 3
            ]
        ]
    , Button.button [] [text "Send"]
    ]
