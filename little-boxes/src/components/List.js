import React from 'react';

// const List = props => {
//   debugger
//   return (
//     <div className='box list'>
//       <h1>{props.title}</h1>
//       <ul>
//         <li>{props.list[0]}</li>
//         <li>{props.list[1]}</li>
//         <li>{props.list[2]}</li>
//         <li>{props.list[3]}</li>
//         <li>{props.list[4]}</li>
//         <li>{props.list[5]}</li>
//       </ul>
//     </div>
//   )
// }

const List = props => {
  let planets =
  props.list.map((item) =>
    <li>{item}</li>
  );

  return(
    <div className='box list'>
    <h1>{props.header}</h1>
    <ul>{planets}</ul>
    </div>
  )
}
export default List;
