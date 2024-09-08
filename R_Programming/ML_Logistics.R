data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

##check/inspect data

sum(complete.cases(df)) ##or
mean(complete.cases(df)) == 1

##glimpse

glimpse(df)
head(df)
tail(df)

##logistic regression method = "glm"

set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5)

logit_model <- train(diabetes ~ . -triceps,
                     data = df,
                     method = "glm",
                     trControl = ctrl)

##final model

logit_model$finalModel

##variable importance

varImp(logit_model)

##confusion matrix

p1 <- predict(logit_model, newdata=df) ##treshold default = 0.5
p2 <- predict(logit_model, newdata=df, type="prob") ##treshold = 0.7
p2 <- ifelse(p2$pos >= 0.7, "pos","neg")

t1 <- table(p1, df$diabetes, dnn = c("predict", "actual"))
t2 <- table(p2, df$diabetes, dnn = c("predict", "actual"))

##caret confustion matrix find precision,recall
confusionMatrix(p1, df$diabetes,
                positive="pos",
                mode="prec_recall")
