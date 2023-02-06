<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="借用目的"
                    prop="cause">
        <el-input v-model="queryParams.cause"
                  placeholder="请输入借用目的"
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
                   v-hasPermi="['yixiu:deploy:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:deploy:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:deploy:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:deploy:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="deployList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="调配id"
                       align="center"
                       prop="deployId" />
      <el-table-column label="设备id"
                       align="center"
                       prop="equipmentId" />
      <el-table-column label="申请单位"
                       align="center"
                       prop="deptIdInName" />
      <el-table-column label="借配单位"
                       align="center"
                       prop="deptIdOutName" />
      <el-table-column label="借用目的"
                       align="center"
                       prop="cause" />
      <el-table-column label="分管领导意见"
                       align="center"
                       prop="leaderOpinion" />
      <el-table-column label="调出部门负责人意见"
                       align="center"
                       prop="departmentOpinion" />
      <el-table-column label="设备管理部负责人意见"
                       align="center"
                       prop="equipmentOpinion" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:deploy:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:deploy:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改借配对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="600px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="归属单位"
                          prop="deptIdIn">
              <treeselect v-model="form.deptIdIn"
                          :options="deptOptions"
                          :show-count="true"
                          @select="onDeptSelect"
                          @input="customBlurValidate('deptIdIn')"
                          placeholder="请选择归属单位" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="借配单位"
                          prop="deptIdOut">
              <treeselect v-model="form.deptIdOut"
                          :options="deptOptions"
                          :show-count="true"
                          @input="customBlurValidate('deptIdOut')"
                          placeholder="请选择借配单位" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备列表"
                          prop="equipmentId">
              <el-select v-model="form.equipmentId"
                         placeholder="请选择设备"
                         @blur="customBlurValidate('equipmentId')">
                <el-option v-for="item in scrapOptions"
                           :key="item.equipmentId"
                           :label="item.equipmentName"
                           :value="item.equipmentId"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="借用目的"
                          prop="cause">
              <el-input v-model="form.cause"
                        placeholder="请输入借用目的" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="分管领导意见"
                      prop="leaderOpinion">
          <el-input v-model="form.leaderOpinion"
                    type="textarea"
                    placeholder="分管领导意见" />
        </el-form-item>
        <el-form-item label="调出部门负责人"
                      prop="departmentOpinion">
          <el-input v-model="form.departmentOpinion"
                    type="textarea"
                    placeholder="调出部门负责人意见" />
        </el-form-item>
        <el-form-item label="设备管理部负责人"
                      prop="equipmentOpinion">
          <el-input v-model="form.equipmentOpinion"
                    type="textarea"
                    placeholder="设备管理部负责人意见" />
        </el-form-item>
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
import { listDeploy, getDeploy, delDeploy, addDeploy, updateDeploy } from "@/api/yixiu/deploy";
import { deptTreeSelect } from "@/api/system/user";
import { listEquipment, getDeptEquipmentList } from "@/api/yixiu/equipment";

import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
export default {
  name: "Deploy",
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
      // 借配表格数据
      deployList: [],
      // 设备列表数据
      scrapOptions: [],
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
        equipmentId: null,
        cause: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        equipmentId: [
          { required: true, message: "设备id不能为空", trigger: "change" }
        ],
        deptIdIn: [
          { required: true, message: "申请单位id不能为空", trigger: "change" }
        ],
        deptIdOut: [
          { required: true, message: "借配单位id不能为空", trigger: "change" }
        ],
        cause: [
          { required: true, message: "借用目的不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询借配列表 */
    getList () {
      this.loading = true;
      listDeploy(this.queryParams).then(response => {
        this.deployList = response.rows;
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
        deployId: null,
        equipmentId: null,
        deptIdIn: null,
        deptIdOut: null,
        cause: null,
        leaderOpinion: null,
        departmentOpinion: null,
        equipmentOpinion: null,
        status: "0",
        remark: null,
        delFlag: null,
        deleteBy: null,
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
      this.ids = selection.map(item => item.deployId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 失去焦点校验
    customBlurValidate (prop) {
      this.$refs["form"].clearValidate(prop)
    },
    onDeptSelect (e) {
      getDeptEquipmentList({ deptId: e.id }).then(res => {
        this.scrapOptions = res.data
        this.form.equipmentIds = []
      })
    },
    /** 新增按钮操作 */
    handleAdd () {
      const param = { pageNum: 1, pageSize: 9999 };

      deptTreeSelect(param).then(res => {
        this.reset();
        this.open = true;
        this.title = "添加借配";

        this.deptOptions = res.data;
      });
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      const param = { pageNum: 1, pageSize: 9999 };
      const deployId = row.deployId || this.ids

      Promise.all([
        deptTreeSelect({}),
        listEquipment(param),
        getDeploy(deployId)
      ]).then(res => {
        this.reset();
        this.open = true;
        this.title = "修改借配";
        this.deptOptions = res[0].data;
        this.scrapOptions = res[1].rows;
        this.form = res[2].data;
      })
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.deployId != null) {
            updateDeploy(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDeploy(this.form).then(response => {
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
      const deployIds = row.deployId || this.ids;
      this.$modal.confirm('是否确认删除借配编号为"' + deployIds + '"的数据项？').then(function () {
        return delDeploy(deployIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/deploy/export', {
        ...this.queryParams
      }, `deploy_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
