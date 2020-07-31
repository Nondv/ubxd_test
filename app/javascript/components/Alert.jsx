import React, { useState } from 'react'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faWindowClose } from '@fortawesome/free-solid-svg-icons'

import './Alert.sass'

function Alert({ msg, hideAfter }) {
  const [hidden, setHidden] = useState(false);
  const [timeoutId, setTimeoutId] = useState(null);

  const closeAlert = () => setHidden(true);
  if(hideAfter && !timeoutId) {
    setTimeoutId(setTimeout(closeAlert, hideAfter));
  }

  const className = ['alert', hidden && 'alert--hidden'].filter(x => x).join(' ');
  return (
    <div className={className}>
      <div className='alert__message'>{msg}</div>
      <div className='alert__close-button' onClick={closeAlert}>
        <FontAwesomeIcon icon={faWindowClose} />
      </div>
    </div>
  )
}

export default Alert
