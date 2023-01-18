<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-15 09:36:33
-->
<template >
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName"
                       :isNavbar="true" />

    <view class="body p-2 bannber"
          :style="{marginTop:marginTop+'px'}">

      <image :src="swiperList[0]?.remote_path"
             class="w-100 h-100 "
             mode="scaleToFill" />
    </view>

    <view class="body p-2"
          :style="{marginBottom:tabbarBottom+'px'}">
      <view class="repair-wrapper">
        <view class="repair-nav">
          <view class="repair-title d-flex ai-center pb-2">
            <view class="flex-grow-1 d-flex ai-center">
              <image src="../../assets/img/repairNav.png"
                     mode="aspectFill" />
              <text class="pl-2">我要报修</text>
            </view>
            <text class="flex-grow-0 fs-xs text-subtitle"></text>
          </view>
          <view class="repair-content">
            <nut-form :model-value="formData"
                      ref="ruleForm"
                      style="">
              <nut-form-item label="医院名称:"
                             prop="company_name"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.company_name">
                <input class="nut-input-text"
                       @blur="customBlurValidate('company_name')"
                       v-model="formData.company_name"
                       placeholder="请输入医院名称"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="科室:"
                             prop="department_name"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.department_name">
                <input class="nut-input-text"
                       @blur="customBlurValidate('department_name')"
                       v-model="formData.department_name"
                       placeholder="请输入科室"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="设备名称:"
                             prop="facility_name"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.facility_name">
                <input class="nut-input-text"
                       @blur="customBlurValidate('facility_name')"
                       v-model="formData.facility_name"
                       placeholder="请输入设备名称"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="系列号:"
                             prop="serial_number"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.serial_number">
                <input class="nut-input-text"
                       @blur="customBlurValidate('serial_number')"
                       v-model="formData.serial_number"
                       placeholder="请输入系列号"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="报修人:"
                             prop="creater"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.creater">
                <input class="nut-input-text"
                       @blur="customBlurValidate('creater')"
                       v-model="formData.creater"
                       placeholder="请输入报修人"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="手机号码:"
                             prop="creater_phone"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.creater_phone">
                <input class="nut-input-text"
                       @blur="customBlurValidate('creater_phone')"
                       v-model="formData.creater_phone"
                       placeholder="请输入手机号码"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="型号:"
                             prop="facility_model"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <input class="nut-input-text"
                       v-model="formData.facility_model"
                       placeholder="请输入型号"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="出厂编号:"
                             prop="factory_number"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <input class="nut-input-text"
                       v-model="formData.factory_number"
                       placeholder="请输入出厂编号"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="工作类别:"
                             prop="type_id"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.type_id">
                <picker mode="selector"
                        rangeKey="name"
                        :range="productType"
                        @change="typeChange">
                  <view class="picker text-subtitle">
                    {{formData.type_name?formData.type_name:"请选择工作类型"}}
                  </view>
                </picker>
              </nut-form-item>
              <nut-form-item label="上门时间:"
                             prop="expect_time"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <date-picker-component :start-time="startTime"
                                       :end-time="endTime"
                                       :default-time="defaultTime"
                                       @result="onResult">
                  <input class="nut-input-text"
                         v-model="formData.expect_time"
                         :disabled="true"
                         placeholder="请选择期望上门服务时间"
                         type="text" />
                </date-picker-component>
              </nut-form-item>
              <nut-form-item label="报修描述:"
                             prop="failure_describe"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <view class="d-flex flex-column">
                  <textarea :auto-focusd="true"
                            class="w-100 text-black"
                            style="height:80px;"
                            v-model="formData.failure_describe"
                            :disable-default-padding="true"
                            maxlength="140"
                            placeholder="请输入报修描述" />
                  <view class="nut-input-word-limit">{{formData.failure_describe?.length}}/140</view>
                </view>
              </nut-form-item>
              <nut-cell>
                <view class="d-flex jc-around w-100">
                  <nut-button type="default"
                              class="bg-theme text-white"
                              style="height: 100rpx;width: 40%;font-size: 32rpx;"
                              @click="submit">提交</nut-button>
                  <nut-button type="danger"
                              style="height: 100rpx;width: 40%;font-size: 32rpx;"
                              @click="reset">重置</nut-button>
                </view>
              </nut-cell>
            </nut-form>
          </view>
        </view>
      </view>
    </view>

    <tabbar-component />

  </view>
</template>

<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { reactive, toRefs } from 'vue';
import { useAuthStore, useTabbarStore } from '@/store';
import { oneKey, orderTypeArr, scanQrcodeRepair, slideList } from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import NavBarComponent from '@/components/NavBarComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';
import DatePickerComponent from '@/components/datePickerComponent.vue';

const authStore = useAuthStore();
const tabbar = useTabbarStore();

const currentInstance = Taro.getCurrentInstance();
const routerParams = currentInstance.router.params; //参数

const state = reactive({
  marginTop: 0,
  tabbarBottom: 0,
  NavBarName: '一键报修',
  swiperList: [],
  ruleForm: null,
  productType: [], // 产品类型
  startTime: null,
  endTime: null,
  defaultTime: null,
  userInfo: null
});

const {
  marginTop,
  tabbarBottom,
  NavBarName,
  swiperList,
  ruleForm,
  productType,
  startTime,
  endTime,
  defaultTime,
  userInfo
} = toRefs(state);

const formData = reactive({
  facility_id: '',
  facility_name: '',
  serial_number: '',
  creater: '',
  creater_phone: '',
  company_id: 0,
  company_name: '',
  department_id: 0,
  department_name: '',
  expect_time: '',
  facility_model: '',
  factory_number: '',
  type_id: '',
  type_name: '',
  failure_describe: ''
});

const formRules = reactive({
  facility_name: [{ required: true, message: '请输入设备名称' }],
  creater: [{ required: true, message: '请输入报修人' }],
  serial_number: [{ required: true, message: '请输入序列号' }],
  creater_phone: [
    { required: true, message: '请填写手机号码' },
    { regex: /^1[0-9]{10}$/, message: '手机号码格式不正确' }
  ],
  company_name: [{ required: true, message: '请输入医院' }],
  department_name: [{ required: true, message: '请输入科室' }],
  type_id: [{ required: true, message: '请输入工作类别' }]
});

/**清除通过扫码获取二次点击无法清除列表数据 */
Taro.useDidHide(() => {
  routerParams.id = '';
  ruleForm.value.reset();
  formData.facility_id = '';
  formData.facility_name = '';
  formData.serial_number = '';
  formData.creater = userInfo.value.nickname;
  formData.creater_phone = userInfo.value.phone;
  formData.company_id = userInfo.value.company_id;
  formData.company_name = userInfo.value.company_name;
  formData.department_id = 0;
  formData.department_name = userInfo.value.department_name;
  formData.expect_time = '';
  formData.facility_model = '';
  formData.factory_number = '';
  formData.type_id = '';
  formData.type_name = '';
  formData.failure_describe = '';
});

// 设置高度
Taro.useReady(() => {
  Taro.nextTick(() => {
    getViewStyle().then((res: Vo.IObject) => {
      marginTop.value = res.topHeight;
      tabbarBottom.value = res.bottonHeight;
    });
  });
});

const getTime = (key, number, date) => {
  const _date = date ? new Date(date) : new Date();

  if (key === 'min') _date.setMinutes(_date.getMinutes() + number);
  if (key === 'hour') _date.setHours(_date.getHours() + number);
  if (key === 'year') _date.setFullYear(_date.getFullYear() + number);
  return _date;
};

startTime.value = getTime('min', 1, null);
endTime.value = getTime('year', 2, null);
defaultTime.value = getTime('min', 0, null);

/**获取时间 */
const onResult = arr => {
  formData.expect_time = arr[0] + '-' + arr[1] + '-' + arr[2] + ' ' + arr[3] + ':' + arr[4];
};

/**工作类型 */
const typeChange = function (e) {
  formData.type_id = productType.value[e.detail.value].id;
  formData.type_name = productType.value[e.detail.value].name;
  ruleForm.value.reset();
};

/**提交事件 */
const submit = () => {
  ruleForm.value.validate().then(({ valid, errors }: any) => {
    if (valid) {
      Taro.showLoading({ title: '正在提交' });

      oneKey({ data: formData }).then(res => {
        tabbar.setActive(0);
        Taro.showToast({ title: res.msg, icon: 'success' });
        setTimeout(() => Taro.reLaunch({ url: '/pages/home/index' }), 2000);
      });
    }
  });
};

// 失去焦点校验
const customBlurValidate = (prop: string) => {
  ruleForm.value.validate(prop);
};

/**重置状态 */
const reset = () => {
  ruleForm.value.reset();
  formData.type_id = '';
  formData.type_name = '';
  formData.expect_time = '';
  formData.failure_describe = '';
};

/** 获取工作类型 */
Promise.all([orderTypeArr({}), slideList({})]).then(res => {
  const arr: object[] = [];

  for (var i in res[0].data) {
    if (res[0].data[i]) arr.push({ id: i, name: res[0].data[i] });
  }

  productType.value = arr;

  swiperList.value.push(...res[1].data);

  userInfo.value = authStore.userInfos.myInfo;
  formData.company_name = userInfo.value.company_name;
  formData.department_name = userInfo.value.department_name;
  formData.creater = userInfo.value.nickname;
  formData.creater_phone = userInfo.value.phone;
});

Taro.useDidShow(() => {
  /** 扫码 */
  if (routerParams.id) {
    Taro.showLoading({ title: '加载中' });

    tabbar.setActive(2);

    scanQrcodeRepair({ id: routerParams.id }).then(res => {
      formData.facility_id = res.data.facility_id || '';
      formData.facility_name = res.data.facility_name || '';
      formData.serial_number = res.data.serial_number || '';
      formData.creater = userInfo.value.nickname || '';
      formData.creater_phone = userInfo.value.phone || '';
      formData.company_id = res.data.company_id || 0;
      formData.company_name = res.data.company_name || '';
      formData.department_id = res.data.department_id || 0;
      formData.department_name = res.data.department_name || '';
      formData.expect_time = res.data.expect_time || '';
      formData.facility_model = res.data.facility_model || '';
      formData.factory_number = res.data.factory_number || '';
      formData.type_id = res.data.type_id || '';
      formData.failure_describe = res.data.failure_describe || '';
    });
  }
});
</script>

<style lang="scss">
.home {
  overflow: hidden;
  .body {
    &.bannber {
      height: 160px;
      box-sizing: border-box;
      image {
        border-radius: 20rpx;
      }
    }

    .navGrid {
      image {
        height: 40px;
        width: 40px;
      }
    }

    .repair-wrapper {
      .repair-title {
        border-bottom: 2px solid #f0f2f1;

        image {
          height: 14px;
          width: 14px;
        }
      }

      .repair-content {
        border: 4rpx solid #f0f2f1;
        margin: 28rpx 0;
        border-radius: 20rpx;
      }

      .repair-poster {
        image {
          height: 160px;
        }
      }
    }
  }
}
</style>
