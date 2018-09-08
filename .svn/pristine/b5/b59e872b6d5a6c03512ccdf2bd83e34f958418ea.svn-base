// Nexus 4 Pure CSS Design
// Author : Erhan Basa ( erhanbasa.com )
// http://erhanbasa.com/blog/css-ile-nexus-4/
$(document).ready(function() {

	/*	Current Tab 	*/
	$('.phone-tabs li a').click(function() {
		$('.phone-tabs li').removeClass('current');
		$(this).parent().addClass('current');
	});

	/*	Simple Tab 	*/
	var tabContents = $('.phone-tab-contents');
	$('.phone-tabs .getphone').click(function() {
		tabContents.removeClass('getpeoples');
		tabContents.removeClass('getclock');
	});

	$('.phone-tabs .getclock').click(function() {
		tabContents.removeClass('getpeoples');
		tabContents.addClass('getclock');
	});

	$('.phone-tabs .getpeoples').click(function() {
		tabContents.removeClass('getclock');
		tabContents.addClass('getpeoples');
	});

	/*	Delete */
	$('.delete-btn').click(function() {
		var numbers = $('.number-area .numbers').text();
		var numbers2 = $('.number-area .numbers').text().length;
		$('.number-area .numbers').text(numbers.substr(0, numbers2 - 1));
	});

	/*	Pusher	*/
	var pusher = {
		number: function(num) {
			$('.numbers-container .pushed' + num + '').click(function() {
				$('.number-area .numbers').append('' + num + '');
			});
		}
	}

	pusher.number(1);
	pusher.number(2);
	pusher.number(3);
	pusher.number(4);
	pusher.number(5);
	pusher.number(6);
	pusher.number(7);
	pusher.number(8);
	pusher.number(9);
	pusher.number(0);

	$('.numbers-container .pushedasterisk').click(function() {
		$('.number-area .numbers').append('*');
	});

	$('.numbers-container .pushednumber').click(function() {
		$('.number-area .numbers').append('#');
	});

});