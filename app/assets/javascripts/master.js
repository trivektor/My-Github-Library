var mgl = {}

$(function() {
  
  $("#back_to_top").click(function() {
    $.scrollTo(0, 1000);
  })
  
  mgl.overlay = $("#overlay");
    
  mgl.pop_dialog = function(dialog) {
    this.overlay.fadeIn(function() {
      dialog.fadeIn();
    })
  }
    
  mgl.dismiss_dialog = function(dialog) {
    var _this = this;
    dialog.fadeOut(function() {
      _this.overlay.fadeOut();
    })
  }
  
  $(".close_dialog").click(function() {
    mgl.dismiss_dialog($(this).parent());
  })
  
})