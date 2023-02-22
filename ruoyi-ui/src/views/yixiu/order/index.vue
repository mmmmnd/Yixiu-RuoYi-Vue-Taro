<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="维修点id"
                    prop="deptId">
        <el-input v-model="queryParams.deptId"
                  placeholder="请输入维修点id"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="设备id"
                    prop="equipmentId">
        <el-input v-model="queryParams.equipmentId"
                  placeholder="请输入设备id"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="工作类别"
                    prop="workType">
        <el-select v-model="queryParams.workType"
                   placeholder="请选择工作类别"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_order_type"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="状态"
                    prop="status">
        <el-select v-model="queryParams.status"
                   placeholder="请选择状态"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_order_status"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="评价"
                    prop="appraise">
        <el-select v-model="queryParams.appraise"
                   placeholder="请选择评价"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_order_appraise_status"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary"
                   icon="el-icon-search"
                   size="mini"
                   @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh"
                   size="mini"
                   @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10"
            class="mb8">
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:order:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:order:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="orderList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="订单id"
                       align="center"
                       prop="orderId" />
      <el-table-column label="医院名称"
                       align="center"
                       prop="dept.parentName" />
      <el-table-column label="科室名称"
                       align="center"
                       prop="dept.deptName" />
      <el-table-column label="设备名称"
                       align="center"
                       prop="equipment.equipmentName" />
      <el-table-column label="序列号"
                       align="center"
                       prop="equipment.serialNumber" />
      <el-table-column label="型号"
                       align="center"
                       prop="equipment.modelNumber" />
      <el-table-column label="出厂编号"
                       align="center"
                       prop="equipment.factoryNumber" />
      <el-table-column label="报修人"
                       align="center"
                       prop="repairman" />
      <el-table-column label="报修电话"
                       align="center"
                       prop="repairPhone" />
      <el-table-column label="工作类别"
                       align="center"
                       prop="workType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_order_type"
                    :value="scope.row.workType" />
        </template>
      </el-table-column>
      <el-table-column label="期望上门服务时间"
                       align="center"
                       prop="expectationTime"
                       width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expectationTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="故障描述"
                       align="center"
                       prop="errorDescription" />
      <el-table-column label="申请科室意见"
                       align="center"
                       prop="applyDeptOpinion" />
      <el-table-column label="装备部意见"
                       align="center"
                       prop="equipmentOpinion" />
      <el-table-column label="分管院长审批意见"
                       align="center"
                       prop="subheadOpinion" />
      <el-table-column label="院长审批意见"
                       align="center"
                       prop="deanOpinion" />
      <el-table-column label="状态"
                       align="center"
                       prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_order_status"
                    :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="评价意见"
                       align="center"
                       prop="appraiseOpinion" />
      <el-table-column label="评价"
                       align="center"
                       prop="appraise">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_order_appraise_status"
                    :value="scope.row.appraise" />
        </template>
      </el-table-column>
      <el-table-column label="评价人"
                       align="center"
                       prop="userId" />
      <el-table-column label="操作"
                       align="center"
                       fixed="right"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-s-promotion"
                     v-hasPermi="['yixiu:equipment:edit']">详情</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-s-promotion"
                     v-if="checkRole(['maintainDirector']) && scope.row.status == 0"
                     v-hasPermi="['yixiu:equipment:edit']">派单</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-document-copy"
                     v-if="checkRole(['engineer']) && scope.row.status == 0"
                     @click="orderReceiving(scope.row)"
                     v-hasPermi="['yixiu:equipment:edit']">接单</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:order:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改订单对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import cache from '@/plugins/cache'
import { checkRole } from '@/utils/permission'
import { addReceiving } from "@/api/yixiu/receiving";
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/yixiu/order";

export default {
  name: "Order",
  dicts: ['mzc_order_type', 'mzc_order_status', 'mzc_order_appraise_status'],
  data () {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        equipmentId: null,
        workType: null,
        status: null,
        appraise: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    checkRole,
    /** 查询订单列表 */
    getList () {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel () {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset () {
      this.form = {
        orderId: null,
        deptId: null,
        equipmentId: null,
        repairman: null,
        repairPhone: null,
        workType: null,
        expectationTime: null,
        errorDescription: null,
        applyDeptOpinion: null,
        equipmentOpinion: null,
        subheadOpinion: null,
        deanOpinion: null,
        status: null,
        appraiseOpinion: null,
        appraise: null,
        userId: null,
        deleteBy: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery () {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery () {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.open = true;
      this.title = "添加订单";
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const orderId = row.orderId || this.ids
      getOrder(orderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单";
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.orderId != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete (row) {
      const orderIds = row.orderId || this.ids;
      this.$modal.confirm('是否确认删除订单编号为"' + orderIds + '"的数据项？').then(function () {
        return delOrder(orderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    },
    orderReceiving (e) {
      const userInfo = cache.session.getJSON('userInfo');
      const param = {};
      param.orderId = e.orderId;
      param.userId = userInfo.userId;

      addReceiving(param).then(res => {
        console.log(res);
      })
    }
  }
};
</script>
