`import Ember from 'ember'`
`import AnchorScrollMixin from 'summit360-web/mixins/anchor-scroll'`

module 'AnchorScrollMixin'

# Replace this with your real tests.
test 'it works', ->
  AnchorScrollObject = Ember.Object.extend AnchorScrollMixin
  subject = AnchorScrollObject.create()
  ok subject
