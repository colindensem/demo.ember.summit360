`import Ember from 'ember'`

#http://stackoverflow.com/questions/18445661/ember-js-anchor-link

AnchorScrollMixin = Ember.Mixin.create(

  actions: {
    goToLink: (item, anchor) ->
      console.log
      $elem = $(anchor)
      $scrollTo = window.scrollTo 0, ($elem.offset().top)
      @transitionToRoute(item.route).then $scrollTo
  }

)


`export default AnchorScrollMixin`
