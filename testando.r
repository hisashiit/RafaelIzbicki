# Restart your R session, then run:
# Load necessary libraries
if (!requireNamespace("glmnet", quietly = TRUE)) {
  install.packages("glmnet")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

library(glmnet)
library(dplyr)

# Set the random seed for reproducibility
set.seed(1)

# Load the dataset using an absolute path
dados <- read.table("C:\\R_projets\\prostate.data", header = TRUE)

# Check if the dataset has the expected columns
if (!all(c("train", "lpsa") %in% names(dados))) {
  stop("The dataset must contain 'train' and 'lpsa' columns.")
}

# Split the dataset into training and validation sets
tr <- dados$train  # Logical vector for training data
X_tr <- dados[tr, 1:8] %>% as.matrix()  # Training features (first 8 columns)
y_tr <- dados$lpsa[tr]  # Training labels (target variable)
X_val <- dados[-tr, 1:8] %>% as.matrix()  # Validation features
y_val <- dados$lpsa[-tr]  # Validation labels

# Prepare the variables for glmnet
x <- X_tr  # Features for training
y <- y_tr  # Target variable for training

# Fit Lasso model (alpha = 1)
ajuste_lasso <- cv.glmnet(x, y, alpha = 1)

# Predict using Lasso model
predito_lasso <- predict(ajuste_lasso, newx = X_val)

# Fit Ridge model (alpha = 0)
ajuste_ridge <- cv.glmnet(X_tr, y_tr, alpha = 0)

# Predict using Ridge model
predito_ridge <- predict(ajuste_ridge, newx = X_val)

# Fit Ordinary Least Squares (OLS)
ajuste_mq <- glmnet(X_tr, y_tr, alpha = 0, lambda = 0)

# Predict using OLS
predito_mq <- predict(ajuste_mq, newx = X_val)

# Output predictions for inspection
list(
  lasso_predictions = predito_lasso,
  ridge_predictions = predito_ridge,
  ols_predictions = predito_mq
)
