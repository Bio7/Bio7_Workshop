#RScript - please enter your code here !
#This Snippet demonstrates the use of supervised learning
#for image analysis using a randomforest, see:
#http://www.inside-r.org/packages/cran/randomforest/docs/randomforest
#
#For this example the image 'FluorescentCells.jpg' was used (dim: 512*512, RGB) and the 'randomForest' package 
#(install if necessary).
#
#1. 	Please open an R,G,B image and split it into its R,G,B components
#		(Image perspective->ImageJ menu->Image->Colours->Split Channels).
# 
#2. 	Create different selections (e.g with the freehand selection of ImageJ).
#		Use the Roi Manager for the selections (Add [t]): ImageJ menu->Edit-Selection->Add to Manager

#3.		Rename them in the ROI-Manager of ImageJ, e.g., to matrix1,matrix2,matrix3..... 
#		Sort it in the ROI Manager (for the transfer!). See the stored ROI!

#4. 	Use the 'Pixel RM' action from the Image-Methods view
#		(Image perspective->ImageJ-Canvas->Window->Bio7-Toolbar)
#		and transfer the different selections (e.g with the freehand selection of ImageJ).
#      For the transfer select a increasing signature (Class) in the dialog (deselect 'Create Custom Class Signature...'). 
#		You can of course type a special signature for more than one sample of a special signature (Class)
#		Signatures from all opened images (or layers) will be transferred.

#5. 	Select the whole image as the test data and add it as 'matrixAll'. 
#		Transfer it with the 'Pixel' action (without a signature)
#		
#6.		Execute the script below!

# We use the lib package randomForest
library(randomForest)

#Combine matrices which represent a special signature (class).

#Train with the selection matrices (layer=colors, layer1=Red....) combined in one matrix
dftrain<-rbind(class1,class2,class3,class4)

#We convert the classes to a factor for a classification else a regession forest will be built!
res<-randomForest(as.factor(Class)~layer1+layer2+layer3,data=dftrain,ntree=64)

#Don't forget step 5 here. Transfer the whole image!

final<-predict(res,testData)#Predict the whole image!

#We convert the votes back to numeric matrix values!
imageMatrix<-matrix(as.integer(final),imageSizeX,imageSizeY)#Create a image matrix

#You can now transfer the image back as a greyscale image (Image perspective->ImageJ-Canvas->Window->Bio7-Toolbar)
#to ImageJ to see the results!