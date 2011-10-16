$(function() {
  
  window.Repositories = Backbone.Collection.extend({
    sync: function() {
      var _this = this;
      
      $.ajax({
        url: "/repositories/sync",
        type: "GET",
        success: function(response) {
          _this.fetch();
        }
      })
    },
    fetch: function() {
      var _this = this;
      
      $.ajax({
        url: "/repositories.json",
        type: "GET",
        success: function(response) {
          _this.reset().add(response.keywords);
        }
      })
    }
  })
  
})