import React from 'react';
import {AnswerDetails} from './AnswerDetails';

function AnswerList (props) {
  const {answers = [], onAnswerDeleteClick = () => {}} = props;

  return (
    <ul className="AnswerList">
      {
        answers.map(answer => (
          <li key={answer.id}>
          {/*}
            <AnswerDetails
              body={answer.body}
              created_at={answer.created_at}
              author_full_name={answer.author_full_name}
            />
            ð shortcut for ð
            Takes all properties of an object an applies
            as props of an element.
          */}
            <AnswerDetails
              {...answer}
              onDeleteClick={onAnswerDeleteClick}
            />
          </li>
        ))
      }
    </ul>
  );
}

export {AnswerList};
