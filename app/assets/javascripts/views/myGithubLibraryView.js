$(function() {
  
  window.MyGithubLibraryView = Backbone.View.extend({
    el: $("body"),
    initialize: function() {
      this.setupSelectors();
    },
    setupSelectors: function() {
      this.search_btn = $("#search");
    },
    events: {
      'click #search': 'triggerSearchDialog'
    },
    triggerSearchDialog: function() {
      this.collection.trigger("search")
    }
  })
  
})