<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="耗材名称"
                    prop="materialName">
        <el-input v-model="queryParams.materialName"
                  placeholder="请输入耗材名称"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="品牌"
                    prop="brand">
        <el-input v-model="queryParams.brand"
                  placeholder="请输入品牌"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="耗材类型"
                    prop="status">
        <el-select v-model="queryParams.status"
                   placeholder="请选择耗材类型"
                   clearable>
          <el-option v-for="dict in dict.type.mzc_material_status"
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
                   v-hasPermi="['yixiu:material:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:material:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:material:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:material:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="materialList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="耗材id"
                       align="center"
                       prop="materialId" />
      <el-table-column label="设备名称"
                       align="center"
                       prop="equipmentName" />
      <el-table-column label="供应商名称"
                       align="center"
                       prop="supplierName" />
      <el-table-column label="耗材名称"
                       align="center"
                       prop="materialName" />
      <el-table-column label="品牌"
                       align="center"
                       prop="brand" />
      <el-table-column label="耗材类型"
                       align="center"
                       prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.mzc_material_status"
                    :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="备注"
                       align="center"
                       prop="remark" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:material:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:material:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改耗材对话框 -->
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
            <el-form-item label="供应商"
                          prop="supplierId">
              <el-select v-model="form.supplierId"
                         placeholder="请选择供应商"
                         @blur="customBlurValidate('supplierId')">
                <el-option v-for="item in supplierOptions"
                           :key="item.supplierId"
                           :label="item.supplierName"
                           :value="item.supplierId"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="耗材名称"
                          prop="materialName">
              <el-input v-model="form.materialName"
                        placeholder="请输入耗材名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="品牌"
                          prop="brand">
              <el-input v-model="form.brand"
                        placeholder="请输入品牌" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="耗材类型">
              <el-radio-group v-model="form.status">
                <el-radio v-for="dict in dict.type.mzc_material_status"
                          :key="dict.value"
                          :label="dict.value">{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="备注"
                          prop="remark">
              <el-input v-model="form.remark"
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
import { listMaterial, getMaterial, delMaterial, addMaterial, updateMaterial } from "@/api/yixiu/material";
import { listEquipment } from "@/api/yixiu/equipment";
import { listSupplier } from "@/api/yixiu/supplier";
export default {
  name: "Material",
  dicts: ['mzc_material_status'],
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
      // 耗材表格数据
      materialList: [],
      // 设备列表数据
      scrapOptions: [],
      // 供应商列表数据
      supplierOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        equipmentId: null,
        supplierId: null,
        materialName: null,
        brand: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        equipmentId: [
          { required: true, message: "设备id不能为空", trigger: "blur" }
        ],
        supplierId: [
          { required: true, message: "供应商不能为空", trigger: "blur" }
        ],
        materialName: [
          { required: true, message: "耗材名称不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "耗材类型 ( 0 普通耗材 1专用耗材 )不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    /** 查询耗材列表 */
    getList () {
      this.loading = true;
      listMaterial(this.queryParams).then(response => {
        this.materialList = response.rows;
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
        materialId: null,
        equipmentId: null,
        supplierId: null,
        materialName: null,
        brand: null,
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
      this.ids = selection.map(item => item.materialId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 失去焦点校验
    customBlurValidate (prop) {
      this.$refs["form"].clearValidate(prop)
    },
    /** 新增按钮操作 */
    handleAdd () {
      const param = { pageNum: 1, pageSize: 9999 };

      Promise.all([listEquipment(param), listSupplier(param)])
        .then(res => {
          this.reset();
          this.open = true;
          this.title = "添加耗材";
          this.scrapOptions = res[0].rows;
          this.supplierOptions = res[1].rows;
        })
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      const param = { pageNum: 1, pageSize: 9999 };
      const materialId = row.materialId || this.ids

      Promise.all([listEquipment(param), listSupplier(param), getMaterial(materialId)]).then(res => {
        this.reset();
        this.open = true;
        this.title = "修改耗材";
        this.scrapOptions = res[0].rows;
        this.supplierOptions = res[1].rows;
        this.form = res[2].data;
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.materialId != null) {
            updateMaterial(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMaterial(this.form).then(response => {
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
      const materialIds = row.materialId || this.ids;
      this.$modal.confirm('是否确认删除耗材编号为"' + materialIds + '"的数据项？').then(function () {
        return delMaterial(materialIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/material/export', {
        ...this.queryParams
      }, `material_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
