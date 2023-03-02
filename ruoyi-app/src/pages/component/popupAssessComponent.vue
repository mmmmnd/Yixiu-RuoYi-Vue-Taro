<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 10:59:50
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="订单评价">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <view class="text ">{{formData.facility_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">订单反馈：</view>
      <nut-rate active-color="#0066CC"
                @change="changeRate()"
                v-model="formData.grade" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">其他备注：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 70%;border: 1px solid #999;"
                v-model="formData.content"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入其他备注" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">评论人：</view>
      <view class="text ">{{formData.engineer_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交评价</nut-button>
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
  },
  changeRate: {
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