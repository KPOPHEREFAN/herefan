function JSearchText(){
	function search(value, target_objs){
		$.each($(target_objs), function(i, obj){
			$(obj).addClass("hidden");
			if($(obj).attr("JSearchText").includes(value)){
				$(obj).removeClass("hidden");
			}
		});
	}
	$(".JSearchText a").click(function(){
		var input = $(this).parent().find(">input")
		search(input.val(), $(this).attr("target_objs"));
	});
	$(".JSearchText input").keypress(function(e){
		if(e.keyCode == '13'){ $(this).parent().find(">a").click(); }
	});
}


function JEditToggler(){
	$(".JEditToggler a").click(function(){
		var input = $(this).parent().find(">input");
		var p = $(this).parent().find(">p");
		$([p, input]).toggleClass("hidden");
		$(p).html($(input).val());
	});
}


function JSelectId(){
	$(".JSelectId").click(function(){
		$($(this).attr("target_input_obj")).val($(this).attr("obj_id"));
	});
}
