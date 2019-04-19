// pages/order-detail/order-detail.js*/
var app = getApp();
Page({
  data: {
    pay:'线上支付',
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(e) {
    app.page.isAccess(this, e);
    var that = this;
    if (e) {
      if (e.order_id) { that.setData({ order_id: e.order_id }) }
    }
    app.util.request({
      url: 'eastshop/Eastshop/getOrderdetail',
      data: {
        order_id: that.data.order_id
      },
      success: function (res) {
        // console.log(res);
        if (res.data.code == 0) {
          that.setData({ order: res.data.data })
        }
      }
    })
  },
  copyText: function(e) {
    var page = this;
    var text = e.currentTarget.dataset.text;
    wx.setClipboardData({
      data: text,
      success: function() {
        wx.showToast({
          title: "已复制"
        });
      }
    });
  },
  location: function() {
    var page = this;
    var shop = page.data.order.shop;
    wx.openLocation({
      latitude: parseFloat(shop.latitude),
      longitude: parseFloat(shop.longitude),
      address: shop.address,
      name: shop.name
    })
  }

});