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

import Model exposing (Model,Msg(..))


page : Model -> List (Html Msg)
page model =
    [ h2 [] [ text "World" ]
      , Grid.row []
        [Grid.col[] [a [href "#chat"] [img [style "width" "200px", src "img/shop.jpeg"] []]]
        , Grid.col[] [a [href "http://www.sciod.ca/"] [img [style "width" "600px", src "img/globe.jpeg"][]]]
        , Grid.col[] [a [href "#"] [img [style "width" "100px", src "img/gradcap.jpg"] []]]
        ]

    ]
