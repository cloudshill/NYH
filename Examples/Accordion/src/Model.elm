module Model exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser.Navigation as Navigation
import Browser exposing (UrlRequest)
import Url exposing (Url)
import Url.Parser as UrlParser exposing ((</>), Parser, s, top)
import Bootstrap.Navbar as Navbar

--ADD ACCORDION imports to main.elm, model.elm, and the page using accordion (ex. Home.elm)
import Bootstrap.Accordion as Accordion
import Bootstrap.Card.Block as Block

--ADD CAROUSEL imports to main.elm, model.elm, and the page using carousel (ex. Home.elm)
import Bootstrap.Carousel as Carousel
import Bootstrap.Carousel.Slide as Slide

--ADD TAB imports to main.elm, model.elm, and the page using carousel (ex. Home.elm)
import Bootstrap.Tab as Tab


type alias Model =
    { navKey : Navigation.Key
    , page : Page
    , navState : Navbar.State
    , accordionState : Accordion.State --ADD ACCORDION
    , carouselState : Carousel.State -- ADD CAROUSEL
    , tabState : Tab.State --ADD TAB
    }

type Page
    = Home
    | NotFound


type Msg
    = UrlChange Url
    | ClickedLink UrlRequest
    | NavMsg Navbar.State
    | NoOp
    | AccordionMsg Accordion.State --ADD ACCORDION
    | CarouselMsg Carousel.Msg --ADD CAROUSEL
    | TabMsg Tab.State --ADD TAB
