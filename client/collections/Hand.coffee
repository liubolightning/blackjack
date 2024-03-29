class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if not @isDealer
      console.log("@get('deck') is " + @get('deck'))
      @add(@deck.pop()).last()
    else
      # console.log("@deck is ")
      # @add(@deck.pop()).last() while @scores()[0] < 17
      @at(0).flip()
      if(@scores()[0] >= 17)
        @stand()
      while(@scores()[0] < 17)
        @add(@deck.pop()).last()

  lose: ->
    @trigger('lose')

  stand: ->
    @trigger('stand')

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
