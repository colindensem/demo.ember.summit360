import Ember from 'ember';
// import Application from '../../app';
// import Router from '../../router';
var Application = require('summit360-web/app')['default'];
var Router = require('summit360-web/router')['default'];

import config from '../../config/environment';

export default function startApp(attrs) {
  var App;

  var attributes = Ember.merge({}, config.APP);
  attributes = Ember.merge(attributes, attrs); // use defaults, but you can override;

  Router.reopen({
    location: 'none'
  });

  Ember.run(function() {
    App = Application.create(attributes);
    App.setupForTesting();
    App.injectTestHelpers();
  });

  App.reset(); // this shouldn't be needed, i want to be able to "start an app at a specific URL"

  return App;
}
