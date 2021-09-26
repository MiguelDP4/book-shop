# Book Shop Simulator

Book Shop Simulator is a basic e-commerce simulation app. Users can create an account without verifying themselves. A $50 balance will be granted upon creating a buyer account, and no balance is granted for a seller account. There is an administrator account created when the app is first launched. Buyer users can use their balance to simulate buying books. The books in the sellers inventory can be added into their shopping carts and then purchased. If the user has not enough balance, the purchase is not going to be processed.

## Built With

- Ruby 3.0.1
- Ruby on Rails 6.1.4.1

## How to deploy

To deploy the project on your local machine, follow these steps:

- First, create the database using rails db:create
```
$ rails db:create 
```
- Then, migrate the database using rails db:migrate
```
$ rails db:migrate 
```
- To seed the database with the necessary categories on the category table, there's some records already created, so run the seed file by running the command rails db:seed. If the app is in the development environment, it also seed mock users, articles and votes.
```
$ rails db:seed 
```
- Finally, run the server on your local computer, and the application is ready to run.
```
$ rails server
```

## Author

👤 **Miguel Dubois**

- Github: [@MiguelDP4](https://github.com/MiguelDP4)
- Twitter: [@Mike_DP4](https://twitter.com/Mike_DP4)
- LinkedIn [Miguel Dubois](https://www.linkedin.com/in/miguel-angel-dubois)

## Live Demo

You can check a demo version of the project in [this link](https://book-store-simulator.herokuapp.com/).

## 🤝 Contributing

This project is just for practice purposes. You can of course make suggestions but I'm moving on to bigger things after this.

## Show your support

Give a ⭐️ if you like this project!