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
          <table className="table">
            <thead>
              <tr>
                <th className="col">Name</th>
                <th className="col">Country</th>
                <th className="col"># of Friends</th>
                <th className="col"></th>
              </tr>
            </thead>
            <tbody>
              {internationals.map((international, index) => (
                <tr key={index} scope="row">
                  <td>{international.name}</td>
                  <td>{international.country}</td>
                  <td>{international.friends_count}</td>
                  <td><Link to={`/internationals/${international.slug}`}>View</Link></td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <div class="alert alert-primary" role="alert">
            No internationals yet, <Link class="alert-link" to="/internationals/new">Create one!</Link>
          </div>
        )}
      </>
    )
  }
}

export default Internationals
