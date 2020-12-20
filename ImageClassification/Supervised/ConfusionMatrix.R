# This Snippet demonstrates the use of supervised learning
# for image analysis and especially the testing of the final model 
# using the randomForest package and the caret package (for data splitting and a confusion matrix), see:
#
# http://www.inside-r.org/packages/cran/randomforest/docs/randomforest
# http://topepo.github.io/caret/index.html
#
# For this example the image 'FluorescentCells.jpg' was used (dim: 512*512, RGB) and the 'randomForest', 'caret' package of R 
# (install if necessary).
#
#1. 	Please open an R,G,B image and split it into its R,G,B components
#		(Image perspective->ImageJ menu->Image->Colours->Split Channels).
# 
#2. 	Create different selections (e.g with the freehand selection of ImageJ).
#		Use the Roi Manager for the selections (Add [t]): ImageJ menu->Edit-Selection->Add to Manager

#3.		Rename them in the ROI-Manager of ImageJ, e.g., to class1, class2, class3..... 
#		Sort it in the ROI Manager (for the transfer!). See the stored ROI!

#4. 	Use the 'Pixel RM' action from the Image-Methods view
#		(Image perspective->ImageJ-Canvas->Window->Bio7-Toolbar)
#		and transfer the different selections (e.g with the freehand selection of ImageJ).
#       For the transfer select a increasing signature (Class) in the dialog (deselect 'Create Custom Class Signature...'). 
#		You can of course type a special signature for more than one sample of a special signature (Class)
#		Signatures from all opened images (or layers) will be transferred.

#5. 	Select the whole image as the training data and add it as 'matrixAll'. 
#		Transfer it with the 'Pixel' action (without a signature)
#		
#6.		Execute the script below!

library(randomForest)# We use the lib package randomForest
library(caret)# We use caret here only to create the confusion matrix!

#Combine matrices which represent a special signature (class, object).
dftrain<-rbind(class1,class2,class3,class4)


#Split the data into training data and test data
inTrain<- createDataPartition(y=dftrain[,1], p=0.5, list=FALSE)
trainingSub<- dftrain[inTrain,]
testDataSub<- dftrain[-inTrain,]
dim(trainingSub); 
dim(testDataSub);

#We convert the classes to a factor for a classification else a regession forest will be built!
res<-randomForest(as.factor(Class)~layer1+layer2+layer3,data=trainingSub)#Train with the selection matrices (layer=colors, layer1=Red....) combined in one matrix

#Don't forget step 5 here. Here we classify the test data!
final<-predict(res,testDataSub)

#Print the confusion matrix.
print(confusionMatrix(final, testDataSub[,1]))
