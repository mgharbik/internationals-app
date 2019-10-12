import React from 'react'
import axios from "axios";
import { Link } from "react-router-dom";

class International extends React.Component {
  state = {
    international: {
      friends: [],
      suggested_friends: [],
    },
  }

  componentDidMount () {
    this.fetchInternational()
  }

  componentDidUpdate (prevProps) {
    if (this.props !== prevProps) {
      this.fetchInternational()

      window.scrollTo(0, 0)
    }
  }

  fetchInternational () {
    const {
      match: {
        params: { slug }
      }
    } = this.props

    axios.get(`/api/v1/internationals/${slug}.json`)
      .then(response => this.setState({international: response.data}))
  }

  render () {
    const { international } = this.state

    return (
      <>
        <h1>{international.name} - {international.country}</h1>

        <div className="friends">
          <h3>Friends ({international.friends_count})</h3>

          {international.friends.length > 0 ? (
            <ul>
              {international.friends.map((friend, index) => (
                <li key={index}>
                  <Link to={`/internationals/${friend.slug}`}>{friend.name} - {friend.country}</Link>
                </li>
              ))}
            </ul>
          ) : (
            <div>No friends, Please add ones bellow!</div>
          )}
        </div>

        <div className="suggested-friends">
          <h3>Suggested Friends</h3>

          {international.suggested_friends.length > 0 ? (
            <ul>
              {international.suggested_friends.map((friend, index) => (
                <li key={index}>
                  <Link to={`/internationals/${friend.slug}`}>{friend.name} - {friend.country}</Link>
                </li>
              ))}
            </ul>
          ) : (
            <div>Sorry, no more suggested friends!</div>
          )}
        </div>
      </>
    )
  }
}

export default International
