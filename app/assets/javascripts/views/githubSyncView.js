$(function() {
  
  window.GithubSyncView = Backbone.View.extend({
    el: $("#dashboard"),
    initialize: function() {
      
    },
    events: {
      'click #sync_github': 'syncGithub'
    },
    syncGithub: function() {
      this.collection.sync();
    }
  })
  
})