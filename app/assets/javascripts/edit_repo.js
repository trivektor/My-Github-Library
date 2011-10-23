$(function() {
  
  var tag = new Tag
  var tags = new Tags
  
  tag.bind("addNewTagEvent", function() {
    tag.save()
  })
  
  var tagsBoxView = new TagsBoxView({model: tag, collection: tags})
  var tagsListView = new TagsListView({model: tag, collection: tags})
  
})