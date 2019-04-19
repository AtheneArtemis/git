var app = getApp();
Page({
    data: {
      total_price: 0,
    },
    onLoad: function(t) {
      app.page.isAccess(this, t);
      var that = this;
      app.util.request({
        url:'eastshop/Eastshop/shopcartList',
        success:function(res){
          // console.log(res);
          if (res.data.code == 0){
            that.setData({
              shopcartlist: res.data.data.shopcartlist
            })
          }
        }
      })
    },
  //单商品选择
  cartCheck:function(res){
    // console.log(res);
    var that = this;
    var index = res.currentTarget.dataset.index;
    var product = that.data.shopcartlist[index];
    that.calculateTotalPrice(product,index);
  },
  //计算总价
  calculateTotalPrice: function (product, index){
    var that = this;
    var product_total_price = parseFloat(product.product.price) * parseFloat(product.number);
    var total_price = that.data.total_price;
    var shopcartlist = that.data.shopcartlist;
    const _k2 = `shopcartlist[${index}].checked`;
    const _ids = `shopcartids[${index}]`;
    if (shopcartlist[index].checked){
      var new_total_price = parseFloat(total_price) - parseFloat(product_total_price);
      var shopcartlist = that.data.shopcartlist;
      that.setData({
        total_price: new_total_price,
        [_k2]: 0,
        [_ids]: 0,
      })
    }else{
      var new_total_price = parseFloat(product_total_price) + parseFloat(total_price);
      var shopcartlist = that.data.shopcartlist;
      that.setData({
        total_price: new_total_price,
        [_k2]: 1,
        [_ids]: product.id,
      })
    }
  },
  //商品增加数量
  addNumber:function(res){
    var that = this;
    var index = res.currentTarget.dataset.index;
    var product = that.data.shopcartlist[index];
    var old_number = product.number;
    var new_number = parseInt(old_number) + 1;
    if (new_number > product.product.stock){
      wx.showModal({
        title: '提示',
        content: '库存不足',
        showCancel:false,
      })
      return;
    }
    var total_price = that.data.total_price;
    var new_total_price = parseFloat(product.product.price) + parseFloat(total_price);
    const number = `shopcartlist[${index}].number`;
    that.setData({
      [number]: new_number
    })
    if (product.checked){
      that.setData({
        total_price: new_total_price
      })
    }
  },
  //商品减少数量
  subNumber: function (res) {
    var that = this;
    var index = res.currentTarget.dataset.index;
    var product = that.data.shopcartlist[index];
    var old_number = product.number;
    var new_number = parseInt(old_number) - 1;
    if (new_number <= 0) {
      wx.showModal({
        title: '提示',
        content: '数量不能低于1',
        showCancel: false,
      })
      return;
    }
    var total_price = that.data.total_price;
    var new_total_price = parseFloat(total_price) - parseFloat(product.product.price);
    const number = `shopcartlist[${index}].number`;
    that.setData({
      [number]: new_number
    })
    if (product.checked) {
      that.setData({
        total_price: new_total_price
      })
    }
  },
  cartSubmit:function (e){
    var that = this;
    var isHaveProduct = 0;
    var total_price = that.data.total_price;
    var shopcartlist = that.data.shopcartlist;
    var shopcartids = that.data.shopcartids;
    if (shopcartids){
      for (var i = 0; i < shopcartids.length; i++) {
        if (shopcartids[i] != 0 && shopcartids[i] != undefined) {
          isHaveProduct = 1; break;
        }
      }
    }else{ isHaveProduct = 0; }
    if (isHaveProduct){
      var productlist = [];
      if (shopcartlist.length) {
        for (var i = 0; i < shopcartlist.length; i++) {
          if (shopcartlist[i].checked != 0 && shopcartlist[i].checked != undefined) {
            productlist.push(shopcartlist[i]);
          }
        }
      }
      app.util.request({
        url:'eastshop/Eastshop/entrySettlement',
        data:{
          productlist: productlist
        },
        success:function(res){
          // console.log(res.data);
          if (res.data.code == 0){
            wx.navigateTo({
              url: '/pages/new-order-submit/new-order-submit',
            })
          }else{
            wx.showModal({
              title: '提示',
              content: '系统繁忙',
              showCancel: false,
            })
          }
        }
      })
    }else{
      wx.showModal({
        title: '提示',
        content: '请选择需要结算的商品',
        showCancel:false,
      })
    }
  },
    onReady: function() {},
    onShow: function() {
      var that = this;
      app.util.request({
        url: 'eastshop/Eastshop/shopcartList',
        success: function (res) {
          // console.log(res);
          if (res.data.code == 0) {
            that.setData({
              shopcartlist: res.data.data.shopcartlist
            })
          }
        }
      })
    },
    onHide: function() {
        // this.saveCart();
    },
    onUnload: function() {
        // this.saveCart();
    },
  cartEdit:function(){
    this.setData({ show_cart_edit:1})
  },
  cartDone:function(){
    this.setData({ show_cart_edit:0})
  },
  cartDelete:function(){
    var that = this;
    wx.showModal({
      title: '提示',
      content: '确定删除选中项吗？',
      success:function(res){
        app.util.request({
          url:'eastshop/Eastshop/shopcartDel',
          data:{
            shopcartids: that.data.shopcartids
          },
          success:function(r){
            if (res.data.code == 0){
              wx.showModal({
                title: '提示',
                content: '操作成功',
                showCancel:false,
                success:function(e){
                  wx.redirectTo({
                    url: '/pages/cart/cart',
                  })
                }
              })
            }
          }
        })
      }
    })
  }
});