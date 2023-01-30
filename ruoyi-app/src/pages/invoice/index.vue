<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-22 17:35:44
-->
<template >
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName"
                       :isNavbar="true" />

    <view class="order-wrapper"
          :style="{marginTop:marginTop+10+'px'}">
      <nut-tabs v-model="tabActive"
                title-scroll
                color="#0066CC"
                background="#ffffff"
                class="order-header"
                @click="getNewScrollList">
        <nut-tabpane v-for="(item,index) of tabList"
                     :key="index"
                     :title="item.title" />
      </nut-tabs>
      <view class="order-body fs-sm p-2">
        <scroll-view :scroll-y="true"
                     @scrolltolower="lazyScrollLoad"
                     :scroll-top="scrollTop"
                     :style="{height:'calc(100vh - '+scrollHegiht+'px)'}">
          <view class="order-scroll-list">
            <template v-if="scrollList?.length>0">
              <view class="order-scroll-item pb-2"
                    v-for="scroll of scrollList"
                    :key="scroll">
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票项目：</view>
                  <view class="text">{{scroll.apply_item || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票单位：</view>
                  <view class="text">{{scroll.company_name || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票税号：</view>
                  <view class="text">{{scroll.tax_id || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票金额：</view>
                  <view class="text">{{scroll.apply_price || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票状态：</view>
                  <view class="text text-red">{{scroll.apply_status || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票人：</view>
                  <view class="text">{{scroll.apply_person || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票时间：</view>
                  <view class="text">{{scroll.apply_time || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">开票意见：</view>
                  <view class="text">{{scroll.reject_reason || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2"
                      v-if="tabActive == '2'">
                  <view class="name text-right text-subtitle">驳回时间：</view>
                  <view class="text">{{scroll.reject_time || '暂无数据'}}</view>
                </view>
              </view>
              <nut-divider v-show="lastPageList == currentPageList || flagPageList">我是有底线的~</nut-divider>
            </template>
            <nut-empty v-else
                       description="无数据" />

          </view>
        </scroll-view>
      </view>
    </view>

    <nut-fixednav :position="{bottom:'100px' }"
                  type="right"
                  :overlay="false"
                  v-model:visible="fixednavComplaint">
      <template v-slot:list>
        <ul class="nut-fixednav__list fs-sm">
          <li class="nut-fixednav__list-item"
              @click="popupComplaint">
            申请
          </li>
        </ul>
      </template>
      <template v-slot:btn>
        <nut-icon name="retweet"
                  color="#fff">
        </nut-icon>
        <span class="text fs-sm">发票申请</span>
      </template>
    </nut-fixednav>

    <!-- 投诉 -->
    <popup-invoice-component v-model:visible="showComplaint"
                             :formData="formDataComplaint"
                             :submit="submitComplaint" />

    <tabbar-component />

  </view>
</template>

<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { reactive, toRefs } from 'vue';
import { useAuthStore } from '@/store';
import { invoicePageList, applyData } from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import NavBarComponent from '@/components/NavBarComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';
import popupInvoiceComponent from '@/pages/component/popupInvoiceComponent.vue';

const authStore = useAuthStore();

const state = reactive({
  marginTop: 0,
  scrollHegiht: 0,
  NavBarName: '发票申请',
  tabActive: '0',
  tabList: [
    {
      id: 1,
      title: '全部'
    },
    {
      id: 2,
      title: '审核中'
    },
    {
      id: 3,
      title: '已驳回'
    },
    {
      id: 4,
      title: '开票中'
    },
    {
      id: 5,
      title: '已开票'
    }
  ],
  scrollTop: 0, //最顶部
  scrollList: [], //列表的数据
  lastPageList: 0, // 通过接口获取最后一页
  currentPageList: 1, //当前页
  flagPageList: false, //判断当前行数据是否加载完
  fixednavComplaint: false, //投诉浮动窗
  showComplaint: false, //投诉弹窗
  formDataComplaint: {
    order_id: '',
    member_id: 0,
    company_name: 'MAS-100A1 微波消融仪-维修',
    tax_id: '13512345678',
    apply_price: '',
    apply_item: '',
    username: ''
  }
});

const {
  marginTop,
  scrollHegiht,
  NavBarName,
  tabActive,
  tabList,
  scrollTop,
  scrollList,
  lastPageList,
  currentPageList,
  flagPageList,
  fixednavComplaint,
  showComplaint,
  formDataComplaint
} = toRefs(state);

Taro.useDidShow(() => {
  asyncInitScrollList();
});

// 设置高度
Taro.useReady(() => {
  Taro.nextTick(() => {
    getViewStyle().then((res: Vo.IObject) => {
      marginTop.value = res.topHeight;
      scrollHegiht.value = res.topHeight + res.bottonHeight + res.tabTopHeight + 30;
    });
  });
});

/** 初始化数据 */
const asyncInitScrollList = async () => {
  const _asyncFn = [];
  Taro.showLoading({ title: '加载中' });

  for (var i = 0; i < currentPageList.value; i++)
    _asyncFn.push(invoicePageList({ status: tabActive.value, page: i + 1, limit: 5 }));

  scrollList.value = []; //将列表数据清空后

  for await (const res of _asyncFn) {
    scrollList.value.push(...res.data.data);
    currentPageList.value = res.data.current_page;
    lastPageList.value = res.data.last_page;
  }
};

/**页面跳转 */
const onToRouter = (url: string) => {
  Taro.navigateTo({ url });
};

/**发票popup */
const popupComplaint = () => {
  fixednavComplaint.value = false;
  formDataComplaint.value.order_id = '';
  formDataComplaint.value.member_id = authStore.userInfos.myInfo.member_id;
  formDataComplaint.value.company_name = authStore.userInfos.myInfo.company_name;
  formDataComplaint.value.tax_id = '';
  formDataComplaint.value.apply_price = '';
  formDataComplaint.value.apply_item = '';
  formDataComplaint.value.username = authStore.userInfos.myInfo.nickname;

  showComplaint.value = true;
};

/** 发票申请 */
const submitComplaint = () => {
  Taro.showModal({
    title: '提示',
    content: '是否提交发票申请？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });

        applyData({ data: formDataComplaint.value }).then(res => {
          showComplaint.value = false;
          Taro.showToast({ title: res.msg });
          setTimeout(() => asyncInitScrollList(), 2000);
        });
        console.log('用户点击确定');
      }
    }
  });
};

/**获取tab点击 */
const getNewScrollList = e => {
  tabActive.value = e.paneKey;
  scrollTop.value = 1;
  Taro.nextTick(() => (scrollTop.value = 0)); //将scroll置顶
  currentPageList.value = 1; //将当前分页设置为第一页
  flagPageList.value = false; //没有数据隐藏
  asyncInitScrollList();
};

/**懒加载 */
const lazyScrollLoad = () => {
  const lastPage = lastPageList.value; //最后一页
  const currentPage = currentPageList.value; //当前页

  if (currentPage < lastPage) {
    Taro.showLoading({ title: '加载中' });
    currentPageList.value++;
    invoicePageList({ status: tabActive.value, page: currentPageList.value, limit: 5 }).then(res => {
      scrollList.value.push(...res.data.data);
    });
  } else {
    flagPageList.value = true;
  }
  console.log(`第${tabActive.value}行，当前页${currentPage},最后一页${lastPage}`);
};
</script>

<style lang="scss">
page {
  overflow-y: hidden;
  .order-wrapper {
    .order-header {
      .nut-tabs__titles {
        height: 28px;
        border-bottom: 4px solid #0066cc;
        .nut-tabs__titles-item {
          // padding: 0 12px;
          &.active {
            font-weight: unset;
            color: #ffffff;
            background: #0066cc;
            border-radius: 5px 5px 0 0;
          }
        }
        .nut-tabs__titles-item__line {
          position: absolute;
          top: 48px;
        }
      }
      .nut-tabs__content {
        .nut-tabpane {
          padding: 0px;
        }
      }
    }
  }
  .order-scroll-list {
    .order-scroll-item {
      border-bottom: 4rpx solid #f0f2f1;
      .name {
        width: 80px;
      }
      .text {
        width: calc(100% - 80px);
        word-break: break-all;
      }
    }
  }

  .nut-rate-item__icon--half {
    display: none;
  }
  .nut-fixednav {
    z-index: 100;
  }
}
</style>
