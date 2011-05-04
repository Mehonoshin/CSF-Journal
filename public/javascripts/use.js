var prevVal = null;

$(document).ready(function() {
	$('#add-mark-btn').click(function() {
		var today = new Date();
     	date = today.getDate() + '.'+ (today.getMonth() + 1) + '.' + today.getFullYear();     
		$("#marks-table tr:first").append('<th>' + date + '</th>');
		$('#marks-table tr:not(:first)').append('<td class="marks-table-cell">asd</td>')
	});
	
	// $('.marks-table-cell').dblclick(function() {
	// 	alert("dbl!");
	// });

	$('.marks-table-cell').click(function() {
		if (!$(this).hasClass('blocked')) {
			prevVal = $(this).html();
			$(this).html('');
			$(this).addClass('blocked');
			$(this).append('<input class="mark-edit-field" type="text" size="5" value="' + prevVal + '">');			
		}
	});
	
	$('.marks-table-cell').mouseleave(function() {
		if ($(this).hasClass('blocked')) {
			val = $(this).children('input').attr('value');
			$(this).html(val);
			$(this).removeClass('blocked');
		}
	});
});