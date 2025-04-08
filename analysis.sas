/* Import the dataset */
proc import out = WORK.obesity
    /* datafile = directory */
    dbms = csv replace;
    getnames = yes;
run;

/* Sort the dataset */
proc sort data = Obesity;
    by family_history_with_overweight Gender;
run;

/* Univariate analysis on Age by family history and gender */
proc univariate plot normal data = Obesity;
    var Age;
    by family_history_with_overweight Gender;
    title 'Descriptive Statistics: Individuals Age by Family History of Overweight';
run;

/* Create 'two' dataset for correlation analysis */
data two;
    set Obesity;
    if NObeyesdad = 'Normal_Weight' then lvl = 0;
    else if NObeyesdad = 'Overweight_Level_I' then lvl = 1;
    else if NObeyesdad = 'Overweight_Level_II' then lvl = 2;
    else if NObeyesdad = 'Obesity_Type_I' then lvl = 3;
    else if NObeyesdad = 'Insufficient_Weight' then lvl = 4;
    else if NObeyesdad = 'Obesity_Type_II' then lvl = 5;
    else if NObeyesdad = 'Obesity_Type_III' then lvl = 6;
    else lvl = .;
    label lvl = 'Obesity Level'
          TUE = 'Time Using Technological Devices';
run;

/* Correlation between obesity level and time using tech devices */
proc corr data = two;
    var lvl TUE;
    title 'Pearson Correlation: Obesity Levels vs TUE Levels';
run;

/* Create 'three' dataset for regression analysis */
data three;
    set Obesity;
    if NObeyesdad = 'Normal_Weight' then lvl = 0;
    else if NObeyesdad = 'Overweight_Level_I' then lvl = 1;
    else if NObeyesdad = 'Overweight_Level_II' then lvl = 2;
    else if NObeyesdad = 'Obesity_Type_I' then lvl = 3;
    else if NObeyesdad = 'Insufficient_Weight' then lvl = 4;
    else if NObeyesdad = 'Obesity_Type_II' then lvl = 5;
    else if NObeyesdad = 'Obesity_Type_III' then lvl = 6;
    else lvl = .;

    if FAVC = 'yes' then freq = 1;
    else if FAVC = 'no' then freq = 0;
    else freq = .;

    label lvl = 'Obesity Level'
          freq = 'Frequency of Highly Caloric Food Intake';
run;

/* Regression analysis */
proc reg data = three;
    model lvl = freq / p clm cli;
    plot lvl * freq;
    plot resid * yhat;
    output out = three_out p = yhat r = resid student = std_resid;
    title1 'Regression Analysis of Obesity Levels vs. Frequency of Highly Caloric Food Intake';
run;

/* Univariate analysis of residuals */
proc univariate data = three_out normal;
    var resid;
    title2 'Residuals for Obesity Levels and Frequency of Highly Caloric Food Intake';
run;
