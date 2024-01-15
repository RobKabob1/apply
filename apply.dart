//Map of the app

//main
//accept input parameters and validate (param_validation.dart)
//connect to database (database_setup_file.dart)
//login get past security checks (login_security_checks.dart)
//apply (apply_to.dart)

//parm_validation.dart
//get browser settings from yaml file
//validate these settings to make sure someone didn't type anything incorrectly
//return back to main

//database_setup_file.dart
//get parameters from main (pass yaml validated results)
//connect to database
//find if table already exists for user's email. If it doesnt, make it
//return back to main

//login_security_checks.dart
//get parameters from main (pass yaml validated results)
//login to site
//if there's a security check, have the user resolve
//return back to main

//apply_to.dart
//starts searching for jobs and increments sleep timer
//apply to jobs 
//goes through application process by answering questions
//writes results to database

