<!--
  * @Author: 莫卓才
  * @eMail: handsome.mo@foxmail.com
  * @Descripttion: 描述
  * @version: 1.0.0
  * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 17:15:07
 -->
 <template >
  <view class="home">
    <nav-bar-component class="NavBar"
                       :name="NavBarName"
                       :isNavbar="true" />

    <nut-searchbar :style="{marginTop:marginTop+'px'}"
                   v-model="keyWord"
                   @search="submit"
                   @clear="asyncInitScrollList"
                   background="#0066cc"
                   input-background="#fff"> </nut-searchbar>

    <view class="divider" />

    <view class="body p-2">
      <view class="repair-wrapper">
        <view class="repair-nav">
          <view class="repair-title d-flex ai-center pb-2">
            <view class="flex-grow-1 d-flex ai-center">
              <image src="../../assets/img/repairNav.png"
                     mode="aspectFill"
                     id="bannerImage" />
              <text class="pl-2">设备列表</text>
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
                        <view class="name text-right text-subtitle">医院名称：</view>
                        <view class="text">{{scroll.dept.parentName || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">科室：</view>
                        <view class="text">{{scroll.dept.deptName || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">设备名称：</view>
                        <view class="text">{{scroll.equipmentName || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">序列号：</view>
                        <view class="text">{{scroll.serialNumber || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">型号：</view>
                        <view class="text">{{scroll.modelNumber || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">出厂编号：</view>
                        <view class="text">{{scroll.factoryNumber || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">品牌：</view>
                        <view class="text">{{scroll.brand || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">价格：</view>
                        <view class="text">{{scroll.price || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">购入时间：</view>
                        <view class="text">{{scroll.purchaseTime || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">保养时间：</view>
                        <view class="text">{{scroll.maintain || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">报废时间：</view>
                        <view class="text">{{scroll.scrapTime || '暂无数据'}}</view>
                      </view>
                      <view class="d-flex py-1 px-2">
                        <view class="name text-right text-subtitle">其他：</view>
                        <view class="text">{{scroll.remark || '暂无数据'}}</view>
                      </view>

                      <view class="d-flex flex-wrap">
                        <nut-button size="small"
                                    color="#007CCC"
                                    type="info"
                                    class="mr-2"
                                    @click="popupHistory(scroll)">历史维护记录</nut-button>
                        <nut-button size="small"
                                    color="#007CCC"
                                    type="info"
                                    class="mr-2"
                                    @click="saveQrCode(scroll)">保存二维码</nut-button>
                        <nut-button size="small"
                                    color="#007CCC"
                                    type="info"
                                    @click="onToRouter('/pages/repair/index?id='+scroll.id)">一键报修</nut-button>
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

  <canvas id="myCanvas"
          type="2d"
          class="canves"
          style=";"
          :style="canvasStyle" />

  <movable-area-component>
    <nut-fixednav :position="{bottom:'100px' }"
                  type="right"
                  :overlay="false"
                  v-model:visible="fixednavComplaint">
      <template v-slot:list>
        <ul class="nut-fixednav__list">
          <li class="nut-fixednav__list-item"
              @click="popupComplaint">
            设备
          </li>
        </ul>
      </template>
      <template v-slot:btn>
        <nut-icon name="retweet"
                  color="#fff">
        </nut-icon>
        <span class="text">新增设备</span>
      </template>
    </nut-fixednav>
  </movable-area-component>

  <!-- 设备新增 -->
  <popup-facility-component v-model:visible="showComplaint"
                            :formData="formDataComplaint"
                            :submit="submitComplaint"
                            :typeChange="typeChange" />

  <!-- 历史记录 -->
  <popup-history-component v-model:visible="showHistory"
                           :formData="formDataHistory"
                           :popupOrderInfo="popupOrderInfo" />

  <!-- 详情明细 -->
  <popup-orderInfo-component v-model:visible="showOrderInfo"
                             :formData="formDataOrderInfo" />

  <tabbar-component />

</template>

<script lang="ts" setup>
import * as Taro from '@tarojs/taro';
import { reactive, toRefs, computed } from 'vue';
import {
  facilityPageList,
  facilityAdd,
  deptAncestorsList,
  deptParentIdList,
  repairLog,
  getFeedbackInfo,
  orderList,
  qrCodeEquipment
} from '@/api/';
import { Vo } from '@/interfaces/';
import { getViewStyle } from '@/utils/util';
import NavBarComponent from '@/components/NavBarComponent.vue';
import TabbarComponent from '@/components/TabbarComponent.vue';
import popupFacilityComponent from '@/pages/component/popupFacilityComponent.vue';
import popupHistoryComponent from '@/pages/component/popupHistoryComponent.vue';
import popupOrderInfoComponent from '@/pages/component/popupOrderInfoComponent.vue';
import movableAreaComponent from '@/components/movableAreaComponent.vue';

const canvasStyle = {
  position: 'fixed',
  left: '9000px',
  opacity: 0,
  width: '750rpx',
  height: '500rpx'
};

const state = reactive({
  marginTop: 0,
  scrollHegiht: 0,
  NavBarName: '设备列表',
  swiperList: [],
  tabActive: '0',
  tabList: [
    {
      id: 1,
      title: '全部'
    },
    {
      id: 2,
      title: '待审批'
    },
    {
      id: 3,
      title: '已审批'
    },
    {
      id: 4,
      title: '未通过'
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
    id: 0,
    company_name: '',
    companyType: [],
    company_id: 0,
    department_name: '',
    departmentType: [],
    department_id: 0,
    name: '',
    series_number: '',
    facility_model: '',
    brand: '',
    unit_price: '',
    buy_date: '',
    keep_warm_note: '',
    scrap_warn_date: '',
    remark: '',
    factory_number: ''
  },
  keyWord: '',
  showHistory: false, //历史记录
  formDataHistory: [],
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
  }
});

const {
  marginTop,
  scrollHegiht,
  NavBarName,
  swiperList,
  tabActive,
  tabList,
  scrollTop,
  scrollList,
  lastPageList,
  currentPageList,
  flagPageList,
  fixednavComplaint,
  showComplaint,
  formDataComplaint,
  keyWord,
  showHistory,
  formDataHistory,
  showOrderInfo,
  formDataOrderInfo
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
        res.topHeight + res.bottonHeight + res.tabTopHeight + res.repairTitleHeight + res.bannberHeight + 70;
    });
  });
});

const submit = () => {
  scrollList.value = [];
  currentPageList.value = 1;

  facilityPageList({ pageNum: currentPageList.value, pageSize: 5, equipmentName: keyWord.value }).then(res => {
    scrollList.value.push(...res.rows);
  });
};

/* 保存二维码 */
const saveQrCode = e => {
  const param = 'equipmentId=' + e.equipmentId;

  Taro.createSelectorQuery()
    .select('#myCanvas')
    .fields({ node: true, size: true })
    .exec(async res => {
      // if (!e.qrcode) return Taro.showToast({ title: '暂无图片信息', icon: 'error' });
      const canvas = res[0].node;
      const { width, height } = res[0];

      Taro.showLoading({ title: '二维码生成中' });
      const ctx = canvas.getContext('2d');
      const dpr = Taro.getWindowInfo().pixelRatio;

      // 初始化画布大小
      canvas.width = width * dpr;
      canvas.height = height * dpr;
      ctx.scale(dpr, dpr);

      // 清空画布
      ctx.clearRect(0, 0, rpx2px(width * 2), rpx2px(height * 2));

      ctx.fillStyle = '#fff';
      ctx.fillRect(0, 0, rpx2px(width * 2), rpx2px(height * 2));

      const r = await qrCodeEquipment(param);
      // const imgUrl: any = await getImageInfo('data:image/png;base64,' + r.data);

      await drawImage(
        ctx,
        canvas,
        'data:image/png;base64,' + r.data,
        rpx2px(200),
        rpx2px(0),
        rpx2px(400 / 1.25),
        rpx2px(400 / 1.25)
      );

      // drawText(ctx, '医院名称:', rpx2px(0), rpx2px(380), `${24}px 宋体 small-caps`, '#000');
      // drawText(ctx, '设备名称:', rpx2px(0), rpx2px(430), `${24}px 宋体 small-caps`, '#000');
      // drawText(ctx, '科室名称:', rpx2px(0), rpx2px(480), `${24}px 宋体 small-caps`, '#000');

      drawRanksTexts(
        ctx,
        `医院名称:${e.dept.parentName}`,
        rpx2px(120),
        rpx2px(380),
        rpx2px(750),
        22,
        `${22}px 宋体 small-caps`,
        '#000'
      );
      drawRanksTexts(
        ctx,
        `设备名称:${e.equipmentName}`,
        rpx2px(120),
        rpx2px(430),
        rpx2px(750),
        22,
        `${22}px 宋体 small-caps`,
        '#000'
      );
      drawRanksTexts(
        ctx,
        `科室名称:${e.dept.deptName}`,
        rpx2px(120),
        rpx2px(480),
        rpx2px(750),
        22,
        `${22}px 宋体 small-caps`,
        '#000'
      );

      drawRanksTexts(ctx, '扫码报修', rpx2px(120), rpx2px(50), rpx2px(0), 30, `${30}px 宋体 small-caps`, '#000');
      drawRanksTexts(ctx, '扫码报修', rpx2px(570), rpx2px(50), rpx2px(0), 30, `${30}px 宋体 small-caps`, '#000');

      saveImg(canvas);
    });
};

/* px转换rpx */
const rpx2px = arg => {
  const width = Taro.getSystemInfoSync().screenWidth;
  return (arg * width) / 750;
};

/* 保存图片 */
const saveImg = canvas => {
  Taro.canvasToTempFilePath({
    canvas,
    success: function (res) {
      Taro.hideLoading();
      Taro.saveImageToPhotosAlbum({
        filePath: res.tempFilePath,
        success() {
          Taro.showToast({ title: '图片保存成功' });
        },
        fail(e) {
          const ErrArr = [
            'saveImageToPhotosAlbum:fail:auth denied',
            'saveImageToPhotosAlbum:fail auth deny',
            'saveImageToPhotosAlbum:fail authorize no response'
          ];

          if (e.errMsg === ErrArr[0] || e.errMsg === ErrArr[1] || e.errMsg === ErrArr[2]) {
            Taro.showModal({
              title: '提示',
              content: '需要您授权保存相册',
              showCancel: false,
              success: () => {
                Taro.openSetting({
                  success(settingdata) {
                    if (settingdata.authSetting['scope.writePhotosAlbum']) {
                      console.log('获取权限成功，给出再次点击图片保存到相册的提示。');
                    } else {
                      console.log('获取权限失败，给出不给权限就无法正常使用的提示');
                    }
                  }
                });
              }
            });
          }
        }
      });
    },
    fail() {
      Taro.hideLoading();
      Taro.showToast({
        title: '保存失败，稍后再试',
        icon: 'none'
      });
    }
  });
};

/* 获取网路图片信息 */
const getImageInfo = src => {
  return new Promise(resolve => {
    Taro.getImageInfo({
      src,
      success: res => {
        resolve(res);
      }
    });
  });
};

/* 图片 */
const drawImage = (ctx, canvas, url, ...arg) => {
  return new Promise(resolve => {
    const image = canvas.createImage();
    image.src = url;
    image.onload = () => {
      ctx.drawImage(image, ...arg);
      resolve(canvas);
    };
  });
};

/* 画文本 */
const drawText = (ctx, text, x, y, fz, fc) => {
  ctx.fillStyle = fc;
  ctx.font = fz;
  ctx.fillText(text, x, y);
};

const drawRanksTexts = (ctx, str, initWidth, initHeight, canvasWidth, width, fz, fc) => {
  let lineWidth = 0;
  let lastSubStrIndex = 0;
  /* 设置文字样式 */
  ctx.fillStyle = fc;
  ctx.font = fz;
  for (let i = 0; i < str.length; i++) {
    lineWidth += ctx.measureText(str[i]).width;
    if (lineWidth > canvasWidth) {
      /* 换行 */
      ctx.fillText(str.substring(lastSubStrIndex, i), initWidth, initHeight);
      initHeight += width;
      lineWidth = 0;
      lastSubStrIndex = i;
    }
    if (i == str.length - 1) {
      /* 无需换行 */
      ctx.fillText(str.substring(lastSubStrIndex, i + 1), initWidth, initHeight);
    }
  }
};

/** 初始化数据 */
const asyncInitScrollList = async () => {
  const _asyncFn = [];
  Taro.showLoading({ title: '加载中' });

  for (var i = 0; i < currentPageList.value; i++) _asyncFn.push(facilityPageList({ pageNum: i + 1, pageSize: 5 }));

  scrollList.value = []; //将列表数据清空后

  for await (const res of _asyncFn) {
    scrollList.value.push(...res.rows);
    currentPageList.value = res.currentPage;
    lastPageList.value = res.totalPages;
  }
};

/**页面跳转 */
const onToRouter = (url: string) => {
  Taro.reLaunch({ url });
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

/**设备popup */
const popupComplaint = () => {
  fixednavComplaint.value = false;

  formDataComplaint.value.id = 0;
  formDataComplaint.value.company_name = '';
  formDataComplaint.value.department_name = '';
  formDataComplaint.value.departmentType = [];
  formDataComplaint.value.department_id = 0;
  formDataComplaint.value.name = '';
  formDataComplaint.value.series_number = '';
  formDataComplaint.value.facility_model = '';
  formDataComplaint.value.brand = '';
  formDataComplaint.value.unit_price = '';
  formDataComplaint.value.buy_date = '';
  formDataComplaint.value.keep_warm_note = '';
  formDataComplaint.value.scrap_warn_date = '';
  formDataComplaint.value.remark = '';
  formDataComplaint.value.factory_number = '';

  showComplaint.value = true;
};

/* 历史记录 */
const popupHistory = e => {
  orderList({ equipmentId: e.equipmentId }).then(res => {
    if (res.rows.length == 0) {
      Taro.showToast({ title: '暂无历史数据', icon: 'none' });
    } else {
      showHistory.value = true;

      formDataHistory.value = res.rows;
    }
  });
};

/**设备申请 */
const submitComplaint = () => {
  Taro.showModal({
    title: '提示',
    content: '是否提交设备申请？',
    success: function (res) {
      if (res.confirm) {
        Taro.showLoading({ title: '正在提交' });
        const param = {
          deptId: formDataComplaint.value.department_id,
          equipmentName: formDataComplaint.value.name,
          serialNumber: formDataComplaint.value.series_number,
          modelNumber: formDataComplaint.value.facility_model,
          factoryNumber: formDataComplaint.value.factory_number,
          brand: formDataComplaint.value.brand,
          price: formDataComplaint.value.unit_price,
          purchaseTime: formDataComplaint.value.buy_date,
          maintain: formDataComplaint.value.keep_warm_note,
          scrapTime: formDataComplaint.value.scrap_warn_date,
          remark: formDataComplaint.value.remark
        };
        facilityAdd(param).then(res => {
          showComplaint.value = false;
          Taro.showToast({ title: res.msg });
          setTimeout(() => asyncInitScrollList(), 2000);
        });
      }
    }
  });
};

/**下拉 */
const typeChange = (e, name) => {
  const form = formDataComplaint.value;
  if (name == 'companyType') {
    const o = form[name][e.detail.value];

    form.company_name = o.deptName;
    form.company_id = o.deptId;

    deptParentIdList({ parentId: form.company_id }).then(res => {
      form.department_name = '';
      form.department_id = 0;
      form.departmentType = res.data;
    });
  } else if (name == 'departmentType') {
    const o = form[name][e.detail.value];

    form.department_name = o.deptName;
    form.department_id = o.deptId;
  } else {
    form[name] = e.detail.value;
  }
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
    facilityPageList({ status: tabActive.value, pageNum: currentPageList.value, pageSize: 5 }).then(res => {
      scrollList.value.push(...res.rows);
    });
  } else {
    flagPageList.value = true;
  }
  console.log(`第${tabActive.value}行，当前页${currentPage},最后一页${lastPage}`);
};

// Promise.all([slideList({}), deptAncestorsList({})]).then(res => {
//   swiperList.value.push(...res[0].data);
//   formDataComplaint.value.companyType = res[1].data;
// });

deptAncestorsList({}).then(res => {
  formDataComplaint.value.companyType = res.data;
});
</script>

<style lang="scss">
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
</style>
