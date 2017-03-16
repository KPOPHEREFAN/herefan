$(document).ready(function(){
	absolute_header_height = parseInt($("#absolute_header").css("height"));
	var fix_header_height = parseInt($("#header").css("height"));
	$("#main").css("padding-top", absolute_header_height+fix_header_height)
	$("#header").css("top", absolute_header_height)
	$("#absolute_header").css("height", absolute_header_height+fix_header_height/2)
})

$(window).scroll(function(){
	var top = absolute_header_height-$(window).scrollTop();
	if(top<=0){$("#header").css("top", "0px"); }
	else{$("#header").css("top", top+"px"); }
})
