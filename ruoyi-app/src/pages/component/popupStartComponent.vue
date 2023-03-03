<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 22:55:02
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="开始维修">
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
import { ref } from 'vue';
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
const update = ref(() => props.showComplaint);
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>