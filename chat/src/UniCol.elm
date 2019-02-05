module UniCol exposing (page)

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
    [ h2 [] [ text "Universities and Colleges" ]
    ,Card.deck cardList
    ]

cardList : List (Card.Config msg)
cardList =
    [ Card.config [ Card.attrs [] ]
      |> Card.header [ class "text-center" ]
          [ img [style "width" "200px", src "img/mac.jpg" ] []
          , h3 [] [ text "McMaster University" ]
          ]
      |> Card.block []
          [ Block.titleH4 [] [ text "Hamilton, Ontario" ]
          , Block.text [] [ text "Specialized in research." ]
          , Block.custom <|
              a [href "#McMaster"] [Button.button [Button.secondary][text "Go There!"]]
          ]
    , Card.config [ Card.attrs [] ]
      |> Card.header [ class "text-center" ]
          [ img [style "width" "300px", src "img/mohawk.jpg" ] []
          , h3 [] [ text "Mohawk College" ]
          ]
      |> Card.block []
          [ Block.titleH4 [] [ text "Hamilton, Ontario" ]
          , Block.text [] [ text "Specialized in research." ]
          , Block.custom <|
              a [href "#McMaster"] [Button.button [Button.secondary][text "Go There!"]]
          ]

     ]
