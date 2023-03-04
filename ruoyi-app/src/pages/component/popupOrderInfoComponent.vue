<!--
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-02 11:02:30
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="详情明细">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <view class="text text-theme">{{formData.equipment?.equipmentName || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">系列号：</view>
      <view class="flex-grow-1 text">{{formData.equipment?.serialNumber || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">科室：</view>
      <view class="flex-grow-1 text">{{formData.dept?.deptName || "暂无数据"}}</view>
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
      <view class="flex-grow-1 text">{{formData?.feedbackInfo?.totalPrice || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报价人：</view>
      <view class="flex-grow-1 text">{{formData?.feedbackInfo?.offeror|| "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报价日期：</view>
      <view class="flex-grow-1 text">{{formData?.feedbackInfo?.quotationDate || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报修人：</view>
      <view class="flex-grow-1 text">{{formData.repairman || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报修日期：</view>
      <view class="flex-grow-1 text">{{formData.createTime || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">检测结果：</view>
      <view class="flex-grow-1 text">{{formData?.feedbackInfo?.equipmentInspection  || "暂无数据"}}</view>
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
      <view class="flex-grow-1 text">{{formData.applyDeptOpinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">装备部：</view>
      <view class="flex-grow-1 text">{{formData.equipmentOpinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">分管院长：</view>
      <view class="flex-grow-1 text">{{formData.subheadOpinion || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">院长：</view>
      <view class="flex-grow-1 text">{{formData.deanOpinion || "暂无数据"}}</view>
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
      <view class="flex-grow-1 text">{{formData.acceptor || "暂无数据"}}</view>
    </view>
    <nut-popup pop-class="popclass"
               v-model:visible="showTable"
               :z-index="100"
               :overlay-style="overlayStyle"
               style="width:90%;max-height:400px;">
      <nut-table :columns="formData.partsTitle"
                 :data="formData?.feedbackInfo?.orderParts"
                 style="overflow-x: auto;white-space: nowrap;overflow-y: hidden;" />
    </nut-popup>

    <nut-popup pop-class="popclass"
               v-model:visible="showTableOffer"
               :z-index="100"
               :overlay-style="overlayStyle"
               style="width:90%;max-height:400px;">
      <nut-table :columns="formData.payTitle"
                 :data="formData?.feedbackInfo?.orderParts"
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
const update = ref(props.showAssess);
const overlayStyle = { paddingBottom: '140%' };
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>