<!--
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-02 16:10:17
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="设备新增">
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">医院名称：</view>
      <picker mode="selector"
              rangeKey="deptName"
              class="w-100"
              :range="formData.companyType"
              @change="e=>typeChange(e,'companyType')">
        <view class="picker text-subtitle">
          {{formData.company_name?formData.company_name:"请选择医院名称"}}
          <nut-icon name="arrow-down"
                    class="float-r"></nut-icon>
        </view>
      </picker>

    </view>
    <view class="d-flex py-1 px-4 pl-2"
          v-show="!!formData.departmentType.length">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">科室：</view>
      <picker mode="selector"
              rangeKey="deptName"
              class="w-100"
              :range="formData.departmentType"
              @change="e=>typeChange(e,'departmentType')">
        <view class="picker text-subtitle">
          {{formData.department_name?formData.department_name:"请选择科室"}}
          <nut-icon name="arrow-down"
                    class="float-r"></nut-icon>
        </view>
      </picker>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">设备名称：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.name"
             style="border: 1px solid #999;"
             placeholder="请输入设备名称" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">序列号：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.series_number"
             style="border: 1px solid #999;"
             placeholder="请输入序列号" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">型号：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.facility_model"
             style="border: 1px solid #999;"
             placeholder="请输入型号" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">出厂编号：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.factory_number"
             style="border: 1px solid #999;"
             placeholder="请输入出厂编号" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">品牌：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.brand"
             style="border: 1px solid #999;"
             placeholder="请输入品牌" />
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">价格：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.unit_price"
             style="border: 1px solid #999;"
             placeholder="请输入价格" />
    </view>
    <view class="d-flex py-2 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">购入时间：</view>
      <picker mode="date"
              @change="e=>typeChange(e,'buy_date')">
        <view class="picker text-subtitle">
          {{formData.buy_date?formData.buy_date:"请选择购入时间"}}
        </view>
      </picker>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">保养时间：</view>
      <input class="nut-input-text"
             type="text"
             v-model="formData.keep_warm_note"
             style="border: 1px solid #999;"
             placeholder="保养时间例如'每年8月'" />
    </view>
    <view class="d-flex py-2 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">报废时间：</view>
      <picker mode="date"
              @change="e=>typeChange(e,'scrap_warn_date')">
        <view class="picker text-subtitle">
          {{formData.scrap_warn_date?formData.scrap_warn_date:"请选择报废时间"}}
        </view>
      </picker>
    </view>
    <view class="d-flex py-1 px-4 pl-2">
      <view class="flex-grow-0 name text-right text-subtitle assess-label">其他：</view>
      <textarea :auto-focusd="true"
                class="text-black"
                style="height:80px;width: 70%;border: 1px solid #999;"
                v-model="formData.remark"
                :disable-default-padding="true"
                maxlength="140"
                placeholder="请输入其他" />
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
  },
  typeChange: {
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