function layer_media_ready_func(layerid){
    var userAgent = navigator.userAgent.toLowerCase();
	if (!/iphone/i.test(userAgent)){
		var imgover=$('#wp-media-image_'+layerid).closest('.img_over');
		imgover.children('.imgloading').width(imgover.width()).height(imgover.height());
	}
	$('#'+layerid).layer_ready(function(){
		if(typeof(layer_img_lzld)=="function"){
		layer_img_lzld(layerid);
		}
	});
}

function layer_media_lazyload_func(layerid, iswx){
    var imgwidth = $('#'+layerid+' .wp-media_content').width();
    var imgheight = $('#'+layerid+' .wp-media_content').height();	
    var imgtop = ($('#wp-media-image_'+layerid));
    if(parseInt(imgtop.css('top'))<-600&&imgtop.attr('src').indexOf('blank.gif')>0){imgtop.attr('src',imgtop.attr('data-original'));}
    if(iswx){
 	if(imgtop.offset().top<window.screen.availHeight&&imgtop.attr('src').indexOf('blank.gif')>0){
 		imgtop.attr('src',imgtop.attr('data-original'));
 	}
 	setTimeout(function(){
		 var imgdisplay = imgtop.css('display');
		 if(imgdisplay&&imgdisplay=='inline') imgtop.css('display','inline-block');
		 },1200);
    }
	// bug#4119 - 模块自适应高度导致的留白
	$('#'+layerid).bind("wrapmodheightadapt", function(){
		$('.img_over, img.paragraph_image', this).height($(this).height());
	});
};
function layer_navbar_ready_func(params, callback){
    var layerid = params.layerid;
    $('#'+layerid).layer_ready(function(){
	var $curlayer = $('#'+layerid);
      if ($.isFunction(callback)) callback();
      if (params.isedit) $curlayer.data("menudata", params.menudata);
	// 修复样式未渲染完成之前的显示问题
	var shwtimer = setTimeout(function(){
		$curlayer.children('.wp-navbar_content').css("visibility", 'visible');
		clearTimeout(shwtimer);
             if(params.skin_style == 'horizontal_h01'){
                var fontSize=parseInt($('#'+layerid+' nav.mtree li a').css('font-size'))||0; 
                var actualFont=params.fontsize;
               if(actualFont>10 &&fontSize-actualFont>0.5){
                   var w=$('#'+layerid+' nav.mtree li a').width();
                   $('#'+layerid+' nav.mtree li a').css('max-width',(w*actualFont/fontSize-2)+'px');
               }else{
                   var w=$('#'+layerid+' nav.mtree li a').width();
                   if(actualFont>10&&actualFont-fontSize>0.5) $('#'+layerid+' nav.mtree li a').css('max-width',(w*actualFont/fontSize-2)+'px');
               }
            }
	}, 50);
	// 编辑模式
	if(params.isedit){
		// 局部刷新时调整模块尺寸
		if (params.isrefresh == 'true') {
			var $content = $curlayer.children('.wp-navbar_content'),modsize = $.padborder_logic($content),
			bwidth = $._parseFloat($curlayer.css("borderLeftWidth")) + $._parseFloat($curlayer.css("borderRightWidth")),
			bheight = $._parseFloat($curlayer.css("borderTopWidth")) + $._parseFloat($curlayer.css("borderBottomWidth")),
			modleft = $._parseFloat($curlayer.css("left")),canvaswidth = canv.width(),modwidth = modheight = 0;
			modwidth = window.modmaxwidth - bwidth;modheight = window.modmaxheight - bheight;
			if (canvaswidth < modleft + modwidth) modwidth -= modleft;
			$content.width(modwidth).height(modheight);$curlayer.width(modwidth + modsize.width).height(modheight + modsize.height);
			var tmptimer = setTimeout(function(){
				var conheight = $content.children('.menubtn,nav.mtree').outerHeight(true);
				conheight = Math.max(conheight, $content.height());
				$content.height(conheight);$curlayer.height(conheight + modsize.height);
				window.modmaxwidth = window.modmaxheight = $content = modsize = null;clearTimeout(tmptimer);
			}, 100);
			bwidth = modleft = canvaswidth = modwidth = modheight = null;
		}
	 
		// 保存配置项
		$curlayer.mod_property(params.options);
		// 禁用<a>标签
		$curlayer.find('li>a.mtitle').attr("href", 'javascript:;');
	}
    });
};
function layer_mslider_preload_func(layerid){
    window['preload_'+layerid] = function(url, callback){
        var img = new Image();
        img.onload = function(){
        	callback(img.width, img.height);
        	img.onload = null;
        };
        img.src = url;
    };
}

function layer_mslider_ready_func(params){
    var $mscontent = $('#'+params.layerid+' > .wp-mslider_content'),
    $mswrap = $mscontent.children('ul.mslider_wrapper'),maxln = $._parseFloat(params.framecnt);
    // Images adaptive
    var width = $mscontent.width()||300,maxwidth = (maxln + 2) * width;
    var ua = navigator.userAgent.toLowerCase() || '';
    if(ua.match(/\sucbrowser\/.+\s+mobile/g)){
    	$mswrap.children('li:last').css({position: 'relative'});
    } else{
    	$mswrap.children('li:last').css({left: (0 - maxwidth)+'px',position: 'relative'});
    }
    $mswrap.css('visibility','visible');
    $mswrap.width(maxwidth).find('img').each(function(i, node){
    	var $img = $(this),imgsrc = $img.attr("data-src")||'';
    	if ($.trim(imgsrc).length == 0) return;
             window['preload_'+params.layerid](imgsrc, function(imgwidth, imgheight){
    		var tmpw = 0,tmph = 0,height = $mscontent.height();
    		$img.attr('src',imgsrc);
    		if ((imgwidth >= width) || (imgheight >= height)) {
    			var direct = (imgwidth >= width) ? (imgwidth >= imgheight) : (imgheight < imgwidth);
    			if (direct) { // Horizontal
    				$img.width(width).height("auto");tmph = $img.height();
    				$img.css("margin", ((height - tmph) / 2)+'px 0');
    			} else { // Vertical
    				$img.height(height).width("auto");tmpw = $img.width();
    				$img.css("margin", '0 '+((width - tmpw) / 2)+'px');
    			}
    		} else $img.css("margin", ((height - imgheight) / 2)+'px '+((width - imgwidth) / 2)+'px');
    		$img.css("visibility", 'visible')
    		.closest('li').css({background: 'none',width: width+'px',height: height+'px'});
    	});
    });
    // Images switch
    var duration = $._parseFloat(params.interval) * 1000;
      window['autoplay_'+params.layerid] = function(status){
    	if (params.autoplay != '1') {
    		if ($mswrap.is(':animated')) $mswrap.stop(true, false);
    		var interid = window['interid_'+params.layerid];
    		if (interid != undefined) clearInterval(interid);
    		return;
    	}
    	var $msbar = $mscontent.find('> .mslider_bar'),curindex = $msbar.children('a.local').index();
    	if (status == undefined) curindex = Math.min(curindex + 1, maxln);
    	if(window['interid_'+params.layerid]) clearInterval(window['interid_'+params.layerid]);
    	window['interid_'+params.layerid] = setInterval(function(){
    		if (curindex > maxln - 1) {
    			$mswrap.animate({left: (0 - curindex*width)+'px'}, function(){
    				$(this).css("left", '0px');
    				$msbar.children('a:eq(0)').addClass("local")
    				.siblings().removeClass("local");
                    $msbar.children('a:eq(0)').find("span").addClass("local");
                    $msbar.children('a:eq(0)').siblings().find("span").removeClass("local");
    			});
    			curindex = 0;
    		} else {
    			$mscontent.find('> .mslider_bar > a:eq('+curindex+')').triggerHandler(mclick,[curindex]);
    		}
    		curindex++;
    	}, duration);
    }
    if (window.ontouchstart !== undefined) {
    	(function(){
    		var target = $mswrap[0];var pagex = 0; var pagey = 0; var curleft = 0;
            var need_stopPropagation=false;
            if(!window['is_touch_bind_'+params.layerid]){
    		target.addEventListener("touchstart", function(e){
    			var $target = $(this);
    			pagex = e.touches[0].pageX;
    			pagey = e.touches[0].pageY;
    			curleft = $._parseFloat($target.css("left"));
                   need_stopPropagation=false;
    		}, false);
    		target.addEventListener("touchmove", function(e){
    			if ($mswrap.is(':animated')) $mswrap.stop(true, false);
    			// init
    			var movex = e.touches[0].pageX - pagex,
    			movey = e.touches[0].pageY - pagey,newleft = curleft + movex;
                   if(need_stopPropagation){
                        e.stopPropagation();
                        e.preventDefault();
                    }
    			// fixed touchmove
    			if (Math.abs(movey) < 10 && Math.abs(movex) > 5) {
    				e.preventDefault();
    				e.stopPropagation();
    				need_stopPropagation=true;
    				// animated
    				$mswrap.css("left", newleft+'px')
    				.find('li>a').bind('click',function(e){e.preventDefault()});/*Disabled <a>*/
    			}
    		}, false);
    		target.addEventListener("touchend", function(e){
    			var interid = window['interid_'+params.layerid];
    			need_stopPropagation=false;
    			if (interid != undefined) clearInterval(interid);
    			var newleft = index = 0,movex = e.changedTouches[0].pageX - pagex,moveln = 30/*moved length*/,
    			curindex = $mscontent.find('> .mslider_bar > a.local').index(),moved = false;
    			if (Math.abs(movex) >= moveln) {
    				moved = true;
    				index = (movex < 0)?(curindex + 1):(curindex - 1);
    				if (index < 0) {
    					newleft = width;
    					index = maxln - 1;
    				} else {
    					newleft = 0 - index * width;
    					if((movex < 0)&&(curindex == maxln - 1)) index = 0;
    				}
    			} else {
    				index = curindex;
    				newleft = 0 - curindex * width;
    			}
    			$mswrap.animate({left: newleft+'px'}, function(){
    				$('li>a', this).unbind('click')/*Enabled <a>*/
    				$mscontent.find('> .mslider_bar > a:eq('+index+')').addClass("local")
    				.siblings().removeClass("local");
                    $mscontent.find('> .mslider_bar > a:eq('+index+')').find("span").addClass("local");
                    $mscontent.find('> .mslider_bar > a:eq('+index+')').siblings().find("span").removeClass("local");
    				if (moved == false) return;
    				if (index == 0) $(this).css("left", '0px');
    				if (index == maxln - 1) $(this).css("left", (0 - index*width)+'px');
                                window['autoplay_'+params.layerid]();
    			});
    		}, false);
            window['is_touch_bind_'+params.layerid]=true;
            }
    	})();
    } else {
    	$mswrap.bind('mousedown.mslider', function(e){
    		e.preventDefault();
    		var $target = $(this),pagex = e.pageX,curleft = $._parseFloat($target.css("left"));
    		if ($target.is(':animated')) $target.stop(true, false);
    		var interid = window['interid_'+params.layerid];
    		if (interid != undefined) clearInterval(interid);
    		$(document).bind('mousemove.mslider', function(e){
    			e.preventDefault();
    			$target.css("left", (curleft + e.pageX - pagex)+'px')
    			.find('li>a').bind('click',function(e){e.preventDefault()});/*Disabled <a>*/
    		}).bind('mouseup.mslider', function(e){
    			e.preventDefault();
    			$(document).unbind('.mslider');
    			var newleft = index = 0,movex = e.pageX - pagex,moveln = 30/*moved length*/,
    			curindex = $mscontent.find('> .mslider_bar > a.local').index(),moved = false;
    			if (Math.abs(movex) >= moveln) {
    				moved = true;
    				index = (movex < 0)?(curindex + 1):(curindex - 1);
    				if (index < 0) {
    					newleft = width;
    					index = maxln - 1;
    				} else {
    					newleft = 0 - index * width;
    					if((movex < 0)&&(curindex == maxln - 1)) index = 0;
    				}
    			} else {
    				index = curindex;
    				newleft = 0 - curindex * width;
    			}
    			$target.animate({left: newleft+'px'}, function(){
    				$('li>a', this).unbind('click')/*Enabled <a>*/
    				$mscontent.find('> .mslider_bar > a:eq('+index+')').addClass("local")
    				.siblings().removeClass("local");
                    $mscontent.find('> .mslider_bar > a:eq('+index+')').find("span").addClass("local");
                    $mscontent.find('> .mslider_bar > a:eq('+index+')').siblings().find("span").removeClass("local");
    				if (moved == false) return;
    				if (index == 0) $(this).css("left", '0px');
    				if (index == maxln - 1) $(this).css("left", (0 - index*width)+'px');
    				window['autoplay_'+params.layerid]();
    			});
    		});
    	});
    }
    // Pager
    $mscontent.find('> .mslider_bar > a').bind(mclick, function(e, n){
    	var $target = $(this),index = n||$target.index();
    	if ($mswrap.is(':animated')) $mswrap.stop(true, false);
    	var interid = window['interid_'+params.layerid];
    	if ((n == undefined) && (interid != undefined)) clearInterval(interid);
    	$target.addClass("local").siblings().removeClass("local");
        $target.find("span").addClass("local");
        $target.siblings().find("span").removeClass("local");
    	$mswrap.animate({left: (0 - index * width)+'px'}, function(){
    		(n == undefined) && window['autoplay_'+params.layerid]();
    	});
    });
    // Autoplay
    if (params.isrefresh) {
        var interid = window['interid_'+params.layerid];
        if (interid != undefined) clearInterval(interid);
        window['autoplay_'+params.layerid]();return;
    }
    window['autoplay_'+params.layerid]('init');
};
function layer_article_list_ready_func(params){
    var layerid = params.layerid, articleStyle = params.theme;
    window['set_thumb_'+layerid] = function(obj){
        $("#"+layerid).find('.imgloading').remove();
        if (articleStyle === "two_column") return false;
        // 修复“手机站编辑模式下 文章列表 插件图文样式无法显示图片（bug#4743）”问题
        $(obj).fadeIn('slow');/* 为了兼容bug#4637 */
        //BUG #1400 文章列表图片不显示
        var imgtimer=$("#"+layerid).data('listimgtimer');
        if(imgtimer) clearTimeout(imgtimer);
        imgtimer= setTimeout(function(){
           $(window).triggerHandler('scroll');
        },200);
        $("#"+layerid).data('listimgtimer',imgtimer); 
    };
    
    $(function(){
        if (articleStyle === "two_column") {
            var $p = $('li p', "#"+layerid);
            var maxW = Math.max.apply(Math, $p.map(function(){
            	return $(this).width();
            }).toArray());
            $p.width(maxW);
        } else if (articleStyle === "skin3") {
            var maxliheight = 0,tmplayerid = "#"+layerid;
		if (tmplayerid.length == 1) return;var $tmpnode = $(tmplayerid+' li > .wp-new-article-style-c');
		maxliheight = Math.max.apply(null,$tmpnode.map(function(){return $(this).outerHeight();}).toArray());
		if (maxliheight) $tmpnode.height(maxliheight);
		//右间距
		$(tmplayerid).bind("fixedmarginright", function(e, margin){
			var $target = $(this),$li = $target.find('li');
			if(margin != undefined) $li.css("margin-right", margin+'px');
			var $first = $li.filter(':first'),liwidth = $first.width(),
			mgnright = $._parseFloat($first.css("marginRight")),
			maxwidth = $target.children('.wp-article_list_content').width(),
			maxcols = Math.floor(maxwidth / (liwidth + mgnright));
			if(maxwidth >= maxcols * (liwidth + mgnright) + liwidth) maxcols += 1;
			for(var i = 1,licnt = $li.length; i <= licnt; i++){
				if (i % maxcols != 0) continue;
				if ((maxcols == 1) && (2*liwidth <= maxwidth)) continue;
				$li.filter(':eq('+(i - 1)+')').css("margin-right", '0');
			}
			$curlayer = $li = null;
		});
		var tmptimer = setTimeout(function(){
			$(tmplayerid).triggerHandler("fixedmarginright");
			wp_heightAdapt($('#'+layerid));
			if($('#'+layerid).find(".wp-pager_link").length){
				$('#'+layerid).find(".wp-pager_link").css({'position':'relative','bottom':'auto','width':'100%'});	
				var cheight = $('#'+layerid).find(".wp-article_content").height();
				var oulheight = $('#'+layerid).find(".article_list-"+layerid).height();
				var olkheight = $('#'+layerid).find(".wp-pager_link").outerHeight();
				if(cheight>oulheight+olkheight){
					$('#'+layerid).find(".wp-pager_link").css({'position':'absolute','bottom':'0px','width':'100%'})
				} 
			}
			clearTimeout(tmptimer);tmplayerid = null;
		}, 100);
		$tmpnode = null;
        }
		
		if (articleStyle === "ylist2") {
			$(function(){
					var LID = layerid;
					$('#'+LID).bind("fixedliwidth", function(e, margin){

							$('#'+LID).find('li').each(function(){
									//set 01-right width
									var $PL = $('.article_list-'+LID),MAXW = $PL.outerWidth(),
									LW = $PL.find('li:first > .wp-new-article-style-01-left').outerWidth(true);
									$PL.find('li > .wp-new-article-style-01-right').css({"width": (MAXW - LW)+'px',"overflow": 'hidden',"word-wrap": 'break-word'});
									
									//set li width
									var self=$(this);var leftwidth=self.find('.wp-new-article-style-01-left').outerWidth();
									var rightwidth=self.find('.wp-new-article-style-01-right').outerWidth();
									if(articleStyle == "ylist2") $PL.find('li > .time').css({"width": (MAXW - LW)+'px'});
									$PL = null;
									if(articleStyle != "ylist2") self.css('width',(leftwidth+rightwidth+350)+'px');

							})

					}).triggerHandler("fixedliwidth");
			});
		}
		
		
    });
    
    if (params.pagehome) $('#'+layerid).data('not_need_heightadapt',true);
}

function layer_article_list_init_func(layerid, options){
    var $curlayer = $('#'+layerid);
    $curlayer.mod_property(options);
    $curlayer.find('.mask').css({'width':$curlayer.width(),height:$curlayer.height()});
}

function layer_article_list_lazyload_func(placeholder){
    $('img.img_lazy_load').lazyload({
	 threshold  : 200,
	 failure_limit : $('img.img_lazy_load').length,	
	  placeholder: placeholder,
	  load:function(){
		 var self=$(this);
		 var id=self.closest('.cstlayer').prop('id');
		if(window['set_thumb_'+id]) window['set_thumb_'+id](this);
	 }
    });	
}

function layer_article_list_pager_func(options){
    var layerid = options.layerid,$cstlayer = $('#'+layerid),
	$pglnker = $cstlayer.find('.wp-article_list_content .wp-pager_link');
	var pageskips = options.pageskip;
	$pglnker.find('a').click(function(e,page){
		var urlhrf = $(this).attr("href");
		if(urlhrf.indexOf("##")>-1){
		var pageid = page||$(this).attr("href").replace("###",'');
		if(options.isedit == "1") $.method.article_list.refreshArticleList({"page":pageid,"layerid":layerid});	
		else {
			var dom = $cstlayer.find('.article_list_save_itemList'),
			params = {
			};
			var param=options;
			$.ajax({
					type: "GET",
					url: parseToURL("article_list","get_page"),
					data: {article_category:param.article_category_param,layer_id: layerid,page: pageid},
					success: function(data){
						var $layer = $("#"+layerid);
						var oldHeight = $layer.find('.article_list-'+layerid).height();
						$layer.children('.wp-article_list_content').before(data).remove();
						setTimeout(
							function(){

							var this_dom = $('#'+layerid);
							this_dom.find(".wp-pager_link").css({'position':'relative','bottom':'auto','width':'100%'});	
							wp_heightAdapt($layer);
							var cheight = this_dom.find(".wp-article_content").height();
							var oulheight = this_dom.find(".article_list-"+layerid).height();
							var olkheight = this_dom.find(".wp-pager_link").outerHeight();
							if(cheight>oulheight+olkheight){
								this_dom.find(".wp-pager_link").css({'position':'absolute','bottom':'0px','width':'100%'})
							} 
								
								if(pageskips == 1){
									$('#scroll_container').scrollTop(0);
									scroll(0,0);
								} else if(pageskips == 2){
									var product_listtop = $cstlayer.css('top').replace('px','');
									var father = $cstlayer.attr('fatherid')||'';
									if(father){
										var father_top = $('#'+father).css('top').replace('px','');
										product_listtop = parseInt(product_listtop)+parseInt(father_top);
									}
									if(product_listtop){
										$('#scroll_container').scrollTop(product_listtop);
										scroll(0,product_listtop);
									}
								}
						},500);
					}
				});
			//返回浏览器顶部
			//scroll(0,0);
		}
		return false;
		}
	});
	
	$pglnker.find('.pageseldomli').change(function(e,page){
		var urlhrf = $(this).val();
		if(urlhrf.indexOf("#")==0){
		var pageid = page||$(this).val().replace("###",'');
		if(options.isedit == "1") $.method.article_list.refreshArticleList({"page":pageid,"layerid":layerid});	
		else {
			var dom = $cstlayer.find('.article_list_save_itemList'),
			params = {
			};
			var param=options;
			$.ajax({
					type: "GET",
					url: parseToURL("article_list","get_page"),
					data: {article_category:param.article_category_param,layer_id: layerid,page: pageid},
					success: function(data){
						var $layer = $("#"+layerid);
						var oldHeight = $layer.find('.article_list-'+layerid).height();
						$layer.children('.wp-article_list_content').before(data).remove();
						setTimeout(
							function(){

							var this_dom = $('#'+layerid);
							this_dom.find(".wp-pager_link").css({'position':'relative','bottom':'auto','width':'100%'});	
							wp_heightAdapt($layer);
							var cheight = this_dom.find(".wp-article_content").height();
							var oulheight = this_dom.find(".article_list-"+layerid).height();
							var olkheight = this_dom.find(".wp-pager_link").outerHeight();
							if(cheight>oulheight+olkheight){
								this_dom.find(".wp-pager_link").css({'position':'absolute','bottom':'0px','width':'100%'})
							} 
								
								if(pageskips == 1){
									$('#scroll_container').scrollTop(0);
									scroll(0,0);
								} else if(pageskips == 2){
									var product_listtop = $cstlayer.css('top').replace('px','');
									var father = $cstlayer.attr('fatherid')||'';
									if(father){
										var father_top = $('#'+father).css('top').replace('px','');
										product_listtop = parseInt(product_listtop)+parseInt(father_top);
									}
									if(product_listtop){
										$('#scroll_container').scrollTop(product_listtop);
										scroll(0,product_listtop);
									}
								}
						},500);
					}
				});
			//返回浏览器顶部
			//scroll(0,0);
		}
		return false;
		}else{
		window.location.href= urlhrf;	 
		}
	});
	// About input
	$pglnker.find(':input').each(function(i,dom){
		var $input = $(this),ent = pgid = '',fnc;
		switch($input.attr("type")) {
			case "text":
				ent = 'keyup';
				fnc = function(){
					pgid = this.value = this.value.replace(/(?:\b0|[^\d+])/i,'');
					return false;
				};
				break;
			case "button":
				ent = 'click';
				fnc = function(){
					if (pgid.length && /^[1-9]{1}\d*$/.test(pgid)) {
						var maxpg = _int($pglnker.find('span.total').html());
						if(!maxpg) maxpg = 1;
						$pglnker.find('a').triggerHandler('click',[Math.min(pgid,maxpg)]);
					}
					function _int(numString){
						var number = parseInt(numString);
						if(isNaN(number)) return 0;
						return number;
					}
					return false;
				};
				break;
		}
		if(fnc && $.isFunction(fnc)) $input[ent](fnc);
	});
}

function layer_article_list_defaultstyle_func(layerid, isedit){
    var func = function(){
        var LID = layerid,$PL = $('.article_list-'+LID, '#'+LID),MAXW = $PL.outerWidth(),
        LW = $PL.find('li:first > .wp-new-article-style-01-left').outerWidth(true);
        $PL.find('li > .wp-new-article-style-01-right').css({"width": (MAXW - LW)+'px',"overflow": 'hidden',"word-wrap": 'break-word'});
        $PL = MAXW = LW = null;
    };
    func();
    
    if (isedit) $('#'+layerid).bind('article_content_resize',func);
}