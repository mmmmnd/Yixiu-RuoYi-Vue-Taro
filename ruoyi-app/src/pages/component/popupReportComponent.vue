<!--
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-02 11:02:42
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="检测报告"
                   class="report">
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <view class="text ">{{formData.facility_name || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报修描述：</view>
      <view class="text ">{{formData.failure_describe || '暂无数据'}}</view>
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">故障原因：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 70%;border: 1px solid #999;"
                v-model="formData.failure_cause"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入故障原因" />
    </view>
    <view class="d-flex py-1 px-2">
      <nut-table style="overflow-x: auto;white-space: nowrap;overflow-y: hidden;margin-bottom: 20px;"
                 :columns="formData.partsTitle"
                 :data="formData.partsList" />
    </view>
    <view class="d-flex py-1 px-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">添加配件：</view>
      <view class="bg-theme icon"
            @click="showTable()">
        <nut-icon name="uploader"
                  color="#ffffff"
                  size="34" />
      </view>
    </view>
    <view class="d-flex py-1 px-2 mb-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label"></view>
      <nut-button color="#007CCC"
                  shape="square"
                  type="primary"
                  @click="submit()">提交报告</nut-button>
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

const emit = defineEmits(['showTableData']);

/**添加配件 */
const showTable = () => {
  emit('showTableData');
};
</script>
<style lang="scss">
.popup-content {
  .assess-label {
    width: 80px;
  }
  .icon {
    border-radius: 100%;
    .nut-icon {
      height: 28px !important;
    }
  }
}
.report {
  .nut-table {
    .nut-table__main {
      margin-bottom: 20px;
    }
  }
}
</style>