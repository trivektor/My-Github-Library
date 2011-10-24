$(function() {
  
  window.Tag = Backbone.Model.extend({
    save: function() {
      var _this = this;
      
      $.ajax({
        url: "/tags",
        type: "POST",
        data: {tag: {name: this.get("name")}, repository_id: this.get("repository_id")},
        success: function(response) {
          _this.trigger("afterSaveEvent", response);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(jqXHR)
          console.log(textStatus)
          console.log(errorThrown)
        }
      })
    }
  })
  
})