$(document).ready(function() {
	$('#add-mark-btn').click(function() {
		$("#marks-table tr:first").append("<th>X</th>");
		$('#marks-table tr:not(:first)').append('<td>Row</td>')
	});
});