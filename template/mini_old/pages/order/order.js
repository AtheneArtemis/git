// order.js
var app = getApp();
Page({
  data: {
    status: 1,
    show_no_data_tip: false,
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(e) {
    app.page.isAccess(this, e);
    var that = this;
    if (e){
      if (e.status) { that.setData({ status: e.status})}
    }
    app.util.request({
      url:'eastshop/Eastshop/orderlist',
      data:{
        status:that.data.status
      },
      success:function(res){
        // console.log(res);
        if (res.data.code == 0){
          that.setData({order_list:res.data.data})
        }
      }
    })
  },
  gohome:function (e){
    wx.reLaunch({
      url: '/pages/index/index',
    })
  },
  orderPay: function (e) {
    var that = this;
    var order_id = e.currentTarget.dataset.id;
    app.util.request({
      url: 'eastshop/Eastshop/payAgain',
      data: {
        order_id: order_id
      },
      success: function (res) {
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
    app.util.request({
      url: 'eastshop/Eastshop/pay_result',
      data: {
        order_type: 'order',
        order_id: data.order_id,
      },
      success(res) {
        // console.log(res);
        if (res.data.code == 0) {
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
  orderCancel: function(e) {
    var that = this;
    var order_id = e.currentTarget.dataset.id;
    wx.showModal({
      title: "提示",
      content: "是否取消该订单？",
      cancelText: "否",
      confirmText: "是",
      success: function(res) {
        if (res.cancel)
          return true;
        if (res.confirm) {
          wx.showLoading({
            title: "操作中",
          });
          app.util.request({
            url:'eastshop/Eastshop/orderCancel',
            data:{
              order_id:order_id,
            },
            success:function(o){
              // console.log(o);
              if(o.data.code == 0){
                wx.showModal({
                  title: '提示',
                  content: o.data.msg,
                  showCancel:false,
                  success:function(res){
                    wx.redirectTo({
                      url: '/pages/order/order?status='+that.data.status,
                    })
                  }
                })
              }
            }
          })
        }
      }
    });
  },
  orderConfirm: function(e) {
    var that = this;
    var order_id = e.currentTarget.dataset.id;
    wx.showModal({
      title: "提示",
      content: "是否确认已收到货？",
      cancelText: "否",
      confirmText: "是",
      success: function(res) {
        if (res.cancel)
          return true;
        if (res.confirm) {
          wx.showLoading({
            title: "操作中",
          });
          app.util.request({
            url: 'eastshop/Eastshop/orderConfirm',
            data: {
              order_id: order_id,
            },
            success: function (o) {
              // console.log(o);
              if (o.data.code == 0) {
                wx.showModal({
                  title: '提示',
                  content: o.data.msg,
                  showCancel: false,
                  success: function (res) {
                    wx.redirectTo({
                      url: '/pages/order/order?status=' + that.data.status,
                    })
                  }
                })
              }
            }
          })
        }
      }
    });
  },
  hide: function(e) {
    this.setData({
      hide: 1
    });
  }

});