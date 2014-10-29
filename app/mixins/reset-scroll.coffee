`import Ember from 'ember'`

ResetScrollMixin = Ember.Mixin.create(
  activate: ->
    @_super()
    window.scrollTo 0,0
    return

)

`export default ResetScrollMixin`
