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
- [ ] build in job search from parameters + validation
- [ ] create timer
- [ ] begin iterating through jobs
- [ ] create next jobs logic
- [ ] start applying on single job
- [ ] initialize retry logic
- [ ] fill up logic for parameters
- [ ] prepare additional question logic
- [ ] get resume
- [ ] send in home address
- [ ] implement unfollow
- [ ] write results to database
- [ ] build stop searching logic based on times


```
start applying
    choose a random job + location
        add "&location" to URL
    built in a time for how long to do a search
    apply to jobs (do the apply jobs function until you've run out of jobs):
        if no jobs, then break out of function
        jobs application loop (scroll through jobs results and inventory):
            get all the variables for our database
            apply to job loop:
                go to right hand pane and click apply
                set retries for this job for 3
                fill up function (populate with data):
                    fill in parameters & contact info
                    fill in additional questions
                    attach resume
                    fill in home address
                unfollow the company              
                if it failed or 'please enter a vlide answer/file is required', then increment a retry
                if retries are up, the break as a failed attempt
            write results to db 
    next jobs page (when you've run out of jobs, do the next jobs function):
    stop searching and sleep if you've searched for too long
```