# Privia Health's Data Parser

## Background

This application accepts a tab delimited file and parses the data. The file itself was left unchanged, but I had to manipulate the data as price and price count were combined into one string when going through the file. I split those values and assigned them to their respective indices. Model testing and controller testing were included. The transactions model handled the bulk of the data parsing. This design was based on the fact that the transactions contained all of the information. 

Postgres was used as the relational database and ActiveRecord as the ORM. The main models and tables were customer, merchant, product, and transactions. The transactions table acted as the through table. 

## Setting Up the Environment

1. After cloning the repo from Github, type "bundle install" in your terminal to install the necessary gems.
2. In your terminal, type "rails generate rspec:install" to install the rspec fixer. 

## Setting Up the Database

1. Create the database first. Run "rake db:create" in the terminal. 
2. Migrate the database. Run "rake db:migrate" in the terminal

## Running the Server

1. To start the server, run "rails s".
2. Type http://localhost:8080/ in your browser

## Uploading a file

1. Upload a tab delimited file
2. See the gross total! 
