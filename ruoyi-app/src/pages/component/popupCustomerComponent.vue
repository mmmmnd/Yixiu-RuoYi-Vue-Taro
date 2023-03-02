<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 09:59:41
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="客户信息">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">医院名称：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.name	"
             style="border: 1px solid #999;"
             placeholder="请输入医院名称" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">医院地址：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.address"
             style="border: 1px solid #999;"
             placeholder="请输入医院地址" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">联系人：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.linkman"
             style="border: 1px solid #999;"
             placeholder="请输入联系人" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">联系电话：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.phone"
             style="border: 1px solid #999;"
             placeholder="请输入联系电话" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">其他说明：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 70%;border: 1px solid #999;"
                v-model="formData.remark"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入其他说明" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">签约状态：</view>
      <nut-radiogroup v-model="formData.sign_status"
                      direction="horizontal">
        <nut-radio shape="button"
                   label="1">已签约</nut-radio>
        <nut-radio shape="button"
                   label="2">未签约</nut-radio>
      </nut-radiogroup>
    </view>
    <view class="d-flex py-1 px-4 pl-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交</nut-button>
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