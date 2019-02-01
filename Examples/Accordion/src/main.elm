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
import Bootstrap.Utilities.Spacing as Spacing
import Task

--ADD ACCORDION imports to main.elm, model.elm, and the page using accordion (ex. Home.elm)
import Bootstrap.Accordion as Accordion
import Bootstrap.Card.Block as Block

--ADD CAROUSEL imports to main.elm, model.elm, and the page using carousel (ex. Home.elm)
import Bootstrap.Carousel as Carousel
import Bootstrap.Carousel.Slide as Slide


import Model exposing(Model,Page(..),Msg(..))
import Home

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
                          , accordionState = Accordion.initialStateCardOpen "" --ADD ACCORDION - what does accordion look like when you open the page?
                            --Accordion.initialStateCardOpen "card1" -- if you put a card id, the accordion starts with that card open
                          , carouselState = Carousel.initialState
                          }
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )



subscriptions : Model -> Sub Msg
subscriptions model =
    --ADD ACCORDION - now that there are multiple subscriptions, they need to be grouped in Sub.batch
    Sub.batch [Navbar.subscriptions model.navState NavMsg
    , Accordion.subscriptions model.accordionState AccordionMsg
    , Carousel.subscriptions model.carouselState CarouselMsg
    ]


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

        --ADD ACCORDION
        AccordionMsg state ->
            ( { model | accordionState = state }
            , Cmd.none
            )

        --ADD CAROUSEL
        CarouselMsg state ->
            ( {model | carouselState = Carousel.update state model.carouselState }
            , Cmd.none
            )



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
        ]


view : Model -> Browser.Document Msg
view model =
    { title = case model.page of
          Home ->
              "Page (change me in main.elm)"

          NotFound ->
              "Page Not Found"
    , body =
        [ div []
            [ mainContent model
            ]
        ]
    }

mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] <|
        case model.page of
            Home ->
                Home.page model

            NotFound ->
                pageNotFound


pageNotFound : List (Html Msg)
pageNotFound =
    [ h1 [Spacing.my4] [ text "Not found" ]
    , text "Sorry, couldn't find that page"
    ]
