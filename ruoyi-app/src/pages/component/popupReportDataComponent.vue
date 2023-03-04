<!--
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-02 11:02:52
-->
<template>
  <popup-component v-model:showPopup="update"
                   style="width: 70%;top: 35%;"
                   :closeableFalg="true"
                   title="配件列表">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">型号：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.partsModel"
             style="border: 1px solid #999;"
             placeholder="请输入型号" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">配件名：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.partsName"
             style="border: 1px solid #999;"
             placeholder="请输入配件名" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"
            style="width: 74px;">数量：</view>
      <nut-inputnumber v-model="formData.number"
                       min="0" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">单位：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.unit"
             style="border: 1px solid #999;"
             placeholder="请输入单位" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">部件费：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.partsPrice"
             style="border: 1px solid #999;"
             placeholder="请输入配件费" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">维修费：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.maintenancePrice"
             style="border: 1px solid #999;"
             placeholder="请输入维修费" />
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="formData.flag?submit():edit()">{{formData.flag?'增加':'修改'}}</nut-button>
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
  },
  edit: {
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