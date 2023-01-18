<!--
  * @Author: 莫卓才
  * @eMail: handsome.mo@foxmail.com
  * @Descripttion: 描述
  * @version: 1.0.0
  * @Date: 2022-09-07 17:37:21
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-12-02 16:19:12
 -->
 <template>
  <view class="footer d-flex w-100 bg-white jc-evenly py-2">
    <template v-for="(item,index) in tabbarList"
              :key="item.name">
      <view class="d-flex flex-column ai-center"
            @click="onToPage(item.url,index)">
        <view class="icon"
              :style="{backgroundImage:`url(${index == tabbarActive ? item.active : item.img})`}"></view>
        <text class="pt-2 fs-xs">{{item.name}}</text>
      </view>
    </template>
  </view>
</template>
<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { ref, watch, computed } from 'vue';
import { footerMenu } from '@/api/';
import { useAuthStore, useTabbarStore } from '@/store';

const authStore = useAuthStore();
const tabbar = useTabbarStore();

const date = new Date().getTime();

const tabbarActive = ref(tabbar.getActive);

const tabbarList = computed(() =>
  authStore.userInfo.tabbarList?.length > 0
    ? authStore.userInfo.tabbarList
    : [
        {
          name: '首页',
          img: 'https://xcx.ylqx.top/static/xcx/home.png?time=' + date,
          active: 'https://xcx.ylqx.top/static/xcx/homeActive.png?time=' + date,
          url: '/pages/home/index'
        },
        {
          name: '订单记录',
          img: 'https://xcx.ylqx.top/static/xcx/botNavOrder.png?time=' + date,
          active: 'https://xcx.ylqx.top/static/xcx/botNavOrderActive.png?time=' + date,
          url: '/pages/order/index'
        },
        {
          name: '一键报修',
          img: 'https://xcx.ylqx.top/static/xcx/botNavRepair.png?time=' + date,
          active: 'https://xcx.ylqx.top/static/xcx/botNavRepairActive.png?time=' + date,
          url: '/pages/repair/index'
        },
        {
          name: '我的',
          img: 'https://xcx.ylqx.top/static/xcx/my.png?time=' + date,
          active: 'https://xcx.ylqx.top/static/xcx/myActive.png?time=' + date,
          url: '/pages/my/index'
        }
      ]
);

watch(
  () => tabbar.getActive,
  (newValue, oldValue) => {
    tabbarActive.value = newValue;
  }
);

// /**判断缓存中角色群组和tabbarList是否存在 */
// if (authStore.userInfo.role_group && !authStore.userInfo.tabbarList) {
//   footerMenu({}).then(res => {
//     const userInfo = authStore.userInfos;

//     userInfo.tabbarList = res.data;
//     authStore.setTabbarList(userInfo);
//   });
// }

/**判断缓存中角色群组和tabbarList是否存在 */
if (authStore.isLogin) {
  footerMenu({}).then(res => {
    const userInfo = authStore.userInfos;

    userInfo.tabbarList = res.data;
    authStore.setTabbarList(userInfo);
  });
}

const onToPage = (url, index) => {
  tabbar.setActive(index);

  Taro.switchTab({ url });
};
</script>

<style lang="scss">
.footer {
  height: 65px;
  position: fixed;
  bottom: 0;
  background-color: #fff;
  border: 1px solid #f0f2f1;
  border-radius: 20px 20px 0 0;
  .icon {
    height: 26px;
    width: 26px;
    background-size: 100%;
    background-position: center center;
    background-repeat: no-repeat;
  }
}
</style>