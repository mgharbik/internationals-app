import React from 'react'
import { Link } from 'react-router-dom'

class Navigation extends React.Component {
  render () {
    return (
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/internationals/new">New International</Link></li>
      </ul>
    )
  }
}

export default Navigation
