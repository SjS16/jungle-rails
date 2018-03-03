# Jungle

A mini e-commerce application built with Rails 4.2. Clients can create sign up and login to purchase any of the available products. A user rating system is enabled for signed in users, and the average product rating is displayed on the home page. Admins are able to access products and categories to make changes to the inventory. This is only accessible after basic http authorization.

## Final Product

!["Home Page"](https://raw.githubusercontent.com/SjS16/jungle-rails/master/readme_images/Screen%20Shot%202018-03-03%20at%2011.11.07%20AM.png)
!["Product Page with Review"](https://raw.githubusercontent.com/SjS16/jungle-rails/master/readme_images/Screen%20Shot%202018-03-03%20at%2011.11.24%20AM.png)
!["Admin Products Page"](https://raw.githubusercontent.com/SjS16/jungle-rails/master/readme_images/Screen%20Shot%202018-03-03%20at%2011.11.43%20AM.png)
!["Login Page"](https://raw.githubusercontent.com/SjS16/jungle-rails/master/readme_images/Screen%20Shot%202018-03-02%20at%201.22.37%20PM.png)
!["Sign Up Page"](https://raw.githubusercontent.com/SjS16/jungle-rails/master/readme_images/Screen%20Shot%202018-03-02%20at%201.26.28%20PM.png)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Create .env file based on .env.example
5. Sign up for a Stripe account
6. Put Stripe (test) keys into appropriate .env vars
7. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

