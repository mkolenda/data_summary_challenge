Feel free to email ([mkolenda@priviahealth.com](mailto:mkolenda@priviahealth.com)) if you have any questions.
## Instructions For running
1) This app is running Ruby 2.2.1 and Rails 4.2.1
2) Clone Repository locally
3) Run Bundle Install to pull necessary gem
4) Run db:migrate for database
5) Run rails s to start rails server
6) Navigate to http://localhost:3000
7) Select new_example file sent via email(my database is a bit differently configured with underscores in the headers and using an item_price2)
8) Click Import TSV

## Submission Instructions
1. First, fork this project on github.  You will need to create an account if you don't already have one.
1. Next, complete the project as described below within your fork.
1. Finally, push all of your changes to your fork on github and submit a pull request.  You should also email the address above to let them know you have submitted a solution.  Make sure to include your github username in your email (so we can match people with pull requests).

## Alternate Submission Instructions (if you don't want to publicize completing the challenge)
1. Clone the repository
1. Next, complete your project as described below within your local repository
1. Email a patch file to the appropriate address listed above.

## Project Description
Imagine that PriviaHealth has just acquired a new company.  Unfortunately, the company has never stored their data in a database and instead uses a plain text file.  We need to create a way for the new subsidiary to import their data into a database.  Your task is to create a web interface that accepts file uploads, normalizes the data, and then stores it in a relational database.

Here's what your web-based application must do:

1. Your app must accept (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name.  You can assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line.  An example input file named example_input.tab is included in this repo.
1. Your app must parse the given file, normalize the data, and store the information in a relational database.
1. After upload, your application should display the total amount gross revenue represented by the uploaded file.
1. Your app is written in Rails.
1. Your app can use any open source libraries as necessary

Your application does not need to:

1. handle authentication or authorization 
1. be aesthetically pleasing

Your application should be easy to set up and should run on either Linux or Mac OS X.  It should not require any for-pay software.

## Evaluation
Evaluation of your submission will be based on the following criteria. Additionally, reviewers will attempt to assess your familiarity with standard libraries. If your code submission is in Ruby, reviewers will attempt to assess your experience with object-oriented programming based on how you've structured your submission.

1. Did your application fulfill the basic requirements?
1. Did you document the method for setting up and running your application?
1. Did you follow the instructions for submission?
1. Did you write tests?

