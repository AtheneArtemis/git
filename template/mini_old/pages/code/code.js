// pages/code/code.js
var app = getApp();
Page({
  data: {

  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (t) {
    app.page.isAccess(this, t);
    var that = this;
    app.util.request({
      url:'eastshop/Personal/promoteQrcode',
      data:{},
      success:function (res){
        // console.log(res);
        if (res.data.code == 0){
          that.setData({
            userinfo:res.data.data,
            'poster[0]': res.data.data.poster
          })
        }
      }
    })
  },
  previewImage: function (e) {
    wx.previewImage({
      current: this.data.userinfo.poster, // 当前显示图片的http链接   
      urls: this.data.poster, // 需要预览的图片http链接列表   
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