library(tidyverse)
library(readr)
library(caret)

df <- read_csv("Dataset.csv")
View(df)

head(df)
tail(df)
glimpse(df)

##split data

set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.7*n)

train_df <- df[id, ]
test_df <- df[-id, ]

##---------------------------------------------------

##train
##linear regression

set.seed(42)
lm_model <- train(temp ~ humidity+ Heat_Index+ pressure,
                  data = train_df,
                  method = "lm")

##score

lm_test <- predict(lm_model, newdata = test_df)

##evaluate

lm_mae <- mean(abs(test_df$temp - lm_test))
lm_rmse <- sqrt(mean((test_df$temp - lm_test)**2))


##--------------------------------------------------

##K-fold cross validation

set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

knn_model <- train(temp ~ humidity+ Heat_Index+ pressure,
                  data = train_df,
                  method = "knn",
                  trControl = ctrl)

knn_test <- predict(knn_model, newdata = test_df)

knn_mae <- mean(abs(test_df$temp - knn_test))
knn_rmse <- sqrt(mean((test_df$temp - knn_test)**2))
