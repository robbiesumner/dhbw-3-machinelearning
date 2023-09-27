library(car)

?Salaries
# linear regression on sex to salary
lm_fit <- lm(
    formula = salary ~ sex,
    data = Salaries
)

summary(lm_fit)

####################################

# modell mit allen variablen

names(Salaries)

lm_fit_all <- lm(
    formula = salary ~ .,
    data = Salaries
)

summary(lm_fit_all)

summary(subset(Salaries, rank == "AssocProf"))
