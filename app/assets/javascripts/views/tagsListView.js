$(function() {
  
  window.TagsListView = Backbone.View.extend({
    el: $("#tags_list"),
    initialize: function() {
      this.setupSelectors();
      this.collection.bind("add", this.render, this);
    },
    setupSelectors: function() {
      this.tag_template = $("#tag_template");
    },
    render: function() {
      this.el.html("");
      this.tag_template.tmpl(this.collection.toJSON()).appendTo(this.el);
      this.el.show();
    }
  })
  
})