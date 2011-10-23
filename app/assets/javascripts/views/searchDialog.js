$(function() {
  
  window.SearchDialog = Backbone.View.extend({
    el: $("#search_dialog"),
    initialize: function() {
      this.setupSelectors();
      this.collection.bind("search", this.render, this);
      this.setupAutocomplete();
    },
    setupSelectors: function() {
      this.search_term = $("#search_term");
    },
    render: function() {
      mgl.pop_dialog(this.el);
    },
    setupAutocomplete: function() {
      this.search_term.autocomplete({
        serviceUrl: "/search/autocomplete",
        minChars: 1,
        width: 210,
        onSelect: function(value, data) {
          
        }
      })
    }
  })
  
})