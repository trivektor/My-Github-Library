$(function() {
  
  window.GithubSyncView = Backbone.View.extend({
    el: $("#dashboard"),
    initialize: function() {
      this.setupSelectors();
      this.collection.bind("add", this.updateSyncStatus, this);
    },
    setupSelectors: function() {
      this.spinner = $("#spinner");
    },
    events: {
      'click #sync_github': 'syncGithub'
    },
    syncGithub: function() {
      this.showSpinner();
      this.collection.sync();
    },
    updateSyncStatus: function() {
      this.hideSpinner();
      alert("Your repositories have been synched");
    },
    hideSpinner: function() {
      this.spinner.hide();
    },
    showSpinner: function() {
      this.spinner.show();
    }
  })
  
})