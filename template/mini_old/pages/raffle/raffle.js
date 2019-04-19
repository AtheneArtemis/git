// pages/raffle/raffle.js
var app = getApp();
Page({
  /**
   * 页面的初始数据
   */
  data: {
    animationData: {},
    showView: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    app.page.isAccess(this, options);
    var that = this;
    app.util.request({
      url:'eastshop/Eastshop/lottery',
      success:function(res){
        // console.log(res);
        var data = res.data.data;
        if (res.data.code == 0){
          that.setData({
            humanNum: data.humanNum,
            humanNum_percent: data.humanNum_percent,
            setting: data.setting,
            userinfo: data.userinfo,
            lottery_award: data.lottery_award,
          })
        }
        if (!data.setting.number || data.setting.number ==0){
          wx.showLoading({
            title: '抽奖暂未开启',
          })
        }
      }
    })
  },
  signtap: function () {
    var that = this;
    if (that.data.userinfo.userlevel_id <= 0){
      this.setData({
        showView: (!this.data.showView)
      })
    }else{
      app.util.request({
        url:'eastshop/Eastshop/signIn',
        // url: 'eastshop/Eastshop/pay_result',
        data:{
          // order_id:37
        },
        success:function(res){
          // console.log(res);
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel:false,
          })
        }
      })
    }
  },
  memberUpgrade:function(){
    wx.navigateTo({
      url: '/pages/member-upgrade-list/member-upgrade-list?cat_id=1',
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    var animation = wx.createAnimation({
      duration: 1000,
      /*    timingFunction: 'ease', */
    })

    this.animation = animation

    // animation.scale(2, 2).rotate(45).step()

    this.setData({
      animationData: animation.export()
    })
    var n = 0;
    setInterval(function () {
      // animation.translateY(-60).step()
      n = n + 1;
      this.animation.rotate(5 * (n)).step()
      this.setData({
        animationData: this.animation.export()
      })
    }.bind(this), 1000)
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