// pages/team/team.js
var app = getApp();
Page({
  data: {
    /*team_list: [{ imgurl: '/pages/images/tx.jpg', name: '惠芳', time: '2018-5-26 14：56' }, { imgurl: '/pages/images/tx.jpg', name: '惠芳', time: '2018-5-26 14：56' }, { imgurl: '/pages/images/tx.jpg', name: '惠芳', time: '2018-5-26 14：56' }]*/
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    app.page.isAccess(this, options);
    var that = this;
    app.util.request({
      url:'eastshop/Personal/myTeam',
      success:function(res){
        var data = res.data;
        if (data.code == 0){
          that.setData({
            subUserinfo: data.subUserinfo
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