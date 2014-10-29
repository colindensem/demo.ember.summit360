`import Ember from 'ember'`
`import ResetScrollMixin from 'summit360-web/mixins/reset-scroll'`

module 'ResetScrollMixin'

# Replace this with your real tests.
test 'it works', ->
  ResetScrollObject = Ember.Object.extend ResetScrollMixin
  subject = ResetScrollObject.create()
  ok subject
