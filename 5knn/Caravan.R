library(ISLR)
# library for knn
library(class)
?Caravan
summary(Caravan)

# Verschiedene Modelle auf Caravan:
# Evaluierungsmetrik: Accuracy wäre keine gute Metrik, wenn wir auch die false negatives minimieren wollen
# => Precision und Recall
# Man kann f1-Metrik nehmen


# split into 80% training and 20% test data
set.seed(1)
rows_train <- sample(
  x = length(Caravan$Purchase),
  size = 0.8 * length(Caravan$Purchase),
)

# logistic regression
log_reg_train <- Caravan[rows_train, ]
log_reg_test <- Caravan[-rows_train, ]

glm_fit <- glm(
  formula = Purchase ~ .,
  data = log_reg_train,
  family = "binomial"
)

glm_predicted <- predict(
  object = glm_fit,
  newdata = log_reg_test,
  type = "response"
)

# confusion matrix for different cutoff points
cutoff_points <- c(0.1, 0.15, 0.2)

for (cutoff in cutoff_points) {
  glm_predicted_class <- ifelse(glm_predicted > cutoff, "Yes", "No")
  glm_confusion_matrix <- table(glm_predicted_class, log_reg_test$Purchase)
  print(glm_confusion_matrix)
}