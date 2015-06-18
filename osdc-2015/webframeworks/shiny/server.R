library('shiny')

shinyServer ( function (input, output) {

  cute_level <- c("cute", "cuter", "cutest", "cutestest")

  output$catpic <- renderImage({

  catpic <- switch( input$kitty,
       "cute"      = "./catpics/lazy-kitty.jpg",
       "cuter"     = "./catpics/greyfluffball.jpg",
       "cutest"    = "./catpics/piglet.jpg",
       "cutestest" = "./catpics/guineapigandcat.jpg"
       )

    list(src = catpic,
         alt = paste("super catpic"))

  }, deleteFile = FALSE)


  output$kittySelection <- renderUI( { list(
     selectInput("kitty", "choose your kitteh:", cute_level, selected = 'cute'),
     textInput("username", "choose your username:")
    )
  })

  output$caption <- renderText( {
    paste("here ", input$username, " have your kitteh!")
  } )

})
