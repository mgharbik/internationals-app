import React from 'react'
import { Link } from 'react-router-dom'
import axios from 'axios'

class Internationals extends React.Component {
  state = {
    internationals: [],
  }

  componentDidMount() {
    axios.get('/api/v1/internationals.json')
      .then(response => this.setState({internationals: response.data}))
  }

  render () {
    const { internationals } = this.state

    return (
      <>
        <h1>Internationals</h1>

        {internationals.length > 0 ? (
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Country of Origin</th>
                <th>Number of Friends</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {internationals.map((international, index) => (
                <tr key={index}>
                  <td>{international.name}</td>
                  <td>{international.country}</td>
                  <td>{international.friends_count}</td>
                  <td><Link to={`/internationals/${international.slug}`}>View</Link></td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <div>No internationals yet, <Link to="/internationals/new">Create one!</Link></div>
        )}
      </>
    )
  }
}

export default Internationals
