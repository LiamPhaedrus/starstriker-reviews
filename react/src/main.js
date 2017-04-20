import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  ReactDOM.render(
    <h1>Wheee!</h1>,
    document.getElementById('react')
  );
});
