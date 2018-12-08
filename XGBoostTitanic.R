require(xgboost)
require(Matrix)
require(data.table)
options(max.print=1000000000)

#The parameters XGBoost will test on
df_test <- read.csv("f1Testfixed.csv", header = TRUE)
df <- data.table(df_test, keep.rownames = F)
sparse_matrix <- sparse.model.matrix(~.-1 ,data = df)

#The parameters XGBoost will learn from
df_train2 <- read.csv("LearningF1.txt", header = TRUE)
df2 <- data.table(df_train2, keep.rownames = F)
sparse_matrix2 <- sparse.model.matrix(~.-1 ,data = df2)

#The result, hit or miss, of the parameters XGBoost will learn from
df_train3 <- read.csv("LearningF2.txt", header = TRUE)
df3 <- data.table(df_train3, keep.rownames = F)
output_vector = df3$Survived


#Actual learning portion with features such as nround, depth, etc

bst <- xgboost(data = sparse_matrix2, label = output_vector, max.depth = 1, eta = 1, nthread = 1, nround = 62, objective = "binary:logistic")
#bst <- xgboost(data = sparse_matrix2, label = output_vector, max.depth = 4, eta = 1, nthread = 24, nround = 100, objective = "binary:logistic")

#78.7081339713 accuracy 

#bst <- xgb.load('titanic.model')

#Actual prediction
predict = predict(bst, sparse_matrix)
#prediction <- as.numeric(predict > 0.4)



write(predict, ncolumns =1, file = "test1.txt")
