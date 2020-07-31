import React from "react"


import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart } from '@fortawesome/free-solid-svg-icons'

import './GithubUserCard.sass'

function GithubUserCard({ username, name, bio, avatarUrl, favouriteLanguage }) {
  const nameElement = <div className='github-user-card__name'>{name}</div>;
  const usernameElement = <div className='github-user-card__username'>@{username}</div>;

  return (
    <div className='github-user-card'>
      <div className='github-user-card__avatar'>
        <img alt='avatar' src={avatarUrl} />
      </div>

      <div className='github-user-card__content'>
        <div className='github-user-card__header'>{nameElement} {usernameElement}</div>
        <div className='github-user-card__bio'>{bio}</div>
        <div className='github-user-card__favourite-language'>
          <FontAwesomeIcon icon={faHeart} /> {favouriteLanguage}
        </div>
      </div>
    </div>
  )
}

export default GithubUserCard;
