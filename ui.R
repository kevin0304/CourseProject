# ui.R

shinyUI(fluidPage(
        titlePanel("Seizure calculator"),
        helpText("Although real seizure prediction is currently not possible, this application tries to demonstrate patients with epilepsy,"),
        helpText("which factors can have an impact on seizure frequency. So imagine that you have epilepsy:"),
        helpText("Enter the seizure frequency from the last month and some habits to see how many seizures you probably going to suffer in the next month."),
        sidebarLayout(
                sidebarPanel(
        sliderInput("Seizures", label = "How many seizures did you have in the previous month?",
                    min = 0, max = 100, value = 0),
        checkboxInput("Medication", label = "Do you take your antiepileptic drugs regularly?", value = FALSE),
        checkboxInput("Sleep", label = "Do you sleep more than six hours regularly?", value = FALSE),
        checkboxInput("Alcohol", label = "Do you drink alcohol?", value = FALSE)
                ),
        mainPanel(
        plotOutput("hist")
        )
        ),
        helpText("This is just a fun app, which has not been created to offend anyone!")
))