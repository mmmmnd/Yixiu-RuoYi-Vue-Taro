<!--
  * @Author: 莫卓才
  * @eMail: handsome.mo@foxmail.com
  * @Descripttion: 描述
  * @version: 1.0.0
  * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-26 16:11:43
 -->
 <template>
  <view class="NavBar bg-theme w-100 pb-3"
        :style="{
          height:statusHeight+menuButtonHeight+'px'
        }">
    <view class="d-flex ai-center"
          :style="{ 
            marginTop:menuButtonTop+4+'px',
          }">
      <view class="left-navbar"
            v-if="isNavbar"
            style="marginLeft: 6px;"
            :style="{
            height:menuButtonHeight+'px',
            width:menuButtonWidth+'px',
          }">
        <view class="d-flex ai-center content">
          <nut-icon name="left"
                    @click="back()" />
          <nut-divider direction="vertical" />
          <nut-icon name="home"
                    @click="home()" />
        </view>
      </view>

      <view class="d-flex text-white fs-sm"
            :style="{
              paddingRight:(isNavbar?menuButtonWidth+6+'px':''),
              margin:(isNavbar?'0 auto':'0 10px')
            }">{{name}}</view>
    </view>

  </view>

</template>

<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { ref, computed } from 'vue';
import { getPhoneInfo } from '@/utils/util';
import { useTabbarStore } from '@/store';

const currentPages = Taro.getCurrentPages();

const tabbar = useTabbarStore();

const props = defineProps({
  name: {
    type: String,
    default: ''
  },
  style: {
    type: Object,
    default: {}
  },
  isNavbar: {
    type: Boolean,
    default: false
  }
});

const statusHeight = computed(() => getPhoneInfo().statusHeight);
const menuButtonHeight = computed(() => getPhoneInfo().menuButtonHeight);
const menuButtonTop = computed(() => getPhoneInfo().menuButtonTop);
const menuButtonWidth = computed(() => getPhoneInfo().menuButtonWidth);

const back = () => {
  if (currentPages.length != 1) {
    Taro.navigateBack({ delta: 1 });
  } else {
    Taro.switchTab({ url: '/pages/home/index' });
  }
  tabbar.setActive(0);
};

const home = () => {
  Taro.switchTab({ url: '/pages/home/index' });
  tabbar.setActive(0);
};
</script>

<style lang="scss">
.NavBar {
  position: fixed;
  z-index: 3;
  top: 0;
  .left-navbar {
    background: rgba(255, 255, 255, 0.9);
    border-radius: 20px;
    .content {
      border-width: 1;
      border-radius: 200px;
      border-color: #dadbde;
      padding: 6px 14px;
      opacity: 0.8;
    }
  }
}
</style>