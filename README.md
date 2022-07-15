<br/>

<div align="center">
  <img height='200' alt='Quidditch Pitch Pixel Art'src='https://res.cloudinary.com/seguraocode/image/upload/v1657036392/cover_ti9mwa.png'>

![rspec status](https://github.com/dedemenezes/legacy_api/actions/workflows/test.yml/badge.svg)
![deploy status](https://github.com/dedemenezes/legacy_api/actions/workflows/main.yml/badge.svg)

<br/>

</div>

A RESTfull API for Harry Potter - [theboywholivedapi](www.theboywholivedapi.fun)

<br/>

## Documentation

- [theboywholivedapi/documentation](www.theboywholivedapi.fun/documentation)

<br/>

## Contributing &nbsp; [![with us](https://img.shields.io/badge/Contribute-with%20us-blue)](https?theboywholivedapi.herokuapp.com)

All contributions are welcome: bug fixes, data contributions, recommendations.
To contribute to this repository:

- [Fork the project to your own GitHub profile](https://help.github.com/articles/fork-a-repo/)

- Download the forked project using git clone:

  ```sh
  git clone git@github.com:<YOUR_USERNAME>/legacy_api.git
  ```

- Create a new branch with a descriptive name:

    ```sh
    git checkout -b my_new_branch
    ```

- Write some code, fix something, and add a test to prove that it works. *No pull request will be accepted without tests passing, or without new tests if new features are added.*

- Commit your code and push it to GitHub

- [Open a new pull request](https://help.github.com/articles/creating-a-pull-request/) and describe the changes you have made.

- We'll accept your changes after review.

Simple!

Ahhh, we have a few service objects to help you scrape and populate new resources. You should take a look at:

  - `Scraper::DcoBuilder`

  - `Parser::BoxInformation`

  - `UpdateModel::MissingFields`

  - `"app/services/seeds"`
