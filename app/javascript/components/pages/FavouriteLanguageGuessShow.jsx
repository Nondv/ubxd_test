import React from "react"

import FavouriteLanguageGuessForm from '../FavouriteLanguageGuessForm'
import FavouriteLanguage from '../FavouriteLanguage'
import GithubUserCard from '../GithubUserCard'

function FavouriteLanguageGuessShow({ language, github_user }) {
  return (
    <div>
      <h1>Guess results</h1>

      <FavouriteLanguage language={language} username={github_user.username} />
      <GithubUserCard {...github_user} />

      <h2>Try again?</h2>
      <FavouriteLanguageGuessForm />
    </div>
  )
}

export default FavouriteLanguageGuessShow
