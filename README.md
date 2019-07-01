# Circleci Artifacts Retriever
A shell script to retrieve CircleCI artifacts by build number

## How to use
Open getReports.sh and fill in details for the below arguments:
* DOMAIN: Your CircleCI Domain. Default is https://circleci.com
* VCS: Your VCS type. It could be either github or bitbucket
* USERNAME: Your CircleCI Username or Github Organization name
* PROJECT=Your project name
* CIRCLE_TOKEN=Your CircleCI token

After filling in all the details, just run the script with a build number
```
sh getReports.sh 34
```
