# apply
Apply is a sample app that traverses LinkedIn and automates applications to job postings.

# Map of the app

### main
- [X] accept input parameters (param_validation.dart)
- [X] connect to database (database_setup_file.dart)
- [X] login get past security checks (login_security_checks.dart)
- [ ] apply (apply_to.dart)

### param_validation.dart
- [X] get browser settings from yaml file
- [X] validate these settings to make sure someone didn't type anything incorrectly

### database_setup_file.dart
- [X] get parameters from main (pass yaml validated results)
- [X] connect to database
- [X] find if table already exists for user's email. If it doesnt, make it
- [X] return back to main

### login_security_checks.dart
- [X] get parameters from main (pass yaml validated results)
- [X] login to site
- [X] if there's a security check, have the user resolve
- [X] return back to main

### apply_to.dart
- [ ] starts searching for jobs and increments sleep timer
- [ ] apply to jobs 
- [ ] goes through application process by answering questions
- [ ] writes results to database