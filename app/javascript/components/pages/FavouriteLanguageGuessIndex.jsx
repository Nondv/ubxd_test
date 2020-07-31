import React from "react"

import DefaultLayout from './layouts/DefaultLayout'

import FavouriteLanguageGuessForm from '../FavouriteLanguageGuessForm'

function FavouriteLanguageGuessIndex() {
  return (
    <DefaultLayout>
      <h1>Favourite language guesser</h1>
      <FavouriteLanguageGuessForm />
    </DefaultLayout>
  )
}

export default FavouriteLanguageGuessIndex
