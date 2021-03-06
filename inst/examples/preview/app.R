
library(shiny)
library(purrple)

page <- purrplePage(fluidPage)
ui <- shinyUI( page(

  fluidRow(
    column(6, JcropImageOutput("image", height = 400 )),
    column(2, JcropImagePreviewOutput("preview", width = 400 ))
  )

))

server = function(input, output, session) {
  image <- system.file("cats", "cat3.jpg", package = "purrple")
  output$image <- renderJcropImage( image , opacity = .3, aspect_ratio = 1  )
  output$preview <- renderJcropImagePreview( JcropImagePreview("image", input$image_change) )

}

shinyApp(ui = ui, server = server)
