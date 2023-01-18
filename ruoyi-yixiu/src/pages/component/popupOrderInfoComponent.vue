<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-16 15:50:58
-->
<template>
  <popup-component v-model:showPopup="showAssess"
                   :closeableFalg="true"
                   title="详情明细">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <view class="text text-theme">{{formData.facility_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">系列号：</view>
      <view class="flex-grow-1 text">{{formData.serial_number || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2"
          v-if="formData.department_name">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">科室：</view>
      <view class="flex-grow-1 text">{{formData.department_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">配件：</view>
      <nut-button size="small"
                  color="#5FB878"
                  type="info"
                  @click="showTable = true">查看明细</nut-button>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报价单：</view>
      <nut-button size="small"
                  color="#5FB878"
                  type="info"
                  @click="showTableOffer = true">查看明细</nut-button>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">总价：</view>
      <view class="flex-grow-1 text">{{formData.total_price || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报价人：</view>
      <view class="flex-grow-1 text">{{formData.offerer_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报价日期：</view>
      <view class="flex-grow-1 text">{{formData.create_time || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报修人：</view>
      <view class="flex-grow-1 text">{{formData.creater_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报修日期：</view>
      <view class="flex-grow-1 text">{{formData.create_time || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">检测结果：</view>
      <view class="flex-grow-1 text">{{formData.failure_cause || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">维修时间：</view>
      <view class="flex-grow-1 text">{{formData.spend_period || "暂无数据"}}</view>
    </view>
    <!-- <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">保修期：</view>
      <view class="flex-grow-1 text">{{formData.warranty_period || "暂无数据"}}</view>
    </view> -->
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">申请科室：</view>
      <view class="flex-grow-1 text">{{formData.dean_branch_opinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">装备部：</view>
      <view class="flex-grow-1 text">{{formData.department_opinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">分管院长：</view>
      <view class="flex-grow-1 text">{{formData.equip_opinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">院长：</view>
      <view class="flex-grow-1 text">{{formData.dean_opinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">验收单位：</view>
      <view class="flex-grow-1 text">{{formData.company_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">验收科室：</view>
      <view class="flex-grow-1 text">{{formData.department_name || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">验收人：</view>
      <view class="flex-grow-1 text">{{formData.accepter_name || "暂无数据"}}</view>
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

    <nut-popup pop-class="popclass"
               v-model:visible="showTableOffer"
               :z-index="100"
               :overlay-style="overlayStyle"
               style="width:90%;max-height:400px;">
      <nut-table :columns="formData.payTitle"
                 :data="formData.payList"
                 style="overflow-x: auto;white-space: nowrap;overflow-y: hidden;" />
    </nut-popup>
  </popup-component>
</template>
<script lang="ts" setup>
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
const showTableOffer = ref(false);
const overlayStyle = { paddingBottom: '140%' };
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>