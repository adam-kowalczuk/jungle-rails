# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Final Product

!["Welcome to the Jungle"](https://github.com/adam-kowalczuk/jungle-rails/blob/master/docs/home.png?raw=true)
!["Try add something to your cart"](https://github.com/adam-kowalczuk/jungle-rails/blob/master/docs/empty-cart.png?raw=true)
!["Uh oh! All sold out!"](https://github.com/adam-kowalczuk/jungle-rails/blob/master/docs/cliff-collard.png?raw=true)
!["Now you've got a couple items in your cart. Nice!"](https://github.com/adam-kowalczuk/jungle-rails/blob/master/docs/my-cart.png?raw=true)
!["A summary of your order. Have a nice day!"](https://github.com/adam-kowalczuk/jungle-rails/blob/master/docs/order.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Create and put (test) keys into appropriate .env admin vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
