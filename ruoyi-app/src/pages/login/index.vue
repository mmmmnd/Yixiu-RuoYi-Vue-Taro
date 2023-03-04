<!--
  * @Author: mmmmnd
  * @eMail: handsome.mo@foxmail.com
  * @Descripttion: 描述
  * @version: 1.0.0
  * @Date: 2021-11-17 10:31:48
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-02-24 10:38:48
 -->
 <template>
  <view class="loginbg">
    <view class="tips">为提供更好的使用体验，当前页面需要授权使用</view>
    <view class="denglu2">
      <button v-if="!isOpenId"
              @tap="getuserinfo">点击授权微信登录</button>

      <button v-if="isOpenId && !isPhone"
              type="default"
              open-type="getPhoneNumber"
              @getphonenumber="getUserPhone">点击授权手机号码</button>
    </view>

  </view>
</template>

<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { User } from '@/interfaces/';
import { useAuthStore, useTabbarStore } from '@/store';
import { saveWechatInfo, binding } from '@/api/';
import { getLogin, getPhone } from '@/utils/mixin/auto';

const authStore = useAuthStore();
const tabbar = useTabbarStore();

const isPhone = authStore.isPhone;
const isOpenId = authStore.isOpenId;

const title = isPhone ? '绑定手机' : '登录';
Taro.setNavigationBarTitle({ title });

/**用户登录 */
const getuserinfo = () => {
  getLogin(res => {
    res = res.data;
    Taro.showLoading({ title: '加载中' });

    Taro.showToast({
      title: '授权成功',
      icon: 'success',
      success() {
        const url = !res.phone ? '/pages/login/index' : '/pages/home/index';
        res.roleId = 0;

        authStore.setAuthStore(res);
        tabbar.setActive(0);

        setTimeout(() => Taro.reLaunch({ url }), 2000);
      }
    });
  });
};

/**获取手机号码 */
const getUserPhone = e => {
  getPhone(e.detail.code, (res: User.IPhone) => {
    const userInfo = authStore.userInfos;

    Taro.showLoading({ title: '加载中' });

    binding({ phone: res.phone, openid: userInfo.openid }).then(res => {
      const userInfo = authStore.userInfos;

      userInfo.phone = res.data.phone;
      userInfo.role_group = res.data.role_group;

      authStore.setAuthStore(userInfo);
      tabbar.setActive(0);

      Taro.showToast({ title: res.msg });
      setTimeout(() => Taro.reLaunch({ url: '/pages/home/index' }), 2000);
    });
  });
};
</script>
<style lang="scss">
page {
  width: 100%;
  height: 100%;
  background-color: #f7f7f7;
}

.loginbg {
  width: 100%;
  height: 100vh;
  background-color: #f4f6f7;
  background-image: url('https://xxyg.daxinxin.vip/wxapp/loginbg.png');
  background-position: bottom center;
  background-size: 100%;
  background-repeat: no-repeat;
}
.denglu2 {
  width: 60%;
  justify-content: center;
  align-items: center;
  height: 60rpx;
  line-height: 60rpx;
  margin: 0 auto;
}
.denglu2 button {
  justify-content: center;
  align-items: center;
  height: 70rpx;
  line-height: 70rpx;
  margin: 0 auto;
  background-color: #46bdf6;
  color: #fff;
  border-radius: 35rpx;
  display: block;
}
.tips {
  color: rgb(182, 176, 176);
  width: 100%;
  text-align: center;
  font-size: 30rpx;
  height: 50rpx;
  line-height: 50rpx;
  padding-top: 66%;
  margin-bottom: 50rpx;
}
</style>