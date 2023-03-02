<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 17:58:56
-->
<template >
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName"
                       :isNavbar="true" />

    <view class="body p-2 bannber"
          :style="{marginTop:marginTop+'px'}">

      <image :src="BASE_URL+swiperList[0]?.filePath"
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
                             prop="companyName"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.companyName">
                <picker mode="selector"
                        rangeKey="deptName"
                        :range="companyType"
                        @change="e=>typeChange('company',e)">
                  <view class="picker text-subtitle">
                    {{formData.companyName?formData.companyName:"请选择医院名称"}}
                  </view>
                </picker>
              </nut-form-item>

              <nut-form-item label="科室:"
                             prop="deptName"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.deptName">
                <picker mode="selector"
                        rangeKey="deptName"
                        :range="deptType"
                        @change="e=>typeChange('dept',e)">
                  <view class="picker text-subtitle">
                    {{formData.deptName?formData.deptName:"请选择科室"}}
                  </view>
                </picker>
              </nut-form-item>

              <nut-form-item label="设备名称:"
                             prop="equipmentName"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.equipmentName">
                <picker mode="selector"
                        rangeKey="equipmentName"
                        :range="equipmentType"
                        @change="e=>typeChange('equipment',e)">
                  <view class="picker text-subtitle">
                    {{formData.equipmentName?formData.equipmentName:"请选择设备名称"}}
                  </view>
                </picker>
              </nut-form-item>

              <nut-form-item label="系列号:"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <input class="nut-input-text"
                       disabled="true"
                       v-model="formData.serialNumber"
                       placeholder="请输入系列号"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="型号:"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <input class="nut-input-text"
                       disabled="true"
                       v-model="formData.modelNumber"
                       placeholder="请输入型号"
                       type="text" />
              </nut-form-item>
              <nut-form-item label="出厂编号:"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <input class="nut-input-text"
                       disabled="true"
                       v-model="formData.factoryNumber"
                       placeholder="请输入出厂编号"
                       type="text" />
              </nut-form-item>

              <nut-form-item label="报修人:"
                             prop="repairman"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.repairman">
                <input class="nut-input-text"
                       @blur="customBlurValidate('repairman')"
                       v-model="formData.repairman"
                       placeholder="请输入报修人"
                       type="text" />
              </nut-form-item>

              <nut-form-item label="手机号码:"
                             prop="repairPhone"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.repairPhone">
                <input class="nut-input-text"
                       @blur="customBlurValidate('repairPhone')"
                       v-model="formData.repairPhone"
                       placeholder="请输入手机号码"
                       type="text" />
              </nut-form-item>

              <nut-form-item label="工作类别:"
                             prop="productName"
                             required
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center"
                             :rules="formRules.productName">
                <picker mode="selector"
                        rangeKey="name"
                        :range="productType"
                        @change="e=>typeChange('product',e)">
                  <view class="picker text-subtitle">
                    {{formData.productName?formData.productName:"请选择工作类型"}}
                  </view>
                </picker>
              </nut-form-item>
              <nut-form-item label="上门时间:"
                             prop="expectationTime"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <date-picker-component :start-time="startTime"
                                       :end-time="endTime"
                                       :default-time="defaultTime"
                                       @result="onResult">
                  <input class="nut-input-text"
                         v-model="formData.expectationTime"
                         :disabled="true"
                         placeholder="请选择期望上门服务时间"
                         type="text" />
                </date-picker-component>
              </nut-form-item>
              <nut-form-item label="报修描述:"
                             prop="errorDescription"
                             label-width="190rpx"
                             label-align="right"
                             class="px-0 d-flex ai-center">
                <view class="d-flex flex-column">
                  <textarea :auto-focusd="true"
                            class="w-100 text-black"
                            style="height:80px;"
                            v-model="formData.errorDescription"
                            :disable-default-padding="true"
                            maxlength="140"
                            placeholder="请输入报修描述" />
                  <view class="nut-input-word-limit">{{formData.errorDescription?.length}}/60</view>
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
import { BASE_URL } from '@/config';
import { reactive, toRefs } from 'vue';
import { useAuthStore, useTabbarStore } from '@/store';
import {
  addOrder,
  orderTypeArr,
  scanQrcodeRepair,
  slideList,
  deptAncestorsList,
  deptParentIdList,
  deptEquipmentList
} from '@/api/';
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
  companyType: [], // 医院类型
  deptType: [], // 科室类型
  equipmentType: [], // 设备类型
  productType: [], // 工作类型
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
  companyType,
  deptType,
  equipmentType,
  startTime,
  endTime,
  defaultTime,
  userInfo
} = toRefs(state);

const formData = reactive({
  companyId: '',
  companyName: '',
  deptId: '',
  deptName: '',
  equipmentId: '',
  equipmentName: '',
  serialNumber: '',
  modelNumber: '',
  factoryNumber: '',
  repairman: '',
  repairPhone: '',
  workType: '',
  productName: '',
  expectationTime: '',
  errorDescription: ''
});

const formRules = reactive({
  companyName: [{ required: true, message: '请输入医院' }],
  deptName: [{ required: true, message: '请输入科室' }],
  equipmentName: [{ required: true, message: '请输入设备名称' }],
  productName: [{ required: true, message: '请输入工作类别' }],
  repairman: [{ required: true, message: '请输入报修人' }],
  repairPhone: [
    { required: true, message: '请填写手机号码' },
    { regex: /^1[0-9]{10}$/, message: '手机号码格式不正确' }
  ]
});

/**清除通过扫码获取二次点击无法清除列表数据 */
Taro.useDidHide(() => {
  routerParams.id = '';
  ruleForm.value.reset();
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
  formData.expectationTime = arr[0] + '-' + arr[1] + '-' + arr[2] + ' ' + arr[3] + ':' + arr[4];
};

/**工作类型 */
const typeChange = function (type, e) {
  /* 医院类型 */
  if (type == 'company') {
    formData.companyId = companyType.value[e.detail.value].deptId;
    formData.companyName = companyType.value[e.detail.value].deptName;
    deptParentIdList({ parentId: formData.companyId }).then(res => {
      deptType.value = [];
      formData.deptId = '';
      formData.deptName = '';

      equipmentType.value = [];
      formData.equipmentId = '';
      formData.equipmentName = '';

      deptType.value = res.data;
    });
    /* 科室类型 */
  } else if (type == 'dept') {
    formData.deptId = deptType.value[e.detail.value].deptId;
    formData.deptName = deptType.value[e.detail.value].deptName;
    deptEquipmentList({ deptId: formData.deptId }).then(res => {
      equipmentType.value = [];
      formData.equipmentId = '';
      formData.equipmentName = '';

      equipmentType.value = res.data;
    });
    /* 设备类型 */
  } else if (type == 'equipment') {
    formData.equipmentId = equipmentType.value[e.detail.value].equipmentId;
    formData.equipmentName = equipmentType.value[e.detail.value].equipmentName;

    formData.serialNumber = equipmentType.value[e.detail.value].serialNumber;
    formData.modelNumber = equipmentType.value[e.detail.value].modelNumber;
    formData.factoryNumber = equipmentType.value[e.detail.value].factoryNumber;
  } else if (type == 'equipment') {
    formData.equipmentId = equipmentType.value[e.detail.value].equipmentId;
    formData.equipmentName = equipmentType.value[e.detail.value].equipmentName;

    formData.serialNumber = equipmentType.value[e.detail.value].serialNumber;
    formData.modelNumber = equipmentType.value[e.detail.value].modelNumber;
    formData.factoryNumber = equipmentType.value[e.detail.value].factoryNumber;
  } else if (type == 'product') {
    formData.workType = productType.value[e.detail.value].id;
    formData.productName = productType.value[e.detail.value].name;
  }

  ruleForm.value.reset();
};

/**提交事件 */
const submit = () => {
  ruleForm.value.validate().then(({ valid, errors }: any) => {
    if (valid) {
      Taro.showLoading({ title: '正在提交' });

      addOrder(formData).then(res => {
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
  deptType.value = [];
  equipmentType.value = [];
  formData.companyId = '';
  formData.companyName = '';
  formData.deptId = '';
  formData.deptName = '';
  formData.equipmentId = '';
  formData.equipmentName = '';
  formData.serialNumber = '';
  formData.modelNumber = '';
  formData.factoryNumber = '';
  formData.repairman = '';
  formData.repairPhone = '';
  formData.workType = '';
  formData.productName = '';
  formData.expectationTime = '';
  formData.errorDescription = '';
};

/** 获取工作类型 */
Promise.all([orderTypeArr({}), slideList({}), deptAncestorsList({})]).then(res => {
  const arr: object[] = [];

  for (var i in res[0].data) {
    if (res[0].data[i]) arr.push({ id: res[0].data[i].dictValue, name: res[0].data[i].dictLabel });
  }

  productType.value = arr;

  swiperList.value.push(...res[1].rows);

  userInfo.value = authStore.userInfos.myInfo;
  // formData.company_name = userInfo.value.company_name;
  // formData.department_name = userInfo.value.department_name;
  // formData.creater = userInfo.value.nickname;
  // formData.creater_phone = userInfo.value.phone;

  companyType.value = res[2].data;
});

Taro.useDidShow(() => {
  const myInfo = authStore.userInfos.myInfo;

  /** 扫码 */
  if (routerParams.equipmentId) {
    Taro.showLoading({ title: '加载中' });

    tabbar.setActive(2);

    scanQrcodeRepair(routerParams.equipmentId).then(res => {
      formData.deptId = res.data.dept.deptId || '';
      formData.equipmentId = res.data.equipmentId || '';
      formData.companyName = res.data.dept.parentName || '';
      formData.deptName = res.data.dept.deptName || '';
      formData.repairman = myInfo.nickName || '';
      formData.repairPhone = myInfo.phonenumber || '';
      formData.serialNumber = res.data.serialNumber || 0;
      formData.modelNumber = res.data.modelNumber || '';
      formData.factoryNumber = res.data.factoryNumber || 0;
      formData.equipmentName = res.data.equipmentName || 0;
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
