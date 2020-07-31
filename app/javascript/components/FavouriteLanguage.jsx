import React from "react"
import './FavouriteLanguage.sass'

function FavouriteLanguage({ username, language }) {
  const usernameElement = <span className='favourite-language__username'>{username}</span>;

  if(!language) {
    return <div>Can't guess {usernameElement}'s favourite language :(</div>;
  }

  const languageElement = <span className='favourite-language__language'>{language}</span>;

  return (
    <div>
      {usernameElement}'s favourite language is {languageElement}
    </div>
  )
}

export default FavouriteLanguage
