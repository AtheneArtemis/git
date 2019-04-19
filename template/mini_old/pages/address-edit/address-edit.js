// pages/address-edit/address-edit.js
var t = require("./../../components/area-picker/area-picker.js");
var app = getApp();
Page({
  data: {
    address_id:0,
    address:[],
    area_picker_show:!1,
    is_default:0,
  },
  onLoad: function (options) {
    app.page.isAccess(this, options);
    var page = this;
    if (options){
      if (options.id) { 
        app.util.request({
          url: 'eastshop/Personal/getAddress',
          data:{
            address_id: options.id
          },
          success: function (res) {
            if (res.data.code == 0) {
              page.setData({ 
                address: res.data.data,
                is_default: res.data.data.is_default,
                edit_district: res.data.edit_district
              })
            }
          }
        })
      }
    }
    page.getDistrictData(function (e) {
      t.init({
        page: page,
        data: e
      });
    });
  },
  getDistrictData: function (t) {
    var that = this;
    var e = wx.getStorageSync('DISTRICT');
    if (!e){
      app.util.request({
        url:'eastshop/Eastshop/getdistrict',
        success:function(res){
          e = res.data;
          wx.setStorage({key: 'DISTRICT',data: res.data,})
          t(e);
        }
      })
    }else{ t(e); }
  },
  onAreaPickerConfirm: function (t) {
    var that = this;
    this.setData({
      edit_district: {
        province: {
          id: t[0].id,
          name: t[0].name
        },
        city: {
          id: t[1].id,
          name: t[1].name
        },
        district: {
          id: t[2].id,
          name: t[2].name
        }
      },
    });
  },
  radioChange:function (e){
    this.setData({is_default:e.detail.value})
  },
  checkFromData:function (e){
    var page = this;
    var myreg = /^([0-9]{6,12})$/;
    var myreg2 = /^(\d{3,4}-\d{6,9})$/;
    if (!myreg.test(e.mobile) && !myreg2.test(e.mobile)) {
      wx.showToast({
        title: "联系电话格式不正确",
        image: "/pages/images/icon-warning.png",
      });
      return false;
    }
    if (e.username == ''){
      wx.showModal({
        title: '提示',
        content: '请输入收货人姓名',
        showCancel:false,
      })
      return false;
    }
    if(e.mobile == ''){
      wx.showModal({
        title: '提示',
        content: '请输入联系电话',
        showCancel: false,
      })
      return false;
    }
    if (e.address == '') {
      wx.showModal({
        title: '提示',
        content: '请输入详细地址',
        showCancel: false,
      })
      return false;
    }
    if (e.province_id == '') {
      wx.showModal({
        title: '提示',
        content: '请选择地区',
        showCancel: false,
      })
      return false;
    }
    return true;
  },
  saveAddress: function (e) {
    // console.log(e);
    var page = this;
    var fromData = e.detail.value;
    var checkFromData = page.checkFromData(fromData);
    // var checkFromData = true;
    if (checkFromData){
      wx.showLoading({
        title: "正在保存",
        mask: true,
      });
      app.util.request({
        url:'eastshop/Personal/saveAddress',
        data:{
          address_id: fromData.address_id || "",
          username: fromData.username,
          mobile: fromData.mobile,
          province_id: fromData.province_id,
          city_id: fromData.city_id,
          district_id: fromData.district_id,
          address: fromData.address,
          is_default: page.data.is_default,
        },
        success:function (res){
          if (res.data.code == 0){
            wx.redirectTo({ url: '/pages/address/address', })
            // wx.navigateBack();
          }
        }
      })
    }
  },

    inputBlur: function (e) {
        //console.log(JSON.stringify(e));
        var name = e.currentTarget.dataset.name;
        var value = e.detail.value;
        //var data = '{"form":{"' + name + '":"' + value + '"}}';
        var data = '{"' + name + '":"' + value + '"}';
        this.setData(JSON.parse(data));
    },

    getWechatAddress: function (e) {
        var page = this;
        wx.chooseAddress({
            success: function (e) {
                if (e.errMsg != 'chooseAddress:ok')
                    return;
                wx.showLoading();
                app.request({
                    url: api.user.wechat_district,
                    data: {
                        national_code: e.nationalCode,
                        province_name: e.provinceName,
                        city_name: e.cityName,
                        county_name: e.countyName,
                    },
                    success: function (res) {
                        if (res.code == 1) {
                            wx.showModal({
                                title: '提示',
                                content: res.msg,
                                showCancel: false,
                            });
                        }
                        page.setData({
                            name: e.userName || "",
                            mobile: e.telNumber || "",
                            detail: e.detailInfo || "",
                            district: res.data.district,
                        });
                    },
                    complete: function () {
                        wx.hideLoading();
                    }
                });
            }
        });
    },

    onReady: function () {

    },
    onShow: function () {

    },
});