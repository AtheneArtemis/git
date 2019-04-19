// pages/prize/prize.js
var app = getApp();
Page({
  data: {
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    app.page.isAccess(this, options);
    var that = this;
    app.util.request({
      url: 'eastshop/Personal/prize',
      success: function (res) {
        var data = res.data;
        if (data.code == 0) {
          that.setData({
            prize: data.prize,
            defaultAddress: data.defaultAddress,
          })
        }
      }
    })
  },
  redeem:function (res){
    var that = this;
    if (!that.data.defaultAddress || !that.data.defaultAddress.id){
      wx.showModal({
        title: '提示',
        content: '请先设置默认收货地址再领取实物奖励',
        showCancel:false,
        success:function(){
          wx.navigateTo({
            url: '/pages/address/address',
          })
        }
      })
      return;
    }
    var id = res.currentTarget.dataset.id;
    var address_id = that.data.defaultAddress.id;
    app.util.request({
      url:'eastshop/Personal/redeem',
      data:{
        id:id,
        address_id: address_id,
      },
      success:function(res){
        // console.log(res);
        if(res.data.code == 0){
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel:false,
            success:function(res){
              wx.redirectTo({
                url: '/pages/prize/prize',
              })
            }
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