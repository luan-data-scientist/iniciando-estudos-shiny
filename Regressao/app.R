#Iniciando o estudos com Shiny 

library(shiny)

dados = read.csv("slr12.csv",sep = ";")
head(dados)
modelo = lm(CusInic ~ FrqAnual, data = dados)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Previsão de Custo Inicial para Montar uma Franquia"),
   
   fluidRow(
     column(4,
            h2("Dados"),
            #tabela com os dados
            tableOutput("tbDados")
     ),
     column(8,
            #grafico com os dados
            plotOutput("grafDados")
     )
   ),
   fluidRow(
     column(6,
            h3("Valor Anual da Franquia:"),
            #Valor que será inserido
            numericInput("NovoValor", "Insira o Valor:",1500, min = 1, max = 9999999),
            #bot?o executar
            actionButton("btnProcessar", "Processar") #identificar 
     ),
     column(6,
            #output, resultado da previsão
            h1(textOutput("txtOutResultado"))
       
     )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   

}

# Run the application 
shinyApp(ui = ui, server = server)

