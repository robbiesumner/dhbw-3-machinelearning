library(ISLR)
?Default
names(Default)
dim(Default)
summary(Default)

pairs(Default)

# Klassifikation mit logistischer Regression, input: balance
glm_fit <- glm(default ~ balance, data = Default, family = binomial)

summary(glm_fit)
coef(glm_fit)
