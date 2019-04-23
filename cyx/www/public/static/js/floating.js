;(function($){
	$.onlineService = {
        version: '2.0.0'
    };
	$.fn.onlineService = function(options){
		var $target = $(this),initval = $.extend($target.data("os-initval") || {}, {account: '0',alias: '0'});
		$target.removeData("os-initval");options = $.extend({
			color: initval.color,// 颜色
			style: initval.style,// 风格
			floating: initval.floating,// （相对浏览器的）浮动位置
			position: {x: initval.x,y: initval.y},// （相对浏览器的）绝对位置
        	showAccount: initval.account,// 显示账号
			showAlias: initval.alias// 显示账号名称
		}, options);
		
		$.onlineService.optionFilter = function(){
			// Function
			var isString = function(obj){return $.type(obj) === "string"},trim = $.trim;
			// Variable
			var color = options.color,floating = options.floating,position = options.position,
			showAccount = options.showAccount,showAlias = options.showAlias,style = options.style;
			// Filter
			if (!isString(color) || (trim(color).length == 0)) options.color = initval.color;
			if (!isString(style) || (trim(style).length == 0)) options.style = initval.style;
			if (!isString(floating) || (trim(floating).length == 0)) options.floating = initval.floating;
			if (!isString(showAlias) || (trim(showAlias).length == 0)) options.showAlias = initval.alias;
			if (!isString(showAccount) || (trim(showAccount).length == 0)) options.showAccount = initval.account;
			if (!$.isPlainObject(position) || $.isEmptyObject(position)) options.position = {x: initval.x,y: initval.y};
			// Unset
			isString = trim = null;
			color = floating = position = showAccount = showAlias = style = null;
		};
		
		$.onlineService.preLoadImage = function($wrapper, callback){
			var $imgs = $wrapper.find('img'),sum = $imgs.length,cnt = 0;
			$imgs.each(function(i, img){
				var imgsrc = $(img).attr("src");
				if ($.trim(imgsrc).length == 0) return;
				var image = new Image();
				image.onload = function(){
					image.onload = null;cnt++;
					if (cnt == sum) callback();
				};
				image.onerror = function(){
					mage.onerror = null;cnt++;
					if (cnt == sum) callback();
				};
				image.src = imgsrc;
			});
		};
		
		$.onlineService.initialize = function(){
			// Filter user input
			$.onlineService.optionFilter();
			// Get online-service source
			var params = {'color': options.color,'float': options.floating,'style': options.style,
			'account': options.showAccount,'alias': options.showAlias,'layerid': options.layerId};
			$.post(parseToURL('customerservices', 'float_style'), params, function(source){
				if ($.trim(source).length == 0) source = '<div style="color:#FF0000;width:150px;">"Online Service" does not exist.Add it by "Edit content" button.</div>';
				// Position
				var position = options.position,postr = 'top:'+position.y+'px;';
				if (options.floating == 'right') {
					var scrlw = $('#scroll_container').width() - $('#scroll_container_bg').width();
					postr += 'right:'+(Math.max(0, scrlw) + intval(position.x))+'px;';scrlw = null;
				} else postr += 'left:'+position.x+'px;';
				// Assign
				postr += 'position:absolute;-moz-user-select:none;-webkit-user-select:none;user-select:none;z-index:10000;';
				if ($('#onlineservice-floatings').length) return;//$('#onlineservice-floating').remove();
				var $floating = $('<div id="onlineservice-floatings" style="'+postr+'">'+source+'</div>').appendTo('body');
				// Style
				if ($floating.length > 0) {
					var ie7 = $.browser.msie && ($.browser.version < 8) && $floating.find('.wp-online-service-one').length;
					if (ie7) $floating.find('span.wp-online-service-close').css("float", 'left');
					// Open/Close Event
					var winh = window.innerHeight||self.innerHeight||document.documentElement.clientHeight||document.body.clientHeight;
					$floating.triggerHandler("expandorcollapse", [winh]);
					$.onlineService.preLoadImage($floating, function(){
						var tmpHeight = $floating.outerHeight();
						$floating.css("top", Math.min(position.y, winh - tmpHeight));
						if (ie7) {
							var $title = $floating.find('.wp-online-service-title'),
							dialogwidth = $floating.outerWidth(true);
							$title.width(dialogwidth);
							$title.find('span.wp-online-service-close').css("margin-left", function(){
								var $icon = $(this).prev('span.wp-online-service-icon'),
								margin = dialogwidth - $icon.outerWidth(true) - $(this).outerWidth(true) + 5;
								$(this).data('customerie7hack', margin);return margin+'px';
							});
						}
						position = tmpHeight = null;
					});
				}
			}).error(function(xhr, status, error){
//				alert('Get "Online Service" information failed('+xhr.readyState+','+xhr.status+' - '+(error||status)+')');
				return false;
			});
		};
		
		// Start
		$.onlineService.initialize();
		
		return $target;
	};
	function intval(str){
		var i = parseInt(str);
		return isNaN(i) ? 0 : i;
	}
})(jQuery);