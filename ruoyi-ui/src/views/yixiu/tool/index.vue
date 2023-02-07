<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="工具名称"
                    prop="toolName">
        <el-input v-model="queryParams.toolName"
                  placeholder="请输入工具名称"
                  clearable
                  @keyup.enter.native="handleQuery" />
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
                   v-hasPermi="['yixiu:tool:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:tool:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:tool:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:tool:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="toolList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="工具id"
                       align="center"
                       prop="toolId" />
      <el-table-column label="单位名称"
                       align="center"
                       prop="deptName" />
      <el-table-column label="工具名称"
                       align="center"
                       prop="toolName" />
      <el-table-column label="规格型号"
                       align="center"
                       prop="model" />
      <el-table-column label="数量"
                       align="center"
                       prop="number" />
      <el-table-column label="性能"
                       align="center"
                       prop="performance" />
      <el-table-column label="用途"
                       align="center"
                       prop="purpose" />
      <el-table-column label="技术指标"
                       align="center"
                       prop="technical" />
      <el-table-column label="推荐厂家及理由"
                       align="center"
                       prop="reason" />
      <el-table-column label="工具价格"
                       align="center"
                       prop="toolPrice" />
      <el-table-column label="申请科室意见"
                       align="center"
                       prop="deptOpinion" />
      <el-table-column label="工程部意见"
                       align="center"
                       prop="engineeringOpinion" />
      <el-table-column label="相关科室意见"
                       align="center"
                       prop="correlationDeptOpinion" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:tool:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:tool:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改工具对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="归属单位"
                          prop="deptId">
              <treeselect v-model="form.deptId"
                          :options="deptOptions"
                          :show-count="true"
                          @input="customBlurValidate('deptId')"
                          placeholder="请选择归属单位" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工具名称"
                          prop="toolName">
              <el-input v-model="form.toolName"
                        placeholder="请输入工具名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="规格型号"
                          prop="model">
              <el-input v-model="form.model"
                        placeholder="请输入规格型号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="数量"
                          prop="number">
              <el-input v-model="form.number"
                        placeholder="请输入数量" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工具价格"
                          prop="toolPrice">
              <el-input v-model="form.toolPrice"
                        placeholder="请输入工具价格" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用途"
                          prop="purpose">
              <el-input v-model="form.purpose"
                        placeholder="请输入用途" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="技术指标"
                          prop="technical">
              <el-input v-model="form.technical"
                        placeholder="请输入技术指标" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="性能"
                          prop="performance">
              <el-input v-model="form.performance"
                        placeholder="请输入性能" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="推荐厂家及理由"
                          prop="reason">
              <el-input v-model="form.reason"
                        type="textarea"
                        placeholder="请输入推荐厂家及理由" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="申请科室意见"
                          prop="deptOpinion">
              <el-input v-model="form.deptOpinion"
                        type="textarea"
                        placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工程部意见"
                          prop="engineeringOpinion">
              <el-input v-model="form.engineeringOpinion"
                        type="textarea"
                        placeholder="请输入内容" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="相关科室意见"
                          prop="correlationDeptOpinion">
              <el-input v-model="form.correlationDeptOpinion"
                        type="textarea"
                        placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>

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
import { listTool, getTool, delTool, addTool, updateTool } from "@/api/yixiu/tool";
import { deptTreeSelect } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
export default {
  name: "Tool",
  components: { Treeselect },
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
      // 工具表格数据
      toolList: [],
      // 归属单位下拉选项 
      deptOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        toolName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        toolId: [
          { required: true, message: "工具id不能为空", trigger: "blur" }
        ],
        deptId: [
          { required: true, message: "单位id不能为空", trigger: "blur" }
        ],
        toolName: [
          { required: true, message: "工具名称不能为空", trigger: "blur" }
        ],
        model: [
          { required: true, message: "规格型号不能为空", trigger: "blur" }
        ],
        number: [
          { required: true, message: "数量不能为空", trigger: "blur" }
        ],
        technical: [
          { required: true, message: "技术指标不能为空", trigger: "blur" }
        ],
        toolPrice: [
          { required: true, message: "工具价格不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询工具列表 */
    getList () {
      this.loading = true;
      listTool(this.queryParams).then(response => {
        this.toolList = response.rows;
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
        toolId: null,
        deptId: null,
        toolName: null,
        model: null,
        number: null,
        performance: null,
        purpose: null,
        technical: null,
        reason: null,
        toolPrice: null,
        deptOpinion: null,
        engineeringOpinion: null,
        correlationDeptOpinion: null,
        stauts: null,
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
      this.ids = selection.map(item => item.toolId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    customBlurValidate (prop) {
      this.$refs["form"].clearValidate(prop)
    },
    /** 新增按钮操作 */
    handleAdd () {
      deptTreeSelect({}).then(res => {
        this.reset();
        this.open = true;
        this.title = "添加工具";
        this.deptOptions = res.data;
      })
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const toolId = row.toolId || this.ids

      Promise.all([
        deptTreeSelect({}),
        getTool(toolId)
      ]).then(res => {
        this.reset();
        this.open = true;
        this.title = "修改工具";
        this.deptOptions = res[0].data;
        this.form = res[1].data;
      })
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.toolId != null) {
            updateTool(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTool(this.form).then(response => {
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
      const toolIds = row.toolId || this.ids;
      this.$modal.confirm('是否确认删除工具编号为"' + toolIds + '"的数据项？').then(function () {
        return delTool(toolIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/tool/export', {
        ...this.queryParams
      }, `tool_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
