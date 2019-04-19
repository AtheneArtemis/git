// pages/list/list.js
var app = getApp();
Page({
  data: {
    cat_id:0,
    attr_id:0,
    page:1,
    index: 0,
    array: ['生活超市', '潮流大牌', '海外精选', '热门推荐'],
  },
  bindPickerChange(e) {
    this.setData({
      index: e.detail.value
    })
  },
  searchInput: function (res) {
    this.setData({ searchInput: res.detail.value })
  },
  search:function(res){
    var that = this;
    app.util.request({
      url: 'eastshop/Eastshop/getProductListByCat',
      data: {
        name: that.data.searchInput,
        attr_id:that.data.attr_id,
        cat_id: that.data.cat_id,
      },
      success: function (res) {
        if (res.data.code == 0) {
          that.setData({ product: res.data.data })
        }
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    app.page.isAccess(this, options);
    var that = this;
    that.setDefaultParameter(options);
    app.util.request({
      url:'eastshop/Eastshop/getProductListByCat',
      data:{
        cat_id: that.data.cat_id,
        attr_id:that.data.attr_id,
        name:that.data.name
      },
      success:function (res){
        if (res.data.code == 0){
          that.setData({product:res.data.data})
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
  onPullDownRefresh: function(res) {
    
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {
    var that = this;
    console.log(that.data.page);
    var new_page = that.data.page + 1;
    app.util.request({
      url: 'eastshop/Eastshop/getProductListByCat',
      data: {
        cat_id: that.data.cat_id,
        attr_id: that.data.attr_id,
        name: that.data.name,
        page: new_page
      },
      success: function (res) {
        if (res.data.code == 0) {
          var product = that.data.product;
          var new_product = product.concat(res.data.data);
          that.setData({
            product: new_product,
            page: new_page
          })
        }
      }
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  },
  setDefaultParameter:function (e){
    var that = this;
    if (e){
      if (e.cat_id){
        that.setData({ cat_id: e.cat_id})
      }
      if (e.attr_id) {
        that.setData({ attr_id: e.attr_id })
      }
      if (e.name){
        that.setData({ name: e.name})
      }
    }
  }
})