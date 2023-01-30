<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-10 17:29:05
-->
<template>
  <popup-component v-model:showPopup="showComplaint"
                   :closeableFalg="true"
                   title="维修完成">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">所属订单：</view>
      <view class="text ">{{formData.facility_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">故障描述：</view>
      <view class="text ">{{formData.failure_describe || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">故障原因：</view>
      <view class="text ">{{formData.failure_cause || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">维修时间：</view>
      <view class="text ">{{formData.repair_time || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">维修结果：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.repair_result"
             style="border: 1px solid #999; width: 70%;"
             placeholder="请输入维修结果" />
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交</nut-button>
    </view>
  </popup-component>
</template>
<script lang="ts" setup>
import popupComponent from '@/components/popupComponent.vue';
const props = defineProps({
  showComplaint: {
    type: Boolean,
    default: false
  },
  formData: {
    type: Object,
    default: {}
  },
  submit: {
    type: Function,
    default: () => {}
  }
});
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>