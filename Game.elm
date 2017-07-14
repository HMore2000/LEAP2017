import GraphicSVG exposing (..)

type Msg = Tick Float GetKeyState
         | StartGame
         | GoInstructions
         | SubmitAnswer Answer Answer
         | Reset
         | BigButton Answer
         | SmallButton Answer

type GameState = Instructions
               | MainMenu
               | InGame
               | EndOfGame
               | Failure
           

type Answer = A | B | C | D | NA

main = gameApp Tick {   model = init
                 ,   view = view
                 ,   update = update
                 }
      

--- MODEL ---

init = { state = MainMenu
       , levels = [ level1,
                    level2,
                    level3,
                    level4, 
                    level5, 
                    level6
                  ]
       , chances = 3
       , time = 0  -- This is specifically ANIMATION time.

         -- Below are a set of variables that aren't used in the template but
         -- maybe you can figure out how to use them? You can add more too!
       , score = 0
       , timelimit = 10
       , highscore = 0
       , current = 0
       , currentButton = NA
       }

--- VIEW ---

view model = case model.state of
                MainMenu -> collage 1000 500 (menuView model)
                Instructions -> collage 1000 500 (instructionsView model)
                InGame   -> collage 1000 500 (levelView (List.head model.levels) model.time model.chances model.currentButton model.timelimit)
                EndOfGame   -> collage 1000 500 (endView model)
                Failure  -> collage 1000 500 (failView model)



instructionsView model = [ group 
                          [ roundedRect 300 100 5
                            |> filled yellow
                            |> scale 0.7
                         , text "Main Menu"
                            |> size 20
                            |> filled red
                            |> move (-45 ,-8)] |> notifyMouseDown Reset |> move (0, -210) 
                          , group [ text "Welcome to the Flag Quiz by Hardik, Michael, and Wang. "
                            |> size 38
                            |> centered
                            |> filled red
                            |>move (0, 190)
                          , text "In our extremely original and creative game,"
                            |> size 26
                            |> centered
                            |> filled black
                            |> move( 0, 130)
                          , text "your ultimate goal is to save the world by matching up the correct flags to stop a disaster . "
                            |> size 26
                            |> centered
                            |> filled black
                            |> move( 0, 100)
                          , text "If you run out of time, THE GAME IS OVER! "
                            |> size 26
                            |> centered
                            |> filled darkRed
                            |> move( 0, -20)
                          , text "There is a timer of 10 seconds, and you have 3 lives."
                            |> size 26
                            |> centered
                            |> filled black
                            |> move( 0, 60)]    ]
                            
                           
                 



menuView model = [ group [ roundedRect 300 100 5
                            |> filled green
                            |> notifyMouseDown StartGame
                            |> scale 1
                            |> move (0, -70)
                          
                         , group [ square 120
                                       |> outlined(solid 2) black
                                       |> scaleY 0.63
                                       |> move (0, 23)
                                       , square 10 
                                       |> filled red
                                       |> scaleX 7 
                                       |> move(25, 55)
                                       ,  square 10 
                                       |> filled white
                                       |> scaleX 7 
                                       |> move(25, 45)
                                       , square 10 
                                       |> filled red
                                       |> scaleX 7 
                                       |> move(25,35)
                                       , square 10 
                                       |> filled white
                                       |> scaleX 7 
                                       |> move(25, 25)
                                       , square 10 
                                       |> filled red
                                       |> scaleX 7 
                                       |> move(25,15)
                                       , square 50
                                       |> filled blue
                                       |> move (-35, 35)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-55 ,54)
                                        , circle 2 
                                       |> filled white 
                                       |> move(-45 ,54)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-35 ,54) 
                                       , circle 2 
                                       |> filled white 
                                       |> move(-25 ,54) 
                                       , circle 2 
                                       |> filled white 
                                       |> move(-15 ,54)
                                      , circle 2 
                                       |> filled white 
                                       |> move(-55 ,44)
                                         , circle 2 
                                       |> filled white 
                                       |> move(-55 ,34)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-55 ,24)
                                         , circle 2 
                                       |> filled white 
                                       |> move(-55 ,14)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-45 ,44)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-45 ,34)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-45 ,24)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-45 ,14)
                                        , circle 2 
                                       |> filled white 
                                       |> move(-35 ,44)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-35 ,34)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-35 ,24)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-35 ,14)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-25 ,44)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-25 ,34),
                                       circle 2 
                                       |> filled white 
                                       |> move(-25 ,24), 
                                       circle 2 
                                       |> filled white 
                                       |> move(-25 ,14)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-15 ,44)
                                         , circle 2 
                                       |> filled white 
                                       |> move(-15 ,34)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-15 ,24)
                                       , circle 2 
                                       |> filled white 
                                       |> move(-15 ,14)
                                       , square 119 
                                       |> filled white 
                                       |> scaleY 0.1
                                       |> move (0, 4)
                                       , square 119 
                                       |> filled red 
                                       |> scaleY 0.1
                                       |> move (0, -8)
                                       , rect 2 200
                                       |> filled black
                                       |>move (-62, 0)
                                       , circle 5
                                       |>filled black
                                       |> move (-60, 65)] |> move ( -300, 180) 
                         , text "Quiz"
                             |> size 150
                             |> centered
                             |> filled red
                             |> move (0, 90) 
                         
                         , text "op"
                             |> size 150
                             |> centered
                             |> filled red
                             |> move (-280, 87) 
 
                         , text "Play"
                             |> size 40
                             |> centered
                             |> filled red
                             |> move (0,-80) 
                             |> notifyMouseDown StartGame],
                         
                         group [ roundedRect 300 100 5
                            |> filled yellow
                            |> scale 0.5
                            |> move (0, -200)
                         , text "Instructions"
                            |> size 18
                            |> centered
                            |> filled red
                            |> move (0,-210)] 
                            |> notifyMouseDown GoInstructions
                 ]





                     


          
                         
                         




endView model = [ group [ roundedRect 300 100 5
                            |> filled green
                         , text "Main Menu"
                            |> size 38
                            |> centered
                            |> filled white
                            |> move (0,-15)]
                            |> move (0,-80)
                            |> notifyMouseDown Reset
                        , text "You Win!"
                            |> size 60
                            |> centered
                            |> filled green
                            |> move (0, 50)
                         
                 ]

failView model = [ group [ roundedRect 300 100 5
                            |> filled darkRed
                         , text "Main Menu"
                            |> size 38
                            |> centered
                            |> filled white
                            |> move (0,-15)]
                            |> move (0,-80)
                            |> notifyMouseDown Reset
                        , text "You lost all lives"
                            |> size 60
                            |> centered
                            |> filled red
                            |> move (0, 50)
                         
                 ]

levelView level t chances cb timelimit = case level of
                                 Nothing -> []
                                 Just lev ->  [ group (lev.image t)
                                            , option A lev.optionA cb
                                                |> move (-150,-120)
                                                |> notifyMouseDown (SubmitAnswer A lev.answer)
                                            , option B lev.optionB cb
                                                |> move (-150,-160)
                                                |> notifyMouseDown (SubmitAnswer B lev.answer)
                                            , option C lev.optionC cb
                                                |> move (150,-120)
                                                |> notifyMouseDown (SubmitAnswer C lev.answer)
                                            , option D lev.optionD cb
                                                |> move (150,-160)
                                                |> notifyMouseDown (SubmitAnswer D lev.answer)
                                            , text "Extra chances"
                                                |> filled red
                                                |> move (200,100)
                                            , group (displayChances chances)
                                                |> move (200,150)
                                            
                                            , group [text "Timer: "
                                                |> size 40
                                                |> filled black ] |> move( -310, 130)
                                            , group [text (toString (ceiling timelimit))
                                                |> size 40
                                                |> filled black ] |> move( -198, 130)
                                                
                                           
                                                
                                                
                                           ]

displayChances chances = case chances of
                            0 -> []
                            _ -> [heart red
                                    |> scale (0.3)
                                    |> move (0 +  chances * 60,0) ] ++ (displayChances (chances - 1))

option ans tex cb = group [ rectangle 200 30
                            |> filled blue 
                       , text ((toString ans) ++ ": " ++ tex)
                            |> size 20
                            |> filled white
                            |> move (-90,-7) ] |> scale (if cb == ans then 2 else 1) |> notifyEnter (BigButton ans)
                            |> notifyLeave (SmallButton ans)


level1 = { image = level1_image
         , optionA = "Peru"
         , optionB = "Chile"
         , optionC = "Brazil"
         , optionD = "Rio"
         , answer = C
         }

level1_image t = [group [ myBackground
           , back
           , mySquare
             |> move(-30, -2)
           , myCircle
             |> move(0,0)
           , whiteBand
             |> move(-16,4)] |> scale 3 |> move(0, 0)
           ,group [  mySq
                |> move (-20, 0)
            , myS1 
                |> move (10, -5)
            , myS2 
                |> move (-5, 30)
            , mySq3 
                |> move (40, -5)
            , mySq4 
                |> move (20, 35)
            , mySq5
                |> move (65, -5)
            , mySq6
                |> move (50, 30) ]|> move(-10, 0) |> move( 40*cos(t/3), 40*sin(t/3) ) |> scale 2
           
           ]

back = rect 10 15
             |> filled darkGreen
             |> scale 6
             |> rotate (degrees -90)
mySquare = polygon [(40, 35), (85, 0), (40, -30), (-5, 0)]
          |> filled lightYellow
          |> scale 0.8
myCircle = circle 8
            |> filled blue
            |> scale 2
          
whiteBand = curve (60, -20) [Pull (40, 0) (0,0), Pull(10, 0) (0,0)]
              |> filled white
              |> scale 0.5
              
              
myBackground = square 200 |> filled white

myShapes = [  mySq
                |> move (-20, 0)
            , myS1 
                |> move (10, -5)
            , myS2 
                |> move (-5, 30)
            , mySq3 
                |> move (40, -5)
            , mySq4 
                |> move (20, 35)
            , mySq5
                |> move (65, -5)
            , mySq6
                |> move (50, 30)
           ]

mySq = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2

myS1 = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2

myS2 = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2

mySq3 = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2

mySq4 = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2

mySq5 = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2 

mySq6 = oval 12 14
              |> filled lightGrey
              |> scale 2
              |> scaleX 2
              |> scaleY 2 

level2 = { image = level2_image
         , optionA = "China"
         , optionB = "Mongolia"
         , optionC = "North Korea"
         , optionD = "Japan"
         , answer = D
         }

level2_image t = [rectangle 151 101 
                    |> filled black
                 , myR
                 , myJapan]

myR = rectangle 150 100 
      |> filled white

myJapan = circle 30 
          |> filled red



level3 = { image = level3_image
         , optionA = "Pakistan"
         , optionB = "Indonesia"
         , optionC = "Qatar"
         , optionD = "Peru"
         , answer = B
         }


level3_image t = [rectangle 151 101 |> filled black
           , myFR
           , myIndonesia
             |>move (0, 25)]

myFR = rectangle 150 100 |> filled white

myIndonesia = rectangle 150 50 |> filled red

level4 = { image = level4_image
         , optionA = "Lebanon"
         , optionB = "Saudi Arabia"
         , optionC = "Yemen"
         , optionD = "Libya"
         , answer = D
         }


level4_image t = [rectangle 151 101 
              |> filled black
           , myDD
           ,group [  mySq
                |> move (-20, 0)
            , myS1 
                |> move (10, -5)
            , myS2 
                |> move (-5, 30)
            , mySq3 
                |> move (40, -5)
            , mySq4 
                |> move (20, 35)
            , mySq5
                |> move (65, -5)
            , mySq6
                |> move (50, 30) ]|> move(-30, 0) |> move( 20*cos(t/2), 20*sin(t/2) ) |> scale 1.5]

myDD = rectangle 150 100 
        |> filled green

level5 = { image = level5_image
         , optionA = "Armenia"
         , optionB = "Russia"
         , optionC = "India"
         , optionD = "Sri Lanka"
         , answer = A
         }
level5_image t = [ myBackgd
           , rect 90 60
               |> outlined(solid 1) (rgb 250 250 250)      
                , rect 90 20
               |> filled red
               |>move(0,20)
               , rect 90 20
               |> filled (rgb 0 0 255)
               , rect 90 20
               |> filled orange
               |> move(0, -20)
               ,group [  mySq
                |> move (-20, 0)
            , myS1 
                |> move (10, -5)
            , myS2 
                |> move (-5, 30)
            , mySq3 
                |> move (40, -5)
            , mySq4 
                |> move (20, 35)
            , mySq5
                |> move (65, -5)
            , mySq6
                |> move (50, 30) ]|> move(-10, 0) |> move( 40*cos(t/3), 40*sin(t/3) ) |> scale 1]


myBackgd = square 200 |> filled white

level6 = { image = level6_image
         , optionA = "Dominica "
         , optionB = "Denmark"
         , optionC = "Finland"
         , optionD = "Burundi"
         , answer = C
         }

level6_image t = [ group [ 
           square 40
               |> outlined(solid 1) darkBlue
               |>scaleX 1.5, 
               square 20
               |> filled darkBlue
               |>scaleX 3
               |>scaleY 0.6, 
               square 15
               |>filled darkBlue
               |>scaleY 2.6
               |>scaleX 0.7
               |>move(-5,0) ] |> scale 2 
               ]


heart c = group [circle 50
            |> filled c
            |> move (0,50)
         ,
          circle 50
            |> filled c
            |> move (50,0)
         ,
          square 100
            |> filled c ] |> rotate (degrees 45)


--- UPDATE ---

update msg model = case msg of
                        Tick t _ -> if model.timelimit <= 0 then {model | state = Failure} else 
                                    { model | state = if model.state == InGame && model.levels == []
                                                            then EndOfGame
                                                            else model.state
                                    ,         time = model.time + 1
                                    ,         timelimit = if model.state == InGame then model.timelimit - 0.07 else model.timelimit}
                        StartGame -> { model | state = InGame}
                        GoInstructions -> {model | state = Instructions}
                        
                        SubmitAnswer ans1 ans2 -> if ans1 == ans2
                                                    then nextLevel model
                                                    else wrongAnswer model
                        Reset -> init
                        BigButton ans -> {model| currentButton = ans}
                        SmallButton ans -> {model| currentButton = NA}

nextLevel model = {model | levels = Maybe.withDefault [] (List.tail model.levels) , time = 0, timelimit = 10}

wrongAnswer model = case model.chances of
                        0 -> {model | state = Failure}
                        _ -> {model | chances = model.chances - 1}
                        


