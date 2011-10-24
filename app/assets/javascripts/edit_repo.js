$(function() {
  
  var tags = new Tags
  var tag = new Tag({collection: tags})
  
  tag.bind("addNewTagEvent", function() {
    tag.save()
  })
  
  tag.bind("afterSaveEvent", function(response) {
    this.get("collection").reset().add($.parseJSON(response))
  })
  
  var tagsBoxView = new TagsBoxView({model: tag, collection: tags})
  var tagsListView = new TagsListView({model: tag, collection: tags})
  
})