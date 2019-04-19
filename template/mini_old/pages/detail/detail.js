// pages/detail/detail.js
var app = getApp();
var WxParse = require('../../utils/js/wxParse/wxParse.js');
Page({
  /**
   * 页面的初始数据
   */
  data: {
    showView:false,
    number:1,
    enshrine:0,
    showAuthView: false,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  guigetap:function(){
    this.setData({
      showView: (!this.data.showView)
    })
  },
  onLoad: function(e) {
    var that = this;
    app.page.onLoad(this, e);
    that.setQrcodeParameter(e);
    if (e) {
      if (e.id) {
        app.util.request({
          url: 'eastshop/Eastshop/getProductListByCat',
          data: {
            id: e.id,
            parent_id: that.data.parent_id,
            isOnlyThumbpicture:2,
            sales:2,
          },
          success: function (res) {
            if (res.data.code == 0) {
              WxParse.wxParse("detail", "html", res.data.data.detail, that);
              that.setData({
                product: res.data.data, 
                enshrine: res.data.data.ifEnshrine,
                shareinfo: res.data.shareinfo,
              })
            }
          }
        })
      }
    }
  },
  subBtn:function(e){
    var that = this;
    if (that.data.number <= 1){
      wx.showModal({
        title: '提示',
        content: '数量不能低于1',
        showCancel: false,
      })
    }else{
      var newNumber = parseInt(that.data.number) - parseInt(1);
      that.setData({ number: newNumber })
    }
  },
  addBtn:function (e){
    var that = this;
    if (that.data.number >= that.data.product.stock){
      wx.showModal({
        title: '提示',
        content: '库存不足',
        showCancel:false,
      })
    }else{
      var newNumber = parseInt(that.data.number) + parseInt(1);
      that.setData({number: newNumber})
    }
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function(e) {
    if (e.from === 'button') {
      // 来自页面内转发按钮
    }
    var shareinfo = this.data.shareinfo;
    return {
      title: shareinfo.title,
      path: shareinfo.path,
      imageUrl: shareinfo.imageUrl,
    }
  },
  goHome:function (){
    wx.reLaunch({
      url: '/pages/index/index',
    })
  },
  enshrine:function (e){
    var that = this;
    var id = e.currentTarget.dataset.id;
    app.util.request({
      url: 'eastshop/Eastshop/enshrine',
      data: {
        product_id: id,
      },
      success: function (res) {
        if (res.data.code == 0){
          that.setData({ enshrine: res.data.data})
        }
      }
    })
  },
  addToCart:function (){
    var that = this;
    if (!that.data.showView) {
      that.setData({ showView: true })
    } else {
      if (that.data.number > that.data.product.stock) {
        wx.showModal({
          title: '提示',
          content: '库存不足',
          showCancel: false
        })
      } else {
        app.util.request({
          url: 'eastshop/Eastshop/addToCart',
          data: {
            product_id: that.data.product.id,
            number: that.data.number,
          },
          success: function (res) {
            if (res.data.code == 0){
              wx.showModal({
                title: '提示',
                content: '添加成功',
                showCancel:false,
              })
              that.setData({ showView: false })
            }
          }
        })
      }
    }
  },
  buyNow:function(e){
    var that = this;
    var product = that.data.product.id;
    var number = that.data.number;
    if (!that.data.showView){
      that.setData({ showView:true})
    }else{
      if (that.data.number > that.data.product.stock){
        wx.showModal({
          title: '提示',
          content: '库存不足',
          showCancel:false
        })
      }else{
        wx.navigateTo({
          url: '/pages/new-order-submit/new-order-submit?product_id=' + product + '&number=' + number,
        })
      }
    }
  }, 
  setQrcodeParameter: function (t) {
    var that = this;
    if (t) {
      if (t.scene) {
        const scene = decodeURIComponent(t.scene);
        var arr = scene.split('/');
        var parent_id = arr[1];
        that.setData({ parent_id: parent_id })
      }
      if (t.id) {
        that.setData({ id: t.id })
      }
      if (t.parent_id) {
        that.setData({ parent_id: t.parent_id })
      }
    }
  },
  myLogin: function (e) {
    app.page.myLogin(this, e);
  },
  redirect: function (res) {
    var that = this;
    wx.redirectTo({
      url: '/pages/detail/detail?id=' + that.data.id + '&parent_id=' + that.data.parent_id +'&isOnlyThumbpicture=2&sales=2',
    })
  },
})