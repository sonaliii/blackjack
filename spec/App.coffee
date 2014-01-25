describe 'game', ->
  game = null

  beforeEach ->
    game = new App()

  describe 'player', ->
    it "should lose when it busts", ->
      expect(game.evaluateHands([11],[22])).toBe 'Player busted! Dealer wins!'
    it 'should lose when dealer\'s score is higher', ->
      expect(game.evaluateHands([20],[19])).toBe 'Player loses!'
    it 'should tie when it has the same score as dealer', ->
      expect(game.evaluateHands([20],[20])).toBe 'Tie!'
    it 'should win when dealer busts', ->
      expect(game.evaluateHands([22],[19])).toBe 'Dealer busted! Player wins!'
    it 'should win when it has higher score than the dealer', ->
      expect(game.evaluateHands([20],[21])).toBe 'Player Wins!'
  describe 'dealer', ->
    xit 'should stand at 17', ->
      king = new Card
             rank: 0
             suit: 1
      seven = new Card
               rank: 7
               suit: 1
      dealerHand = new Hand [ king, seven ], new Deck(), true
      dealerHand.dealerPlay()
      expect(dealerHand.length).toBe 2
    it 'should lose when it busts', ->
      expect(game.evaluateHands([22],[19])).toBe 'Dealer busted! Player wins!'
    it 'should lose when player\'s score is higher', ->
      expect(game.evaluateHands([20],[21])).toBe 'Player Wins!'
    it 'should tie when it has the same score as player', ->
      expect(game.evaluateHands([20],[20])).toBe 'Tie!'
    it 'should win when player busts', ->
      expect(game.evaluateHands([20],[22])).toBe 'Player busted! Dealer wins!'
    it 'should win when it has higher score than the player', ->
      expect(game.evaluateHands([20],[19])).toBe 'Player loses!'