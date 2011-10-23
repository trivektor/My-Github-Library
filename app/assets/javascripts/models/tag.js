$(function() {
  
  window.Tag = Backbone.Model.extend({
    save: function() {
      $.ajax({
        url: "/tags",
        type: "POST",
        data: {tag: {name: this.get("name")}},
        success: function(response) {
          
        }
      })
    }
  })
  
})