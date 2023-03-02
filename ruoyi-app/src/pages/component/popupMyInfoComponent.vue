<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 10:06:03
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="我的信息">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">姓名：</view>
      <view class="text ">{{formData.nickname || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">科室：</view>
      <view class="text ">{{formData.department_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">联系方式：</view>
      <view class="text ">{{formData.phone || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">医院地址：</view>
      <view class="text ">{{formData.company_address || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">医院名称：</view>
      <view class="text ">{{formData.company_name || '暂无数据'}}</view>
    </view>
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

const update = ref(props.showAssess);
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>