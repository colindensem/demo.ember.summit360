`import Ember from 'ember';`

`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType


Router.map ->
  @route "about"
  @route '/', queryParams: ['anchor']

  @route "four-oh-four", {path: "*path"}

`export default Router;`
