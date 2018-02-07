import React, {Component} from 'react';
// When you're not export a default from a module
// (e.g. export {QuestionDetails, AnswerDetails}),
// you must braces after `import` to choose the values
// that you are import from the module.
import {QuestionDetails} from '../QuestionDetails';
import {AnswerList} from '../AnswerList';
import {Question} from '../../requests/questions';

class QuestionShowPage extends Component {
  // When you create your own constructor, you overwrite
  // the constructor in the parent class, Component.
  // The parent constructor must still be called which
  // is we super(props) as first line of code inside
  // our constructor.

  // We use constructor primarily to set an initial state
  // for our component.
  constructor (props) {
    super(props);

    this.state = {
      loading: true,
      question: {}
    };

    this.delete = this.delete.bind(this);
    this.deleteAnswer = this.deleteAnswer.bind(this);
  }

  delete () {
    this.setState({
      question: {}
    });
  }

  deleteAnswer (answerId) {
    const {question} = this.state;
    const {answers} = question;

    this.setState({
      question: {
        ...question,
        answers: answers.filter(answer => answer.id !== answerId)
      }
    })
  }

  componentDidMount () {
    const {params} = this.props.match;

    Question
      .get(params.id)
      .then(question => {
        this.setState({question, loading: false})
      });
  }

  render () {
    const {question, loading} = this.state;
    const {answers = []} = this.state.question;

    if (loading) {
      return (
        <main
          className="QuestionShowPage"
          style={{
            padding: '0 20px'
          }}
        >
          <h3>Loading question...</h3>
        </main>
      )
    }

    /*
    if (Object.keys(this.state.question).length < 1) {
      return (
        <main
          className="QuestionShowPage"
          style={{
            padding: '0 20px'
          }}
        >
          <h2>Question doesn't exist!</h2>
        </main>
      );
    }
    */
    // To pass props to React elements, set them with
    // "HTML attributes". Each attribute will as a property
    // of the `props` object.

    // When passing props in JSX, any value that
    // is a non-string (e.g. numbers, objects, arrays, functions, etc)
    // must be put inside {}.
    return (
      <main
        className="QuestionShowPage"
        style={{
          padding: '0 20px'
        }}
      >
        {/* I'm a valid comment */}
        <QuestionDetails {...question} />
        <button
          onClick={this.delete}
        >Delete</button>
        <h3>Answer</h3>
        <AnswerList
          answers={answers}
          onAnswerDeleteClick={this.deleteAnswer}
        />
      </main>
    );
  }
}

export {QuestionShowPage};
