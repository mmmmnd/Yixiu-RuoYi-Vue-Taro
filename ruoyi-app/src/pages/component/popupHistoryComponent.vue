<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-15 08:45:30
-->
<template>
  <popup-component v-model:showPopup="showData"
                   :closeableFalg="true"
                   title="历史记录">
    <template v-for="(data,index) in formData"
              :key="data.id">
      <view :class="{'mt-2':Number(index)>0?true:false}"
            style="border-bottom: 1px solid #000">
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label text-red">历史次数：</view>
          <view class="text  text-red">{{index+1}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
          <view class="text ">{{data.facility_name || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">维修类型：</view>
          <view class="text ">{{data.type_name || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">报修时间：</view>
          <view class="text ">{{data.create_time || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">订单状态：</view>
          <view class="text ">{{data.status || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">故障描述：</view>
          <view class="text ">{{data.failure_describe || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">故障原因：</view>
          <view class="text ">{{formData.failure_cause || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label">报修人：</view>
          <view class="text ">{{data.linkman || '暂无数据'}}</view>
        </view>
        <view class="d-flex py-1 px-4 pl-2 mb-2">
          <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
          <nut-button color="#007CCC"
                      shape="square"
                      type="primary"
                      @click="popupOrderInfo(data)">查看详情明细</nut-button>
        </view>

      </view>
    </template>

  </popup-component>
</template>
<script lang="ts" setup>
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
  },
  typeChange: {
    type: Function,
    default: () => {}
  },
  popupOrderInfo: {
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