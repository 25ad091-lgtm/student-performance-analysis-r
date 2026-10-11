
library(shiny)

ui <- fluidPage(
  
  tags$head(
    tags$style(HTML("
      body {
        background: #eef2f7;
        font-family: Arial, sans-serif;
      }

      .header {
        background: #173b68;
        color: white;
        padding: 25px;
        text-align: center;
        border-radius: 12px;
        margin-bottom: 20px;
      }

      .header h1 {
        font-weight: bold;
      }

      .nav-tabs {
        background: white;
        border-radius: 8px;
        padding: 8px;
      }

      .tab-content {
        background: white;
        padding: 25px;
        border-radius: 10px;
        margin-top: 15px;
        box-shadow: 0 2px 8px #d5dce5;
      }

      .well {
        background: #f8fafc;
        border: 1px solid #dbe3ed;
        border-radius: 10px;
      }

      .result-box {
        background: #f0f7ff;
        padding: 20px;
        border-left: 5px solid #2563eb;
        border-radius: 8px;
        margin-top: 15px;
        font-size: 16px;
        line-height: 1.8;
      }

      .btn-primary {
        background: #173b68;
        border: none;
        padding: 10px 20px;
      }

      h3, h4 {
        color: #173b68;
      }

      .footer {
        text-align: center;
        color: #64748b;
        margin-top: 25px;
        padding: 15px;
      }
    "))
  ),
  
  div(
    class = "header",
    h1("Student Analysis System"),
    p("R Programming | Interactive Web Application"),
    p("Maximum | Average | Even & Odd | Grade | Square")
  ),
  
  tabsetPanel(
    
    tabPanel(
      "Maximum & Minimum",
      br(),
      sidebarLayout(
        sidebarPanel(
          h3("Enter Numbers"),
          numericInput("n1", "Number 1", 25),
          numericInput("n2", "Number 2", 10),
          numericInput("n3", "Number 3", 45),
          numericInput("n4", "Number 4", 30),
          numericInput("n5", "Number 5", 15)
        ),
        mainPanel(
          h3("Analysis Result"),
          div(class = "result-box",
              verbatimTextOutput("out1"))
        )
      )
    ),
    
    tabPanel(
      "Average Marks",
      br(),
      sidebarLayout(
        sidebarPanel(
          h3("Enter Student Marks"),
          numericInput("m1", "Mark 1", 78, min = 0, max = 100),
          numericInput("m2", "Mark 2", 85, min = 0, max = 100),
          numericInput("m3", "Mark 3", 92, min = 0, max = 100),
          numericInput("m4", "Mark 4", 67, min = 0, max = 100),
          numericInput("m5", "Mark 5", 80, min = 0, max = 100)
        ),
        mainPanel(
          h3("Marks Result"),
          div(class = "result-box",
              verbatimTextOutput("out2"))
        )
      )
    ),
    
    tabPanel(
      "Even & Odd",
      br(),
      sidebarLayout(
        sidebarPanel(
          h3("Enter Numbers"),
          numericInput("e1", "Number 1", 10),
          numericInput("e2", "Number 2", 15),
          numericInput("e3", "Number 3", 22),
          numericInput("e4", "Number 4", 31),
          numericInput("e5", "Number 5", 40),
          numericInput("e6", "Number 6", 55)
        ),
        mainPanel(
          h3("Number Classification"),
          div(class = "result-box",
              verbatimTextOutput("out3"))
        )
      )
    ),
    
    tabPanel(
      "Grade Calculator",
      br(),
      sidebarLayout(
        sidebarPanel(
          h3("Student Marks"),
          numericInput("mark", "Enter Mark",
                       85, min = 0, max = 100)
        ),
        mainPanel(
          h3("Grade Result"),
          div(class = "result-box",
              verbatimTextOutput("out4"))
        )
      )
    ),
    
    tabPanel(
      "Square Calculator",
      br(),
      sidebarLayout(
        sidebarPanel(
          h3("Square Calculation"),
          numericInput("num", "Enter Number", 6)
        ),
        mainPanel(
          h3("Calculation Result"),
          div(class = "result-box",
              verbatimTextOutput("out5"))
        )
      )
    )
  ),
  
  div(
    class = "footer",
    "Student Analysis System | Developed using R Shiny"
  )
)

server <- function(input, output, session) {
  output$out1 <- renderText({
    x <- c(input$n1, input$n2, input$n3,
           input$n4, input$n5)
    
    paste(
      "Maximum and Minimum Values",
      "--------------------------",
      paste("Numbers:", paste(x, collapse = ", ")),
      paste("Maximum Value:", max(x)),
      paste("Minimum Value:", min(x)),
      sep = "\n"
    )
  })
  output$out2 <- renderText({
    marks <- c(input$m1, input$m2, input$m3,
               input$m4, input$m5)
    
    paste(
      "Student Marks Analysis",
      "----------------------",
      paste("Marks:", paste(marks, collapse = ", ")),
      paste("Total Marks:", sum(marks)),
      paste("Average Marks:", round(mean(marks), 2)),
      sep = "\n"
    )
  })
  output$out3 <- renderText({
    x <- c(input$e1, input$e2, input$e3,
           input$e4, input$e5, input$e6)
    
    even <- x[x %% 2 == 0]
    odd <- x[x %% 2 != 0]
    
    paste(
      "Even and Odd Number Analysis",
      "----------------------------",
      paste("Even Numbers:", paste(even, collapse = ", ")),
      paste("Odd Numbers:", paste(odd, collapse = ", ")),
      sep = "\n"
    )
  })
  output$out4 <- renderText({
    m <- input$mark
    
    grade <- if (m >= 90) {
      "A+"
    } else if (m >= 80) {
      "A"
    } else if (m >= 70) {
      "B"
    } else if (m >= 60) {
      "C"
    } else {
      "Fail"
    }
    
    paste(
      "Student Grade Report",
      "--------------------",
      paste("Mark:", m),
      paste("Grade:", grade),
      sep = "\n"
    )
  })
  output$out5 <- renderText({
    x <- input$num
    
    paste(
      "Square Calculation",
      "------------------",
      paste("Number:", x),
      paste("Square:", x * x),
      sep = "\n"
    )
  })
}

shinyApp(ui = ui, server = server)
