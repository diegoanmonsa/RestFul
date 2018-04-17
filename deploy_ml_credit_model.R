# Se crea la función que lee los datos y por medio del árbol de decisión arroja
# probabilidad de pago

# Se agregan las librerias rpart y jsonlite necesarias para convertir la función en una interface restful

library(rpart)
library(jsonlite)

# Se carga el árbol de decisión creado anteriormente

load("decision_Tree_for_german_credit_data.RData")

# Se define el método post de la función. 

#* @post /predict
predict.default.rate <- function(
  Status.of.existing.checking.account
  , Duration.in.month
  , Credit.history
  , Savings.account.bonds
) {
  data <- list(
    Status.of.existing.checking.account=Status.of.existing.checking.account
    , Duration.in.month=Duration.in.month
    , Credit.history=Credit.history
    
    , Savings.account.bonds=Savings.account.bonds
  )
  prediction <- predict(decision.tree, data)
  return(list(default.probability=unbox(prediction[1, 2])))
}

