# KaggleTitanic
Titanic Kaggle Challenge

I am quickly realising I need to get better. I obtained my highest results using XGBoost with 78.7% accuracy on the dataset.

I can't seem to get a good Neural Network working. There are some scores of over 90% which aren't accurrate, but there is one person who is a top contributor with an accuracy of 90.9%. 

Is it possible to get such a high accuracy using only the data we're given? Or did those people use the entire titanic set to train their model? Or perhaps trained on the test set and overfitted it?

In any case, I've read of people getting 82% without resorting to such methods, so I still have work to do.


XGBoost model 1 was generated using a max.depth of 1, eta of 1, nround of 62. Unknown data was averaged for time, though ideally it would be predicted. Data also wasn't normalized for time, and names were removed from data.
