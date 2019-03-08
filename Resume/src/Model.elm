module Model exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser.Navigation as Navigation
import Browser exposing (UrlRequest)
import Url exposing (Url)
import Url.Parser as UrlParser exposing ((</>), Parser, s, top)
import Bootstrap.Navbar as Navbar
import Bootstrap.Button as Button
import Bootstrap.ButtonGroup as ButtonGroup
import Dict exposing(Dict)


type alias Model =
    { navKey : Navigation.Key
    , page : Page
    , navState : Navbar.State
    , experience : Dict Int Experience
    , languages : List Language
    , editingMode : EditingMode
    }

type EditingMode =
      NotEditing
    | EditingExperience Int

type Page
    = Home
    | NotFound

type Experience =
    Experience String {-jobTitle-} String {-location-} String {-dates-} (List String) {-stuff-}

type Language =
    Language String {-language-} Int {-fluency out of 100-}

type Msg
    = UrlChange Url
    | ClickedLink UrlRequest
    | NavMsg Navbar.State
    | NoOp
    | AddExperience
    | EditExperience Int
    | SaveExperience
    | ChangeExperience Int Experience
