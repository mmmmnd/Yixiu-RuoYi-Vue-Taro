<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 10:59:11
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="维修验收">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <view class="text text-theme">{{formData.facility_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">工程师：</view>
      <view class="flex-grow-1 text">{{formData.engineer_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">联系方式：</view>
      <view class="flex-grow-1 text">{{formData.engineer_phone || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">到达时间：</view>
      <view class="flex-grow-1 text">{{formData.repair_time || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">结束时间：</view>
      <view class="flex-grow-1 text">{{formData.finish_time || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">型号：</view>
      <view class="flex-grow-1 text">{{formData.facility_model || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">出厂编号：</view>
      <view class="flex-grow-1 text">{{formData.serial_number || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">维修类型：</view>
      <view class="flex-grow-1 text">{{formData.type_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报修原因：</view>
      <view class="flex-grow-1 text">{{formData.failure_describe || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">维修结果：</view>
      <view class="flex-grow-1 text">{{formData.failure_cause || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">配件：</view>
      <nut-button size="small"
                  color="#5FB878"
                  type="info"
                  @click="showTable = true">查看明细</nut-button>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">确定验收</nut-button>
    </view>
    <nut-popup pop-class="popclass"
               v-model:visible="showTable"
               :z-index="100"
               :overlay-style="overlayStyle"
               style="width:90%;max-height:400px;">
      <nut-table :columns="formData.partsTitle"
                 :data="formData.partsList"
                 style="overflow-x: auto;white-space: nowrap;overflow-y: hidden;" />
    </nut-popup>
  </popup-component>

</template>
<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { ref } from 'vue';
import popupComponent from '@/components/popupComponent.vue';

const props = defineProps({
  showAssess: {
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

const showTable = ref(false);
const update = ref(props.showAssess);
const overlayStyle = { paddingBottom: '140%' };
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>