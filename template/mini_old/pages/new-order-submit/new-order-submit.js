// pages/order-submint/order-submint.js
var app = getApp();
Page({
  data: {
    array: ['线上支付'],//, '货到付款', '余额支付'
    index: 0,
    product_list:[],
    total_price:0,
    new_total_price: 0,
    order_id:0,
    number:0,
    commission:'',
    commission_used:0,
    dividend:'',
    dividend_used:0,
    manual_integral_used:0,
    note:'',
    product_id:0,
    showView: false,
    currentTime: 60,
    time: '获取验证码',
    captcha: '',
    phoneNo: '',
    textareaDisplay:'block',
  },
  bindPickerChange: function (e) {
    this.setData({
      index: e.detail.value
    })
  },
  setNote:function (e){
    var input = e.detail.value;
    this.setData({note:input})
  },
  goToAddress:function(){
    wx.navigateTo({
      url: '/pages/address-picker/address-picker',
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (e) {
    app.page.isAccess(this, e);
    var that = this;
    if (e){
      if (e.product_id){
        that.setData({ product_id: e.product_id})
      }
      if(e.number){
        that.setData({ number: e.number })
      }
    }
    app.util.request({
      url: 'eastshop/Eastshop/settlement',
      data: { id: that.data.product_id, number: that.data.number },
      success: function (res) {
        if (res.data.code == 0) {
          that.setData({
            product_list: res.data.data,
            freight: res.data.freight,
            total_price: res.data.total_price,
            new_total_price: res.data.total_price,
            number: e.number,
            userinfo: res.data.userinfo,
            product_price: res.data.product_price,
            picker_address: res.data.picker_address, 
            address_id: res.data.picker_address.id
          })
        }
        if (res.data.userinfo) {
          if (!res.data.userinfo.mobile || res.data.userinfo.mobile == 0) {
            that.setData({ showView: (!this.data.showView), textareaDisplay:'none'})
          }
        }
      }
    })
  },
  pay: function(e){
    var that = this;
    var address_id = that.data.address_id;
    if (address_id == '' || address_id == undefined){
      wx.showModal({
        title: '提示',
        content: '请选择收货地址',
        showCancel:false,
      })
      return;
    }
    app.util.request({
      url:'eastshop/Eastshop/payNow',
      data:{
        product_list: that.data.product_list,
        total_price: that.data.total_price,
        userinfo:that.data.userinfo,
        address_id: address_id,
        freight: that.data.freight,
        commission_used: that.data.commission_used,
        dividend_used: that.data.dividend_used,
        manual_integral_used: that.data.userinfo.manual_integral_used,
        product_price: that.data.product_price,
        note:that.data.note
      },
      success:function(res){
        // console.log(res);
        that.payelment(res.data.data);
      }
    })
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
                url: '/pages/order/order?status=1',
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
      url: 'eastshop/Eastshop/pay_result',
      data: {
        order_type: 'order',
        order_id: data.order_id,
      },
      success(res) {
        // console.log(res);
        if (res.data.code == 0) {
          wx.hideLoading();
          wx.showModal({
            title: '提示',
            content: res.data.msg,
            showCancel:false,
            success:function(e){
              wx.redirectTo({
                url: '/pages/order/order?status=2',
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
      },
    })
  },
  checkCommission:function(e){
    var that = this;
    if (that.data.commission == ''){
      //计算总价
      var commission = e.detail.value[0];//可用佣金
      var commission_used;//本次佣金
      var total_price = that.data.total_price;
      var new_total_price;
      if (commission > total_price){
        new_total_price = 0;
        commission_used = total_price;
      }else{
        new_total_price = total_price - commission;
        commission_used = commission;
      }
      that.setData({
        commission: 'checked',
        total_price: new_total_price,
        commission_used: commission_used
      })
    }else{
      var commission = e.detail.value[0];//可用佣金
      var commission_used = 0;//本次佣金
      var total_price = that.data.total_price;
      if (commission > total_price) {
        total_price = that.data.commission_used
      } else {
        total_price = parseFloat(total_price) + parseFloat(that.data.commission_used);
      }
      that.setData({
        commission: '',
        total_price: total_price,
        commission_used: commission_used
      })
    }
  },
  checkDividend: function (e) {
    var that = this;
    if (that.data.dividend == '') {
      //计算总价
      var dividend = e.detail.value[0];//可用积分
      var dividend_used;//本次积分
      var total_price = that.data.total_price;
      var new_total_price;
      if (dividend > total_price) {
        new_total_price = 0;
        dividend_used = total_price;
      } else {
        new_total_price = total_price - dividend;
        dividend_used = dividend;
      }
      that.setData({
        dividend: 'checked',
        total_price: new_total_price,
        dividend_used: dividend_used
      })
    } else {
      var dividend = e.detail.value[0];//可用积分
      var dividend_used = 0;//本次积分
      var total_price = that.data.total_price;
      if (dividend > total_price) {
        total_price = that.data.dividend_used
      } else {
        total_price = parseFloat(total_price) + parseFloat(that.data.dividend_used);
      }
      that.setData({
        dividend: '',
        total_price: total_price,
        dividend_used: dividend_used
      })
    }
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
    var picker_address = wx.getStorageSync("picker_address");
    // console.log(picker_address);
    this.setData({ picker_address: picker_address, address_id: picker_address.id})
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
          // console.log(res);
          if (res.data.code == 0) {
            that.setData({ showView: false, textareaDisplay:'block'})
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