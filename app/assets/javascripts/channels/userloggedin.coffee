App.userloggedin = App.cable.subscriptions.create "UserloggedinChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    changeStatusOfLoggedInUser data
