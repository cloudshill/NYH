module Home exposing (page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick,onInput)
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

import Dict


import Model exposing (..)

clr1 : String
clr1 = "rgb(25,85,140)"

clr2 : String
clr2 = "rgb(175,200,225)"

buttonClr : String
buttonClr = "rgb(20,130,175)"

editName : Header -> String -> Msg
editName (Header _ i) str =
    ChangeHeader <| Header str i

editInfo : Header -> String -> Msg
editInfo (Header n _) str =
    ChangeHeader <| Header n str

editJobTitle : Int -> Experience -> String -> Msg
editJobTitle n (Experience _ location dates stuff) str =
    ChangeExperience n <| Experience str location dates stuff

editDates : Int -> Experience -> String -> Msg
editDates n (Experience jobTitle location _ stuff) str =
    ChangeExperience n <| Experience jobTitle location str stuff

editLocation : Int -> Experience -> String -> Msg
editLocation n (Experience jobTitle _ dates stuff) str =
    ChangeExperience n <| Experience jobTitle str dates stuff

addDuty : Int -> Experience -> Msg
addDuty n (Experience jobTitle location dates stuff) =
    ChangeExperience n <| Experience jobTitle location dates (stuff ++ ["Duty " ++ String.fromInt (List.length stuff + 1)])

editDuty : Int -> Int -> Experience -> String -> Msg
editDuty n m (Experience jobTitle location dates stuff) str =
    ChangeExperience n <| Experience jobTitle location dates (List.take m stuff ++ [str] ++ List.drop (m+1) stuff)

editSchool : Int -> Education -> String -> Msg
editSchool n (Education _ schoolDates schoolInfo) str =
    ChangeEducation n <| Education str schoolDates schoolInfo

editSchoolDates : Int -> Education -> String -> Msg
editSchoolDates n (Education school _ schoolInfo) str =
    ChangeEducation n <| Education school str schoolInfo

editSchoolInfo : Int -> Education -> String -> Msg
editSchoolInfo n (Education school schoolDates _) str =
    ChangeEducation n <| Education school schoolDates str

editLang : Int -> Language -> String -> Msg
editLang n (Language _ fluency) str =
    ChangeLanguage n <| Language str fluency

editFluency : Int -> Language -> String -> Msg
editFluency n (Language lang _) str =
    ChangeLanguage n <| Language lang (Maybe.withDefault 100 (String.toFloat str))

header : Bool -> Bool -> Header -> List (Html Msg)
header editing editable h =
  let
    (Header name info) = h
  in
  if editing then
    [ Grid.row []
        [ Grid.col [Col.sm8]
            [ h1 [Spacing.mt5, Spacing.mb2] [ input [value name, onInput (editName h)] [] ]
            , h4 [][ input [value info, onInput (editInfo h), style "width" "100%"] [] ]
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ h3 [Spacing.my3] [text " "]
            , Card.config []
                |> Card.block []
                    [ Block.titleH3 [style "font-weight" "bold"] [ text "Contact" ]
                    , Block.text [] [ text "Email: ", a [target "_blank", href "mailto:myemail@gmail.com"] [text "myemail@gmail.com"]]
                    ]
                |> Card.view
            ]
        ]
    , smallBlank
    , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick Save]] [text "Save"]
    ]
  else
    [ Grid.row []
        [ Grid.col [Col.sm8]
            [ h1 [Spacing.mt5, Spacing.mb2, style "color" clr1] [ text name ]
            , h4 [][ text info ]
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ h3 [Spacing.my3] [text " "]
            , Card.config []
                |> Card.block []
                    [ Block.titleH3 [style "font-weight" "bold"] [ text "Contact" ]
                    , Block.text [] [ text "Email: ", a [target "_blank", href "mailto:myemail@gmail.com"] [text "myemail@gmail.com"]]
                    ]
                |> Card.view
            ]
        ]
    , smallBlank
    , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick EditHeader]] [text "Edit"]
    ]



experience : Bool -> Bool -> (Int, Experience) -> List (Html Msg)
experience editing editable (n, exp) =
  let
    (Experience jobTitle location dates stuff) = exp
  in
  if editing then
    [ Grid.row []
        [ Grid.col [Col.sm7]
            [ h5 [ style "font-weight" "bold"][ input [value jobTitle, onInput (editJobTitle n exp), style "width" "100%"] [] ]
            ]
        , Grid.col []
            [ input [value location, onInput (editLocation n exp), style "width" "100%"] []
            ]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ input [value dates, onInput (editDates n exp), style "width" "100%"] []
            ]
        ]
    ] ++
    ( List.indexedMap (\ idx oneStuff -> Grid.row []
        [ Grid.col [Col.offsetSm1]
            [ input [value oneStuff, onInput (editDuty n idx exp), style "width" "100%"] []
            ]
        ]
               )
        stuff
    ) ++
      [smallBlank
      , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick (addDuty n exp)]] [text "New Duty"]]
    ++
      [Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick Save]] [text "Save"]]
  else
    [ Grid.row []
        [ Grid.col [Col.sm8]
            [ h5 [ style "font-weight" "bold"][ text jobTitle ]
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
    ++
    [smallBlank
    , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick (EditExperience n)]] [text "Edit"]]

education : Bool -> Bool -> (Int, Education) -> List (Html Msg)
education editing editable (n, ed) =
  let
    (Education school schoolDates schoolInfo) = ed
  in
  if editing then
    [ Grid.row []
        [ Grid.col [Col.sm8]
            [ h5 [ style "font-weight" "bold"][ input [value school, onInput (editSchool n ed)] []]]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ input [value schoolDates, onInput (editSchoolDates n ed)] []
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [input [value schoolInfo, onInput (editSchoolInfo n ed), style "width" "100%"] []]
        ]
    , smallBlank
    , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick Save]] [text "Save"]
    ]
  else
    [ Grid.row []
        [ Grid.col [Col.sm8]
            [ h5 [style "font-weight" "bold"] [text school]]
        , Grid.col [Col.textAlign Text.alignLgRight]
            [ text schoolDates
            ]
        ]
    , Grid.row []
        [ Grid.col []
            [text schoolInfo]
        ]
    , smallBlank
    , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick (EditEducation n)]] [text "Edit"]
    ]


language : Bool -> Bool -> (Int, Language) -> List (Html Msg)
language editing editable (n, langu) =
  let
    (Language lang fluency) = langu
  in
  if editing then
    [ Grid.row []
        [ Grid.col [Col.sm3]
            [ h5 [] [input [value lang, onInput (editLang n langu)] []]]
        , Grid.col [Col.sm3]
            [ h5 [] [input [value (String.fromFloat fluency), onInput (editFluency n langu)] []]
            ]
        ]
      , smallBlank
      , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick Save]] [text "Save"]
    ]
  else
    [ Grid.row []
        [ Grid.col [Col.sm3]
            [ h5 [] [text lang]]
        , Grid.col [Col.sm3]
            [ Progress.progress [ Progress.attrs[style "background-color" clr2], Progress.value fluency ]
            ]
        ]
        , smallBlank
        , Button.button [Button.small, Button.attrs[style "background-color" buttonClr, onClick (EditLanguage n)]] [text "Edit"]
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
    (\h -> header (model.editingMode == EditingHeader) True h) model.header
    ++
    [ --HEADER
    smallBlank
    , Grid.row [Row.attrs [ style "background-color" clr2 ]] --draws a line (empty row with rgb colour - you can also use colour names from link above)
           [ Grid.col []
               [
               ]
            ]
    --EXPERIENCE
    , h2 [Spacing.mt5, Spacing.mb2, style "color" clr1] [text "Experience"]
    ]
    ++
    List.concat (List.map (\(n, exp) -> experience (model.editingMode == EditingExperience n) True (n, exp)) (Dict.toList model.experience))
    ++
    [ Grid.row[]
        [Grid.col []
            [Button.button [Button.dark, Button.small, Button.attrs[onClick AddExperience]] [text "New"]]
        ]
    , largeBlank
    --EDUCATION
    , h2 [Spacing.mt3, Spacing.mb2, style "color" clr1] [text "Education"]
    ]
    ++
    List.concat (List.map (\(n, ed) -> education (model.editingMode == EditingEducation n) True (n, ed)) (Dict.toList model.education))
    ++
    [ Grid.row[]
        [Grid.col []
            [Button.button [Button.dark, Button.small, Button.attrs[onClick AddEducation]] [text "New"]]
        ]
    , largeBlank
    --LANGUAGES
    , h2 [Spacing.mt3, Spacing.mb2, style "color" clr1] [text "Languages"]
    ]
    ++
    List.concat (List.map (\(n, langu) -> language (model.editingMode == EditingLanguage n) True (n, langu)) (Dict.toList model.languages))
    ++
    [ Grid.row[]
        [Grid.col []
            [Button.button [Button.dark, Button.small, Button.attrs[onClick AddLanguage]] [text "New"]]
        ]
    , largeBlank
    ]
