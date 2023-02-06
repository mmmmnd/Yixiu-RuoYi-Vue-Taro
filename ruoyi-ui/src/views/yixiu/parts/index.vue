<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="配件名称"
                    prop="name">
        <el-input v-model="queryParams.name"
                  placeholder="请输入配件名称"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="是否急需"
                    prop="needStatus">
        <el-select v-model="queryParams.needStatus"
                   placeholder="请选择是否急需"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_parts_status"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态"
                    prop="auditStatus">
        <el-select v-model="queryParams.auditStatus"
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
                   v-hasPermi="['yixiu:parts:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:parts:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:parts:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:parts:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="partsList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="配件id"
                       align="center"
                       prop="partsId" />
      <el-table-column label="配件名称"
                       align="center"
                       prop="name" />
      <el-table-column label="配件型号"
                       align="center"
                       prop="model" />
      <el-table-column label="配件数量"
                       align="center"
                       prop="number" />
      <el-table-column label="用途"
                       align="center"
                       prop="purpose" />
      <el-table-column label="是否急需"
                       align="center"
                       prop="needStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_parts_status"
                    :value="scope.row.needStatus" />
        </template>
      </el-table-column>
      <el-table-column label="采购人"
                       align="center"
                       prop="purchaseName" />
      <el-table-column label="审核状态"
                       align="center"
                       prop="auditStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_audit_status"
                    :value="scope.row.auditStatus" />
        </template>
      </el-table-column>
      <el-table-column label="审核意见"
                       align="center"
                       prop="auditOpinion" />
      <el-table-column label="审核人"
                       align="center"
                       prop="auditBy" />
      <el-table-column label="审核时间"
                       align="center"
                       prop="auditTime"
                       width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     :disabled="scope.row.needStatus != 0"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:parts:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-s-check"
                     @click="handleAudit(scope.row)"
                     v-hasPermi="['yixiu:parts:audit']">审核</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:parts:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改配件申请对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-form-item label="配件名称"
                      prop="name">
          <el-input v-model="form.name"
                    placeholder="请输入配件名称" />
        </el-form-item>
        <el-form-item label="配件型号"
                      prop="model">
          <el-input v-model="form.model"
                    placeholder="请输入配件型号" />
        </el-form-item>
        <el-form-item label="配件数量"
                      prop="number">
          <el-input v-model="form.number"
                    placeholder="请输入配件数量" />
        </el-form-item>
        <el-form-item label="用途"
                      prop="purpose">
          <el-input v-model="form.purpose"
                    placeholder="请输入用途" />
        </el-form-item>
        <el-form-item label="是否急需">
          <el-radio-group v-model="form.needStatus">
            <el-radio v-for="dict in dict.type.mzc_parts_status"
                      :key="dict.value"
                      :label="parseInt(dict.value)">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="采购人"
                      prop="purchaseName">
          <el-input v-model="form.purchaseName"
                    placeholder="请输入采购人" />
        </el-form-item>
        <el-form-item label="备注"
                      prop="remark">
          <el-input v-model="form.remark"
                    type="textarea"
                    placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitForm">确 定</el-button>
        <el-button @click="cancel('open')">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 审核配件申请对话框 -->
    <el-dialog :title="title"
               :visible.sync="openAudit"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-form-item label="配件名称"
                      prop="name">
          <el-input v-model="form.name"
                    disabled
                    placeholder="请输入配件名称" />
        </el-form-item>
        <el-form-item label="配件型号"
                      prop="model">
          <el-input v-model="form.model"
                    disabled
                    placeholder="请输入配件型号" />
        </el-form-item>
        <el-form-item label="配件数量"
                      prop="number">
          <el-input v-model="form.number"
                    disabled
                    placeholder="请输入配件数量" />
        </el-form-item>
        <el-form-item label="用途"
                      prop="purpose">
          <el-input v-model="form.purpose"
                    disabled
                    placeholder="请输入用途" />
        </el-form-item>
        <el-form-item label="是否急需">
          <el-radio-group v-model="form.needStatus">
            <el-radio v-for="dict in dict.type.mzc_parts_status"
                      :key="dict.value"
                      disabled
                      :label="parseInt(dict.value)">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核状态">
          <el-radio-group v-model="form.auditStatus">
            <el-radio v-for="dict in dict.type.mzc_audit_status"
                      :key="dict.value"
                      v-show="dict.value != 0"
                      :label="dict.value">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核意见"
                      prop="auditOpinion">
          <el-input v-model="form.auditOpinion"
                    type="textarea"
                    placeholder="请输入审核意见" />
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
import { listParts, getParts, delParts, addParts, updateParts, auditParts } from "@/api/yixiu/parts";

export default {
  name: "Parts",
  dicts: ['mzc_audit_status', 'mzc_parts_status'],
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
      // 配件申请表格数据
      partsList: [],
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
        name: null,
        needStatus: null,
        auditStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "配件名称不能为空", trigger: "blur" }
        ],
        model: [
          { required: true, message: "配件型号不能为空", trigger: "blur" }
        ],
        number: [
          { required: true, message: "配件数量不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询配件申请列表 */
    getList () {
      this.loading = true;
      listParts(this.queryParams).then(response => {
        this.partsList = response.rows;
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
        partsId: null,
        name: null,
        model: null,
        number: null,
        purpose: null,
        needStatus: 0,
        purchaseName: null,
        auditStatus: "0",
        auditOpinion: null,
        auditBy: null,
        auditTime: null,
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
      this.ids = selection.map(item => item.partsId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.open = true;
      this.title = "添加配件申请";
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const partsId = row.partsId || this.ids
      getParts(partsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改配件申请";
      });
    },
    /** 审核按钮操作 */
    handleAudit (row) {
      this.reset();
      const partsId = row.partsId || this.ids
      getParts(partsId).then(response => {
        this.form = response.data;
        this.openAudit = true;
        this.title = "审核配件申请";
        console.log(this.form.auditStatus);
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.auditStatus != 0) {
            auditParts(this.form).then(response => {
              this.$modal.msgSuccess("审核成功");
              this.openAudit = false;
              this.getList();
            });
          } else if (this.form.partsId != null) {
            updateParts(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addParts(this.form).then(response => {
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
      const partsIds = row.partsId || this.ids;
      this.$modal.confirm('是否确认删除配件申请编号为"' + partsIds + '"的数据项？').then(function () {
        return delParts(partsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/parts/export', {
        ...this.queryParams
      }, `parts_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
