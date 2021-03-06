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
    , header : Header
    , experience : Dict Int Experience
    , education : Dict Int Education
    , languages : Dict Int Language
    , editingMode : EditingMode
    }

type EditingMode =
      NotEditing
    | EditingHeader
    | EditingExperience Int
    | EditingEducation Int
    | EditingLanguage Int

type Page
    = Home
    | NotFound

type Header =
    Header String {-name-} String {-info-}

type Experience =
    Experience String {-jobTitle-} String {-location-} String {-dates-} (List String) {-stuff-}

type Education =
    Education String {-school-} String {-schoolDates-} String {-schoolInfo-}


type Language =
    Language String {-language-} Float {-fluency out of 100-}

type Msg
    = UrlChange Url
    | ClickedLink UrlRequest
    | NavMsg Navbar.State
    | NoOp
    | Save
    | EditHeader
    | ChangeHeader Header
    | AddExperience
    | EditExperience Int
    | ChangeExperience Int Experience
    | AddEducation
    | EditEducation Int
    | ChangeEducation Int Education
    | AddLanguage
    | EditLanguage Int
    | ChangeLanguage Int Language
