import React from 'react';
import {Field} from './Field';

// In React, a function that returns a React element (or JSX)
// is called a "component".

// React component function's names must begin with a capital letter.
function QuestionDetails (props = {}) {
  const {author = {}} = props;
  const containerStyle = {
    paddingLeft: "10px"
  };


  return (
    // JSX tags are translated into React.createElement() function
    // calls which output React elements.
    <div className="QuestionDetails">
      <h2>{props.title}</h2>
      <div style={containerStyle}>
        <p>{props.body}</p>
        <p>By {author.full_name}</p>
        <Field name="View Count" value={props.view_count} />
        <Field name="Created At" value={props.created_at} />
        <Field name="Updated At" value={props.updated_at} />
      </div>
    </div>
  );
}

export {QuestionDetails};
