$(function() {
  
  window.Repositories = Backbone.Collection.extend({
    sync: function() {
      $.ajax({
        url: "/repositories/sync",
        type: "GET",
        data: {},
        success: function(response) {
          
        }
      })
    }
  })
  
})