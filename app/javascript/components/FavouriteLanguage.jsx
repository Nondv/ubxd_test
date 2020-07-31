import React from "react"
import './FavouriteLanguage.sass'

function FavouriteLanguage({ username, language }) {
  const usernameElement = <span className='favourite-language__username'>{username}</span>;
  const languageElement = <span className='favourite-language__language'>{language}</span>;

  return (
    <div>
      {usernameElement}'s favourite language is {languageElement}
    </div>
  )
}

export default FavouriteLanguage
