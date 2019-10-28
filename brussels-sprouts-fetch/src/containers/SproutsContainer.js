import React, { Component } from 'react';
import RandomSprout from '../components/RandomSprout';
import SproutsIndex from '../components/SproutsIndex';

class SproutsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      recipe: "",
      recipes: []
    }
    this.getRandomRecipe = this.getRandomRecipe.bind(this)
    this.getAllRecipes = this.getAllRecipes.bind(this)
    this.getLongestRecipe = this.getLongestRecipe.bind(this)
  }

  getRandomRecipe(){
    fetch("/api/v1/random-recipe")
    .then(response => {
  if (response.ok) {
    return response;
  } else {
    let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
    throw(error);
  }
})
.then(response => response.json())
.then(body => {
  let response = body;
  this.setState({ recipe: response });
})
.catch(error => console.error(`Error in fetch: ${error.message}`));
      // .then (response => response.json())
      // .then (response => {this.setState({ recipe: response }) })
      // .catch (error => console.log('error!'))
    // YOUR FETCH CALL HERE
  }

  getAllRecipes(){
    // YOUR FETCH CALL HERE
    fetch("/api/v1/recipes")
    .then (response => response.json())
    .then (response => {this.setState({ recipe: response }) })
    // .catch (error => console.log('error!'))
  }

  getLongestRecipe() {
    fetch("/api/v1/longest-recipe")
    .then (response => response.json())
    .then (response => {this.setState({ longest: response}) })
    .catch (error => console.log('error!'))
  }

  render(){

    let handleRandomClick = () => {
      this.getRandomRecipe();
    }

    let handleIndexClick = () => {
      this.getAllRecipes();
    }

    return(
      <div className="container">
        <h1>Sprout Fetcher</h1>
        <RandomSprout
          recipe={this.state.recipe}
        />
        <SproutsIndex
          recipes={this.state.recipes}
        />

        <div className="buttons">
          <button onClick={handleRandomClick} className="btn">Get Random Recipe</button>

          <button onClick={handleIndexClick} className="btn">See All Recipes</button>
        </div>
      </div>
    )
  }
}

export default SproutsContainer;
