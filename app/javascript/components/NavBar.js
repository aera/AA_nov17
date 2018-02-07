import React from 'react';
import {CurrentDateTime} from './CurrentDateTime';
import {Link} from 'react-router-dom';

function NavBar (props) {
  const {user, onSignOutClick = () => {}} = props;

  const handleSignOut = event => {
    event.preventDefault();
    onSignOutClick();
  };

  return (
    <nav
      style={{
        padding: '10px',
        display: 'flex',
      }}
    >
      <Link style={{marginRight: '20px'}} to="/">Home</Link>
      <Link style={{marginRight: '20px'}} to="/questions/new">New Question</Link>
      <Link to="/questions">Questions</Link>
      {
        user ? ([
          <span
            key='1'
            style={{marginLeft: 'auto', marginRight: '20px'}}
          >
            Hello, {user.full_name}
          </span>,
          <a
            onClick={handleSignOut}
            key='2'
            href="#"
            style={{marginRight: '20px'}}
          >
            Sign Out
          </a>
        ]) : (
          <Link
            style={{marginLeft: 'auto', marginRight: '20px'}}
            to="/sign_in"
          >
              Sign In
          </Link>
        )
      }
      <CurrentDateTime />
    </nav>
  );
}

export {NavBar};
