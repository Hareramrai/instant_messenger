$(document).ready(function(){
  changeStatusOfLoggedInUser = function(data) {
    var user_status = $("#user-status-"+data.user_id);
    if(data.status){
      user_status.addClass("loggedin");
      user_status.parent().show();
    }
    else{
       user_status.removeClass("loggedin");
       user_status.parent("div").hide();
    }
  };

  var current_user = $("#current_user");
  $(".user-row-line").hide();
  
  if(current_user.length>0){
    changeStatusOfLoggedInUser({ user_id:current_user.val(), status:true });   
  }
});