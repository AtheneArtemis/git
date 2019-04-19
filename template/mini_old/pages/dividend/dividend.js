// pages/dividend/dividend.js
var app = getApp();
Page({
  data: {
  },
  onLoad: function (options) {
    app.page.isAccess(this, options);
    var that = this;
    app.util.request({
      url:'eastshop/Personal/dividend',
      success: function (res) {
        if (res.data.code == 0) {
          that.setData({
            userinfo: res.data.userinfo,
            dividend_record: res.data.dividend_record,
          })
        }
      }
    })
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

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})