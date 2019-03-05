module Home exposing (page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Text as Text
import Bootstrap.Utilities.Spacing as Spacing
import Bootstrap.Button as Button
import Bootstrap.ButtonGroup as ButtonGroup
import Bootstrap.Progress as Progress
import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block



import Model exposing (Model,Msg(..))

clr1 : String
clr1 = "rgb(25,85,140)"

clr2 : String
clr2 = "rgb(175,200,225)"

--experience : String -> String -> String -> List String ->
experience jobTitle location dates stuff =
    [ Grid.row []
        [ Grid.col [Col.sm8]
            [ h5 [ style "font-weight" "bold"][ text jobTitle]
            ]
        , Grid.col []
            [ text location
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ text dates
            ]
        ]
    ] ++
    ( List.map (\ oneStuff -> Grid.row []
        [ Grid.col [Col.offsetSm1]
            [ text oneStuff
            ]
        ]
               )
        stuff
    )

language lang fluency =
    [ Grid.row []
        [ Grid.col [Col.sm2]
            [ h5 [] [text lang]]
        , Grid.col [Col.sm4]
            [ Progress.progress [ Progress.attrs[style "background-color" clr2], Progress.value fluency ]
            ]
        ]
    ]

smallBlank = Grid.row [] --this is an empty row (to add blank space)
              [ Grid.col []
                  [ h6[Spacing.my3][text " "] --change spacing number to make empty row bigger or smaller (0-5)
                  ]
              ]

largeBlank = Grid.row [] --this is an empty row (to add blank space)
              [ Grid.col []
                  [ h6[Spacing.my5][text " "] --change spacing number to make empty row bigger or smaller (0-5)
                  ]
              ]


page : Model -> List (Html Msg)
page model =
    [ --HEADER
    Grid.row []
        [ Grid.col []
            [ h1 [Spacing.mt5, Spacing.mb2, style "color" clr1] [ text "Name" ]
            , h4 [][text "Additional information"]
            ]
        , Grid.col [Col.sm4]
            [ h3 [Spacing.my3] [text " "]
            , Card.config []
                |> Card.block []
                    [ Block.titleH3 [style "font-weight" "bold"] [ text "Contact" ]
                    , Block.text [] [ text "Email: ", a [target "_blank", href "mailto:myemail@gmail.com"] [text "myemail@gmail.com"]]
                    ]
                |> Card.view
            ]
        ]
    , Grid.row [Row.attrs [ style "background-color" clr2 ]] --draws a line (empty row with rgb colour - you can also use colour names from link above)
           [ Grid.col []
               [
               ]
            ]
    --EXPERIENCE
    , h2 [Spacing.mt5, Spacing.mb2, style "color" clr1] [text "Experience"]
    ]
    ++
    experience "Job Title 1" "Location" "Years"
          ["- More information"
          ,"- More information"
          ,"- More information"
          ]
    ++
    [ smallBlank ]
    ++
    experience "Job Title 2" "Location" "Years"
          ["- More information"
          ,"- More information"
          ,"- More information"
          ]
    ++
    [ smallBlank ]
    ++
    experience "Job Title 3" "Location" "Years"
          ["- More information"
          ,"- More information"
          ,"- More information"
          ]
    ++
    [ largeBlank
    --EDUCATION
    , h2 [Spacing.mt3, Spacing.mb2, style "color" clr1] [text "Education"]
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
            [ text "Extracurriculars"]
        ]
    ]
    ++
    [ largeBlank
    --LANGUAGES
    , h2 [Spacing.mt3, Spacing.mb2, style "color" clr1] [text "Languages"]
    ]
    ++
    language "English" 100
    ++
    language "French" 67
    ++
    language "Not so fluent" 33
    ++
    [ largeBlank
    , largeBlank
    , Grid.row [Row.attrs[style "background-color" clr2]]
           [ Grid.col []
               [h1[] [text " "]
               ]
            ]
    ]
