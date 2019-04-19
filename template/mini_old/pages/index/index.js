//index.js
var app = getApp();
Page({
  data: {
    indicatorDots: true,
    vertical: false,
    autoplay: true, 
    currentTime: 60,
    time: '获取验证码',
    captcha: '',
    phoneNo: '',
    interval: 2000,
    duration: 500,
    currentIndex: 0,
    showView: false,
    showAuthView: false,
    parent_id:0,
    cardimg: [{
      imgurl: '/pages/images/x-banner.jpg'
    }, {
      imgurl: '/pages/images/x-banner2.jpg'
    }, {
      imgurl: '/pages/images/x-banner3.jpg'
    }],
    newMemberOpen:1,
  },
  search:function(res){
    var keyword = this.data.searchInput;
    if (keyword == '' || keyword == undefined){
      wx.showModal({
        title: '提示',
        content: '请输入关键字',
        showCancel:false,
      })
    }else{
      wx.navigateTo({
        url: '/pages/list/list?name=' + keyword,
      })
    }
  },
  searchInput:function(res){
    this.setData({ searchInput:res.detail.value})
  },
  gotoRaffle: function (res) {
    wx.reLaunch({
      url: '/pages/raffle/raffle',
    })
  },
  gotoProductDetail:function(e){
    var that = this;
    var id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '/pages/detail/detail?id='+id,
    })
  },
  handleChange: function(e) {
    this.setData({
      currentIndex: e.detail.current
    })
  },
  closetap: function() {
    this.setData({
      showView: (!this.data.showView)
    })
  },
  buyNewProduct:function(res){
    var id = res.currentTarget.dataset.id;
    console.log(id);
    wx.navigateTo({
      url: '/pages/detail/detail?id='+id,
    })
  },
  buyMember:function(e){
    var cat_id = e.currentTarget.dataset.cat_id;
    wx.navigateTo({
      url: '/pages/member-upgrade-list/member-upgrade-list?cat_id='+cat_id,
    })
  },
  onLoad: function(t) {
    app.page.onLoad(this, t);
    this.setQrcodeParameter(t);
    var that = this;
    app.util.request({
      url: 'eastshop/Eastshop/index',
      data:{
        id:12138,
      },
      success: function (res) {
        // console.log(res);
        if (res.data.code == 0){
          that.setData({
            carousel: res.data.data.carousel,
            productCat: res.data.data.productCat,
            newMember: res.data.data.newMember,
            newProduct: res.data.data.newProduct,
            hotsell: res.data.data.hotsell,
            featured: res.data.data.featured,
            userinfo: res.data.data.userinfo,
            memberUpgrade: res.data.data.memberUpgrade,
            newMemberOpen: res.data.data.newMemberOpen
          })
          // if (res.data.data.userinfo){
          //   if (!res.data.data.userinfo.mobile || res.data.data.userinfo.mobile == 0){
          //     that.setData({ showView: (!this.data.showView)})
          //   }
          // }
        }
      }
    })
  },
  myLogin: function (e) {
    app.page.myLogin(this,e);
  },
  getProductByCat:function (e){
    // console.log(e);
    var cat_id = e.currentTarget.dataset.cat_id
    wx.navigateTo({
      url: '/pages/list/list?cat_id=' + cat_id,
    })
  },
  redirect:function(res){
    // console.log(this.data);
    wx.reLaunch({
      url: '/pages/index/index',
    })
    // this.onLoad();
    // this.setData({ showAuthView: false });
  },
  setuserinfo:function(e){
    var that = this;
    var formData = e.detail.value;
    var verifyformData = this.verifyformData(formData);
    if (verifyformData){
      app.util.request({
        url: 'eastshop/Eastshop/setuserinfo',
        data: {
          realname: formData.realname,
          phoneNo: formData.phoneNo,
          invitationCode: formData.invitationCode,
          parent_id:that.data.parent_id,
        },
        success: function (res) {
          console.log(res);
          if (res.data.code == 0){
            that.setData({ showView: false})
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
  verifyformData:function(data){
    var that = this;
    if (data.phoneNo == ''){
      wx.showModal({
        title: '提示',
        content: '请输入手机号码',
        showCancel:false,
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
  setQrcodeParameter:function(t){
    var that = this;
    if (t){
      if (t.scene) {
        const scene = decodeURIComponent(t.scene);
        var arr = scene.split('/');
        var parent_id = arr[1];
        that.setData({ parent_id: parent_id })
      }
    }
  }
})