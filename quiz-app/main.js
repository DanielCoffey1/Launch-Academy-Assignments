// Average score for each Mentor Group and for the cohort
// Round averages to the nearest integer for display
//Calculate the number of students passing the quiz (grade >= 70%)
// Declare a variable for each person and assign their score as its value
//  Just React
var rami = 88;
var natoya = 92;
var bill = 68;
var susie = 100;
// We are Ruby
var sasha = 82;
var mohammed = 98;
var jennifer = 94;
var ken = 92;
//Then do your calculations with those variables
let justReact = [rami, natoya, bill, susie];
var sum = 0;
for( var i = 0; i < justReact.length; i++ ){
    sum += parseInt( justReact[i] );
}

var reactAvg = sum/justReact.length;
var reactAvgTwo = Math.round(reactAvg);
justReactAvg = `The Average for Just React is ${reactAvgTwo}.`;


let weAreRuby = [sasha, mohammed, jennifer, ken];
var sum = 0;
for( var i = 0; i < weAreRuby.length; i++ ){
    sum += parseInt( weAreRuby[i] );
}

var rubyAvg = sum/weAreRuby.length;
var rubyAvgTwo = Math.round(rubyAvg);
weAreRubyAvg = `The Average for We Are Ruby is ${rubyAvgTwo}.`;

cohort = [reactAvgTwo, rubyAvgTwo];
var sum = 0;
for( var i = 0; i < cohort.length; i++ ){
    sum += parseInt( cohort[i] );
}
var cohortAvg = sum/cohort.length;
var cohortAvgTwo = Math.round(cohortAvg);
aCohortAvg = `The Average for the cohort is ${cohortAvgTwo}.`;
//Averages
console.log(justReactAvg);
console.log(weAreRubyAvg);
console.log(aCohortAvg);

// Passing Student Grades
let passingScores = [88, 92, 68, 100, 82, 98, 94, 92];
var counter = 0;
for( var i = 0; i < passingScores.length; i++ ){
    if (passingScores[i] >= 70){
      counter ++;
    }
    studentsPassed = `The number of students who passed the quiz is ${counter}.`;
}

console.log(studentsPassed);
