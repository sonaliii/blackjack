class window.AppView extends Backbone.View

  el: '.game-container'

  template: _.template '
    <p class="blackjack-title">Blackjack</p>
    <div class="alert alert-success"><%= gameStatus %></div>
    <div class="player-hand-container"></div>
    <div class="button-container">
      <button class="hit-button btn btn-success">Hit</button> <button class="stand-button btn btn-warning">Stand</button>
    </div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('dealerHand').dealerPlay()

  initialize: ->
    @model.on 'change', =>
      @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
