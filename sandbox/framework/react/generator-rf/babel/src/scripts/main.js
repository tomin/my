require('../index.html');
require('../assets/stylesheets/style.sass');

// TODO: Require assets here.
// require('../assets/product.png');

import App from './components/App.js';
import React from 'react';

React.render(<App />, document.getElementById('main'));
