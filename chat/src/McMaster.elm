module McMaster exposing (page)

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
    [ h2 [] [ text "McMaster" ]

    , Card.config []
    |> Card.header [] [ text "Question: Supplementary Application to McMaster" ]
    |> Card.block []
        [ Block.titleH3 [] [ text "How many people apply?" ]
        , Block.text [] [ text "Jessica     9pm   Feb 2, 2019." ]
        , Block.custom <|
            Button.button [ Button.primary ] [ text "Comment" ]
        ]
    |> Card.view
    , Card.config []
    |> Card.header [] [ text "Question: Student Life" ]
    |> Card.block []
        [ Block.titleH3 [] [ text "Are there any programming clubs?" ]
        , Block.text [] [ text "Emily     9pm   Feb 6, 2019." ]
        , Block.custom <|
            Button.button [ Button.primary ] [ text "Comment" ]
        ]
    |> Card.view
    , h2 [] [ text " " ]
    , Form.form []
      [ h4 [] [ text "Post a Question:"]
      , Form.group []
          [ Form.label [] [ text "Topic" ]
          , Input.text [ Input.attrs [ placeholder "" ] ]
          ]

      , Form.group []
          [ Form.label [] [ text "Question" ]
          , Textarea.textarea
            [ Textarea.id "myarea"
            , Textarea.rows 3
            ]
          ]
      ]
    , Button.button [Button.secondary] [text "Post"]
    ]
