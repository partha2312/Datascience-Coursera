## Code book

The script reads in the datasets provided. It replaces the column names to have meaningful names.
The script then stores the training and testing data as tables. 
It binds column wise the subject and activities data of the training and testing data.
It binds the training and testing data row wise to get a bigger data set.
The script then creates another dataset by averaging all the columns having subject and activity as identifier.

Columns of Tidy Dataset:
Identifiers:
1                          Subject
2                         Activity
Measurements:
3                 TimeBodyAccMeanX
4                 TimeBodyAccMeanY
5                 TimeBodyAccMeanZ
6                  TimeBodyAccStdX
7                  TimeBodyAccStdY
8                  TimeBodyAccStdZ
9              TimeGravityAccMeanX
10             TimeGravityAccMeanY
11             TimeGravityAccMeanZ
12              TimeGravityAccStdX
13              TimeGravityAccStdY
14              TimeGravityAccStdZ
15            TimeBodyAccJerkMeanX
16            TimeBodyAccJerkMeanY
17            TimeBodyAccJerkMeanZ
18             TimeBodyAccJerkStdX
19             TimeBodyAccJerkStdY
20             TimeBodyAccJerkStdZ
21               TimeBodyGyroMeanX
22               TimeBodyGyroMeanY
23               TimeBodyGyroMeanZ
24                TimeBodyGyroStdX
25                TimeBodyGyroStdY
26                TimeBodyGyroStdZ
27           TimeBodyGyroJerkMeanX
28           TimeBodyGyroJerkMeanY
29           TimeBodyGyroJerkMeanZ
30            TimeBodyGyroJerkStdX
31            TimeBodyGyroJerkStdY
32            TimeBodyGyroJerkStdZ
33              TimeBodyAccMagMean
34               TimeBodyAccMagStd
35           TimeGravityAccMagMean
36            TimeGravityAccMagStd
37          TimeBodyAccJerkMagMean
38           TimeBodyAccJerkMagStd
39             TimeBodyGyroMagMean
40              TimeBodyGyroMagStd
41         TimeBodyGyroJerkMagMean
42          TimeBodyGyroJerkMagStd
43           FrequencyBodyAccMeanX
44           FrequencyBodyAccMeanY
45           FrequencyBodyAccMeanZ
46            FrequencyBodyAccStdX
47            FrequencyBodyAccStdY
48            FrequencyBodyAccStdZ
49       FrequencyBodyAccMeanFreqX
50       FrequencyBodyAccMeanFreqY
51       FrequencyBodyAccMeanFreqZ
52       FrequencyBodyAccJerkMeanX
53       FrequencyBodyAccJerkMeanY
54       FrequencyBodyAccJerkMeanZ
55        FrequencyBodyAccJerkStdX
56        FrequencyBodyAccJerkStdY
57        FrequencyBodyAccJerkStdZ
58   FrequencyBodyAccJerkMeanFreqX
59   FrequencyBodyAccJerkMeanFreqY
60   FrequencyBodyAccJerkMeanFreqZ
61          FrequencyBodyGyroMeanX
62          FrequencyBodyGyroMeanY
63          FrequencyBodyGyroMeanZ
64           FrequencyBodyGyroStdX
65           FrequencyBodyGyroStdY
66           FrequencyBodyGyroStdZ
67      FrequencyBodyGyroMeanFreqX
68      FrequencyBodyGyroMeanFreqY
69      FrequencyBodyGyroMeanFreqZ
70         FrequencyBodyAccMagMean
71          FrequencyBodyAccMagStd
72     FrequencyBodyAccMagMeanFreq
73     FrequencyBodyAccJerkMagMean
74      FrequencyBodyAccJerkMagStd
75 FrequencyBodyAccJerkMagMeanFreq
76        FrequencyBodyGyroMagMean
77         FrequencyBodyGyroMagStd
78    FrequencyBodyGyroMagMeanFreq
79    FrequencyBodyGyroJerkMagMean
