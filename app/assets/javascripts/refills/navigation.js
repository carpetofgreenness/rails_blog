$(window).resize(function() {
  var more = document.getElementById("js-navigation-more");
  if ($(more).length > 0) {
    var windowWidth = $(window).width();
    var moreLeftSideToPageLeftSide = $(more).offset().left;
    var moreLeftSideToPageRightSide = windowWidth - moreLeftSideToPageLeftSide;

    if (moreLeftSideToPageRightSide < 330) {
      $("#js-navigation-more .submenu .submenu").removeClass("fly-out-right");
      $("#js-navigation-more .submenu .submenu").addClass("fly-out-left");
    }

    if (moreLeftSideToPageRightSide > 330) {
      $("#js-navigation-more .submenu .submenu").removeClass("fly-out-left");
      $("#js-navigation-more .submenu .submenu").addClass("fly-out-right");
    }
  }
});

$(document).ready(function() {
  var menuToggle = $("#js-mobile-menu").unbind();
  $("#js-navigation-menu").removeClass("show");
  $("#js-navigation-menu-right").removeClass("show");
  $("#js-navigation-menu-loggedout").removeClass("show");

  menuToggle.on("click", function(e) {
    e.preventDefault();
    $("#js-navigation-menu").slideToggle(function(){
      if($("#js-navigation-menu").is(":hidden")) {
        $("#js-navigation-menu").removeAttr("style");
      }
    });
    $("#js-navigation-menu-loggedout").slideToggle(function(){
      if($("#js-navigation-menu-loggedout").is(":hidden")) {
        $("#js-navigation-menu-loggedout").removeAttr("style");
      }
    });
    $("#js-navigation-menu-right").slideToggle(function(){
      if($("#js-navigation-menu-right").is(":hidden")) {
        $("#js-navigation-menu-right").removeAttr("style");
      }
    });
  });
}); 
