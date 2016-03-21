# AUTHORIZE ACCOUNT
# rsconnect::setAccountInfo(name='xita20', token='8E28FD86BFEA34C4BC401410F3EB799F', secret='NgTbOfH1SqHxSl0BajA4Le5BoECWkvSOT+kjSaqR')
# In the future, you can manage your tokens from the Tokens page the settings menu.
#install.packages(c('ggplot2', 'shiny'))
library(shiny)
shinyUI (pageWithSidebar(
  #Specify Application title
  headerPanel ("Gender Inequality and HIV Treatment"),        
  #Sidebar with controls to select the variable to plot against match result
  sidebarPanel 
  (
  #####Subgoal of GOAL
  selectInput("goal", strong("Please select GOAL:"),
              c("Goal1: COMBAT HIV/AIDS AND OTHER DISEASES"="goal1",
                "Goal2: PROMOTE GENDER EQUALITY AND EMPOWER WOMEN"="goal2"),
              multiple=F),
  
  conditionalPanel(
    condition = "input.goal == 'goal1'",
    selectInput("target1", strong("Please select SUB-TARGET:"),
                c("Target 1.A: Have halted by 2015 and begun to reverse the spread of HIV/AIDS"="target1.1",
                  "Target 1.B: Achieve, by 2010, universal access to treatment for HIV/AIDS for all those who need it"="target1.2",
                  "Target 1.C: Have halted by 2015 and begun to reverse the incidence of malaria and other major diseases"="target1.3"))
  ),
  
  conditionalPanel(
    condition = "input.goal == 'goal2'",
    selectInput("target2", strong("Please select your sub-target:"),
                c("Target 2.A: Eliminate gender disparity in primary and secondary education, and in all levels of education no later than 2015"="target2.1"))
  )
  ),
  
  
  mainPanel(
    tabsetPanel(
      tabPanel("Regional Effect",h4("By Region"),htmlOutput("region_chart")),
      tabPanel("Country Visualization",h4("By Country"),htmlOutput("motionchart_country"))
      )
  )))


