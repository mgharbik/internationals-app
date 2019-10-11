import React from 'react'
import { Route, Switch } from 'react-router-dom'

import Internationals from './Internationals'
import International from './International'
import NewInternational from './NewInternational'

class App extends React.Component {
  render () {
    return (
      <Switch>
        <Route exact path="/" component={Internationals} />
        <Route exact path="/internationals/new" component={NewInternational} />
        <Route exact path="/internationals/:slug" component={International} />
      </Switch>
    )
  }
}

export default App
