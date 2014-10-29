`import Ember from 'ember'`
`import AnchorScroll from 'summit360-web/mixins/anchor-scroll'`


ApplicationController = Ember.ObjectController.extend(AnchorScroll,
#
#  actions: {
#    goToLink: (item, anchor) ->
#      $elem = $(anchor)
#      $scrollTo = window.scrollTo 0, $elem.offset().top
#      @transitionToRoute(item.route).then $scrollTo
#  }

)

`export default ApplicationController`
