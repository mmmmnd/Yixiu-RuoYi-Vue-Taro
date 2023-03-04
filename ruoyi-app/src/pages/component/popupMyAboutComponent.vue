<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-21 08:30:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-04 10:26:55
-->
<template>
  <popup-component v-model:showPopup="update"
                   :closeableFalg="true"
                   title="关于我们">
    <view class="px-4 py-2">
      <rich-text :nodes="formatRichText(formData.textAbout)"></rich-text>
    </view>
  </popup-component>
</template>
<script lang="ts" setup>
import { ref, computed } from 'vue';
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

const formatRichText = computed(() => (html: string) => {
  return html
    .replace(/<img[^>]*>/gi, match => match.replace(/style=".*"/gi, '').replace(/style='.*'/gi, ''))
    .replace(/\<img/gi, '<img style="width:100%;"');
});
</script>
<style lang="scss">
.assess-label {
  width: 80px;
}
</style>