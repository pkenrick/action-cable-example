App.messages = App.cable.subscriptions.create('MessagesChannel',  {
  received: function(data){
    // $('#messages').removeClass('hidden')
    $('#message_content').val('')
    return $('#messages').prepend(this.renderMessage(data));
  },

  renderMessage: function(data){
    return "<li>" + data.user.toUpperCase() + " says: " + data.message + "</li>";
  }
})
