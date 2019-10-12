import React from 'react'
import { Route, Switch } from 'react-router-dom'
import axios from 'axios'

import Navigation from './Navigation'
import Internationals from './Internationals'
import International from './International'
import NewInternational from './NewInternational'

class App extends React.Component {
  render () {
    const csrfToken = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

    return (
      <>
        <Navigation />
        <Switch>
          <Route exact path="/" component={Internationals} />
          <Route exact path="/internationals/new" component={NewInternational} />
          <Route exact path="/internationals/:slug" component={International} />
        </Switch>
      </>
    )
  }
}

export default App
