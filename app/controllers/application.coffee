`import Ember from 'ember'`
`import AnchorScroll from 'summit360-web/mixins/anchor-scroll'`

#Required to handle any anchor/actions that are global, e.g. header/footer partials

ApplicationController = Ember.ObjectController.extend(AnchorScroll)

`export default ApplicationController`
