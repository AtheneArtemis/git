module.exports = {
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
    getApp().util.request({
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
            showCancel: false,
            success: function (e) {
              wx.redirectTo({
                url: '/pages/order/order?status=2',
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
  
};