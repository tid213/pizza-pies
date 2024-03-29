# Pizza Pies

Welcome to the Pizza Pies! This Ruby on Rails application allows users to create and manage pizzas with various toppings.

## Features

- **Pizza Management:** Create, edit, and delete pizzas with a variety of toppings.
- **Topping Management:** Maintain a list of available pizza toppings.
- **Validation:** Ensure unique combinations of toppings for each pizza.
- **User Interface:** Simple and intuitive interface for managing pizzas and toppings.

## About This Project
As a Rails newbie, I embarked on the journey of building Pizza Pies, and I found Rails to be an excellent companion for setting up the backend. The built-in helpers and conventions made the development process smooth and enjoyable. I opted for Heroku's PostgreSQL as the database, ensuring a robust and scalable solution for storing pizza creations.

## Getting Started

Follow these steps to set up and run the Pizza App locally on your machine.

### Prerequisites

Make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/)
- [Ruby on Rails](https://rubyonrails.org/)

### Installation

1. Clone the repository:

   ```
   git clone https://github.com/tid213/pizza-pies.git
   ```

2. Navigate to the project directory:

    ```
    cd pizza-pies
    ```

3. Install dependencies:
    ```
    bundle install
    ```
4. Set up the database:
    ```
    rails db:create
    rails db:migrate
    ```

### Running Locally

1. Start the Rails server:

    ```
    rails server
    ```

2. Visit http://localhost:3000 in your web browser to access Pizza Pies.

### Running Tests

1. To run tests, use the following command:

    ```
    rails test
    ```

### Contributing
Feel free to contribute to the development of Pizza Pies by opening issues or creating pull requests. Your feedback and contributions are highly appreciated!