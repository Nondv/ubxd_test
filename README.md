# README

## Task

1. Github test
We would like you to build a simple web or command line application, which should allow users to enter an arbitrary GitHub username, and be presented with a best guess of the GitHub user's favourite programming language.

This can be computed by using the GitHub API to fetch all of the user's public GitHub repos, each of which includes the name of the dominant language for the repository.
Documentation for the GitHub API can be found at http://developer.github.com

There is no recommended timeframe for you to complete this exercise in, do what you need to do to showcase the very best of your ability. You are also not obliged to complete the full exercise but we do ask for an indication on the amount of time that you spend completing the exercises. Please use this exercise to showcase your strengths in Ruby/Rails.

2. HTML/CSS test
Please implement the following design in HTML and CSS

![image](https://user-images.githubusercontent.com/2451896/89039063-5b810480-d339-11ea-8c61-64af95b3f457.png)

## Usage

- Yarn is needed for frontend.
- Ruby 2.7.1 was used but without any specific features so older ones should be fine.

```
bundle
yarn
bundle exec rails s
```

Then just navigate to the root (probably https://localhost:3000)


Tests can be run via `bundle exec rspec`. No frontend tests were written due to
it being mostly just markup (except for `Alert` but who cares :D).

## Implementation

It's a rails 6 app with react for frontend.

### The css design
The design was implemented in `GithubUserCard` component. I didn't try to create any design abstractions - it's just a component with some sass no fancy grids.

It's not exactly the same as required in the task but the overall markup seems identical (only the content differs).

![image](https://user-images.githubusercontent.com/2451896/89039480-10b3bc80-d33a-11ea-9cb9-880a20418f0e.png)
![image](https://user-images.githubusercontent.com/2451896/89039506-1d381500-d33a-11ea-9dec-bbe2ed07418c.png)



### Backend

The app itself has two endpoints:

1. `/` - leads to `favourite_language_guess#index`
2. `/guess` - leads to `favourite_language_guess#show`

Interaction with github is made via `octokit` gem but it's wrapped. Only API-specific services use it directly and they return our local models:

- `GithubRepo`
- `GithubUser`

which provide limited and clean interface for the rest of the app to use.

Guessing is literally just checking which language is most often used in user's repositories. No complex logic like fork/original, code size counting, etc is used

### Frontend

I decided that for a new app there's no point in distributing views' code between JS and rails view templates. The only thing views do is rendering ONE react component and passing props to it.

I assume it slows down the frontend significantly but on the other hand the code is distributed much better and can be worked on separately (no erb/haml/slim and ruby knowledge needed really).

Also, for state react hooks were used (there're none react component classes yay).
