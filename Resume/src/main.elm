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
import Bootstrap.Button as Button
import Bootstrap.ButtonGroup as ButtonGroup

import Dict



import Model exposing(..)
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
                          , name = Name "Name"
                          , experience = Dict.fromList [(0,Experience "Job Title" "Location" "Date" ["Duty 1", "Duty 2"])]
                          , languages = Dict.fromList [(0,Language "Language" 100)]
                          , editingMode = EditingExperience 1
                          }
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [Navbar.subscriptions model.navState NavMsg
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

        EditName ->
            ({ model | editingMode = EditingName }, Cmd.none)

        SaveName ->
            ({ model | editingMode = NotEditing}, Cmd.none)

        ChangeName string ->
            ({ model | name = model.name }, Cmd.none)

        AddExperience ->
            ( { model | experience = Dict.insert
                                        (Dict.size model.experience)
                                        (Experience "Job Title" "Location" "Dates" ["Duty 1", "Duty 2"])
                                        model.experience
                 }
            , Cmd.none
            )

        EditExperience n ->
            ({ model | editingMode = EditingExperience n }, Cmd.none)

        SaveExperience ->
            ({ model | editingMode = NotEditing}, Cmd.none)

        ChangeExperience n exp ->
            ({ model | experience = Dict.insert n exp model.experience }, Cmd.none)

        AddLanguage ->
            ( { model | languages = Dict.insert
                                        (Dict.size model.languages)
                                        (Language "Language" 100)
                                        model.languages
                 }
            , Cmd.none
            )

        EditLanguage n ->
            ({ model | editingMode = EditingLanguage n }, Cmd.none)

        SaveLanguage ->
            ({ model | editingMode = NotEditing}, Cmd.none)

        ChangeLanguage n lang ->
            ({ model | languages = Dict.insert n lang model.languages }, Cmd.none)


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
              "Resume Template"

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
