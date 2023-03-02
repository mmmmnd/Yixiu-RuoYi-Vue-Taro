<!--
  * @Author: 莫卓才
  * @eMail: handsome.mo@foxmail.com
  * @Descripttion: 描述
  * @version: 1.0.0
  * @Date: 2022-09-16 17:13:03
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 11:07:49
 -->
 <template>
  <nut-popup pop-class="popclass"
             v-model:visible="update"
             :z-index="100"
             :closeable="closeableFalg"
             @close="closePopup"
             style="width:90%;maxHeight:400px">
    <view class="popup-wrapper">
      <view class="popup-header p-2"
            v-if="title">
        {{title}}
      </view>
      <view class="popup-content fs-sm">
        <slot></slot>
      </view>
    </view>
  </nut-popup>
</template>
<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { ref } from 'vue';

const props = defineProps({
  title: {
    type: String,
    default: ''
  },
  showPopup: {
    type: Boolean,
    default: false
  },
  closeableFalg: {
    type: Boolean,
    default: false
  }
});

const update = ref(props.showPopup);

const emit = defineEmits(['update:showPopup']);

/**关闭父弹窗 */
const closePopup = () => {
  emit('update:showPopup');
};
</script>
<style lang="scss">
.nut-popup {
  border-radius: 10px;
  .popup-wrapper {
    .popup-header {
      border-bottom: 4rpx solid #f0f2f1;
    }
  }
  .nut-popup__close-icon--top-right {
    top: 0px;
    right: 0px;
  }
}
</style>