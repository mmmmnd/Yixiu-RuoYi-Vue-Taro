<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-14 16:54:47
-->
<template>
  <popup-component v-model:showPopup="showData"
                   :closeableFalg="true"
                   :title="formData.falg?'报销申请':'报销修改'">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">费用项目：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.title	"
             style="border: 1px solid #999;"
             placeholder="请输入费用项目" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">类别：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.classes"
             style="border: 1px solid #999;"
             placeholder="请输入类别" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">金额：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.price"
             style="border: 1px solid #999;"
             placeholder="请输入金额" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">总金额：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.price_total"
             style="border: 1px solid #999;"
             placeholder="请输入总金额" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报销人：</view>
      <view class="text">{{formData.leader || "暂无数据"}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">{{formData.falg?'提交':'修改'}}</nut-button>
    </view>
  </popup-component>
</template>
<script lang="ts" setup>
import { reactive, ref } from 'vue';
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
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>