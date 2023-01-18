<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-14 10:49:21
-->
<template>
  <popup-component v-model:showPopup="showComplaint"
                   :closeableFalg="true"
                   :title="formData.status_offer !=1?'提交报价单':'显示报价单'">
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <view class="text ">{{formData.facility_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">序列号：</view>
      <view class="text ">{{formData.serial_number || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">科室：</view>
      <view class="text ">{{formData.department_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备故障：</view>
      <view class="text ">{{formData.failure_describe || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">检测结果：</view>
      <view class="text ">{{formData.failure_cause || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2 flex-column"
          v-if="!!formData.partsData.length">
      <view class="title d-flex w-100">
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">型号</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">配件名</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">数量</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">单位</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">部件费</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">维修费</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">单价</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">优惠价</view>
      </view>
      <view class="content d-flex w-100"
            v-for="(item,index) in formData.partsData"
            :key="index">
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">{{item.model_number || '暂无数据'}}</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">{{item.parts_name || '暂无数据'}}</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">{{item.num || '暂无数据'}}</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;">{{item.unit || '暂无数据'}}</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;word-break:break-all;">{{item.parts_price || '暂无数据'}}</view>
        <view style="width:12.5%;border: 1px solid #000;text-align: center;box-sizing: border-box;word-break:break-all;">{{item.repair_price || '暂无数据'}}</view>

        <view style="width:12.5%;min-height: 45px;border: 1px solid #000;text-align: center;box-sizing: border-box;word-break:break-all;"
              v-if="formData.status_offer != 1">
          <input class="nut-input-text"
                 type="text"
                 v-model="item.unit_price"
                 placeholder="请输入单价" />
        </view>
        <view v-else
              style="width:12.5%;min-height: 45px;border: 1px solid #000;text-align: center;box-sizing: border-box;word-break:break-all;">{{item.unit_price || '暂无数据'}}</view>

        <view style="width:12.5%;min-height: 45px;border: 1px solid #000;text-align: center;box-sizing: border-box;word-break:break-all;"
              v-if="formData.status_offer != 1">
          <input class="nut-input-text"
                 type="text"
                 v-model="item.discount_price"
                 placeholder="请输入单价" />
        </view>
        <view v-else
              style="width:12.5%;min-height: 45px;border: 1px solid #000;text-align: center;box-sizing: border-box;word-break:break-all;">{{item.discount_price || '暂无数据'}}</view>
      </view>

    </view>
    <view class="d-flex py-1 px-2"
          v-else>
      <view class="flex-grow-0 name text-right text-subtitle assess-label">配件信息：</view>
      <view class="text ">暂无数据</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">总价：</view>
      <input v-if="formData.status_offer != 1"
             class="nut-input-text"
             type="text"
             v-model="formData.total_price"
             style="border: 1px solid #999;"
             placeholder="请输入总价" />
      <view v-else
            class="text ">{{formData.total_price || '暂无数据'}}</view>

    </view>
    <view class="d-flex py-1 px-2 mb-2"
          v-if="formData.status_offer != 1">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交报价单</nut-button>
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