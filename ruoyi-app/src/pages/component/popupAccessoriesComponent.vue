<!--
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-02 21:32:53
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="配件申请">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">名称：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.parts_name	"
             style="border: 1px solid #999;"
             placeholder="请输入名称" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">规格型号：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.parts_size"
             style="border: 1px solid #999;"
             placeholder="请输入规格型号" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">用途：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.purpose"
             style="border: 1px solid #999;"
             placeholder="请输入用途" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">数量：</view>
      <nut-inputnumber v-model="formData.parts_num"
                       min="0" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">是否急需：</view>
      <nut-radiogroup v-model="formData.urgency"
                      direction="horizontal">
        <nut-radio shape="button"
                   label="0">否</nut-radio>
        <nut-radio shape="button"
                   label="1">是</nut-radio>
      </nut-radiogroup>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">备注：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 70%;border: 1px solid #999;"
                v-model="formData.remark"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入备注" />
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