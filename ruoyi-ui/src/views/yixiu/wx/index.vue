<template>
  <div class="app-container">
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
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
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['yixiu:wx:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['yixiu:wx:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['yixiu:wx:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="wxList"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="微信用户id"
                       align="center"
                       prop="wxUserId" />
      <el-table-column label="系统用户id"
                       align="center"
                       prop="userId" />
      <el-table-column label="微信openid"
                       align="center"
                       prop="wxOpenId" />
      <el-table-column label="昵称"
                       align="center"
                       prop="nickname" />
      <el-table-column label="联系电话"
                       align="center"
                       prop="phone" />
      <el-table-column label="性别"
                       align="center"
                       prop="sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex"
                    :value="scope.row.sex" />
        </template>
      </el-table-column>
      <el-table-column label="头像"
                       align="center"
                       prop="avatar"
                       width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.avatar"
                         :width="50"
                         :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="帐号状态"
                       align="center"
                       prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable"
                    :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="删除标志"
                       align="center"
                       prop="delFlag">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable"
                    :value="scope.row.delFlag" />
        </template>
      </el-table-column>
      <el-table-column label="最后登录IP"
                       align="center"
                       prop="loginIp" />
      <el-table-column label="最后登录时间"
                       align="center"
                       prop="loginDate"
                       width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.loginDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['yixiu:wx:edit']">修改</el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['yixiu:wx:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改微信用户对话框 -->
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
import { listWx, getWx, delWx, addWx, updateWx } from "@/api/yixiu/wx";

export default {
  name: "Wx",
  dicts: ['sys_user_sex', 'sys_normal_disable'],
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
      // 微信用户表格数据
      wxList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
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
    /** 查询微信用户列表 */
    getList () {
      this.loading = true;
      listWx(this.queryParams).then(response => {
        this.wxList = response.rows;
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
        wxUserId: null,
        userId: null,
        wxOpenId: null,
        nickname: null,
        phone: null,
        sex: "0",
        avatar: null,
        remark: null,
        status: "0",
        delFlag: null,
        loginIp: null,
        loginDate: null,
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
      this.ids = selection.map(item => item.wxUserId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.open = true;
      this.title = "添加微信用户";
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const wxUserId = row.wxUserId || this.ids
      getWx(wxUserId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改微信用户";
      });
    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.wxUserId != null) {
            updateWx(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWx(this.form).then(response => {
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
      const wxUserIds = row.wxUserId || this.ids;
      this.$modal.confirm('是否确认删除微信用户编号为"' + wxUserIds + '"的数据项？').then(function () {
        return delWx(wxUserIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('yixiu/wx/export', {
        ...this.queryParams
      }, `wx_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
