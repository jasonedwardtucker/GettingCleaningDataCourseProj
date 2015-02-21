---
title: "README"
author: "Jason Tucker"
date: "Saturday, February 21, 2015"
output: html_document
---
This script and resulting dataset are the results of a class project for "Getting and Cleaning Data" from Johns Hopkins School of Public Health on Coursera.org. As of 21-Feb-2015 the .zip file containing all data files is located here for manual download if desired: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script "run_analysis.R" will download the zip file and extract it to a directory "UCI HAR Dataset" in your working directory.

As of 21-Feb-2015, an explanation of the original data collection and dataset production methods can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The resulting "UCI HAR Dataset" directory contains the following files:

* activity_labels.txt provides the names of the activities and their corresponding numerical label.
* features.txt provides the names for each of the variables recorded in the original experiment. 
* features_info.txt is an explanation of the variables in features.txt
* readme.txt gives information on the included files.
* The test and train sub-directories each contain an "X" file which is the data, and a "Y" file which contains the subject labels for each observation in "X".

The final created file of means for the Mean and Standard Deviation Variables will be named "summarisedmeanandstdmeasurements.txt".