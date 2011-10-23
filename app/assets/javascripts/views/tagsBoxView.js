$(function() {
  
  window.TagsBoxView = Backbone.View.extend({
    el: $("#tags_box"),
    initialize: function() {
      this.setupAutocomplete();
      this.setupKeypress();
    },
    setupAutocomplete: function() {
      this.el.autocomplete({
        serviceUrl: "/tags/autocomplete",
        minChars: 1,
        select: function(data, value) {
          //this.model.set({name: })
        }
      })
    },
    setupKeypress: function() {
      var _this = this;
      
      this.el.keypress(function(event) {
        if (event.which == 13) {
          event.preventDefault();
          _this.model.set({name: _this.el.val()}).trigger("addNewTagEvent");
        }
      })
    }
  })
  
})