import React from "react"

import './GithubUserCard.sass'

function GithubUserCard({ username, name, bio, avatar_url }) {
  const nameElement = <div className='github-user-card__name'>{name}</div>;
  const usernameElement = <div className='github-user-card__username'>@{username}</div>;

  return (
    <div className='github-user-card'>
      <img className='github-user-card__avatar' alt='avatar' src={avatar_url} />
      <div className='github-user-card__content'>
        <div className='github-user-card__header'>{nameElement} {usernameElement}</div>
        <div className='github-user-card__bio'>{bio}</div>
      </div>
    </div>
  )
}

export default GithubUserCard;
