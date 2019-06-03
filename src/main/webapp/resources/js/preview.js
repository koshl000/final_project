/**
 * 
 */
if(!jQuery) console.error("jQuery 미지원");
else{
	$.fn.preview=function(element){
		$(this).on("change", function(){
			var files = $(this).prop("files");
			var reader = new FileReader();
			reader.onloadend=function(event){
				var imgTag = $("<img />")
				.attr({src:event.target.result})
				.css({width:"200px", height:"200px"});
				$(element).html(imgTag);		
			}
			reader.readAsDataURL(files[0]);
		});
	}
}
