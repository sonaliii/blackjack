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
      console.log 'Dealer busted! Player wins!'
      return 'Dealer busted! Player wins!'
    if playerScore > 21
      console.log 'Player busted! Dealer wins!'
      return 'Player busted! Dealer wins!'
    if playerScore is dealerScore
      console.log 'Tie!'
      return 'Tie!'
    if playerScore > dealerScore
      console.log 'Player Wins!'
      return 'Player Wins!'
    else
      console.log 'Player loses!'
      return 'Player loses!'
