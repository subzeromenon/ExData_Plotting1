1. SubjNo. 
    Individual code of the 30 volunteers
        Vector of type int which varies from 1 to 30.

2. Activity
    Describes the activity performed by the SubjNo. at any point of time.
        Vector of type factor with 6 levels with the following labels:
            1   WALKING
            2   WALKING_UPSTAIRS
            3   WALKING_DOWNSTAIRS
            4   SITTING
            5   STANDING
            6   LAYING

3. The following numeric vectors are the measurements made of the experiment. Measurements are bound within [-1,1]. The columnnames are written in CamelCasing. Furthermore, the column names with the following prefixes signify the following:

    1.1. TimeDomain: Time Domain Signals 
    1.2. FreqDomain: Frequency Domain Signals
    
The column names with the following suffixes signify the following: 
    2.1. St.dev: Standard Deviation of the measurements 
    2.2. Mean: Mean of the measurements.
    2.3. Xaxis: Measurement taken along the X axis.
    2.4. Yaxis: Measurement taken along the Y axis.
    2.5. Zaxis: Measurement taken along the Z axis.
    
Column names with these features represent the following:
    3.1. BodyAcc: Body acceleration signals
    3.2. GravityAcc: Gravity acceleration signals
    3.3. BodyAccJerk: Linear body acceleration jerk signals                  
    3.4. BodyGyroJerk: Angular velocity jerk signals 
    3.5. BodyGyro: Angular velocity signals
    3.6. BodyAccMag: Magnitude of body acceleration signals.
    3.7. GravityAccMag: Magnitude of gravity accerleration signals.
    3.8. BodyAccJerkMag: Magnitude of linear body acceleration jerk singals.
    3.9. BodyGyroMag: Magnitude of angular velocity signals.
    3.10. BodyGyroJerkMag: Magnitude of angular velocity jerk signals.
    
    Using the above schema, one can easily comprehend that a column name stands for. For eg,
    TimeDomainBodyAccMagMean: Mean of magnitude of time domain signals of linear body acceleration.
    FreqDomainBodyAccSt.devYaxis: Standard deviation of frequency domain of linear acceleration of body along y-axis.
