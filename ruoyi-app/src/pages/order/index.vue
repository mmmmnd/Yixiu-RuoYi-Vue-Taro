<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-01 11:24:55
-->
<template >
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName"
                       :isNavbar="true" />
    <nut-searchbar :style="{marginTop:marginTop+'px'}"
                   class="mb-2"
                   v-model="keyWord"
                   @search="submit"
                   @clear="asyncInitScrollList"
                   background="#0066cc"
                   input-background="#fff"> </nut-searchbar>
    <view class="order-wrapper">
      <nut-tabs v-model="tabActive"
                title-scroll
                color="#0066CC"
                background="#ffffff"
                class="order-header"
                @click="getNewScrollList">
        <nut-tabpane v-for="item of tabList"
                     :key="item.id"
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
                  <view class="name text-right text-subtitle">设备名称：</view>
                  <view class="text text-theme">{{scroll.equipment?.equipmentName  || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">工程师：</view>
                  <view class="text">{{scroll.engineer_name || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">医院名称：</view>
                  <view class="text">{{scroll.dept?.parentName  || "暂无数据"}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">医院科室：</view>
                  <view class="text">{{scroll.dept?.deptName  || "暂无数据"}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">联系方式：</view>
                  <view class="text">{{scroll.repairPhone || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">维修类型：</view>
                  <view class="text">{{getOrderType(scroll.workType) || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">订单状态：</view>
                  <view class="text text-red">{{getOrderStatusType(scroll.status) || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">故障描述：</view>
                  <view class="text">{{scroll.errorDescription || '暂无数据'}}</view>
                </view>
                <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">故障原因：</view>
                  <view class="text">{{scroll.orderFeedback.equipmentInspection || '暂无数据'}}</view>
                </view>
                <!-- <view class="d-flex py-1 px-2">
                  <view class="name text-right text-subtitle">配件：</view>
                  <nut-button size="small"
                              color="#5FB878"
                              type="info"
                              @click="showTableFun(scroll)">查看明细</nut-button>
                </view> -->
                <view class="d-flex py-1 px-2"
                      v-if="scroll.status == 10">
                  <view class="flex-grow-0 name text-right text-subtitle assess-label">订单评分：</view>
                  <nut-rate active-color="#0066CC"
                            readonly
                            v-model="scroll.appraise" />
                </view>
                <view class="d-flex py-1 px-2"
                      v-if="scroll.status == 10">
                  <view class="flex-grow-0 name text-right text-subtitle assess-label">订单反馈：</view>
                  <view class="text">{{scroll.appraiseOpinion || '暂无数据'}}</view>
                </view>
                <view class="d-flex jc-between flex-wrap"
                      v-if="scroll.status > 8">
                  <nut-button size="small"
                              :color="scroll.status == '8'?'#09C160':'#BBBBBB'"
                              type="info"
                              @click="scroll.status == '8'?submitAcceptance(scroll):''">维修验收</nut-button>
                  <nut-button size="small"
                              :color="scroll.status == '9'?'#FFB800':'#BBBBBB'"
                              type="info"
                              @click="scroll.status == '9'?popupAssess(scroll):''">评价</nut-button>
                  <nut-button size="small"
                              :color="scroll.status == '10'?'#FF5722':'#BBBBBB'"
                              type="info"
                              @click="scroll.status == '10'?popupComplaint(scroll):''">投诉</nut-button>
                </view>

                <view class="d-flex py-1 jc-between flex-wrap"
                      v-if="authStore.userInfo.roleId == 104 || authStore.userInfo.roleId == 110 || authStore.userInfo.roleId == 1">
                  <nut-button size="small"
                              color="#007CCC"
                              type="info"
                              @click="popupOrderInfo(scroll)">详情明细</nut-button>
                  <nut-button size="small"
                              :color="scroll.status == '1' || scroll.status == '2' ? '#007CCC' : '#BBBBBB'"
                              type="info"
                              @click="scroll.status == '1' || scroll.status == '2' ? detection(scroll) : ''">立即检测</nut-button>
                  <nut-button size="small"
                              :color="scroll.status == '3' ? '#09C160' : '#BBBBBB'"
                              type="info"
                              @click="scroll.status == '3' ? popupReport(scroll) : ''">检测报告</nut-button>
                  <nut-button size="small"
                              :color="scroll.status == '6' ? '#5FB878' : '#BBBBBB'"
                              type="info"
                              @click="scroll.status == '6' ? popupStart(scroll) : ''">开始维修</nut-button>
                  <nut-button size="small"
                              :color="scroll.status == '7' ? '#FF5722' : '#BBBBBB'"
                              type="info"
                              @click="scroll.status == '7' ? popupEnd(scroll) : ''">维修完成</nut-button>
                </view>

                <view class="d-flex py-1"
                      v-if="authStore.userInfo.role_group == 3">
                  <nut-button size="small"
                              color="#007CCC"
                              type="info"
                              @click="popupOrderInfo(scroll)">详情明细</nut-button>
                  <nut-button size="small"
                              :color="scroll.status_offer != '1'?'#007CCC':'#BBBBBB'"
                              type="info"
                              class="mx-2"
                              @click="scroll.status_offer != '1'?popupOffer(scroll):''">提交报价单</nut-button>
                  <nut-button size="small"
                              :color="scroll.status_offer == '1'?'#09C160':'#BBBBBB'"
                              type="info"
                              class="mx-2"
                              @click="scroll.status_offer == '1'?popupOffer(scroll):''">查看报价单</nut-button>
                </view>
              </view>

              <nut-divider v-show="lastPageList == currentPageList || flagPageList">我是有底线的~</nut-divider>
            </template>
            <nut-empty v-else
                       description="无数据" />
          </view>
        </scroll-view>
      </view>

      <!-- 详情明细 -->
      <popup-orderInfo-component v-model:visible="showOrderInfo"
                                 :formData="formDataOrderInfo" />

      <!-- 评价 -->
      <popup-assess-component v-model:visible="showAssess"
                              :formData="formDataAssess"
                              :submit="submitAssess"
                              :changeRate="changeRate" />

      <!-- 投诉 -->
      <popup-complaint-component v-model:visible="showComplaint"
                                 :formData="formDataComplaint"
                                 :submit="submitComplaint" />
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

      <!-- 配件 -->
      <nut-popup pop-class="popclass"
                 v-model:visible="showTable"
                 :z-index="100"
                 style="width:90%;maxHeight:400px">
        <nut-table :columns="formData.partsTitle"
                   :data="formData.partsData"
                   style="overflow-x: auto;white-space: nowrap;overflow-y: hidden;" />
      </nut-popup>
      <tabbar-component />
    </view>
  </view>
</template>

<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { reactive, toRefs, computed, h } from 'vue';
import { useAuthStore } from '@/store';
import {
  orderList,
  comment,
  complainAdd,
  handling,
  report,
  startRepair,
  offerSubmit,
  orderInfo,
  acceptConfirm,
  repairComplete,
  orderTypeArr,
  orderStatus,
  getFeedbackInfo,
  acceptanceOrder
} from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import NavBarComponent from '@/components/NavBarComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';
import popupStartComponent from '@/pages/component/popupStartComponent.vue';
import popupOrderInfoComponent from '@/pages/component/popupOrderInfoComponent.vue';
import popupEndComponent from '@/pages/component/popupEndComponent.vue';
import popupAssessComponent from '@/pages/component/popupAssessComponent.vue';
import popupComplaintComponent from '@/pages/component/popupComplaintComponent.vue';
import popupReportComponent from '@/pages/component/popupReportComponent.vue';
import popupReportDataComponent from '@/pages/component/popupReportDataComponent.vue';
import popupOfferComponent from '@/pages/component/popupOfferComponent.vue';

const authStore = useAuthStore();

const state = reactive({
  marginTop: 0,
  scrollHegiht: 0,
  NavBarName: '订单记录',
  tabActive: '0',
  tabList: [
    {
      id: 1,
      title: '全部'
    },
    {
      id: 2,
      title: '已提交'
    },
    {
      id: 3,
      title: '派件中'
    },
    {
      id: 4,
      title: '待审批'
    },
    {
      id: 5,
      title: '维修中'
    },
    {
      id: 6,
      title: '已完成'
    }
  ],
  scrollTop: 0, //最顶部
  scrollList: [], //列表的数据
  lastPageList: 0, // 通过接口获取最后一页
  currentPageList: 1, //当前页
  flagPageList: false, //判断当前行数据是否加载完
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
  showAcceptance: false, //维修验收
  formDataAcceptance: {
    order_id: 0,
    facility_name: '',
    engineer_name: '',
    engineer_phone: null,
    repair_time: null,
    finish_time: null,
    model_number: '',
    serial_number: '',
    type_name: '',
    failure_cause: '',
    repair_result: '',
    partsTitle: [],
    partsList: [],
    accept_company_name: '',
    department_name: '',
    accepter_name: ''
  },
  showAssess: false, //评价弹窗
  formDataAssess: {
    order_id: '',
    facility_name: '',
    grade: 3.5,
    content: '',
    engineer_name: ''
  },
  showComplaint: false, //投诉弹窗
  formDataComplaint: {
    order_id: '',
    facility_name: '',
    engineer_phone: '',
    other: '',
    content: '',
    engineer_name: '',
    equipmentId: ''
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
        key: 'model_number',
        title: '型号'
      },
      {
        align: 'center',
        key: 'parts_name',
        title: '配件名'
      },
      {
        align: 'center',
        key: 'num',
        title: '数量'
      },
      {
        align: 'center',
        key: 'unit',
        title: '单位'
      },
      {
        align: 'center',
        key: 'parts_price',
        title: '部件费'
      },
      {
        align: 'center',
        key: 'repair_price',
        title: '维修费'
      },
      {
        title: '操作',
        key: 'render'
      }
    ],
    partsList: [
      {
        model_number: '',
        parts_name: '',
        num: '',
        unit: '',
        parts_price: '',
        repair_price: ''
      }
    ]
  },
  showTableData: false, //检测报告=>更换配件
  tableData: {
    index: 0,
    flag: true,
    model_number: '',
    parts_name: '',
    num: 0,
    unit: '',
    parts_price: '',
    repair_price: ''
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
  showTable: false, //配件
  formData: {
    partsTitle: [
      {
        align: 'center',
        key: 'parts_name',
        title: '配件名'
      },
      {
        align: 'center',
        key: 'num',
        title: '数量'
      },
      {
        align: 'center',
        key: 'unit',
        title: '单位'
      },
      {
        align: 'center',
        key: 'parts_price',
        title: '部件费'
      },
      {
        align: 'center',
        key: 'repair_price',
        title: '维修费'
      }
    ],
    partsData: []
  },
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
  keyWord: '',
  orderType: [],
  orderStatusArr: []
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
  showOrderInfo,
  formDataOrderInfo,
  showAcceptance,
  formDataAcceptance,
  showAssess,
  formDataAssess,
  showComplaint,
  formDataComplaint,
  showReport,
  formDataReport,
  showTableData,
  tableData,
  showStart,
  formDataStart,
  showEnd,
  formDataEnd,
  showTable,
  formData,
  showOffer,
  formDataOffer,
  keyWord,
  orderType,
  orderStatusArr
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
      scrollHegiht.value = res.topHeight + res.bottonHeight + res.tabTopHeight + 70;
    });
  });
});

const submit = () => {
  scrollList.value = [];
  currentPageList.value = 1;

  orderList({ StatusType: tabActive.value, page: currentPageList.value, limit: 5, keyWord: keyWord.value }).then(
    res => {
      scrollList.value.push(...res.rows);
    }
  );
};

/** 初始化数据 */
const asyncInitScrollList = async () => {
  const _asyncFn = [];
  Taro.showLoading({ title: '加载中' });

  for (var i = 0; i < currentPageList.value; i++)
    _asyncFn.push(orderList({ StatusType: tabActive.value, page: i + 1, limit: 5 }));

  scrollList.value = []; //将列表数据清空后

  for await (const res of _asyncFn) {
    scrollList.value.push(...res.rows);
    currentPageList.value = res.currentPage;
    lastPageList.value = res.totalPages;
  }
};

/**页面跳转 */
const onToRouter = (url: string) => {
  Taro.navigateTo({ url });
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

/** 维修验收提交 */
const submitAcceptance = e => {
  Taro.showModal({
    title: '提示',
    content: '是否确定验收维修验收表？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });
        acceptanceOrder(e.orderId).then(res => {
          Taro.showToast({ title: res.msg });
          setTimeout(() => asyncInitScrollList(), 2000);
        });
        console.log('用户点击确定');
      }
    }
  });
};

/**评价popup */
const popupAssess = e => {
  formDataAssess.value.order_id = e.orderId;
  formDataAssess.value.facility_name = e.equipment.equipmentName;
  formDataAssess.value.grade = 5;
  formDataAssess.value.content = '非常好';
  formDataAssess.value.engineer_name = e.engineerName;
  showAssess.value = true;
};

/** 评价提交 */
const submitAssess = () => {
  Taro.showModal({
    title: '提示',
    content: '是否提交评价？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });

        const param = {
          orderId: formDataAssess.value.order_id,
          appraiseName: formDataAssess.value.engineer_name,
          appraise: formDataAssess.value.grade,
          appraiseOpinion: formDataAssess.value.content
        };
        comment(param).then(res => {
          showAssess.value = false;
          Taro.showToast({ title: res.msg });
          setTimeout(() => asyncInitScrollList(), 2000);
        });
      }
    }
  });
};

/**评价备注 */
const changeRate = () => {
  const i = formDataAssess.value.grade;
  const O = { 1: '非常差', 2: '很差', 3: '一般', 4: '很好', 5: '非常好' }[i];

  formDataAssess.value.content = O;
};

/**投诉popup */
const popupComplaint = e => {
  console.log(e.engineerId);

  formDataComplaint.value.order_id = e.orderId;
  formDataComplaint.value.equipmentId = e.engineerId;
  formDataComplaint.value.facility_name = e.equipment.equipmentName;
  formDataComplaint.value.other = '';
  formDataComplaint.value.content = '';
  formDataComplaint.value.engineer_name = e.repairman;
  formDataComplaint.value.engineer_phone = e.repairPhone;
  showComplaint.value = true;
};

/**投诉提交 */
const submitComplaint = () => {
  Taro.showModal({
    title: '提示',
    content: '是否提交投诉？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });

        const param = {
          orderId: formDataComplaint.value.order_id,
          equipmentId: formDataComplaint.value.equipmentId,
          nickname: formDataComplaint.value.engineer_name,
          phone: formDataComplaint.value.engineer_phone,
          title: formDataComplaint.value.content,
          remark: formDataComplaint.value.other
        };

        complainAdd(param).then(res => {
          showComplaint.value = false;
          Taro.showToast({ title: res.msg });
          setTimeout(() => asyncInitScrollList(), 2000);
        });
        console.log('用户点击确定');
      }
    }
  });
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
    id: formDataReport.value.order_id,
    failure_cause: formDataReport.value.failure_cause,
    partsArr: formDataReport.value.partsList
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
  tableData.value.model_number = '';
  tableData.value.parts_name = '';
  tableData.value.num = 0;
  tableData.value.unit = '';
  tableData.value.parts_price = '';
  tableData.value.repair_price = '';
};

/**检测报告=> 显示修改配件*/
const editTableDataFun = e => {
  showTableData.value = true;

  tableData.value.flag = false;
  tableData.value.index = e.index;
  tableData.value.model_number = e.model_number;
  tableData.value.parts_name = e.parts_name;
  tableData.value.num = e.num;
  tableData.value.unit = e.unit;
  tableData.value.parts_price = e.parts_price;
  tableData.value.repair_price = e.repair_price;
};

/**检测报告=> 增加配件*/
const addTableData = () => {
  if (tableData.value.parts_name == '' && tableData.value.parts_price == '') {
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

  tableData.value.model_number = '';
  tableData.value.parts_name = '';
  tableData.value.num = 0;
  tableData.value.unit = '';
  tableData.value.parts_price = '';
  tableData.value.repair_price = '';
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

/**检测报告=> 修改配件*/
const editTableData = e => {
  if (tableData.value.parts_name == '' && tableData.value.parts_price == '') {
    Taro.showToast({ title: '配件名和部件费不能为空！', icon: 'none' });
    return false;
  }
  formDataReport.value.partsList.find((item: any) => {
    if (item.index == tableData.value.index) {
      item.model_number = tableData.value.model_number;
      item.parts_name = tableData.value.parts_name;
      item.num = tableData.value.num;
      item.unit = tableData.value.unit;
      item.parts_price = tableData.value.parts_price;
      item.repair_price = tableData.value.repair_price;
      showTableData.value = false;
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
  Taro.showLoading({ title: '加载中' });

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

/**显示配件table */
const showTableFun = e => {
  showTable.value = true;
  formData.value.partsData = e.partsData;
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
  Taro.showLoading({ title: '正在提交' });

  offerSubmit(formDataOffer.value).then(res => {
    showOffer.value = false;
    asyncInitScrollList();
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

Promise.all([orderTypeArr({}), orderStatus({})]).then(res => {
  orderType.value = res[0].data;
  orderStatusArr.value = res[1].data;
});

/**懒加载 */
const lazyScrollLoad = () => {
  const lastPage = lastPageList.value; //最后一页
  const currentPage = currentPageList.value; //当前页

  if (currentPage < lastPage) {
    Taro.showLoading({ title: '加载中' });
    currentPageList.value++;
    orderList({ StatusType: tabActive.value, page: currentPageList.value, limit: 5 }).then(res => {
      scrollList.value.push(...res.rows);
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
}
</style>
