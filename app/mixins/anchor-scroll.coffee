`import Ember from 'ember'`

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
