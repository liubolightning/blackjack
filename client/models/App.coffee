#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
  	@reset()

  reset: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('lose', @reset, @)
    @get('dealerHand').on('add stand', @decide, @)
    @get('dealerHand').on('lose', @reset, @)
    console.log("reset App")

  decide: ->
    dealerScore = @get('dealerHand').scores()[0]
    playerScore = @get('playerHand').scores()[0]
    if(dealerScore >= 17 and dealerScore <=21)
      if(dealerScore > playerScore)
        alert("You lose")
      else
        alert("You win")
      @reset()