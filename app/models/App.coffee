#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'evaluate', (->
      @evaluateHands(@get('dealerHand').scores(), @get('playerHand').scores())
    ), this
    @get('dealerHand').on 'evaluate', (->
      @evaluateHands(@get('dealerHand').scores(), @get('playerHand').scores())
    ), this

  evaluateHands: (dealerScores, playerScores) ->
    playerScore = (playerScores[1] if playerScores[1]? and playerScores[1] <= 21) or playerScores[0]
    dealerScore = (dealerScores[1] if dealerScores[1]? and dealerScores[1] <= 21) or dealerScores[0]
    if dealerScore > 21
      alert 'Dealer busted! Player wins!'
      return
    if playerScore > 21
      alert 'Player busted! Dealer wins!'
      return
    if playerScore is dealerScore then alert 'Tie.'
    if playerScore > dealerScore then alert 'Player Wins!' else alert 'Player loses!'
