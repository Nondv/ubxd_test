import React from "react"

import DefaultLayout from './layouts/DefaultLayout'

import FavouriteLanguageGuessForm from '../FavouriteLanguageGuessForm'

function FavouriteLanguageGuessIndex({ alert }) {
  return (
    <DefaultLayout alert={alert}>
      <h1>Favourite language guesser</h1>
      <FavouriteLanguageGuessForm />
    </DefaultLayout>
  )
}

export default FavouriteLanguageGuessIndex
