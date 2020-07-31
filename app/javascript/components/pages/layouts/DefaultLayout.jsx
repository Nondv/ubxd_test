import React from 'react'

import './DefaultLayout.sass'

function DefaultLayout({ children }) {
  return (
    <div className='default-layout'>
      {children}
    </div>
  )
}

export default DefaultLayout;
