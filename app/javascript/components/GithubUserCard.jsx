import React from "react"

function GithubUserCard({ username, name, bio, avatar_url }) {
  return (
    <div>
      <img src={avatar_url} />
      <div><strong>{name}</strong> @{username}</div>
      <p>{bio}</p>
    </div>
  )
}

export default GithubUserCard;
