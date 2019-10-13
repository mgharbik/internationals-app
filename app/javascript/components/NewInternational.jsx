import React from 'react'
import { Link } from 'react-router-dom'
import axios from 'axios'

class NewInternational extends React.Component {
  state = {
    name: '',
    country: '',
  }

  onChange = (event) => {
    this.setState({ [event.target.name]: event.target.value })
  }

  onSubmit = (event) => {
    event.preventDefault()

    const { name, country } = this.state;

    if (name.length == 0 || country.length == 0) { return }

    axios.post('/api/v1/internationals.json', { international: { name: name, country: country } })
      .then(response => this.props.history.push(`/internationals/${response.data.slug}`))
  }

  render () {
    return (
      <>
        <h1>New International</h1>

        <form onSubmit={this.onSubmit}>
          <div className="form-group">
            <label>Name</label>
            <input
              className="form-control"
              type="text"
              name="name"
              required
              onChange={this.onChange}
            />
          </div>

          <div className="form-group">
            <label>Country of Origin</label>
            <input
              className="form-control"
              type="text"
              name="country"
              required
              onChange={this.onChange}
            />
          </div>

          <button type="submit" className="btn btn-primary">Submit</button>
        </form>
      </>
    )
  }
}

export default NewInternational
