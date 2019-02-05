module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser.Navigation as Navigation
import Browser exposing (UrlRequest)
import Browser.Dom as Dom
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
import Bootstrap.Utilities.Spacing as Spacing
import Task

import Model exposing(Model,Page(..),Msg(..))
import Home
import Chat
import SquareOne
import Jobs
import McMaster
import UniCol
import FAQ


type alias Flags =
    {}


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChange
        }

init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( navState, navCmd ) =
            Navbar.initialState NavMsg

        ( model, urlCmd ) =
            urlUpdate url { navKey = key
                          , navState = navState
                          , page = Home
                          }
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )



subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navState NavMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink req ->
             case req of
                 Browser.Internal url ->
                     ( model, Navigation.pushUrl model.navKey <| Url.toString url )

                 Browser.External href ->
                     ( model, Navigation.load href )


        UrlChange url ->
            urlUpdate url model

        NavMsg state ->
            ( { model | navState = state }
            , Cmd.none
            )

        NoOp -> (model, Cmd.none)




urlUpdate : Url -> Model -> ( Model, Cmd Msg )
urlUpdate url model =
    case decode url of
        Nothing ->
            ( { model | page = NotFound }, resetViewport )

        Just route ->
            ( { model | page = route }, resetViewport )

resetViewport : Cmd Msg
resetViewport =
  Task.perform (\_ -> NoOp) (Dom.setViewport 0 0)

decode : Url -> Maybe Page
decode url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
    |> UrlParser.parse routeParser

routeParser : Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Home top
        , UrlParser.map Chat (s "chat")
        , UrlParser.map SquareOne (s "SquareOne")
        , UrlParser.map McMaster (s "McMaster")
        , UrlParser.map UniCol (s "UniCol")
        , UrlParser.map Jobs (s "jobs")
        , UrlParser.map FAQ (s "faq")
        ]


view : Model -> Browser.Document Msg
view model =
    { title = case model.page of
          Home ->
              "Log In"

          Chat ->
              "Chat"

          SquareOne ->
                "Square One"

          Jobs ->
                "Jobs"

          McMaster ->
                "McMaster"

          UniCol ->
                "UniCol"

          FAQ ->
                "Questions and Answers"

          NotFound ->
              "Page Not Found"
    , body =
        [ div []
            [ menu model
            , mainContent model
            ]
        ]
    }

menu : Model -> Html Msg
menu model =
    Navbar.config NavMsg
        |> Navbar.withAnimation
        |> Navbar.container
        |> Navbar.brand [ href "#" ] []
        |> Navbar.items
            [ Navbar.itemLink [ href "#SquareOne" ] [ text "World" ]
            ]
        |> Navbar.view model.navState

mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] <|
        case model.page of
            Home ->
                Home.page model

            Chat ->
                Chat.page model

            SquareOne ->
               SquareOne.page model

            Jobs ->
                Jobs.page model

            McMaster ->
                McMaster.page model

            UniCol ->
                UniCol.page model

            FAQ ->
                FAQ.page model

            NotFound ->
                pageNotFound


pageNotFound : List (Html Msg)
pageNotFound =
    [ h1 [Spacing.my4] [ text "Not found" ]
    , text "Sorry, couldn't find that page"
    ]
