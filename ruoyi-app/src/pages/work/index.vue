<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 22:19:26
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
              <text class="pl-2">工作记录</text>
            </view>
            <text class="flex-grow-0 fs-xs text-subtitle"></text>
          </view>
          <template v-if="scrollList?.length>0">
            <view class="repair-content">
              <scroll-view :scroll-y="true"
                           @scrolltolower="lazyScrollLoad"
                           :scroll-top="scrollTop"
                           :style="{height:'calc(100vh - '+scrollHegiht+'px)'}">
                <view class="order-scroll-list fs-sm">
                  <template v-for="scroll of scrollList"
                            :key="scroll">
                    <view class="order-scroll-item pb-2">
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">设备名称：</view>
                        <view class="text text-theme">{{scroll.equipment.equipmentName || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">所属科室：</view>
                        <view class="text font-ellipsis">{{scroll.dept.deptName || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">联系人：</view>
                        <view class="text font-ellipsis">{{scroll.repairman || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">联系方式：</view>
                        <view class="text font-ellipsis">{{scroll.repairPhone || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">维修类型：</view>
                        <view class="text font-ellipsis">{{getOrderType(scroll.workType)  || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">维修时间：</view>
                        <view class="text font-ellipsis">{{scroll.orderFeedback.maintenanceStartTime || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">完成时间：</view>
                        <view class="text font-ellipsis">{{scroll.orderFeedback.maintenanceEndTime || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">订单状态：</view>
                        <view class="text font-ellipsis text-red">{{getOrderStatusType(scroll.status) || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">故障描述：</view>
                        <view class="text font-ellipsis">{{scroll.errorDescription || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">故障原因：</view>
                        <view class="text font-ellipsis">{{scroll.orderFeedback.equipmentInspection || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">配件：</view>
                        <nut-button size="small"
                                    color="#5FB878"
                                    type="info"
                                    @click="showTableFun(scroll)">查看明细</nut-button>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">验收人：</view>
                        <view class="text font-ellipsis">{{scroll.acceptor || '暂无数据'}}</view>
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

  <nut-popup pop-class="popclass"
             v-model:visible="showTable"
             :z-index="100"
             style="width:90%;maxHeight:400px">
    <nut-table :columns="formData?.partsTitle"
               :data="formData?.partsData"
               style="overflow-x: auto;white-space: nowrap;overflow-y: hidden;" />
  </nut-popup>

  <tabbar-component />

</template>

<script lang="ts" setup>
import { BASE_URL } from '@/config';
import * as Taro from '@tarojs/taro';
import { reactive, toRefs, computed } from 'vue';
import { orderList, slideList, orderStatus, orderTypeArr, getFeedbackInfo } from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import popupComponent from '@/components/popupComponent.vue';
import NavBarComponent from '@/components/NavBarComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';

const state = reactive({
  marginTop: 0,
  scrollHegiht: 0,
  NavBarName: '工作报告',
  swiperList: [],
  tabActive: '0',
  scrollTop: 0, //最顶部
  scrollList: [], //列表的数据
  lastPageList: 0, // 通过接口获取最后一页
  currentPageList: 1, //当前页
  flagPageList: false, //判断当前行数据是否加载完
  showTable: false,
  formData: {
    facility_name: '',
    department_name: '',
    creater_name: null,
    creater_phone: null,
    type_name: null,
    create_time: '',
    handle_start_time: '',
    finish_time: '',
    order_status: '',
    failure_describe: '',
    partsTitle: [
      {
        align: 'center',
        key: 'partsModel',
        title: '型号'
      },
      {
        align: 'center',
        key: 'partsName',
        title: '配件名'
      },
      {
        align: 'center',
        key: 'number',
        title: '数量'
      },
      {
        align: 'center',
        key: 'unit',
        title: '单位'
      },
      {
        align: 'center',
        key: 'partsPrice',
        title: '部件费'
      },
      {
        align: 'center',
        key: 'maintenancePrice',
        title: '维修费'
      }
    ],
    partsData: [],
    accept_person: '',
    accept_time: ''
  },
  orderStatusArr: [],
  orderType: []
});

const {
  marginTop,
  scrollHegiht,
  NavBarName,
  swiperList,
  tabActive,
  scrollTop,
  scrollList,
  lastPageList,
  currentPageList,
  flagPageList,
  showTable,
  orderStatusArr,
  orderType,
  formData
} = toRefs(state);

const getOrderStatusType = computed(() => (index: string) => {
  if (index != null && index != '') {
    const e = orderStatusArr.value.find(item => item.dictValue == index);
    return e.dictLabel;
  } else {
    return '';
  }
});

const getOrderType = computed(() => (index: string) => {
  if (index != null && index != '') {
    const e = orderType.value.find(item => item.dictValue == index);
    return e.dictLabel;
  } else {
    return '';
  }
});

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

/**显示配件table */
const showTableFun = e => {
  showTable.value = true;

  if (e.feedbackId) {
    getFeedbackInfo(e.feedbackId).then(res => {
      formData.value.partsData = res.data.orderParts;
    });
  } else {
    formData.value.partsData = [];
  }
};

/** 初始化数据 */
const asyncInitScrollList = () => {
  Taro.showLoading({ title: '加载中' });

  orderList({ pageNum: currentPageList.value, pageSize: 5 }).then(res => {
    scrollList.value = res.rows;
    currentPageList.value = res.currentPage;
    lastPageList.value = res.totalPages;
    flagPageList.value = false;
  });
};

/**懒加载 */
const lazyScrollLoad = () => {
  const lastPage = lastPageList.value; //最后一页
  const currentPage = currentPageList.value; //当前页
  if (currentPage < lastPage) {
    Taro.showLoading({ title: '加载中' });
    currentPageList.value++;

    orderList({ pageNum: currentPageList.value, pageSize: 5 }).then(res => {
      scrollList.value.push(...res.rows);
    });
  } else {
    Taro.hideLoading();
    flagPageList.value = true;
    console.log('没有更多数据啦~');
  }
  console.log(scrollList.value);
  console.log(`第${tabActive.value}行，当前页${currentPage},最后一页${lastPage}`);
};

Promise.all([slideList({}), orderStatus({}), orderTypeArr({})]).then(res => {
  swiperList.value.push(...res[0].rows);
  orderStatusArr.value = res[1].data;
  orderType.value = res[2].data;
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
                width: 80px;
              }
              .text {
                width: calc(100% - 80px);
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
