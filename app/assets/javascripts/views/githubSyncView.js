$(function() {
  
  window.GithubSyncView = Backbone.View.extend({
    initialize: function() {
      this.setupSelectors();
      this.collection.bind("add", this.updateSyncStatus, this);
    },
    setupSelectors: function() {
      this.sync_status = $("#github_sync_status");
    },
    events: {
      'click #sync_github': 'syncGithub',
      'click #sync': 'syncGithub'
    },
    syncGithub: function() {
      this.collection.sync();
      this.sync_status.html("Synching...").show();
    },
    updateSyncStatus: function() {
      this.sync_status.hide();
      alert("Your repositories have been synched");
      window.location.href = window.location.href
    }
  })
  
})