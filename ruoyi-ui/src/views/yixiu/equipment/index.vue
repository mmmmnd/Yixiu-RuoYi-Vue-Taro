<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4"
              :xs="24">
        <div class="head-container">
          <el-input v-model="deptName"
                    placeholder="请输入部门名称"
                    clearable
                    size="small"
                    prefix-icon="el-icon-search"
                    style="margin-bottom: 20px" />
        </div>
        <div class="head-container">
          <el-tree :data="deptOptions"
                   :props="defaultProps"
                   :expand-on-click-node="false"
                   :filter-node-method="filterNode"
                   ref="tree"
                   node-key="id"
                   default-expand-all
                   highlight-current
                   @node-click="handleNodeClick" />
        </div>
      </el-col>
      <el-col :span="20"
              :xs="24">
        <el-form :model="queryParams"
                 ref="queryForm"
                 size="small"
                 :inline="true"
                 v-show="showSearch"
                 label-width="68px">
          <el-form-item label="设备名称"
                        prop="equipmentName">
            <el-input v-model="queryParams.equipmentName"
                      placeholder="请输入设备名称"
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
          <el-form-item label="购买时间"
                        prop="purchaseTime">
            <el-date-picker clearable
                            v-model="queryParams.purchaseTime"
                            type="date"
                            value-format="yyyy-MM-dd"
                            placeholder="请选择购买时间">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="报废时间"
                        prop="scrapTime">
            <el-date-picker clearable
                            v-model="queryParams.scrapTime"
                            type="date"
                            value-format="yyyy-MM-dd"
                            placeholder="请选择报废时间">
            </el-date-picker>
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
                       v-hasPermi="['yixiu:equipment:add']">新增</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="success"
                       plain
                       icon="el-icon-edit"
                       size="mini"
                       :disabled="single"
                       @click="handleUpdate"
                       v-hasPermi="['yixiu:equipment:edit']">修改</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger"
                       plain
                       icon="el-icon-delete"
                       size="mini"
                       :disabled="multiple"
                       @click="handleDelete"
                       v-hasPermi="['yixiu:equipment:remove']">删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="warning"
                       plain
                       icon="el-icon-download"
                       size="mini"
                       @click="handleExport"
                       v-hasPermi="['yixiu:equipment:export']">导出</el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch"
                         @queryTable="getList"></right-toolbar>

        </el-row>

        <el-table v-loading="loading"
                  :data="equipmentList"
                  @selection-change="handleSelectionChange">
          <el-table-column type="selection"
                           width="55"
                           align="center" />
          <el-table-column label="序号"
                           align="center"
                           prop="equipmentId" />
          <el-table-column label="上级单位"
                           align="center"
                           prop="dept.parentName" />
          <el-table-column label="归属单位"
                           align="center"
                           prop="dept.deptName" />
          <el-table-column label="设备名称"
                           align="center"
                           prop="equipmentName" />
          <el-table-column label="序列号"
                           align="center"
                           prop="serialNumber" />
          <el-table-column label="出厂编号"
                           align="center"
                           prop="factoryNumber" />
          <el-table-column label="设备型号"
                           align="center"
                           prop="modelNumber" />
          <el-table-column label="品牌"
                           align="center"
                           prop="brand" />
          <el-table-column label="价格"
                           align="center"
                           prop="price" />
          <el-table-column label="购买时间"
                           align="center"
                           prop="purchaseTime"
                           width="180">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.purchaseTime, '{y}-{m}-{d}') }}</span>
            </template>
          </el-table-column>
          <el-table-column label="报废时间"
                           align="center"
                           prop="scrapTime"
                           width="180">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.scrapTime, '{y}-{m}-{d}') }}</span>
            </template>
          </el-table-column>
          <el-table-column label="保养预警"
                           align="center"
                           prop="maintain" />
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
                         v-hasPermi="['yixiu:equipment:edit']">修改</el-button>
              <el-button size="mini"
                         type="text"
                         icon="el-icon-delete"
                         @click="handleDelete(scope.row)"
                         v-hasPermi="['yixiu:equipment:remove']">删除</el-button>
              <el-dropdown size="mini"
                           @command="(command) => handleCommand(command, scope.row)"
                           v-hasPermi="['system:user:resetPwd', 'system:user:edit']">
                <el-button size="mini"
                           type="text"
                           icon="el-icon-d-arrow-right">更多</el-button>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item command="handleQrCode"
                                    icon="el-icon-postcard"
                                    v-hasPermi="['yixiu:equipment:qrCode']">设备二维码</el-dropdown-item>
                  <el-dropdown-item command="handleAuthRole"
                                    icon="el-icon-s-order"
                                    v-hasPermi="['system:user:edit']">设备记录</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </template>
          </el-table-column>
        </el-table>

        <pagination v-show="total>0"
                    :total="total"
                    :page.sync="queryParams.pageNum"
                    :limit.sync="queryParams.pageSize"
                    @pagination="getList" />

      </el-col>

    </el-row>

    <!-- 添加或修改设备列表对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="500px"
               append-to-body>
      <el-form ref="form"
               :model="form"
               :rules="rules"
               label-width="80px">
        <el-form-item label="归属单位"
                      prop="deptId">
          <treeselect v-model="form.deptId"
                      :options="deptOptions"
                      :show-count="true"
                      placeholder="请选择归属单位" />
        </el-form-item>
        <el-form-item label="设备名称"
                      prop="equipmentName">
          <el-input v-model="form.equipmentName"
                    placeholder="请输入设备名称" />
        </el-form-item>
        <el-form-item label="序列号"
                      prop="serialNumber">
          <el-input v-model="form.serialNumber"
                    placeholder="请输入序列号" />
        </el-form-item>
        <el-form-item label="出厂编号"
                      prop="factoryNumber">
          <el-input v-model="form.factoryNumber"
                    placeholder="请输入出厂编号" />
        </el-form-item>
        <el-form-item label="设备型号"
                      prop="modelNumber">
          <el-input v-model="form.modelNumber"
                    placeholder="请输入设备型号" />
        </el-form-item>
        <el-form-item label="品牌"
                      prop="brand">
          <el-input v-model="form.brand"
                    placeholder="请输入品牌" />
        </el-form-item>
        <el-form-item label="价格"
                      prop="price">
          <el-input v-model="form.price"
                    placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="购买时间"
                      prop="purchaseTime">
          <el-date-picker clearable
                          v-model="form.purchaseTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择购买时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="报废时间"
                      prop="scrapTime">
          <el-date-picker clearable
                          v-model="form.scrapTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择报废时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="保养预警"
                      prop="maintain">
          <el-input v-model="form.maintain"
                    placeholder="请输入保养预警" />
        </el-form-item>
        <el-form-item label="备注"
                      prop="remark">
          <el-input v-model="form.remark"
                    type="textarea"
                    placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button type="primary"
                   @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 设备二维码 -->
    <el-dialog :title="title"
               :visible.sync="qrCodeOpen"
               width="400px"
               append-to-body>
      <div ref="imageCanvas">
        <p style="width: 1px;position: absolute;left: 25px;font-size: 44px;line-height: 44px;top: 65px;">扫码报修</p>
        <img :src="equipment.srcUrl"
             style="margin-left: 12%;height: 200px;margin: 0 auto;display: block;" />
        <p style="width: 1px;position: absolute;right: 65px;font-size: 44px;line-height: 44px;top: 65px;">扫码报修</p>
        <div style="font-size: 24px;line-height: 0;display: flex;">
          <p style="flex: 0 0 120px;text-align: right;">医院名称:</p>
          <p>{{equipment.parentName}}</p>
        </div>
        <div style="font-size: 24px;line-height: 0;display: flex;">
          <p style="flex: 0 0 120px;text-align: right;">设备名称:</p>
          <p>{{equipment.equipmentName}}</p>
        </div>
        <div style="font-size: 24px;line-height: 0;display: flex;">
          <p style="flex: 0 0 120px;text-align: right;">科室名称:</p>
          <p>{{equipment.deptName}}</p>
        </div>
      </div>
      <span slot="footer"
            class="dialog-footer">
        <el-button @click="qrCodeOpen = false">取 消</el-button>
        <el-button type="primary"
                   @click="saveCanvas">确 定</el-button>
      </span>
    </el-dialog>

  </div>
</template>

<script>
import { listEquipment, getEquipment, delEquipment, addEquipment, updateEquipment, qrCodeEquipment } from "@/api/yixiu/equipment";
import { deptTreeSelect } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import html2canvas from 'html2canvas'
export default {
  name: "Equipment",
  dicts: ['sys_normal_disable'],
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
      // 设备列表表格数据
      equipmentList: [],
      // 弹出层标题
      title: "",
      // 归属单位下拉选项 
      deptOptions: undefined,
      // 是否显示弹出层
      open: false,
      // 设备二维码弹窗
      qrCodeOpen: false,
      // 部门名称
      deptName: undefined,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        equipmentName: null,
        serialNumber: null,
        factoryNumber: null,
        modelNumber: null,
        brand: null,
        price: null,
        purchaseTime: null,
        scrapTime: null,
        maintain: null,
        status: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 设备信息
      equipment: {
        srcUrl: undefined,
        parentName: "",
        name: "",
        departmentName: ""
      },
      // 表单校验
      rules: {
        equipmentName: [
          { required: true, message: "设备名称不能为空", trigger: "blur" }
        ],
        serialNumber: [
          { required: true, message: "序列号不能为空", trigger: "blur" }
        ],
        factoryNumber: [
          { required: true, message: "出厂编号不能为空", trigger: "blur" }
        ],
        modelNumber: [
          { required: true, message: "设备型号不能为空", trigger: "blur" }
        ],
        brand: [
          { required: true, message: "品牌不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "价格不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
    this.getDeptTree();
  },
  methods: {
    /** 查询设备列表列表 */
    getList () {
      this.loading = true;
      listEquipment(this.queryParams).then(response => {
        this.equipmentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询部归属单位下拉树结构 */
    getDeptTree () {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
      });
    },
    // 筛选节点
    filterNode (value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick (data) {
      this.queryParams.deptId = data.id;
      this.handleQuery();
    },
    // 取消按钮
    cancel () {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset () {
      this.form = {
        equipmentId: null,
        deptId: null,
        equipmentName: null,
        serialNumber: null,
        factoryNumber: null,
        modelNumber: null,
        brand: null,
        price: null,
        purchaseTime: null,
        scrapTime: null,
        maintain: null,
        status: "0",
        remark: null,
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
      this.queryParams.deptId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.ids = selection.map(item => item.equipmentId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 更多操作触发
    handleCommand (command, row) {
      switch (command) {
        case "handleQrCode":
          this.handleQrCode(row);
          break;
        case "handleAuthRole":
          this.handleAuthRole(row);
          break;
        default:
          break;
      }
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.open = true;
      this.title = "添加设备列表";
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const equipmentId = row.equipmentId || this.ids
      getEquipment(equipmentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改设备列表";
      });
    },
    /* 设备二维码 */
    handleQrCode (row) {
      const param = "equipmentId=" + row.equipmentId;
      qrCodeEquipment(param).then(res => {
        this.qrCodeOpen = true;
        this.title = "设备二维码";
        this.equipment.srcUrl = "data:image/png;base64," + res.data
        this.equipment.parentName = row.dept.parentName
        this.equipment.equipmentName = row.equipmentName
        this.equipment.deptName = row.dept.deptName
      })
    },
    /* 调整Canvas */
    getPixelRatio (context) {
      var backingStore = context.backingStorePixelRatio ||
        context.webkitBackingStorePixelRatio ||
        context.mozBackingStorePixelRatio ||
        context.msBackingStorePixelRatio ||
        context.oBackingStorePixelRatio ||
        context.backingStorePixelRatio || 0.5;
      return (window.devicePixelRatio || 0.5) / backingStore;
    },
    /* 下载图片 */
    saveCanvas () {
      var imgName = `医院:${this.equipment.parentName}-设备名称:${this.equipment.equipmentName}-科室:${this.equipment.deptName}.png`;
      var shareContent = this.$refs.imageCanvas;
      var width = shareContent.offsetWidth;
      var height = shareContent.offsetHeight;
      var canvas = document.createElement("canvas");
      var context = canvas.getContext('2d');
      var scale = this.getPixelRatio(context); //将canvas的容器扩大PixelRatio倍，再将画布缩放，将图像放大PixelRatio倍。
      canvas.width = width * 2
      canvas.height = height * 2
      canvas.style.width = width / 2 + 'px'
      canvas.style.height = height / 2 + 'px'
      context.scale(scale, scale);

      const options = {
        backgroundColor: null,
        canvas: canvas,
        useCORS: true
      }

      html2canvas(shareContent, options).then(function (canvas) {
        context.imageSmoothingEnabled = false;
        context.webkitImageSmoothingEnabled = false;
        context.msImageSmoothingEnabled = false;
        context.imageSmoothingEnabled = false;
        const dataUrl = canvas.toDataURL('image/png', 1.0);
        const a = document.createElement("a");
        const event = new MouseEvent("click");
        a.download = imgName;
        a.href = dataUrl;
        a.dispatchEvent(event);
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.equipmentId != null) {
            updateEquipment(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEquipment(this.form).then(response => {
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
      const equipmentIds = row.equipmentId || this.ids;
      this.$modal.confirm('是否确认删除设备列表编号为"' + equipmentIds + '"的数据项？').then(function () {
        return delEquipment(equipmentIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/equipment/export', {
        ...this.queryParams
      }, `equipment_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
