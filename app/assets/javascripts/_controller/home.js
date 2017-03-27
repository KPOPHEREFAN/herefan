$(window).load(function(){
	JSearchText();

	$(".Jfandom_select").click(function(){
		var fandom_image = $(this).find(".fandom_image")
		var window_width = $(window).width()
		var left_offset=$(fandom_image).offset().left+19
		var top_offset=$(fandom_image).offset().top+19
		$("#intro2")
			.css("display", "block")
			.css("left", left_offset)
			.css("top", top_offset)
			.prepend(fandom_image);
		setTimeout(function(){
			$(fandom_image)
				.css("width", window_width*2)
				.css("height", window_width*2)
				.css("border-width", (window_width-62));
			setTimeout(function(){$("#intro1").css("display", "none") }, 1000);
			setTimeout(function(){
				$("#intro2")
					.css("transition", "0.5s")
					.css("top", 70)
					.css("left", window_width/2-62);
				setTimeout(function(){
					$(".bubble_up").css("transform", "scale(1)");
					$("#intro_service_list>a").click(function(){
						$("#here_intro").css("display", "none")
					})
				}, 1000)
			}, 0);
		}, 0);
	})
});



