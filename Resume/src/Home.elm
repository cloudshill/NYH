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

--ADD CAROUSEL imports to main.elm, model.elm, and the page using carousel (ex. Home.elm)
import Bootstrap.Carousel as Carousel
import Bootstrap.Carousel.Slide as Slide

import Bootstrap.Modal as Modal

import Bootstrap.Button as Button
import Bootstrap.ButtonGroup as ButtonGroup



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
            [ text "- Some stuff here"
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.offsetSm1] --increase number after offsetSm to make the offset bigger (range 0-11)
            [ text "- Some more stuff"
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
            [ text "- Some stuff here"
            ]
        ]
    , Grid.row []
        [ Grid.col [Col.offsetSm1] --increase number after offsetSm to make the offset bigger (range 0-11)
            [ text "- Some more stuff"
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
            [ text "StartYear - EndYear"
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [ h3 [] [text " "]]
        ]
    , Grid.row []
        [ Grid.col [Col.sm9]
            [ text "Some information here"
            , Accordion.config AccordionMsg
                |> Accordion.withAnimation
                |> Accordion.cards
                    [ Accordion.card
                        { id = "card1" --each accordion card needs an id
                        , options = []
                        , header =
                            Accordion.header []
                                (Accordion.toggle [] [ text "Courses"] )
                                |> Accordion.prependHeader
                                    [ img [style "width" "50px",src "img/grad-cap.png"] [] ]
                        , blocks =
                            [ Accordion.block []
                                [ Block.text [] [ text "Text inside card 1" ] ]
                            ]
                        }
                    , Accordion.card
                        { id = "card2"
                        , options = []
                        , header =
                              Accordion.header []
                                  (Accordion.toggle [] [ text "Extrcurriculars"] )
                                  |> Accordion.prependHeader
                                      [ img [style "width" "50px",src "img/grad-cap.png"] [] ]
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
                                (Accordion.toggle [] [ text "More Information"] )
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
        , Grid.col [Col.textAlign Text.alignLgCenter]
            [ img [style "width" "200px",src "img/school.png"] []
            ]
        ]
    , Grid.row [] --this is an empty row (to add empty space)
        [ Grid.col []
            [ h6[Spacing.my5][] --change spacing number to make empty row bigger or smaller
            ]
        ]
        ,Carousel.config CarouselMsg [style "height" "500px"]
                |> Carousel.slides
                    [ Slide.config [] (image "500px" "https://c1.staticflickr.com/8/7018/6446600053_14c322b898_b.jpg")
                    , Slide.config [] (image "500px" "img/school.png")
                    ]
                |> Carousel.withControls
                |> Carousel.withIndicators
                |> Carousel.view model.carouselState
      , div []
        [Button.button
            [ Button.success
            , Button.attrs [ onClick <| ShowModal ]
            ]
            [ text "Open Modal"]

        , Modal.config CloseModal
            |> Modal.small
            |> Modal.hideOnBackdropClick True
            |> Modal.h3 [] [ text "Pop-up header" ]
            |> Modal.body [] [ p [] [ text "This is a pop-up for you !"] ]
            |> Modal.footer []
                [ Button.button
                    [ Button.primary
                    , Button.attrs [ onClick CloseModal ]
                    ]
                    [ text "Close" ]
                ]
            |> Modal.view model.modalVisibility
        ]

    ]

image h url = Slide.image [style "height" h, style "margin" "auto"] url
