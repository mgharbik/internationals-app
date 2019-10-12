import React from 'react'
import axios from "axios";

class International extends React.Component {
  state = {
    international: {},
  }

  componentDidMount() {
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

        <h3>Friends</h3>
      </>
    )
  }
}

export default International
