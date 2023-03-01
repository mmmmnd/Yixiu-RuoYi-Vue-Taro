<!--
  * @Author: 莫卓才
  * @eMail: handsome.mo@foxmail.com
  * @Descripttion: 描述
  * @version: 1.0.0
  * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-28 09:16:48
 -->
<template>
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName" />

    <view class="body p-2">
      <nut-swiper :pagination-visible="true"
                  pagination-color="#426543"
                  auto-play="5000"
                  height="160"
                  :style="{ marginTop: marginTop + 'px' }"
                  class="swiper">
        <nut-swiper-item v-for="swiperItem in swiperList"
                         :key="swiperItem">
          <image :src="BASE_URL + swiperItem.filePath"
                 class="w-100 h-100"
                 mode="scaleToFill	" />
        </nut-swiper-item>
      </nut-swiper>

      <nut-sticky :top="marginTop"
                  z-index="100">
        <nut-grid :border="false"
                  :column-number="4"
                  class="navGrid">
          <nut-grid-item v-for="(item, index) in gridList"
                         :key="index"
                         @click="item.type === 'fn' ? scanCode() : onToRouter(item.url, item.type, item.activeNum)">

            <image :src="item.icon"
                   mode="aspectFill" />
            <text class="pt-2 text-subtitle fs-xs">{{ item.name }}</text>

          </nut-grid-item>
        </nut-grid>
      </nut-sticky>
    </view>

    <view class="divider" />

    <!-- 工程师 -->
    <view class="body p-2"
          v-if="authStore.userInfo.roleId == 104 || authStore.userInfo.roleId == 110 || authStore.userInfo.roleId == 1">
      <view class="repair-wrapper">
        <view class="repair-nav">
          <nut-tabs v-model="tabActive"
                    color="#3f7dff"
                    background="#fff"
                    @click="setTabsActive">
            <template v-for="item of tabList"
                      :key="item.id">
              <nut-tabpane :title="item.title" />
            </template>
          </nut-tabs>

          <view class="repair-content">
            <view class="repair-list"
                  v-if="engineerList?.length > 0">
              <view class="repair-item d-flex jc-between px-2 py-2 fs-sm"
                    v-for="item of engineerList"
                    :key="item.id">
                <view class="flex-grow-1 content">
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">设备名称：</view>
                    <view class="text text-theme">{{ item.equipment.equipmentName || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">医院名称：</view>
                    <view class="text">{{ item.dept.parentName || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">医院科室：</view>
                    <view class="text">{{ item.dept.deptName || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">联系方式：</view>
                    <view class="text">{{ item.repairPhone || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">维修类型：</view>
                    <view class="text">{{ getOrderType(item.workType) || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">期望时间：</view>
                    <view class="text">{{ item.expectationTime || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">订单状态：</view>
                    <view class="text text-red">{{ getOrderStatusType(item.status) || "暂无数据" }}</view>
                  </view>
                </view>
                <view class="flex-grow-0 position d-flex flex-column jc-center ai-center"
                      v-if="item.status == '0'">
                  <nut-button size="small"
                              color="#FFB800"
                              type="info"
                              @click="order(item)">立即接单</nut-button>
                </view>
                <view class="flex-grow-0 position d-flex flex-column jc-around ai-center"
                      v-else>
                  <nut-button size="small"
                              color="#007CCC"
                              type="info"
                              @click="popupOrderInfo(item)">详情明细</nut-button>
                  <nut-button size="small"
                              :color="item.status == '1' || item.status == '2' ? '#007CCC' : '#BBBBBB'"
                              type="info"
                              @click="item.status == '1' || item.status == '2' ? detection(item) : ''">立即检测</nut-button>
                  <nut-button size="small"
                              :color="item.status == '3' ? '#09C160' : '#BBBBBB'"
                              type="info"
                              @click="item.status == '3' ? popupReport(item) : ''">检测报告</nut-button>
                  <nut-button size="small"
                              :color="item.status == '6' ? '#5FB878' : '#BBBBBB'"
                              type="info"
                              @click="item.status == '6' ? popupStart(item) : ''">开始维修</nut-button>
                  <nut-button size="small"
                              :color="item.status == '7' ? '#FF5722' : '#BBBBBB'"
                              type="info"
                              @click="item.status == '7' ? popupEnd(item) : ''">维修完成</nut-button>
                </view>
              </view>
            </view>
            <nut-empty v-else
                       description="无数据" />
          </view>
        </view>
      </view>
    </view>

    <!-- 业务员 -->
    <view class="body p-2"
          v-else-if="authStore.userInfo.roleId == 100">
      <view class="repair-wrapper">
        <view class="repair-nav">
          <view class="repair-title d-flex ai-center pb-2">
            <view class="flex-grow-1 d-flex ai-center">
              <image src="../../assets/img/repairNav.png"
                     mode="aspectFill" />
              <text class="pl-2">待报价订单</text>
            </view>
            <view class="flex-grow-0 fs-xs text-subtitle"
                  @click="onToRouter('/pages/order/index', 'tabBar', null)">全部
              &gt;
            </view>
          </view>
          <view class="repair-content">
            <view class="repair-list"
                  v-if="offerList?.length > 0">
              <view class="repair-item d-flex jc-between px-2 py-2 fs-sm"
                    v-for="item of offerList"
                    :key="item.id">
                <view class="flex-grow-1 content">
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">设备名称：</view>
                    <view class="text text-theme">{{ item.facility_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">工程师：</view>
                    <view class="text">{{ item.engineer_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">医院名称：</view>
                    <view class="text">{{ item.company_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">医院科室：</view>
                    <view class="text">{{ item.department_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">联系方式：</view>
                    <view class="text">{{ item.creater_phone || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">维修类型：</view>
                    <view class="text">{{ item.type_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">订单状态：</view>
                    <view class="text text-red">{{ item.order_status_text || "暂无数据" }}</view>
                  </view>
                </view>
                <view class="flex-grow-0 position d-flex flex-column jc-evenly">
                  <nut-button size="small"
                              color="#007CCC"
                              type="info"
                              @click="popupOrderInfo(item)">详情明细</nut-button>
                  <nut-button size="small"
                              :color="item.status_offer != '1' ? '#007CCC' : '#BBBBBB'"
                              type="info"
                              @click="item.status_offer != '1' ? popupOffer(item) : ''">提交报价单</nut-button>
                  <nut-button size="small"
                              :color="item.status_offer == '1' ? '#09C160' : '#BBBBBB'"
                              type="info"
                              @click="item.status_offer == '1' ? popupOffer(item) : ''">查看报价单</nut-button>
                </view>
              </view>
            </view>
            <nut-empty v-else
                       description="无数据" />
          </view>
        </view>
      </view>
    </view>

    <!-- 用户 -->
    <view class="body p-2"
          v-else>
      <view class="repair-wrapper">
        <view class="repair-nav">
          <view class="repair-title d-flex ai-center pb-2">
            <view class="flex-grow-1 d-flex ai-center">
              <image src="../../assets/img/repairNav.png"
                     mode="aspectFill" />
              <text class="pl-2">最新报修</text>
            </view>
            <view class="flex-grow-0 fs-xs text-subtitle"
                  @click="onToRouter('/pages/order/index', 'tabBar', null)">全部
              &gt;
            </view>
          </view>
          <view class="repair-content">
            <view class="repair-list"
                  v-if="repairList?.length > 0">
              <view class="repair-item d-flex jc-between px-2 py-2 fs-sm"
                    v-for="item of repairList"
                    :key="item.id">
                <view class="flex-grow-1 content">
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">设备名称：</view>
                    <view class="text text-theme">{{ item.facility_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1 px-2">
                    <view class="name text-right text-subtitle">医院名称：</view>
                    <view class="text">{{ item.company_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">工程师：</view>
                    <view class="text">{{ item.engineer_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">联系方式：</view>
                    <view class="text">{{ item.creater_phone || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">维修类型：</view>
                    <view class="text">{{ item.type_name || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">报修时间：</view>
                    <view class="text">{{ item.expect_time || "暂无数据" }}</view>
                  </view>
                  <view class="d-flex py-1">
                    <view class="name text-right text-subtitle">完成时间：</view>
                    <view class="text">{{ item.finish_time || "暂无数据" }}</view>
                  </view>
                </view>
                <view class="flex-grow-0 position d-flex flex-column jc-center">
                  <image mode="aspectFill"
                         :src="getStatusCoceImgType(item.status_code, 'path')" />
                  <text class="fs-xs text-white">{{ getStatusCoceImgType(item.status_code, 'name') || "暂无数据" }}</text>

                </view>
              </view>
            </view>
            <nut-empty v-else
                       description="无数据" />
          </view>
        </view>
      </view>
    </view>

    <view :style="{ marginBottom: !fooBanner[0]?.remote_path ? tabbarBottom + 'px' : '0px' }" />

    <view class="footer-wrapper p-2"
          v-if="!!fooBanner[0]?.remote_path">
      <image class="w-100 footer-poster"
             :src="fooBanner[0]?.remote_path"
             :style="{ marginBottom: tabbarBottom + 'px' }"
             mode="aspectFill" />
    </view>

    <!-- 详情明细 -->
    <popup-orderInfo-component v-model:visible="showOrderInfo"
                               :formData="formDataOrderInfo" />

    <!-- 检测报告 -->
    <popup-report-component v-model:visible="showReport"
                            :formData="formDataReport"
                            :submit="submitReport"
                            @showTableData="showTableDataFun" />

    <!-- 检测报告 添加配件 -->
    <popup-report-data-component v-model:visible="showTableData"
                                 :formData="tableData"
                                 :submit="addTableData"
                                 :edit="editTableData" />

    <!-- 开始维修 -->
    <popup-start-component v-model:visible="showStart"
                           :formData="formDataStart"
                           :submit="submitStart" />

    <!-- 维修完成 -->
    <popup-end-component v-model:visible="showEnd"
                         :formData="formDataEnd"
                         :submit="submitEnd" />

    <!-- 提交/修改/显示报价单 -->
    <popup-offer-component v-model:visible="showOffer"
                           :formData="formDataOffer"
                           :submit="submitOffer" />

    <tabbar-component />

  </view>
</template>
<script lang="ts" setup>
import { BASE_URL } from '@/config';
import * as Taro from '@tarojs/taro';
import { reactive, toRefs, computed, h } from 'vue';
import { useAuthStore, useTabbarStore } from '@/store';
import {
  myInfo,
  orderList,
  takeUp,
  handling,
  report,
  startRepair,
  headerMenu,
  slideList,
  footerBanner,
  offerSubmit,
  repairComplete,
  orderInfo,
  orderStatus,
  orderTypeArr,
  getFeedbackInfo
} from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import NavBarComponent from '@/components/NavBarComponent.vue';
import popupOrderInfoComponent from '@/pages/component/popupOrderInfoComponent.vue';
import popupReportComponent from '@/pages/component/popupReportComponent.vue';
import popupReportDataComponent from '@/pages/component/popupReportDataComponent.vue';
import popupStartComponent from '@/pages/component/popupStartComponent.vue';
import popupEndComponent from '@/pages/component/popupEndComponent.vue';
import popupOfferComponent from '@/pages/component/popupOfferComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';

const authStore = useAuthStore();
const tabbar = useTabbarStore();

const date = new Date().getTime();

const state = reactive({
  cavnasShow: false,
  marginTop: 0,
  tabbarBottom: 0,
  swiperList: [],
  fooBanner: [],
  gridList: [],
  repairList: [], //员工列表
  tabActive: 0, //工程师tab列表选中
  engineerList: [], //工程师列表
  tabList: [
    {
      id: 1,
      title: '系统派单'
    },
    {
      id: 2,
      title: '自主接单'
    }
  ], //工程师tab列表
  showOrderInfo: false, //详情明细
  formDataOrderInfo: {
    equipment: {},
    dept: {},
    feedbackInfo: {},
    totalPrice: '',
    repairman: '',
    createTime: '',
    spend_period: '',
    applyDeptOpinion: '',
    equipmentOpinion: '',
    subheadOpinion: '',
    deanOpinion: '',
    company_name: '',
    department_name: '',
    accepter_name: '',
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
    payTitle: [
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
      },
      {
        align: 'center',
        key: 'unitPrice',
        title: '单价'
      },
      {
        align: 'center',
        key: 'preferentialPrice',
        title: '优惠价'
      }
    ]
  },
  showReport: false, //检测报告
  formDataReport: {
    order_id: 0,
    facility_name: '',
    failure_describe: '',
    failure_cause: '',
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
      },
      {
        title: '操作',
        key: 'render'
      }
    ],
    partsList: [
      {
        partsModel: '',
        partsName: '',
        number: '',
        unit: '',
        partsPrice: '',
        maintenancePrice: ''
      }
    ]
  },
  showTableData: false, //检测报告=>更换配件
  tableData: {
    index: 0,
    flag: true,
    partsModel: '',
    partsName: '',
    number: 0,
    unit: '',
    partsPrice: '',
    maintenancePrice: ''
  },
  showStart: false, //开始维修
  formDataStart: {
    order_id: 0,
    facility_name: '',
    failure_describe: '',
    failure_cause: '',
    repair_time: ''
  },
  showEnd: false, //开始维修
  formDataEnd: {
    order_id: 0,
    facility_name: '',
    failure_describe: '',
    failure_cause: '',
    repair_time: '',
    finish_time: '',
    repair_result: ''
  },
  offerList: [], //业务员列表
  showOffer: false, //提交报价单
  formDataOffer: {
    order_id: 0,
    facility_name: '',
    serial_number: '',
    department_name: '',
    failure_describe: '',
    failure_cause: '',
    status_offer: 0,
    partsData: [],
    total_price: ''
  },
  orderStatusArr: [],
  orderType: []
});

const {
  cavnasShow,
  marginTop,
  tabbarBottom,
  swiperList,
  fooBanner,
  repairList,
  tabActive,
  engineerList,
  tabList,
  showReport,
  formDataReport,
  showTableData,
  tableData,
  showStart,
  formDataStart,
  showEnd,
  formDataEnd,
  offerList,
  showOffer,
  formDataOffer,
  showOrderInfo,
  formDataOrderInfo,
  orderStatusArr,
  orderType
} = toRefs(state);

const gridList = computed(() =>
  authStore.userInfo.gridList?.length > 0
    ? authStore.userInfo.gridList
    : [
        {
          name: '维修申请',
          icon: 'https://xcx.ylqx.top/static/xcx/repairRequest.png?time=' + date,
          url: '/pages/repair/index',
          type: 'tabBar'
        },
        {
          name: '维修记录',
          icon: 'https://xcx.ylqx.top/static/xcx/maintenanceRecords.png?time=' + date,
          url: '/pages/order/index',
          type: 'tabBar'
        },
        {
          name: '扫码报修',
          icon: 'https://xcx.ylqx.top/static/xcx/scanCode.png?time=' + date,
          url: '',
          type: 'fn'
        },
        {
          name: '维修点',
          icon: 'https://xcx.ylqx.top/static/xcx/repair.png?time=' + date,
          url: '/pages/place/index',
          type: 'page'
        }
      ]
);

const NavBarName = computed(() => authStore.userInfo.NavBarName);

// 设置高度
Taro.useReady(() => {
  Taro.nextTick(() => {
    getViewStyle().then((res: Vo.IObject) => {
      marginTop.value = res.topHeight;
      tabbarBottom.value = res.bottonHeight;
    });
  });
});

/** 获取状态*/
const getStatusCoceImgType = computed(() => (index: number, type: string) => {
  const A = ['无数据', '已提交', ' 派单中', '待审批', '维修中', '已完成'][index || 0];

  const O = {
    无数据: require('@/assets/img/0processing.png'),
    已提交: require('@/assets/img/1processing.png'),
    派单中: require('@/assets/img/2processing.png'),
    待审批: require('@/assets/img/3processing.png'),
    维修中: require('@/assets/img/4processing.png'),
    已完成: require('@/assets/img/5processing.png')
  };

  return type === 'path' ? O[A] : A;
});

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

/** 扫码 */
const scanCode = () => {
  Taro.scanCode({
    success: res => {
      if (res.errMsg == 'scanCode:ok') {
        const path = res.path;
        if (path) {
          path.indexOf('pages/repair/index') != -1
            ? Taro.reLaunch({ url: '/' + path })
            : Taro.showToast({ title: '设备二维码不正确!', icon: 'error' });
        } else {
          Taro.showToast({ title: '请扫描设备二维码!', icon: 'error' });
        }
      }
    }
  });
};

/**路由跳转 */
const onToRouter = (url: string, type: string, activeNum: Number | null) => {
  type === 'tabBar' ? Taro.switchTab({ url }) : Taro.navigateTo({ url });
  tabbar.setActive(activeNum);
};

/**立即接单 */
const order = e => {
  Taro.showModal({
    title: '提示',
    content: '是否确认立即接单？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });
        const myInfo = authStore.userInfos.myInfo;
        const param = { orderId: e.orderId, engineerId: myInfo.userId };

        takeUp(param).then(res => {
          Taro.showToast({ title: res.msg });
          asyncInitScrollList();
        });
      }
    }
  });
};

/**详情明细popup */
const popupOrderInfo = e => {
  const { partsTitle, payTitle } = formDataOrderInfo.value;
  formDataOrderInfo.value = e;
  formDataOrderInfo.value.partsTitle = partsTitle;
  formDataOrderInfo.value.payTitle = payTitle;
  showOrderInfo.value = true;

  if (e.feedbackId) {
    getFeedbackInfo(e.feedbackId).then(res => {
      formDataOrderInfo.value.feedbackInfo = res.data;
    });
  }
};

/**立即检测 */
const detection = e => {
  Taro.showModal({
    title: '提示',
    content: '是否确认立即检测？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });

        handling(e.orderId).then(res => {
          Taro.showToast({ title: res.msg });
          asyncInitScrollList();
        });
      }
    }
  });
};

/**检测报告popup */
const popupReport = e => {
  tableData.value.index = 0;
  formDataReport.value.order_id = e.orderId;
  formDataReport.value.facility_name = e.equipment.equipmentName;
  formDataReport.value.failure_describe = e.errorDescription;
  formDataReport.value.failure_cause = '';
  formDataReport.value.partsList.length = 0;
  showReport.value = true;
};

/**检测报告提交 */
const submitReport = () => {
  Taro.showLoading({ title: '加载中' });

  report({
    orderId: formDataReport.value.order_id,
    equipmentInspection: formDataReport.value.failure_cause,
    orderParts: formDataReport.value.partsList
  }).then(res => {
    showReport.value = false;
    Taro.showToast({ title: res.msg });
    asyncInitScrollList();
  });
};

/**检测报告=> 显示配件*/
const showTableDataFun = () => {
  showTableData.value = true;

  tableData.value.flag = true;
  tableData.value.partsModel = '';
  tableData.value.partsName = '';
  tableData.value.number = 0;
  tableData.value.unit = '';
  tableData.value.partsPrice = '';
  tableData.value.maintenancePrice = '';
};

/**检测报告=> 显示修改配件*/
const editTableDataFun = e => {
  showTableData.value = true;

  tableData.value.flag = false;
  tableData.value.index = e.index;
  tableData.value.partsModel = e.partsModel;
  tableData.value.partsName = e.partsName;
  tableData.value.number = e.number;
  tableData.value.unit = e.unit;
  tableData.value.partsPrice = e.partsPrice;
  tableData.value.maintenancePrice = e.maintenancePrice;
};

/**检测报告=> 增加配件*/
const addTableData = () => {
  if (tableData.value.partsName == '' && tableData.value.partsPrice == '') {
    Taro.showToast({ title: '配件名和部件费不能为空！', icon: 'none' });
    return false;
  }

  tableData.value.index++;
  const D = JSON.parse(JSON.stringify(tableData.value));
  D.render = e => {
    return h('div', [
      h(
        'span',
        {
          onClick: () => editTableDataFun(e)
        },
        '编辑'
      ),
      h(
        'span',
        {
          style: 'color:red',
          onClick: () => delTableData(e)
        },
        '删除'
      )
    ]);
  };
  formDataReport.value.partsList.unshift(D);

  tableData.value.partsModel = '';
  tableData.value.partsName = '';
  tableData.value.number = 0;
  tableData.value.unit = '';
  tableData.value.partsPrice = '';
  tableData.value.maintenancePrice = '';
};

/**检测报告=> 修改配件*/
const editTableData = e => {
  if (tableData.value.partsName == '' && tableData.value.partsPrice == '') {
    Taro.showToast({ title: '配件名和部件费不能为空！', icon: 'none' });
    return false;
  }
  formDataReport.value.partsList.find((item: any) => {
    if (item.index == tableData.value.index) {
      item.partsModel = tableData.value.partsModel;
      item.partsName = tableData.value.partsName;
      item.number = tableData.value.number;
      item.unit = tableData.value.unit;
      item.partsPrice = tableData.value.partsPrice;
      item.maintenancePrice = tableData.value.maintenancePrice;
      showTableData.value = false;
    }
  });
};

/**检测报告=> 删除配件*/
const delTableData = e => {
  Taro.showModal({
    title: '提示',
    content: '是否删除配件信息？',
    success: function (res) {
      res.confirm &&
        formDataReport.value.partsList.find((item: any, index) => {
          if (item && item.index == e.index) {
            formDataReport.value.partsList.splice(index, 1);
          }
        });
    }
  });
};

/**开始维修popup */
const popupStart = e => {
  formDataStart.value.order_id = e.orderId;
  formDataStart.value.facility_name = e.equipment.equipmentName;
  formDataStart.value.failure_describe = e.errorDescription;
  if (e.feedbackId) {
    getFeedbackInfo(e.feedbackId).then(res => {
      formDataStart.value.failure_cause = res.data.equipmentInspection;
    });
  }
  formDataEnd.value.repair_time = '';
  formDataEnd.value.repair_result = '';
  showStart.value = true;
};

/**开始维修提交 */
const submitStart = () => {
  Taro.showLoading({ title: '正在提交' });

  startRepair(formDataStart.value.order_id).then(res => {
    showStart.value = false;
    Taro.showToast({ title: res.msg });
    asyncInitScrollList();
  });
};

/**维修完成popup */
const popupEnd = e => {
  formDataEnd.value.order_id = e.orderId;
  formDataEnd.value.facility_name = e.equipment.equipmentName;
  formDataEnd.value.failure_describe = e.errorDescription;
  if (e.feedbackId) {
    getFeedbackInfo(e.feedbackId).then(res => {
      formDataEnd.value.failure_cause = res.data.equipmentInspection;
      formDataEnd.value.repair_time = res.data.maintenanceStartTime;
    });
  }
  formDataEnd.value.finish_time = '';
  formDataEnd.value.repair_result = '';
  showEnd.value = true;
};

/**维修完成提交 */
const submitEnd = () => {
  const param = { orderId: formDataEnd.value.order_id, feedbackResult: formDataEnd.value.repair_result };
  repairComplete(param).then(res => {
    showEnd.value = false;
    Taro.showToast({ title: res.msg });
    asyncInitScrollList();
  });
};

/**报价单popup */
const popupOffer = e => {
  formDataOffer.value.order_id = e.id;
  formDataOffer.value.facility_name = e.facility_name;
  formDataOffer.value.serial_number = e.serial_number;
  formDataOffer.value.department_name = e.department_name;
  formDataOffer.value.failure_describe = e.failure_describe;
  formDataOffer.value.failure_cause = e.failure_cause;
  formDataOffer.value.status_offer = e.status_offer;

  formDataOffer.value.partsData = e.partsData;

  formDataOffer.value.total_price = e.total_price;

  showOffer.value = true;
};

/**报价单提交/修改 */
const submitOffer = () => {
  Taro.showLoading({ title: '加载中' });

  offerSubmit(formDataOffer.value).then(res => {
    showOffer.value = false;
    asyncInitScrollList();
  });
};

// Promise.all([slideList({}), footerBanner({})]).then(res => {
//   swiperList.value.push(...res[0].data);
//   fooBanner.value.push(...res[1].data);
// });

// /**判断缓存中角色群组和tabbarList是否存在 */
// if (authStore.userInfo.role_group && !authStore.userInfo.gridList) {
//   /**显示个人信息和关于 */
//   Taro.showLoading({ title: '加载中' });
//   Promise.all([myInfo({}), headerMenu({})]).then(res => {
//     const userInfo = authStore.userInfos;

//     userInfo.gridList = res[1].data;
//     userInfo.NavBarName = '欢迎登录:' + res[0].data.company_name;
//     authStore.setGridList(userInfo);
//   });
// }

/**不要缓存每次请求首页重新加载 */
Taro.useDidShow(() => {
  const userInfo = authStore.userInfos;

  swiperList.value = [];
  fooBanner.value = [];

  /**登录再去请求医院信息 */
  // Promise.all([slideList({}), footerBanner({})]).then(res => {
  //   swiperList.value.push(...res[0].data);
  //   fooBanner.value.push(...res[1].data);
  // });

  slideList({}).then(res => {
    swiperList.value.push(...res.rows);
  });

  /**登录再去请求登录后的信息 */
  if (authStore.isLogin) {
    Taro.showLoading({ title: '加载中' });
    Promise.all([myInfo({}), headerMenu({}), orderStatus({}), orderTypeArr({})]).then(res => {
      userInfo.NavBarName = '欢迎登录:' + res[0].user.nickName;
      userInfo.gridList = res[1].data;
      userInfo.myInfo = res[0].user;
      userInfo.roleId = res[0].user.roleId;
      orderStatusArr.value = res[2].data;
      orderType.value = res[3].data;

      authStore.setMyInfo(userInfo);
      authStore.setGridList(userInfo);
      asyncInitScrollList();
    });
  }
});

/* 工程师端切换接单 */
const setTabsActive = e => {
  if (e == null) {
    tabActive.value = tabActive.value;
  } else if (e.title == '自主接单') {
    tabActive.value = 1;
  } else if (e.title == '系统派单') {
    tabActive.value = 0;
  }

  const index = tabActive.value + 1;

  Taro.showLoading({ title: '加载中' });

  /**工程师端 获取列表 */
  engineerList.value = [];

  orderList({ orderType: index }).then(res => {
    engineerList.value.push(...res.rows);
    Taro.hideLoading();
  });
};

/** 初始化数据 */
const asyncInitScrollList = () => {
  if (authStore.userInfo.roleId == 104 || authStore.userInfo.roleId == 110) {
    setTabsActive(null);
    console.log('工程师');
  } else if (authStore.userInfo.roleId == 100) {
    console.log('业务员端');
    Taro.showLoading({ title: '加载中' });

    /**业务员端 获取列表 */
    offerList.value = [];
    orderList({}).then(res => {
      offerList.value = res.rows;
      Taro.hideLoading();
    });
  } else {
    console.log('用户端');
    Taro.showLoading({ title: '加载中' });

    /**用户端 获取列表 */
    repairList.value = [];
    orderList({}).then(res => {
      repairList.value = res.rows;
      Taro.hideLoading();
    });
  }
};
</script>

<style lang="scss">
.home {
  overflow: hidden;

  .body {
    .swiper {
      border-radius: 10px;
    }

    .navGrid {
      image {
        height: 40px;
        width: 40px;
      }
    }

    .repair-wrapper {
      .repair-nav {
        .repair-title {
          border-bottom: 2px solid #f0f2f1;

          image {
            height: 14px;
            width: 14px;
          }
        }

        .repair-content {
          .repair-item {
            position: relative;
            border: 2px solid #f0f2f1;
            margin: 14px 0;
            border-radius: 20rpx;

            .name {
              width: 80px;
            }

            .text {
              width: calc(100% - 80px);
              word-break: break-all;
            }

            .position {
              image {
                height: 50px;
                width: 50px;
              }

              text {
                position: absolute;
                margin-left: 6px;
              }
            }
          }
        }

        .nut-tabs__titles {
          height: 36px;
          padding: 0;
          border-bottom: 4rpx solid #f0f2f1;

          .nut-tabs__titles-item {
            &.active {
              background: #3f7dff;
              color: #fff;
            }
          }
        }

        .nut-tabs__content {
          .nut-tabpane {
            padding: 0;

            .repair-item {
              box-sizing: border-box;

              .content {
                width: 75%;

                .name {
                  width: 280rpx !important;
                }
              }

              .position {
                width: 25%;
              }
            }
          }
        }
      }
    }
  }

  .footer-wrapper {
    .footer-poster {
      height: 160px;
    }
  }
}
</style>
