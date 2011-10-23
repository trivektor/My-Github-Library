$(function() {
  
  window.SearchDialog = Backbone.View.extend({
    el: $("#search_dialog"),
    initialize: function() {
      this.setupSelectors();
      this.collection.bind("search", this.render, this);
    },
    setupSelectors: function() {
      
    },
    render: function() {
      mgl.pop_dialog(this.el);
    }
  })
  
})