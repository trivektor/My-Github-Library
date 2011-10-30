$(function() {
  
  var tags = new Tags
  var tag = new Tag({collection: tags})
  
  tag.bind("addNewTagEvent", function() {
    tag.save()
  })
  
  tag.bind("afterSaveEvent", function(response) {
    var collection = this.get("collection");
    collection.reset().add(response.repository);
    collection.trigger("fetched");
  })
  
  tag.bind("afterRemoveEvent", function(response) {
    var collection = this.get("collection");
    collection.reset().add(response.repository);
    collection.trigger("fetched");
  })
  
  var tagsBoxView = new TagsBoxView({model: tag, collection: tags})
  var tagsListView = new TagsListView({model: tag, collection: tags})
  
})