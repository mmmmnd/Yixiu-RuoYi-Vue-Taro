<template>
  <view class="my">
    <view class="header-wrapper h-100 d-flex ai-center jc-between px-2">
      <template v-if="isLogin">
        <view class="d-flex ai-center jc-center">
          <button class="d-flex avatar-wrapper"
                  open-type="chooseAvatar"
                  :plain="true"
                  @Chooseavatar="onChooseAvatar">
            <nut-icon name="photograph" />
            <image class="avatar"
                   mode="aspectFill"
                   :src="BASE_URL+userInfo.myInfo.avatar" />
          </button>
          <view class="header d-flex flex-column ai-start">
            <text class="name fs-lg text-white">{{formData.nickname}}</text>
            <text class="phone text-lightGrey">{{getPhone(formData.phone)}}</text>
          </view>
        </view>

      </template>
      <template v-else>
        <view class="d-flex ai-center avatar-wrapper">
          <image class="avatar"
                 mode="aspectFill"
                 src="../../assets/img/myAvatar.png" />
          <view class="header d-flex flex-column ai-start  pl-4">
            <text class="name fs-lg text-white">立即登录</text>
            <text class="phone text-lightGrey">登录体验更多功能</text>
          </view>
        </view>
      </template>
    </view>
    <view class="info-wrapper px-2 fs-sm">
      <view class="info-title d-flex ai-center jc-between px-4">
        <text class="text-darkYellow">{{!!formData.status == 0?"签约客户":'游客'}}</text>
        <text class="text-subtitle">{{isLogin?formData.department_name:'暂无医院信息'}}</text>
      </view>
      <view class="info-list">
        <view class="info-item d-flex ai-center p-3"
              v-for="(item,index) in infoList"
              :key="index">
          <view class="content d-flex ai-center flex-grow-1"
                style="height: 50rpx;"
                v-if="item.type === 'service'">
            <image class="icon"
                   mode="aspectFill"
                   :src="item.icon" />
            <nut-button type="default"
                        open-type="contact"
                        class="text-black"
                        hover-class="none"
                        style="border:none;position: relative;width: 90%;font-size: 32rpx;">
              <view style="position: absolute;left: 16px;top: 0;">{{ item.name }}</view>
            </nut-button>
          </view>
          <view class="content d-flex ai-center flex-grow-1"
                v-else
                @click="item.type === 'fn'?showPopup(item.url):onToRouter(item.url,item.type,item.activeNum)">
            <image class="icon"
                   mode="aspectFill"
                   :src="item.icon" />
            <view class="pl-3">{{ item.name }}</view>
          </view>
          <image class="gt flex-grow-0"
                 mode="aspectFill"
                 src="../../assets/img/myGt2.png" />
        </view>
        <view class="info-item d-flex jc-center p-3"
              v-if="isLogin"
              @click="loginout"
              style="color: red;">
          退出我的账号
        </view>
      </view>
    </view>

    <!-- 我的信息 -->
    <popup-my-info-component v-model:visible="showUserInfo"
                             :formData="formData" />

    <!-- 关于我们 -->
    <popup-component v-model:showPopup="showAbout"
                     :closeableFalg="true"
                     title="关于我们">
      <view class="px-4 py-2">
        <rich-text :nodes="formatRichText(textAbout)"></rich-text>
      </view>
    </popup-component>

    <tabbar-component />
  </view>
</template>

<script lang="ts" setup>
import { BASE_URL } from '@/config';
import * as Taro from '@tarojs/taro';
import { reactive, toRefs, computed } from 'vue';
import { useAuthStore, useTabbarStore } from '@/store';
import { myInfo, myAbout, saveWechatInfo } from '@/api/';
import { getToken } from '@/utils/util';
import TabbarComponent from '@/components/TabbarComponent.vue';
import popupComponent from '@/components/popupComponent.vue';
import popupMyInfoComponent from '@/pages/component/popupMyInfoComponent.vue';

const authStore = useAuthStore();
const tabbar = useTabbarStore();

const state = reactive({
  infoList: [
    {
      icon: require('@/assets/img/myOrder.png'),
      name: '我的订单',
      url: '/pages/order/index',
      type: 'tabBar',
      activeNum: 1
    },
    {
      icon: require('@/assets/img/myInfo.png'),
      name: '我的信息',
      url: 'userInfo',
      type: 'fn',
      activeNum: null
    },
    {
      icon: require('@/assets/img/myAbout.png'),
      name: '关于医修',
      url: 'about',
      type: 'fn',
      activeNum: null
    },
    {
      icon: require('@/assets/img/myComplaint.png'),
      name: '我的投诉',
      url: '/pages/complaint/index',
      type: 'tabBar',
      activeNum: null
    },
    {
      icon: require('@/assets/img/account.png'),
      name: '我的报销',
      url: '/pages/account/index',
      type: 'page',
      activeNum: null
    },
    {
      icon: require('@/assets/img/myService.png'),
      name: '在线客服',
      url: '',
      type: 'service',
      activeNum: null
    }
  ],
  showUserInfo: false,
  showAbout: false,
  textAbout: '',
  userInfo: authStore.userInfos,
  isLogin: authStore.isLogin,
  formData: {
    nickname: '',
    department_name: '',
    phone: null,
    company_address: '',
    company_name: '',
    company_id: 0
  }
});

const { infoList, showUserInfo, showAbout, textAbout, userInfo, isLogin, formData } = toRefs(state);

/**格式化手机号码 */
const getPhone = computed(() => (phone: string) => {
  return phone && phone.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
});

const formatRichText = computed(() => (html: string) => {
  return html
    .replace(/<img[^>]*>/gi, match => match.replace(/style=".*"/gi, '').replace(/style='.*'/gi, ''))
    .replace(/\<img/gi, '<img style="width:100%;"');
});

/**显示Popup弹窗 */
const showPopup = url => {
  if (url === 'userInfo') {
    showUserInfo.value = true;
  } else {
    showAbout.value = true;
  }
};

/**路由跳转 */
const onToRouter = (url: string, type: string, activeNum: number | null) => {
  type === 'tabBar' ? Taro.switchTab({ url }) : Taro.navigateTo({ url });
  tabbar.setActive(activeNum);
};

/* 获取微信头像 */
const onChooseAvatar = e => {
  const userInfo = authStore.userInfos;

  Taro.uploadFile({
    url: BASE_URL + '/system/user/profile/avatar',
    filePath: e.detail.avatarUrl,
    name: 'avatarfile',
    header: {
      Authorization: 'Bearer ' + getToken()
    },
    success(r: any) {
      userInfo.myInfo.avatar = r.imgUrl;

      console.log(userInfo.myInfo.avatar);
      authStore.setMyInfo(userInfo);
    },
    fail(e) {
      Taro.showToast({ title: '上传失败，请换一张头像' });
    }
  });
};

/**退出 */
const loginout = () => {
  Taro.showModal({
    title: '账号退出',
    content: '是否退出当前账号信息？',
    confirmText: '确认',
    cancelText: '取消',
    success: res => {
      if (res.confirm) {
        authStore.resetAuthStore();
        Taro.showToast({ title: '退出成功' });
        tabbar.setActive(0);

        setTimeout(() => Taro.reLaunch({ url: '/pages/home/index' }), 2000);
      }
    }
  });
};

/**不要缓存每次请求重新加载 */
Taro.useDidShow(() => {
  const userInfo = authStore.userInfos;

  Taro.showLoading({ title: '加载中' });
  myInfo({}).then(res => {
    userInfo.myInfo = res.user;

    formData.value.nickname = res.user.nickName;
    formData.value.department_name = res.user.dept.deptName;
    formData.value.phone = res.user.phonenumber;
    formData.value.company_address = res.user.dept.address;
    formData.value.company_name = res.user.deptName;

    authStore.setMyInfo(userInfo);
  });
});

/**显示个人信息和关于 */
myAbout({}).then(res => {
  textAbout.value = res.data.content;
});
</script>
<style lang="scss">
.my {
  .header-wrapper {
    height: 260px;
    background: #fff url('../../assets/img/myBg.png') no-repeat;
    background-size: 100% 100%;
    margin-top: -1px;

    .avatar-wrapper {
      border: none;
      .nut-icon {
        font-size: 22px;
        position: absolute;
        right: 16px;
        bottom: 0;
        color: #fff;
      }
      .avatar {
        height: 60px;
        width: 60px;
        border-radius: 50%;
      }
    }
  }

  .info-wrapper {
    position: relative;
    top: -53px;

    .info-title {
      border-radius: 20px 20px 0 0;
      height: 55px;
      background: linear-gradient(to bottom, #efddbe, #ffffff);
    }

    .info-list {
      .info-item {
        border-bottom: 2px solid #f0f2f1;

        .content {
          .icon {
            height: 25px;
            width: 25px;
          }
        }

        .gt {
          height: 15px;
          width: 10px;
        }
      }
    }
  }
}
</style>