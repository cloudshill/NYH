module Home exposing (page)

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


page : Model -> List (Html Msg)
page model =
    [ h1 [] [ text "Log In" ]
    , Grid.row []
        [ Grid.col []
            [ Form.form []
                [ Form.group []
                    [ Form.label [for "myid"] [ text "User ID "]
                    , Input.email [ Input.id "myid" ]
                    , Form.validFeedback [] [ text "All good !" ]
                    , Form.help [] [ text "We'll never share your email with anyone else." ]
                    ]
                , Form.group []
                    [ Form.label [for "mypwd"] [ text "Password "]
                    , Form.validFeedback [] [ text "All good !" ]
                    , Input.password [ Input.id "mypwd" ]
                    ]
                , a [href "#chat"] [Button.button [][text "Submit"]]
                ]
            ]
        ]
    ]
