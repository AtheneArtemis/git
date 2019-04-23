/*
www.keleyi.com/
*/
; (function ($) {
     $.fn.extend({
        Tabs: function (options) {  
            // 处理参数
            options = $.extend({
                event: 'mouseover',
                timeout: 0,
                auto: 0,
                callback: null
            }, options);

            var self = $(this),
tabBox = self.children('div.tab_box').children('div'),
menu = self.children('ul.tab_menu'),
items = menu.find('li'),
timer;

            var Waterfallshow = function(index){
 
                var thisdom = tabBox.siblings('div').end().eq(index);
                var Waterbool = thisdom.attr("data") || 0;
             
               Waterbool = parseInt(Waterbool);
               if(Waterbool==1){
                     var tab_menu = menu;
                       var tab_box = self.children('div.tab_box');
                       var tops = parseInt(tab_menu.outerHeight(true)) + parseInt(tab_box.css('padding-top'));
                       var lefts =  parseInt(tab_box.css('padding-left'));


                    var parDom = thisdom.find("ul");
                    var chdDom = thisdom.find("li");
                     var options={'top':0,'left':0},endCallback;
                    var befCallback = function(){
                       chdDom.css("position",'absolute')
                       chdDom.find(".wp-new-tabs-style-c").removeAttr("style");
                    }
                     options.top = tops;
                    options.left = lefts;
                    endCallback = function(height){
                        var pdom = chdDom.closest('.wp-tabs_content');
                        chdDom.closest('.artprotext').height(height);
                    }
                    WaterfallsFlow(parDom,chdDom,options,befCallback,endCallback)
               }
 
            }
			
            var tabHandle = function (elem) {
                elem.siblings('li')
.removeClass('current')
.end()
.addClass('current');

                tabBox.siblings('div')
.addClass('hide')
.end()
.eq(elem.index())
.removeClass('hide');
  
   Waterfallshow(elem.index());    
                
            },

delay = function (elem, time) {
    time ? setTimeout(function () { tabHandle(elem); }, time) : tabHandle(elem);
},

start = function () {
    if (!options.auto) return;
    timer = setInterval(autoRun, options.auto);
},

autoRun = function () {
    var current = menu.find('li.current'),
firstItem = items.eq(0),
len = items.length,
index = current.index() + 1,
item = index === len ? firstItem : current.next('li'),
i = index === len ? 0 : index;

    current.removeClass('current');
    item.addClass('current');

    tabBox.siblings('div')
.addClass('hide')
.end()
.eq(i)
.removeClass('hide');
 
  Waterfallshow(i);

};

            items.bind(options.event, function () {
                delay($(this), options.timeout);
                if (options.callback) {
                    options.callback(self);
                }
            });

            if (options.auto) {
                start();
                self.hover(function () {
                    clearInterval(timer);
                    timer = undefined;
                }, function () {
                    start();
                });
            }
          
            return this;
        }
    });
})(jQuery);