// pages/address/address.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // address_list: [{ name: '王哈哈', mobile: '12463283789', address: '重庆市重庆市九龙坡区杨家坪步行街', is_default:'1'}],
    address_list:{},
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    app.page.isAccess(this, options);
    var page = this;
    app.util.request({
      url:'eastshop/Personal/getAddress',
      success:function(res){
        if(res.data.code == 0){
          page.setData({ address_list:res.data.data})
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
    var page = this;
  },

  setDefaultAddress: function (e) {
    var page = this;
    var address_id = e.currentTarget.dataset.id;
    app.util.request({
      url: 'eastshop/Personal/setDefaultAddress',
      data:{
        address_id: address_id
      },
      success: function (res) {
        // console.log(res);
        if (res.data.code == 0) {
          wx.redirectTo({ url: '/pages/address/address', })
        }
      }
    })
  },

  deleteAddress: function (e) {
    var page = this;
    
  },

});