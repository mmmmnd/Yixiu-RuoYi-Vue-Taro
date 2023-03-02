<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 11:00:02
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="订单投诉">

    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">投诉人：</view>
      <view class="text ">{{formData.engineer_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">联系方式：</view>
      <view class="text ">{{formData.engineer_phone || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2"
          v-if="!formData.isFacility">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">所属订单：</view>
      <view class="text ">{{formData.facility_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">投诉原因：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.content"
             style="border: 1px solid #999; width: 70%;"
             placeholder="请输入投诉原因" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">投诉内容：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 70%;border: 1px solid #999;"
                v-model="formData.other"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入投诉内容" />
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交投诉</nut-button>
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
const update = ref(props.showComplaint);
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>