---
title: "Code Book"
author: "Jason Tucker"
date: "Saturday, February 21, 2015"
output: html_document
---
As of 21-Feb-2015, an explanation of the original data collection and dataset production methods can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The purpose of this script is to combine the "test" and "training" data, along with the Subject Identification Labels and descriptive labels for the Activities measured during the experiment. Additionally, out of the 561 variables contained in the orginal datasets, only those variables containing computed Mean and Standard Variation were included in the data extracted by this script, for a total of 79 variables in the second data set. 

After the complete dataset of 10299 observations of 81 variables (79 data variables + subject and activity labels), the mean of observations was taken by subject by activity. There were 30 subjects observed as they performed 6 different activities, so the resulting tidy dataset contains 180 mean observations for each of the 79 data variables.

The changes in variable names from the original dataset are as follows:

* Extraneous Symbols, "_, (), -" were removed. 
* Erroneous duplications "bodybody" were corrected. 
* Initial "f" and "t" indicators were change to "freq" and "time". 
* "acc" was changed to "accel" to more clearly denote accelerometer measurements.

Further information in on how each variable was orignially calculated and normalized can be found in features_info.txt file included in the original dataset, and on the website listed above. 