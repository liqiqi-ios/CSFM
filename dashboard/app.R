## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  
  skin = "blue",
  
  dashboardHeader(title = "THE CSFM PROGRAM"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Datesets", tabName = "datasets", icon = icon("th")),
      menuItem("Nation-level", tabName = "nation-level", icon = icon("flag-checkered")),
      menuItem("Time-level", tabName = "time-level", icon = icon("calendar")),
      menuItem("Individual-level", tabName = "individual-level", icon = icon("user-circle"))
    )
  ),
  
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "datasets",
              h2("Show datasets here")
      ),
      
      # Third tab content
      tabItem(tabName = "nation-level",
              h2("Show national-level analysis here")
      ),
      
      #Forth tab content
      tabItem(tabName = "time-level",
              h2("Show time-level analysis here")
      ),
      
      #Fifth tab content
      tabItem(tabName = "individual-level",
              h2("Show individual-level analysis here"))
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)