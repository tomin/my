require('../index.html');
require('../assets/stylesheets/style.sass');

// TODO: Require assets here.
// require('../assets/product.png');

var App = require('./components/App.js');
var React = require('react');

React.render(<App />, document.getElementById('main'));
