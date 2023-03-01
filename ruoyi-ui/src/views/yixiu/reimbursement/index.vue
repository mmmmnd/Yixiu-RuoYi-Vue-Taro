<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="项目"
                    prop="project">
        <el-input v-model="queryParams.project"
                  placeholder="请输入项目"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="审核状态"
                    prop="status">
        <el-select v-model="queryParams.status"
                   placeholder="请选择审核状态"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_audit_status"
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
        <el-button type="primary"
                   plain
                   icon="el-icon-plus"
                   size="mini"
                   @click="handleAdd"
                   v-hasPermi="['yixiu:reimbursement:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:reimbursement:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:reimbursement:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:reimbursement:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="reimbursementList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="报销id"
                       align="center"
                       prop="reimbursementId" />
      <el-table-column label="项目"
                       align="center"
                       prop="project" />
      <el-table-column label="类别"
                       align="center"
                       prop="category" />
      <el-table-column label="金额"
                       align="center"
                       prop="price" />
      <el-table-column label="总金额"
                       align="center"
                       prop="totalPrice" />
      <el-table-column label="负责人"
                       align="center"
                       prop="person" />
      <el-table-column label="审核状态"
                       align="center"
                       prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_audit_status"
                    :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="审核内容"
                       align="center"
                       prop="remark" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     :disabled="scope.row.status != 0"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:reimbursement:edit']">修改</el-button>
          <el-button v-if="scope.row.status == 0"
                     size="mini"
                     type="text"
                     icon="el-icon-s-check"
                     @click="handleAudit(scope.row)"
                     v-hasPermi="['yixiu:reimbursement:edit']">审核</el-button>
          <el-button v-else-if="scope.row.status != 0"
                     size="mini"
                     type="text"
                     icon="el-icon-s-check"
                     style="color:#e6a23c"
                     @click="handleAudit(scope.row)"
                     v-hasPermi="['yixiu:reimbursement:edit']">重新审核</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:reimbursement:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改报销对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-form-item label="项目"
                      prop="project">
          <el-input v-model="form.project"
                    placeholder="请输入项目" />
        </el-form-item>
        <el-form-item label="类别"
                      prop="category">
          <el-input v-model="form.category"
                    placeholder="请输入类别" />
        </el-form-item>
        <el-form-item label="金额"
                      prop="price">
          <el-input v-model="form.price"
                    placeholder="请输入金额" />
        </el-form-item>
        <el-form-item label="总金额"
                      prop="totalPrice">
          <el-input v-model="form.totalPrice"
                    placeholder="请输入总金额" />
        </el-form-item>
        <el-form-item label="负责人"
                      prop="person">
          <el-input v-model="form.person"
                    placeholder="请输入负责人" />
        </el-form-item>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitForm">确 定</el-button>
        <el-button @click="cancel('open')">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 审核报销对话框 -->
    <el-dialog :title="title"
               :visible.sync="openAudit"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-form-item label="项目"
                      prop="project">
          <el-input v-model="form.project"
                    disabled
                    placeholder="请输入项目" />
        </el-form-item>
        <el-form-item label="类别"
                      prop="category">
          <el-input v-model="form.category"
                    disabled
                    placeholder="请输入类别" />
        </el-form-item>
        <el-form-item label="金额"
                      prop="price">
          <el-input v-model="form.price"
                    disabled
                    placeholder="请输入金额" />
        </el-form-item>
        <el-form-item label="总金额"
                      prop="totalPrice">
          <el-input v-model="form.totalPrice"
                    disabled
                    placeholder="请输入总金额" />
        </el-form-item>
        <el-form-item label="负责人"
                      prop="person">
          <el-input v-model="form.person"
                    disabled
                    placeholder="请输入负责人" />
        </el-form-item>
        <el-form-item label="审核内容"
                      prop="remark">
          <el-input v-model="form.remark"
                    type="textarea"
                    placeholder="请输入审核内容" />
        </el-form-item>
        <el-form-item label="审核状态">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in dict.type.mzc_audit_status"
                      :key="dict.value"
                      v-show="dict.value != 0"
                      :label="dict.value">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitForm">确 定</el-button>
        <el-button @click="cancel('openAudit')">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listReimbursement, getReimbursement, delReimbursement, addReimbursement, updateReimbursement, auditReimbursement } from "@/api/yixiu/reimbursement";

export default {
  name: "Reimbursement",
  dicts: ['mzc_audit_status'],
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
      // 报销表格数据
      reimbursementList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示审核弹出层
      openAudit: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        project: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        project: [
          { required: true, message: "项目不能为空", trigger: "blur" }
        ],
        category: [
          { required: true, message: "类别不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "金额不能为空", trigger: "blur" }
        ],
        totalPrice: [
          { required: true, message: "总金额不能为空", trigger: "blur" }
        ],
        person: [
          { required: true, message: "负责人不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "审核内容不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询报销列表 */
    getList () {
      this.loading = true;
      listReimbursement(this.queryParams).then(response => {
        this.reimbursementList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel (name) {
      this[name] = false;
      this.reset();
    },
    // 表单重置
    reset () {
      this.form = {
        reimbursementId: null,
        project: null,
        category: null,
        price: null,
        totalPrice: null,
        person: null,
        status: "0",
        remark: null,
        delFlag: null,
        deleteBy: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        updateBy: null
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
      this.ids = selection.map(item => item.reimbursementId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.open = true;
      this.title = "添加报销";
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const reimbursementId = row.reimbursementId || this.ids
      getReimbursement(reimbursementId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改报销";
      });
    },
    /** 审核按钮操作 */
    handleAudit (row) {
      this.reset();
      const reimbursementId = row.reimbursementId || this.ids
      getReimbursement(reimbursementId).then(response => {
        this.form = response.data;
        this.openAudit = true;
        this.title = "审核报销";
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.status != 0) {
            auditReimbursement(this.form).then(response => {
              this.$modal.msgSuccess("审核成功");
              this.openAudit = false;
              this.getList();
            });
          } else if (this.form.reimbursementId != null) {
            updateReimbursement(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addReimbursement(this.form).then(response => {
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
      const reimbursementIds = row.reimbursementId || this.ids;
      this.$modal.confirm('是否确认删除报销编号为"' + reimbursementIds + '"的数据项？').then(function () {
        return delReimbursement(reimbursementIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/reimbursement/export', {
        ...this.queryParams
      }, `reimbursement_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
