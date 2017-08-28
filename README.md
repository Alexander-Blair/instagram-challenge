# README

A clone of Instagram, built with Ruby on Rails.

### Features
* Anyone can post an image, comment on posts, and delete those comments and posts;
* A user can sign up for an account, and log in and out;


## Setup

$ git clone   git@github.com:Alexander-Blair/instagram-challenge.git  
$ cd instagram-challenge  
$ bundle install  
$ bin/rails db:create  
$ bin/rails db:migrate  
$ bin/rails server

## How to run the test suite

$ bin/rails db:migrate RAILS_ENV=test # Ensure your test environment is updated  
$ bundle exec rspec # Runs the whole test suite  
$ bundle exec rspec path/to/spec_file # Runs a single spec

## Setting up remote hosting with Amazon S3

* Sign up to AWS and create a bucket to store file uploads.

* Create a .env file in the root directory of the project and include the following details:  

S3_BUCKET_NAME=(bucket name)  
AWS_ACCESS_KEY_ID=(your key)  
AWS_SECRET_ACCESS_KEY=(your secret access key)  
AWS_REGION=(region, eg eu-west-2)  

The .env file should already be in the .gitignore file.
