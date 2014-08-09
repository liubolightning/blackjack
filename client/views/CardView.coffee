class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src=img/cards/<%= rankName %>-<%= suitName %>.png>'
  template2: _.template '<img src=img/card-back.png>'
  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    if @model.get('revealed')
    	@$el.html @template @model.attributes
    	@$el.addClass 'covered' unless @model.get 'revealed'
    else
    	@$el.html @template2 @model.attributes
    	@$el.addClass 'covered' unless @model.get 'revealed'