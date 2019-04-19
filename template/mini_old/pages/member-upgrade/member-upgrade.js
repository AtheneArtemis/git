// pages/detail/detail.js
var app = getApp();
var WxParse = require('../../utils/js/wxParse/wxParse.js');
Page({
  data: {
    showAuthView: false,
    showView: false,
    currentTime: 60,
    time: '获取验证码',
    captcha: '',
    phoneNo: '',
    address_id:0
  },
  goToAddress: function () {
    wx.navigateTo({
      url: '/pages/address-picker/address-picker',
    })
  },
  onLoad: function (e) {
    app.page.onLoad(this, e);
    var that = this;
    if (e) {
      if (e.id) {
        that.setData({id:e.id})
      }
      if (e.parent_id) {
        that.setData({ parent_id: e.parent_id })
      }
    }
    app.util.request({
      url: 'eastshop/Personal/memberUpgrade',
      data: {
        id: that.data.id,
        // parent_id: that.data.parent_id,
      },
      success: function (res) {
        if (res.data.code == 0) {
          WxParse.wxParse("detail", "html", res.data.data.detail, that);
          that.setData({
            product: res.data.data,
            shareinfo: res.data.shareinfo,
            userinfo:res.data.userinfo,
          })
        }
      }
    })
  },
  pay: function (e) {
    var that = this;
    if (that.data.userinfo){
      if (!that.data.userinfo.mobile || that.data.userinfo.mobile == 0){
        that.setData({ showView: (!this.data.showView)})
      }else{
        app.util.request({
          url: 'eastshop/Personal/buyMemberUpgrade',
          data: {
            product_id: that.data.product.id,
            address_id: that.data.address_id,
          },
          success: function (res) {
            // console.log(res);
            that.payelment(res.data.data);
          }
        })
      }
    }else{
      wx.showModal({
        title: '提示',
        content: '用户信息不正确',
      })
    }
  },
  //发起支付请求
  payelment: function (data) {
    var that = this;
    if (!1) {
      that.payelmentaftersuccess(data);
    } else {
      wx.requestPayment({
        timeStamp: data.timeStamp,
        nonceStr: data.nonceStr,
        package: data.package,
        signType: data.signType,
        paySign: data.paySign,
        success(res) {
          that.payelmentaftersuccess(data);
        },
        fail(payres) {
          console.log(payres);
          wx.showModal({
            title: "提示",
            content: "支付失败",
            showCancel: false,
            confirmText: "确认",
            success: function (e) {
              wx.redirectTo({
                url: '/pages/member-upgrade/member-upgrade?id='+that.data.id,
              })
            }
          });
        }
      })
    }
  },
  //支付成功处理
  payelmentaftersuccess: function (data) {
    var that = this;
    wx.showLoading();
    app.util.request({
      url: 'eastshop/Personal/pay_member_result',
      data: {
        order_type: 'member',
        order_id: data.order_id,
        product_id: data.product_id,
        cat_id: data.cat_id,
      },
      success(res) {
        // console.log(res);
        if (res.data.code == 0) {
          wx.hideLoading();
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel: false,
            success: function (e) {
              wx.reLaunch({
                url: '/pages/my/my',
              })
            }
          })
        } else {
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel: false,
          })
        }
      },
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
    var picker_address = wx.getStorageSync("picker_address");
    // console.log(picker_address);
    this.setData({ picker_address: picker_address, address_id: picker_address.id })
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
  firstPage:function (e){
    // console.log(e);
    wx.reLaunch({
      url: '/pages/index/index',
    })
  },
  
  buyNow:function(e){
    
  },
  myLogin: function (e) {
    app.page.myLogin(this, e);
  },
  redirect: function (res) {
    // console.log(this.data);
    wx.redirectTo({
      url: '/pages/member-upgrade/member-upgrade?id='+this.data.id+'&parent_id='+this.data.parent_id,
    })
  },
  setuserinfo: function (e) {
    var that = this;
    var formData = e.detail.value;
    var verifyformData = this.verifyformData(formData);
    if (verifyformData) {
      app.util.request({
        url: 'eastshop/Eastshop/setuserinfo',
        data: {
          realname: formData.realname,
          phoneNo: formData.phoneNo,
          invitationCode: formData.invitationCode,
          parent_id: that.data.parent_id,
        },
        success: function (res) {
          console.log(res);
          if (res.data.code == 0) {
            that.setData({ showView: false })
          }
        }
      })
    }
  },
  getcaptcha: function () {
    var phone = this.data.phoneNo;
    var regBox = {
      regMobile: /1[3|4|5|7|8|9][0-9]/,
    }
    var mflag = regBox.regMobile.test(phone);
    if (!mflag) {
      wx.showModal({
        title: '提示',
        content: '请输入正确的手机号码',
        showCancel: false,
      })
    } else {
      var that = this;
      wx.showLoading({
        title: '正在发送验证码',
        mask: true,
      })
      app.util.request({
        url: 'eastshop/Eastshop/getcaptcha',
        data: {
          mobile: phone,
          actiontype: 'register'
        },
        success: function (res) {
          wx.hideLoading();
          var a = res.data;
          if (a.code == 0) {
            wx.showModal({
              title: '提示',
              content: a.msg,
              showCancel: false,
            })
            that.setData({
              captcha: a.data,
              disabled: true
            })
            that.getCode();
          } else {
            wx.showModal({
              title: '提示',
              content: a.msg,
            })
          }
        }
      })
    }
  },
  getCode: function (options) {
    var that = this;
    var currentTime = that.data.currentTime
    var interval = setInterval(function () {
      currentTime--;
      // console.log(currentTime);
      that.setData({
        time: currentTime + 's'
      })
      if (currentTime <= 0) {
        clearInterval(interval)
        // console.log(currentTime);
        that.setData({
          time: '重新发送',
          currentTime: 60,
          disabled: false
        })
      }
    }, 1000)
  },
  changeponeNo: function (e) {
    var phoneNo = e.detail.value;
    this.setData({
      phoneNo: phoneNo,
    })
  },
  verifyformData: function (data) {
    var that = this;
    if (data.phoneNo == '') {
      wx.showModal({
        title: '提示',
        content: '请输入手机号码',
        showCancel: false,
      })
      return false;
    }
    if (data.realname == '') {
      wx.showModal({
        title: '提示',
        content: '请输入姓名',
        showCancel: false,
      })
      return false;
    }
    if (data.captcha == '' || data.captcha != that.data.captcha) {
      wx.showModal({
        title: '提示',
        content: '验证码错误',
        showCancel: false,
      })
      return false;
    }
    return true;
  },
})