import React from 'react'

import './DefaultLayout.sass'

import Alert from '../../Alert.jsx'


function DefaultLayout({ alert, children }) {
  let alertBlock = null;
  if(alert) {
    alertBlock = <div className='default-layout__alerts'><Alert msg={alert} hideAfter={3000} /></div>;
  }

  return (
    <div className='default-layout'>
      {alertBlock}

      {children}
    </div>
  )
}

export default DefaultLayout;
