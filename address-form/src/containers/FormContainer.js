import React, { Component } from 'react'
import TextField from '../components/TextField'
class FormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      firstName: '',
      lastName: '',
      address: '',
      city: '',
      state: '',
      zipCode: '',
      phoneNumber: '',
      email: ''
    }
    this.handleFirstNameChange = this.handleFirstNameChange.bind(this)
    this.handleLastNameChange = this.handleLastNameChange.bind(this)
    this.handleAddressChange = this.handleAddressChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleFirstNameChange(event) {
    this.setState({ firstName: event.target.value })
  }

  handleLastNameChange(event) {
    this.setState({ lastName: event.target.value })
  }

  handleAddressChange(event) {
    this.setState({ address: event.target.value })
  }

  handleCityChange(event) {
    this.setState({city: event.target.value})
  }

  handleStateChange(event) {
    this.setState({state: event.target.value})
  }

  handleZipCodeChange(event) {
    this.setState({zipCode: event.target.value})
  }

  handlePhoneNumberChange(event) {
    this.setState({phoneNumber: event.target.value})
  }

  handleEmailChange(event) {
    this.setState({email: event.target.value})
  }

  handleSubmit(event) {
    event.preventDefault()
    console.log(this.state)
  }

  render() {
    console.log(this.state)
    return (
      <form onSubmit={this.handleSubmit} className="callout" id="shipping-address-form">
        <h1>Shipping Address</h1>

        <TextField
          id="first-name"
          name="firstName"
          label="First Name"
          content={this.state.firstName}
          handleChange={this.handleFirstNameChange}
          />

        <TextField
          id="last-name"
          name="lastName"
          label="Last Name"
          content={this.state.lastName}
          handleChange={this.handleLastNameChange}
          />

        <TextField
          id="address"
          name="address"
          label="Address"
          content={this.state.address}
          handleChange={this.handleAddressChange}
          />

        <div>
          <label htmlFor="city">City:</label>
          <input type="text" id="city" name="city" />
        </div>

        <div>
          <label htmlFor="state">State:</label>
          <input type="text" id="state" name="state" />
        </div>

        <div>
          <label htmlFor="zipCode">Zip Code:</label>
          <input type="text" id="zip-code" name="zipCode" />
        </div>

        <div>
          <label htmlFor="phoneNumber">Phone Number:</label>
          <input type="text" id="phone-number" name="phoneNumber" />
        </div>

        <div>
          <label htmlFor="email">Email:</label>
          <input type="text" id="email" name="email" />
        </div>

        <input type="submit" className="button" value="Submit "/>
      </form>
    )
  }
}

export default FormContainer
