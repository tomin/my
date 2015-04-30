require('../index.html')
require('../assets/stylesheets/style.sass')

# Require assets here.
# require('../assets/product.png')

App = require('./components/App.ls')
React = require('react')

React.render(<App />, document.getElementById('main'))
