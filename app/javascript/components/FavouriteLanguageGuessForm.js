import React, { useState } from "react"

function FavouriteLanguageGuessForm() {
  const [username, setUsername] = useState('');

  return (
    <form action='/guess' method='GET'>
      <label for='username'>Github username:</label>
      <input type='text' name='username' value={username} onChange={e => setUsername(e.target.value)}  />
      <input type='submit' value='Guess' />
    </form>
  )
}

export default FavouriteLanguageGuessForm
