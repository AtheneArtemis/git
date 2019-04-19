/* var api = require('../../api.js'); */
var app = getApp();
Page({

    data: {
        address_list: null,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
      app.page.isAccess(this, options);
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {
      var page = this;
      app.util.request({
        url: 'eastshop/Personal/getAddress',
        success: function (res) {
          if (res.data.code == 0) {
            page.setData({ address_list: res.data.data })
          }
        }
      })
    },

    pickAddress: function (e) {
      var page = this;
      var index = e.currentTarget.dataset.index;
      var address = page.data.address_list[index];
      wx.setStorageSync("picker_address", address);
      wx.navigateBack();
    },

});