module Home exposing (page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Text as Text
import Bootstrap.Utilities.Spacing as Spacing

--ADD ACCORDION imports to main.elm, model.elm, and the page using accordion (ex. Home.elm)
import Bootstrap.Accordion as Accordion
import Bootstrap.Card.Block as Block

import Model exposing (Model,Msg(..))


page : Model -> List (Html Msg)
page model =
    [ --HEADER
    h1 [Spacing.mt5, Spacing.mb2, style "color" "maroon"] [ text "Name" ] --https://htmlcolorcodes.com/color-names/ for more colour names (you can also use rgb)
    , h4 [][text "Additional information"]
    , Grid.row [Row.attrs [ style "background-color" "rgb(121,19,65)" ]] --draws a line (empty row with rgb colour - you can also use colour names from link above)
           [ Grid.col []
               [
               ]
            ]


    --EXPERIENCE
    , h2 [Spacing.mt5, Spacing.mb2] [text "Experience"]
    , Grid.row []
        [ Grid.col [Col.sm3] --increase number after sm to make this column bigger (range 1-12)
            [ h5 [ style "font-weight" "bold"][ text "Job title"]
            ]
        , Grid.col []
            [ text "Location"
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ text "Date"
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.offsetSm1] --increase number after offsetSm to make the offset bigger (range 0-11)
            [ text "- Some stuff here (with an offset)"
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.offsetSm1] --increase number after offsetSm to make the offset bigger (range 0-11)
            [ text "- Some more stuff (this has an offset too)"
            ]
        ]
    , Grid.row [] --this is an empty row (to add blank space)
        [ Grid.col []
            [ h6[Spacing.my3][] --change spacing number to make empty row bigger or smaller (0-5)
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.sm3] --increase number after sm to make this column bigger (range 1-12)
            [ h5 [ style "font-weight" "bold"][ text "Job title"]
            ]
        , Grid.col []
            [ text "Location"
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ text "Date"
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.offsetSm1] --increase number after offsetSm to make the offset bigger (range 0-11)
            [ text "- Some stuff here (with an offset)"
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.offsetSm1] --increase number after offsetSm to make the offset bigger (range 0-11)
            [ text "- Some more stuff (this has an offset too)"
            ]
        ]
    , Grid.row [] --this is an empty row (to add empty space)
        [ Grid.col []
            [ h6[Spacing.my5][] --change spacing number to make empty row bigger or smaller
            ]
        ]


    --EDUCATION
    , h2 [Spacing.mt3, Spacing.mb2] [text "Education"]
    , Grid.row []
        [ Grid.col [Col.sm8] --increase number after sm to make this column bigger (range 1-12)
            [ --use 'a [target "_blank", href "link"] [text/picture]' to create a link
            a [target "_blank", href "https://www.google.ca/"] [h5 [ style "font-weight" "bold"][ text "School Name with link"]]
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ text "Date"
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ a [target "_blank", href "https://www.google.ca/"] [ text "This is also a link"]]
        , Grid.col []
            [ text "This picture has a link:"
            , a [target "_blank", href "https://www.google.ca/"] [img [style "width" "150px", src "img/school.png"] []]
            ]
        , Grid.col []
            [ text "This is just a picture:"
            , img [style "width" "200px",src "img/grad-cap.png"] []
            ]
        ]
    , Grid.row [] --this is an empty row (to add empty space)
        [ Grid.col []
            [ h6[Spacing.my5][] --change spacing number to make empty row bigger or smaller
            ]
        ]

    --ADD ACCORDION - edit what your accordion looks like
    , Grid.row []
        [ Grid.col []
            [ Accordion.config AccordionMsg
                |> Accordion.withAnimation
                |> Accordion.cards
                    [ Accordion.card
                        { id = "card1" --each accordion card needs an id
                        , options = []
                        , header =
                            Accordion.header [] <| Accordion.toggle [] [ text "Accordion card 1 name" ]
                        , blocks =
                            [ Accordion.block []
                                [ Block.text [] [ text "Text inside card 1" ] ]
                            ]
                        }
                    , Accordion.card
                        { id = "card2"
                        , options = []
                        , header =
                            Accordion.header [] <| Accordion.toggle [] [ text "Accordion card 2 name" ]
                        , blocks =
                            [ Accordion.block []
                                [ Block.text [] [ text "Text inside card 2" ] ]
                            ]
                        }
                    , Accordion.card
                        { id = "card3"
                        , options = []
                        , header =
                            Accordion.header []
                                (Accordion.toggle [] [ text " This accordion header has a picture"] )
                                |> Accordion.prependHeader
                                    [ img [style "width" "50px",src "img/grad-cap.png"] [] ]
                        , blocks =
                            [ Accordion.block []
                                [ Block.text [] [ text "Text inside card 3" ]
                                ]
                            ]
                        }
                    ]
                |> Accordion.view model.accordionState
            ]
        ]
    ]
