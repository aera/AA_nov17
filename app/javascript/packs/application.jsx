/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import '../effects/main';
import React from 'react';
import ReactDOM from 'react-dom';
import {Navigation} from '../components/Navigation';
import {ready, qS} from '../utilities';

ready(() => {
  const navigationDiv = qS('#Navigation');
  // HTML nodes have a "dataset" property that contain
  // all html attributes that begin with "data-" as keys with
  // their values associated.
  // For example:
  // <div id="Test" data-props="{a: 1}" data-target="#node-id"> </div>
  // qS('#Test').dataset.props // returns "{a: 1}"
  // qS('#Test').dataset.target // returns "#node-id"
  const props = JSON.parse(navigationDiv.dataset.props);
  navigationDiv.dataset.props = null;

  ReactDOM.render(
    <Navigation {...props} />,
    navigationDiv
  );
});



// bump
