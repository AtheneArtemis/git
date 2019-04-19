// ljkj_compass/pages/package/package.js
var app = getApp();
Page({
  /**
   * 页面的初始数据
   */
  data: {
    /*goods_list: [{
      src: '/pages/images/spt6.png',
      name: '男士手提包横款商务皮包单',
      money: '599'
    }, {
        src: '/pages/images/spt6.png',
        name: '男士手提包横款商务皮包单',
      money: '599'
    }, {
        src: '/pages/images/spt6.png',
        name: '男士手提包横款商务皮包单',
      money: '599'
    }]*/
  },
  detailstap: function(res) {
    var id = res.currentTarget.dataset.id;
    // console.log(res);return;
    wx.navigateTo({
      url: '/pages/detail/detail?id=' + id,
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    app.page.isAccess(this, options);
    var that = this;
    app.util.request({
      url:'eastshop/Personal/enshrine',
      success:function(res){
        var data = res.data;
        if (data.code == 0){
          that.setData({
            enshrine_list: data.enshrine_list,
          })
        }
      }
    })
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
  onShareAppMessage: function() {

  }
})