import React from "react"

import DefaultLayout from './layouts/DefaultLayout'

import FavouriteLanguageGuessForm from '../FavouriteLanguageGuessForm'
import GithubUserCard from '../GithubUserCard'

function FavouriteLanguageGuessShow({ language, githubUser }) {
  return (
    <DefaultLayout>
      <h1>Guess results</h1>

      <GithubUserCard username={githubUser.username}
                      name={githubUser.name}
                      avatarUrl={githubUser.avatar_url}
                      bio={githubUser.bio}
                      favouriteLanguage={language} />

      <h2>Try again?</h2>
      <FavouriteLanguageGuessForm />
    </DefaultLayout>
  )
}

export default FavouriteLanguageGuessShow
