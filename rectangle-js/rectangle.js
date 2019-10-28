// your code, here

// Define a new class that represents a rectangle

// SHould require two arguments: width and height

//class Rectangle {
  //constructor(width, height) {
    //this.width = width;
    //this.height = height;
  //}
//}

// Allow Square Rectangles
// Modify your Rectangle so it only requires a single argument, but allows for an optional, second arguments

//class Rectangle {
//  constructor(width, height) {
  //  this.width = width;

    // check if height is provided
    //if (!!height) {
      //this.height = height;
  //  } else {
    //  this.height = width;
    //}
  //}
//}

// Give the Rectangle Behavior
// Add a method to your Rectangle class that calculates the area of a rectangle object, based on its width and height


class Rectangle {
  constructor(width, height) {
    this.width = width;

    // check if height is provided
    if (!!height) {
      this.height = height;
    } else {
      this.height = width;
    }
  }
  area() {
    return this.width * this.height;
  }
}
