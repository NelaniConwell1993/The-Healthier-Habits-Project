#1 
library(dplyr)
library(ggplot2)

#2
nutritionData <- read.csv("nutritionData.csv", stringsAsFactors = FALSE)

#3
nutritionData <- nutritionData %>% 
  mutate(calories = as.numeric(calories))

#4
PlotNutrition <- ggplot(data = nutritionData, aes(x = type, y = calories)) +
  geom_boxplot()

#5
print(PlotNutrition)

#6
nutritionData <- nutritionData %>%
  group_by(type) %>% 
  summarise(aveNutrition = mean(calories))

#7 View(nutritionData)

#8
nutritionDataList <- list()

#9
averageCalories <- nutritionData$aveNutrition

#10
nutritionDataList <- cbind(nutritionDataList, averageCalories)

#11
healthyMealPlan <- function(nutritionDataList){
  
  #12
  # Variables
  nutritionList <- nutritionDataList
  totalCalories = 0
  
  #13
  #Loop through each nutrition value and sum together
  for(i in nutritionList$aveNutrition){
    totalCalories = totalCalories + i    
  }
  
  #14
  # Return the total calories
  return(totalCalories)
}

#15
totalCalories <- healthyMealPlan(nutritionDataList)

#16
print(paste0("Total Calories needed per day: ", totalCalories))

#17
healthyEatingAdvice <- function(totalCalories){
  #18
  # Variables
  suggestedNumberOfMeals = 4
  
  #19
  # Calculate calorie ranges
  suggestedCalorieRangeLow <- totalCalories*(1/suggestedNumberOfMeals)-25
  suggestedCalorieRangeHigh <- totalCalories*(1/suggestedNumberOfMeals)+25
  
  #20
  # Return the suggested calorie range
  return(c(suggestedCalorieRangeLow, suggestedCalorieRangeHigh))
}

#21
calorieRanges <- healthyEatingAdvice(totalCalories)

#22
print(paste0("Suggested calorie range per meal: ", calorieRanges[1], " to ", calorieRanges[2]))

#23
healthyLifestyleAdvice <- function(calorieRanges){
  #24
   # Variables
   suggestedExerciseTime <- 60
  
   #25
   # Calculate daily exercise  
   suggestedExerciseLow <- suggestedExerciseTime/2
   suggestedExerciseHigh <- suggestedExerciseTime*2
   
   #26
   # Return the suggested exercise time
   return(c(suggestedExerciseLow, suggestedExerciseHigh))
  
}

#27
exerciseTime <- healthyLifestyleAdvice(calorieRanges)

#28
print(paste0("Suggested daily exercise time: ", exerciseTime[1], " to ", exerciseTime[2], " minutes"))

#29
nutritionAndWellness <- function(totalCalories, calorieRanges, exerciseTime){
  #30
  # Variables
  nutritionAdvices <- c("A balanced diet should include a variety of foods from all major food groups.",
                        "Eat a variety of fruits and vegetables daily.",
                        "Choose whole grains instead of processed grains.",
                        "Choose lean protein sources such as beans, legumes, and fish.")
  exerciseAdvices <- c("Aerobic exercise, such as walking, jogging, running, swimming, or cycling.",
                       "Strength training, such as lifting weights or doing bodyweight exercises.",
                       "Flexibility exercises, such as stretching or yoga.")
  
  #31
  # Print nutrition advices                       
  print(paste0("Nutrition advice: ", nutritionAdvices))
  
  #32
  # Print exercise advices
  print(paste0("Exercise advice: ", exerciseAdvices))
  
  #33
  # Print total calories, calorie range and exercise time
  print(paste0("Total calories needed per day: ", totalCalories))
  print(paste0("Suggested calorie range per meal: ", calorieRanges[1], " to ", calorieRanges[2]))
  print(paste0("Suggested daily exercise time: ", exerciseTime[1], " to ", exerciseTime[2], " minutes"))
}

#34
nutritionAndWellness(totalCalories, calorieRanges, exerciseTime)

#35
message <- "A nutrition and wellness initiative that promotes healthy eating habits and active lifestyles, helping people to build a healthy and happy life."

#36
print(message)