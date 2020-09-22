(function($) {
	// DOM Ready
	$(function() {
		// Binding a click event
		// From jQuery v.1.7.0 use .on() instead of .bind()
		$('.my-button0').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up0').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up0').bPopup();
		});


		$('.my-button1').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up1').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up1').bPopup();
		});


		$('.my-button2').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up2').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up2').bPopup();
		});


		$('.my-button3').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up3').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up3').bPopup();
		});


		$('.my-button4').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up4').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up4').bPopup();
		});


		$('.my-button5').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up5').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up5').bPopup();
		});


		$('.my-button6').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up6').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up6').bPopup();
		});


		$('.my-button7').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up7').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up7').bPopup();
		});


		$('.my-button8').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up8').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up8').bPopup();
		});


		$('.my-button9').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up9').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up9').bPopup();
		});


		$('.my-button10').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up10').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up10').bPopup();
		});


		$('.my-button11').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up11').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up11').bPopup();
		});


		$('.my-button12').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up12').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up12').bPopup();
		});


		$('.my-button13').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up13').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up13').bPopup();
		});


		$('.my-button14').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up14').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up14').bPopup();
		});


		$('.my-button15').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up15').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up15').bPopup();
		});


		$('.my-button16').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up16').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up16').bPopup();
		});


		$('.my-button17').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up17').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up17').bPopup();
		});


		$('.my-button18').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up18').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up18').bPopup();
		});


		$('.my-button19').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up19').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up19').bPopup();
		});


		$('.my-button20').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up20').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up20').bPopup();
		});


		$('.my-button21').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up21').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up21').bPopup();
		});


		$('.my-button22').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up22').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up22').bPopup();
		});


		$('.my-button23').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up23').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up23').bPopup();
		});


		$('.my-button24').bind('click', function(e) {
			var self = $(this) // button
			, content = $('.content');
			$('.element_to_pop_up24').bPopup({
				onOpen : function() {
					content.html(self.data('bpopup') || '');
				},
				onClose : function() {
					content.empty();
				}
			});
			// Prevents the default action to be triggered.
			e.preventDefault();
			// Triggering bPopup when click event is fired
			$('.element_to_pop_up24').bPopup();
		});



	});
})(jQuery);