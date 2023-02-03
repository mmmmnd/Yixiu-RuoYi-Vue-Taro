<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="状态"
                    prop="status">
        <el-select v-model="queryParams.status"
                   placeholder="请选择状态"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_scrap_status"
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
                   v-hasPermi="['yixiu:scrap:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:scrap:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:scrap:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:scrap:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="scrapList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="序号"
                       type="index"
                       width="50"
                       align="center">
        <template slot-scope="scope">
          <span>{{(queryParams.pageNum - 1) * queryParams.pageSize + scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column label="报废编号"
                       align="center"
                       prop="number" />
      <el-table-column label="上级单位"
                       align="center"
                       prop="parentName" />
      <el-table-column label="归属单位"
                       align="center"
                       prop="deptName" />
      <el-table-column label="联系人"
                       align="center"
                       prop="nickname" />
      <el-table-column label="联系电话"
                       align="center"
                       prop="phone" />
      <el-table-column label="报废原因"
                       align="center"
                       prop="cause" />
      <el-table-column label="报废情况记录"
                       align="center"
                       prop="record" />
      <el-table-column label="部门意见"
                       align="center"
                       prop="deptOpinion" />
      <el-table-column label="设备部门意见"
                       align="center"
                       prop="equipmentOpinion" />
      <el-table-column label="院长意见"
                       align="center"
                       prop="presidentOpinion" />
      <el-table-column label="分院长意见"
                       align="center"
                       prop="subPresident" />
      <el-table-column label="状态"
                       align="center"
                       prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_scrap_status"
                    :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="申请日期"
                       align="center"
                       prop="createTime" />
      <el-table-column label="申请人"
                       align="center"
                       prop="createBy" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:scrap:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:scrap:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改报废申请对话框 -->
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
                          prop="deptId">
              <treeselect v-model="form.deptId"
                          :options="deptOptions"
                          :show-count="true"
                          @input="customBlurValidate('deptId')"
                          @select="onDeptSelect"
                          placeholder="请选择归属单位" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备列表"
                          prop="equipmentIds">
              <el-select v-model="form.equipmentIds"
                         multiple
                         placeholder="请选择设备列表"
                         @blur="customBlurValidate('equipmentIds')">
                <el-option v-for="item in scrapOptions"
                           :key="item.equipmentId"
                           :label="item.equipmentName"
                           :value="item.equipmentId"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="联系人"
                          prop="nickname">
              <el-input v-model="form.nickname"
                        placeholder="请输入联系人" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系电话"
                          prop="phone">
              <el-input v-model="form.phone"
                        placeholder="请输入联系电话" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="报废原因"
                          prop="cause">
              <el-input v-model="form.cause"
                        type="textarea"
                        placeholder="请输入报废原因" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="报废情况"
                          prop="record">
              <el-input v-model="form.record"
                        type="textarea"
                        placeholder="请输入报废情况记录" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="部门"
                          prop="deptOpinion">
              <el-input v-model="form.deptOpinion"
                        type="textarea"
                        placeholder="请输入部门意见" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备部门"
                          prop="equipmentOpinion">
              <el-input v-model="form.equipmentOpinion"
                        type="textarea"
                        placeholder="请输入设备部门意见" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="院长"
                          prop="presidentOpinion">
              <el-input v-model="form.presidentOpinion"
                        type="textarea"
                        placeholder="请输入院长意见" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="分院长"
                          prop="subPresident">
              <el-input v-model="form.subPresident"
                        type="textarea"
                        placeholder="请输入分院长意见" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.scrapId != null">
          <el-col :span="24">
            <el-form-item label="状态">
              <el-radio-group v-model="form.status">
                <el-radio v-for="dict in dict.type.mzc_scrap_status"
                          :key="dict.value"
                          :label="dict.value"
                          :disabled="form.updateTime != null"
                          v-show="dict.value != 0">{{dict.label}}</el-radio>
              </el-radio-group>
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
import { listScrap, getScrap, delScrap, addScrap, updateScrap } from "@/api/yixiu/scrap";
import { deptTreeSelect } from "@/api/system/user";
import { listEquipment, getDeptEquipmentList } from "@/api/yixiu/equipment";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
export default {
  name: "Scrap",
  dicts: ['mzc_scrap_status'],
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
      // 报废申请表格数据
      scrapList: [],
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
        number: null,
        nickname: null,
        phone: null,
        cause: null,
        record: null,
        deptOpinion: null,
        equipmentOpinion: null,
        presidentOpinion: null,
        subPresident: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        deptId: [
          { required: true, message: "请选择归属单位", trigger: "blur" }
        ],
        equipmentIds: [
          { required: true, message: "请选择设备列表", trigger: "blur" }
        ],
        equipmentId: [
          { required: true, message: "设备列表不能为空", trigger: "blur" }
        ],
        nickname: [
          { required: true, message: "联系人不能为空", trigger: "blur" }
        ],
        phone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" },
          { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }
        ],
        cause: [
          { required: true, message: "报废原因不能为空", trigger: "blur" }
        ],
        record: [
          { required: true, message: "报废情况不能为空", trigger: "blur" }
        ],
        deptOpinion: [
          { required: true, message: "部门不能为空", trigger: "blur" }
        ],
        equipmentOpinion: [
          { required: true, message: "设备部门不能为空", trigger: "blur" }
        ],
        presidentOpinion: [
          { required: true, message: "院长不能为空", trigger: "blur" }
        ],
        subPresident: [
          { required: true, message: "分院长不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询报废申请列表 */
    getList () {
      this.loading = true;
      listScrap(this.queryParams).then(response => {
        this.scrapList = response.rows;
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
        scrapId: null,
        equipmentId: null,
        number: null,
        nickname: null,
        phone: null,
        cause: null,
        record: null,
        deptOpinion: null,
        equipmentOpinion: null,
        presidentOpinion: null,
        subPresident: null,
        status: "1",
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
      this.ids = selection.map(item => item.scrapId)
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
      deptTreeSelect({}).then(res => {
        this.reset();
        this.open = true;
        this.title = "添加报废申请";
        this.deptOptions = res.data;
      })
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const scrapId = row.scrapId || this.ids
      Promise.all([
        deptTreeSelect({}),
        listEquipment({ pageNum: 1, pageSize: 9999 }),
        getScrap(scrapId)
      ]).then(res => {
        this.reset();
        this.open = true;
        this.title = "修改报废申请编号:" + res[2].data.number;
        this.deptOptions = res[0].data;
        this.scrapOptions = res[1].rows;
        this.form = res[2].data;
      })

    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.scrapId != null) {
            updateScrap(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addScrap(this.form).then(response => {
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
      const scrapIds = row.scrapId || this.ids;
      this.$modal.confirm('是否确认删除报废申请编号为"' + scrapIds + '"的数据项？').then(function () {
        return delScrap(scrapIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/scrap/export', {
        ...this.queryParams
      }, `scrap_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
