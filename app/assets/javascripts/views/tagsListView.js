$(function() {
  
  window.TagsListView = Backbone.View.extend({
    el: $("#tags_list"),
    initialize: function() {
      this.setupSelectors();
      this.collection.bind("fetched", this.render, this);
    },
    setupSelectors: function() {
      this.tag_template = $("#tag_template");
    },
    events: {
      'click .remove_tag': 'removeTag'
    },
    render: function() {
      this.el.html("");
      this.tag_template.tmpl(this.collection.toJSON()).appendTo(this.el);
      this.el.show();
    },
    removeTag: function(event) {
      var target = $(event.target);
      
      this.model.set({tag_id: target.attr("tag_id"), repository_id: target.attr("repository_id")});
      this.model.remove();
    }
  })
  
})