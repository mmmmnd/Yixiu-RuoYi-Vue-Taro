<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 10:01:14
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="发票申请">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">开票单位：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.company_name"
             style="border: 1px solid #999;"
             placeholder="请输入开票单位" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">单位税号：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.tax_id"
             style="border: 1px solid #999;"
             placeholder="请输入单位税号" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">开票金额：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.apply_price"
             style="border: 1px solid #999;"
             placeholder="请输入开票金额" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">开票项目：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 57%;border: 1px solid #999;"
                v-model="formData.apply_item"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入开票项目" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">申请人：</view>
      <view class="text ">{{formData.username || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交申请</nut-button>
    </view>
  </popup-component>
</template>
<script lang="ts" setup>
import { ref } from 'vue';
import popupComponent from '@/components/popupComponent.vue';

const props = defineProps({
  showData: {
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
const update = ref(props.showData);
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>