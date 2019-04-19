// pages/withdraw/withdraw.js
var app = getApp();
Page({
  data: {
    showView:false,
    money:0,
    index:0,
    accountArr:{}
  },
  closetap:function(){
    this.setData({
      showView:!this.data.showView,
      accountArr: {}
    })
  },
  changeAccountTap:function(res){
    this.setData({
      showView: !this.data.showView,
      accountArr: this.data.withdraw_account[this.data.index],
    })
  },
  bindPickerChange(e) {
    this.setData({
      index: e.detail.value
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (e) {
    app.page.isAccess(this, e);
    var that = this;
    if (e){
      if(e.type){
        that.setData({type:e.type})
      }
    }
    app.util.request({
      url:'eastshop/Personal/withdraw',
      data:{type:that.data.type},
      success:function(res){
        if (res.data.code == 0){
          that.setData({ 
            total_money: res.data.data.total_money,
            withdraw_account: res.data.data.withdraw_account,
            setting: res.data.data.setting,
            withdraw_account_show: res.data.data.withdraw_account_show,
          })
        }
      }
    })
  },
  setWithdrawMoney:function(e){
    var value = e.detail.value;
    var result_money = parseInt(value) > parseInt(this.data.setting.withdraw_max);
    if (result_money){
      wx.showModal({
        title: '提示',
        content: '每日提现上限为' + this.data.setting.withdraw_max + '元',
        showCancel:false,
      })
    }else{
      if (value > this.data.total_money){
        wx.showModal({
          title: '提示',
          content: '余额不足',
          showCancel: false,
        })
      }else{
        this.setData({ money: value })
      }
    }
  },
  withdrawAll:function(e){
    var that = this;
    if (that.data.total_money > that.data.setting.withdraw_max){
      wx.showModal({
        title: '提示',
        content: '每日提现上限为' + that.data.setting.withdraw_max + '元',
        showCancel: false,
        success: function(res) {
          that.setData({ money: that.data.setting.withdraw_max})
        },
      })
    }else{
      that.setData({ money: that.data.total_money })
    }
  },
  saveWithAccount:function(e){
    var that = this;
    var formData = e.detail.value;
    var verifyformData = this.verifyformData(formData);
    if (verifyformData){
      app.util.request({
        url: 'eastshop/Personal/saveWithAccount',
        data: {
          id: formData.id,
          name: formData.name,
          mobile: formData.mobile,
          wechat: formData.wechat,
          alipay: formData.alipay,
          bank_name: formData.bank_name,
          bank_account: formData.bank_account,
        },
        success: function (res) {
          // console.log(res);
          if (res.data.code == 0) {
            wx.showModal({
              title: '提示',
              content: res.data.msg,
              showCancel:false,
              success:function(res){
                wx.redirectTo({
                  url: '/pages/withdraw/withdraw?type='+that.data.type,
                })
              }
            })
          }else{
            wx.showModal({
              title: '提示',
              content: res.data.msg,
              showCancel: false,
            })
          }
        }
      })
    }
  },
  verifyformData: function (data) {
    var that = this;
    if (data.name == '') {
      wx.showModal({
        title: '提示',
        content: '请输入名字',
        showCancel: false,
      })
      return false;
    }
    if (data.mobile == '') {
      wx.showModal({
        title: '提示',
        content: '请输入联系电话',
        showCancel: false,
      })
      return false;
    }
    if (data.wechat == '' && data.alipay == '' && (data.bank_name == '' || data.bank_account == '') ) {
      wx.showModal({
        title: '提示',
        content: '请输入提现账号',
        showCancel: false,
      })
      return false;
    }
    return true;
  },
  nowWithdraw:function(res){
    var that = this;
    var money = that.data.money;
    if (!money || money < that.data.setting.withdraw_min){
      wx.showModal({
        title: '提示',
        content: '请输入提现金额,且最小提现金额为：' + that.data.setting.withdraw_min + '元',
        showCancel:false
      })
      return;
    }
    var withdraw_account_id = that.data.withdraw_account[that.data.index].id;
    if (!withdraw_account_id){
      wx.showModal({
        title: '提示',
        content: '请添加/选择提现账号',
        showCancel: false
      })
      return;
    }
    app.util.request({
      url:'eastshop/Personal/saveWithdraw',
      data:{
        money: money,
        withdraw_account_id: withdraw_account_id,
        type:that.data.type,
      },
      success:function(res){
        if (res.data.code == 0){
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel:false,
            success:function(){
              wx.redirectTo({
                url: '/pages/' + that.data.type + '/' + that.data.type,
              })
            }
          })
        }else{
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel:false
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