<!--
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-03 16:47:19
-->
<template >
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName"
                       :isNavbar="true" />

    <view class="body p-2 bannber"
          :style="{marginTop:marginTop+'px'}">

      <image :src="BASE_URL+swiperList[0]?.filePath"
             class="w-100 h-100 "
             mode="scaleToFill" />
    </view>

    <view class="divider" />

    <view class="body p-2">
      <view class="repair-wrapper">
        <view class="repair-nav">
          <view class="repair-title d-flex ai-center pb-2">
            <view class="flex-grow-1 d-flex ai-center">
              <image src="../../assets/img/repairNav.png"
                     mode="aspectFill" />
              <text class="pl-2">所有维修点</text>
            </view>
            <text class="flex-grow-0 fs-xs text-subtitle"></text>
          </view>
          <template v-if="scrollList?.length>0">
            <view class="repair-content fs-sm">
              <scroll-view :scroll-y="true"
                           @scrolltolower="lazyScrollLoad"
                           :scroll-top="scrollTop"
                           :style="{height:'calc(100vh - '+scrollHegiht+'px)'}">
                <view class="order-scroll-list">
                  <template v-for="scroll of scrollList"
                            :key="scroll">
                    <view class="order-scroll-item pb-2">
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">维修点名称：</view>
                        <view class="text text-theme">{{scroll.deptName || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">联系电话：</view>
                        <view class="text">{{scroll.phone || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">地址：</view>
                        <view class="text">{{scroll.address || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle assess-label"></view>
                        <nut-button color="#09C160"
                                    shape="square"
                                    type="primary"
                                    size="small"
                                    @click="callPhone(scroll.phone)">拨打电话</nut-button>
                      </view>
                    </view>
                  </template>

                  <nut-divider v-show="lastPageList == currentPageList || flagPageList">我是有底线的~</nut-divider>
                </view>
              </scroll-view>
            </view>
          </template>
          <nut-empty v-else
                     description="无数据" />
        </view>
      </view>
    </view>
  </view>

  <tabbar-component />

</template>

<script lang="ts" setup>
import { BASE_URL } from '@/config';
import * as Taro from '@tarojs/taro';
import { reactive, toRefs } from 'vue';
import { districtPageList, slideList } from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import popupComponent from '@/components/popupComponent.vue';
import NavBarComponent from '@/components/NavBarComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';
import DatePickerComponent from '@/components/datePickerComponent.vue';

const state = reactive({
  marginTop: 0,
  scrollHegiht: 0,
  NavBarName: '维修点',
  tabActive: '0',
  swiperList: [],
  scrollTop: 0, //最顶部
  scrollList: [], //列表的数据
  lastPageList: 0, // 通过接口获取最后一页
  currentPageList: 1, //当前页
  flagPageList: false //判断当前行数据是否加载完
});

const {
  marginTop,
  scrollHegiht,
  NavBarName,
  tabActive,
  swiperList,
  scrollTop,
  scrollList,
  lastPageList,
  currentPageList,
  flagPageList
} = toRefs(state);

Taro.useDidShow(() => {
  asyncInitScrollList();
});

// 设置高度
Taro.useReady(() => {
  Taro.nextTick(() => {
    getViewStyle().then((res: Vo.IObject) => {
      marginTop.value = res.topHeight;
      scrollHegiht.value =
        res.topHeight + res.bottonHeight + res.tabTopHeight + res.repairTitleHeight + res.bannberHeight + 20;
    });
  });
});

/** 初始化数据 */
const asyncInitScrollList = () => {
  Taro.showLoading({ title: '加载中' });

  districtPageList({ parentId: 1 }).then(res => {
    currentPageList.value = res.data.current_page;
    lastPageList.value = res.data.last_page;
    scrollList.value = res.data;
    flagPageList.value = false;

    console.log(res);
  });
};

/**页面跳转 */
const onToRouter = (url: string) => {
  Taro.navigateTo({ url });
};

/**拨打电话 */
const callPhone = (phone: string) => {
  Taro.makePhoneCall({ phoneNumber: phone }).catch(() => {});
};

/**懒加载 */
const lazyScrollLoad = () => {
  const lastPage = lastPageList.value; //最后一页
  const currentPage = currentPageList.value; //当前页
  if (currentPage < lastPage) {
    Taro.showLoading({ title: '加载中' });
    currentPageList.value++;
    districtPageList({ parentId: 1 }).then(res => {
      scrollList.value.push(...res.rows);
    });
  } else {
    flagPageList.value = true;
    console.log('没有更多数据啦~');
  }
  console.log(scrollList.value);
  console.log(`第${tabActive.value}行，当前页${currentPage},最后一页${lastPage}`);
};

slideList({}).then(res => {
  swiperList.value.push(...res.rows);
});
</script>

<style lang="scss">
page {
  overflow: hidden;
  .home {
    overflow: hidden;
    .body {
      &.bannber {
        height: 160px;
        box-sizing: border-box;
        image {
          border-radius: 20rpx;
        }
      }

      .navGrid {
        image {
          height: 40px;
          width: 40px;
        }
      }

      .repair-wrapper {
        .repair-title {
          border-bottom: 2px solid #f0f2f1;

          image {
            height: 14px;
            width: 14px;
          }
        }

        .repair-content {
          .order-scroll-list {
            .order-scroll-item {
              border-bottom: 4rpx solid #f0f2f1;
              .name {
                width: 100px;
              }
              .text {
                width: calc(100% - 100px);
                word-break: break-all;
              }
            }
          }
        }

        .repair-poster {
          image {
            height: 160px;
          }
        }
      }
    }
  }
}
</style>
