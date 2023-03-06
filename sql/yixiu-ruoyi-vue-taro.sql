/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : yixiu-ruoyi-vue-taro

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 06/03/2023 10:57:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'mzc_equipment', '设备表', '', '', 'MzcEquipment', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'equipment', '设备列表', 'mmmmnd', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21', NULL);
INSERT INTO `gen_table` VALUES (6, 'mzc_equi_scrap', '设备报废关联表', '', '', 'MzcEquiScrap', 'tree', 'com.ruoyi.yixiu', 'yixiu', 'scrap', '设备报废关联', 'mmmmnd', '0', '/', '{\"treeCode\":\"scrap_id\",\"treeName\":\"scrap_id\",\"treeParentCode\":\"scrap_id\"}', 'admin', '2023-01-30 16:19:51', '', '2023-02-01 09:30:53', NULL);
INSERT INTO `gen_table` VALUES (7, 'mzc_scrap', '报废', '', '', 'MzcScrap', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'scrap', '报废申请', 'mmmmnd', '0', '/', '{}', 'admin', '2023-01-30 16:19:51', '', '2023-01-30 17:29:32', NULL);
INSERT INTO `gen_table` VALUES (8, 'mzc_material', '耗材', '', '', 'MzcMaterial', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'material', '耗材', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03', NULL);
INSERT INTO `gen_table` VALUES (9, 'mzc_supplier', '供应商', NULL, NULL, 'MzcSupplier', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'supplier', '供应商', 'mmmmnd', '0', '/', '{\"parentMenuId\":\"2014\"}', 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24', NULL);
INSERT INTO `gen_table` VALUES (10, 'mzc_complaint', '投诉', NULL, NULL, 'MzcComplaint', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'complaint', '投诉', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41', NULL);
INSERT INTO `gen_table` VALUES (11, 'mzc_burst', '不良事件', '', '', 'MzcBurst', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'burst', '不良事件', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36', NULL);
INSERT INTO `gen_table` VALUES (12, 'mzc_deploy', '借配', NULL, NULL, 'MzcDeploy', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'deploy', '借配', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41', NULL);
INSERT INTO `gen_table` VALUES (13, 'mzc_parts', '配件申请', NULL, NULL, 'MzcParts', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'parts', '配件申请', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44', NULL);
INSERT INTO `gen_table` VALUES (14, 'mzc_tool', '工具', NULL, NULL, 'MzcTool', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'tool', '工具', 'mmmmnd', '0', '/', '{\"parentMenuId\":2045}', 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40', NULL);
INSERT INTO `gen_table` VALUES (15, 'mzc_inventory', '配件清单', NULL, NULL, 'MzcInventory', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'inventory', '配件清单', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39', NULL);
INSERT INTO `gen_table` VALUES (16, 'mzc_reimbursement', '报销', NULL, NULL, 'MzcReimbursement', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'reimbursement', '报销', 'mmmmnd', '0', '/', '{\"parentMenuId\":\"2065\"}', 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56', NULL);
INSERT INTO `gen_table` VALUES (17, 'mzc_invoice', '发票', NULL, NULL, 'MzcInvoice', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'invoice', '发票', 'mmmmnd', '0', '/', '{\"parentMenuId\":\"2065\"}', 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31', NULL);
INSERT INTO `gen_table` VALUES (18, 'mzc_wx', '微信用户', NULL, NULL, 'MzcWx', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'wx', '微信用户', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-14 17:27:03', '', '2023-02-14 21:47:51', NULL);
INSERT INTO `gen_table` VALUES (19, 'mzc_swiper', '轮播图', NULL, NULL, 'MzcSwiper', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'swiper', '轮播图', 'mmmmnd', '0', '/', '{\"parentMenuId\":1}', 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32', NULL);
INSERT INTO `gen_table` VALUES (20, 'mzc_order', '订单', '', '', 'MzcOrder', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'order', '订单', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49', NULL);
INSERT INTO `gen_table` VALUES (22, 'mzc_order_feedback', '反馈单', '', '', 'MzcOrderFeedback', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'feedback', '反馈单', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23', NULL);
INSERT INTO `gen_table` VALUES (23, 'mzc_order_parts', '订单配件', NULL, NULL, 'MzcOrderParts', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'parts', '订单配件', 'mmmmnd', '0', '/', '{}', 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34', NULL);
INSERT INTO `gen_table` VALUES (26, 'mzc_singlepage', '单页列表', NULL, NULL, 'MzcSinglepage', 'crud', 'com.ruoyi.yixiu', 'yixiu', 'singlepage', '单页', 'mmmmnd', '0', '/', '{}', 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 392 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (38, '3', 'equipment_id', '设备id', 'bigint(20)', 'Long', 'equipmentId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (39, '3', 'dept_id', '设备关联单位id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (40, '3', 'equipment_name', '设备名称', 'varchar(30)', 'String', 'equipmentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (41, '3', 'serial_number', '设备序列号', 'varchar(20)', 'String', 'serialNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (42, '3', 'factory_number', '出厂编号', 'varchar(40)', 'String', 'factoryNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (43, '3', 'model_number', '设备型号', 'varchar(40)', 'String', 'modelNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (44, '3', 'brand', '品牌', 'varchar(20)', 'String', 'brand', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (45, '3', 'price', '价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (46, '3', 'purchase_time', '购买时间', 'datetime', 'Date', 'purchaseTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (47, '3', 'scrap_time', '报废时间', 'datetime', 'Date', 'scrapTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (48, '3', 'maintain', '保养预警', 'varchar(20)', 'String', 'maintain', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (49, '3', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 12, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (50, '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (51, '3', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (52, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (53, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (54, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (55, '3', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-01-24 09:31:12', '', '2023-01-24 09:43:21');
INSERT INTO `gen_table_column` VALUES (56, '4', 'equipment_id', '设备ID', 'bigint(20)', 'Long', 'equipmentId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '4', 'scrap_id', '报废ID', 'bigint(20)', 'Long', 'scrapId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '5', 'scrap_id', '报废id', 'bigint(20)', 'Long', 'scrapId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '5', 'dept_id', '设备关联单位id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '5', 'number', '报废编号', 'varchar(11)', 'String', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '5', 'nickname', '联系人', 'varchar(20)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '5', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '5', 'cause', '报废原因', 'varchar(255)', 'String', 'cause', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '5', 'record', '报废记录', 'varchar(255)', 'String', 'record', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, '5', 'depa_opinion', '部门意见', 'varchar(255)', 'String', 'depaOpinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '5', 'equipment_opinion', '设备部门意见', 'varchar(255)', 'String', 'equipmentOpinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, '5', 'president_opinion', '院长意见', 'varchar(255)', 'String', 'presidentOpinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '5', 'sub_president', '分院长', 'varchar(255)', 'String', 'subPresident', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, '5', 'status', '状态（0正常 1失败 2通过）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, '5', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, '5', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '5', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-01-30 16:05:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '6', 'equipment_id', '设备ID', 'bigint(20)', 'Long', 'equipmentId', '1', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-30 16:19:51', '', '2023-02-01 09:30:53');
INSERT INTO `gen_table_column` VALUES (77, '6', 'scrap_id', '报废ID', 'bigint(20)', 'Long', 'scrapId', '1', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2023-01-30 16:19:51', '', '2023-02-01 09:30:53');
INSERT INTO `gen_table_column` VALUES (78, '7', 'scrap_id', '报废id', 'bigint(20)', 'Long', 'scrapId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (80, '7', 'number', '报废编号', 'varchar(11)', 'String', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (81, '7', 'nickname', '联系人', 'varchar(20)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (82, '7', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (83, '7', 'cause', '报废原因', 'varchar(255)', 'String', 'cause', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (84, '7', 'record', '报废情况记录', 'varchar(255)', 'String', 'record', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (85, '7', 'depa_opinion', '部门意见', 'varchar(255)', 'String', 'depaOpinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (86, '7', 'equipment_opinion', '设备部门意见', 'varchar(255)', 'String', 'equipmentOpinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (87, '7', 'president_opinion', '院长意见', 'varchar(255)', 'String', 'presidentOpinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (88, '7', 'sub_president', '分院长意见', 'varchar(255)', 'String', 'subPresident', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (89, '7', 'status', '状态（0正常 1失败 2通过）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'mzc_scrap_status', 12, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (90, '7', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (91, '7', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (92, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (93, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (94, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (95, '7', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-01-30 16:19:51', '', '2023-01-31 08:16:56');
INSERT INTO `gen_table_column` VALUES (97, '7', 'dept_id', '报废关联单位id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2023-01-31 08:16:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '8', 'material_id', '耗材id', 'bigint(20)', 'Long', 'materialId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (99, '8', 'equipment_id', '设备id', 'bigint(20)', 'Long', 'equipmentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (100, '8', 'supplier_id', '供应商', 'bigint(20)', 'Long', 'supplierId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (101, '8', 'material_name', '耗材名称', 'varchar(30)', 'String', 'materialName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (102, '8', 'brand', '品牌', 'varchar(20)', 'String', 'brand', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (103, '8', 'status', '耗材类型 ( 0 普通耗材 1专用耗材 )', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'mzc_material_status', 6, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (104, '8', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (105, '8', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(4)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (106, '8', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (107, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (108, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (109, '8', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (110, '8', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-02-03 16:32:34', '', '2023-02-03 23:33:03');
INSERT INTO `gen_table_column` VALUES (111, '9', 'supplier_id', '供应商id', 'bigint(20)', 'Long', 'supplierId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (112, '9', 'supplier_name', '供应商名称', 'varchar(30)', 'String', 'supplierName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (113, '9', 'nickname', '联系人', 'varchar(20)', 'String', 'nickname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (114, '9', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (115, '9', 'stauts', '状态 (0 存在 1不存在 )', 'char(1)', 'String', 'stauts', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (116, '9', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(4)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (117, '9', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (118, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (119, '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (120, '9', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-02-03 16:32:34', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (121, '9', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-03 16:32:35', '', '2023-02-04 09:58:24');
INSERT INTO `gen_table_column` VALUES (122, '10', 'complaint_id', '投诉id', 'bigint(20)', 'Long', 'complaintId', '1', '1', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (123, '10', 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (124, '10', 'complaint_type', '投诉类型 （0 普通投诉 1 订单投诉）', 'char(1)', 'String', 'complaintType', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'radio', 'mzc_complaint_type', 3, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (125, '10', 'nickname', '投诉人', 'varchar(20)', 'String', 'nickname', '0', '0', NULL, '0', '0', '1', '0', 'LIKE', 'input', '', 4, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (126, '10', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (127, '10', 'status', '状态 （0 未处理 1已处理）', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'radio', 'mzc_complaint_status', 6, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (128, '10', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'textarea', '', 7, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (129, '10', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (130, '10', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (131, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (132, '10', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (133, '10', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (134, '10', 'update_by', '修改者', 'char(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-02-04 23:49:29', '', '2023-02-04 23:57:41');
INSERT INTO `gen_table_column` VALUES (135, '11', 'burst_id', '不良情况id', 'bigint(20)', 'Long', 'burstId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (136, '11', 'dept_id', '单位id', 'bigint(20)', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (137, '11', 'title', '标题', 'varchar(30)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (138, '11', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 4, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (139, '11', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 5, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (140, '11', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(4)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (141, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 8, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (142, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (143, '11', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (144, '11', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-02-06 08:27:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (145, '11', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 6, '', '2023-02-06 08:54:36', '', '2023-02-06 08:55:36');
INSERT INTO `gen_table_column` VALUES (146, '12', 'deploy_id', '调配id', 'bigint(20)', 'Long', 'deployId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (147, '12', 'equipment_id', '设备id', 'bigint(20)', 'Long', 'equipmentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (148, '12', 'dept_id_in', '申请单位id', 'bigint(20)', 'Long', 'deptIdIn', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 3, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (149, '12', 'dept_id_out', '借配单位id', 'bigint(20)', 'Long', 'deptIdOut', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 4, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (150, '12', 'cause', '借用目的', 'varchar(60)', 'String', 'cause', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (151, '12', 'leader_opinion', '分管领导意见', 'varchar(255)', 'String', 'leaderOpinion', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (152, '12', 'department_opinion', '调出部门负责人意见', 'varchar(255)', 'String', 'departmentOpinion', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 7, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (153, '12', 'equipment_opinion', '设备管理部负责人意见', 'varchar(255)', 'String', 'equipmentOpinion', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (154, '12', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 9, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (155, '12', 'remark', '备注', 'varchar(60)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'input', '', 10, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (156, '12', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (157, '12', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 12, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (158, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (159, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (160, '12', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (161, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-02-06 10:01:28', '', '2023-02-06 10:04:41');
INSERT INTO `gen_table_column` VALUES (162, '13', 'parts_id', '配件id', 'bigint(20)', 'Long', 'partsId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (163, '13', 'name', '配件名称', 'varchar(30)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (164, '13', 'model', '配件型号', 'varchar(40)', 'String', 'model', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (165, '13', 'number', '配件数量', 'int(11)', 'Long', 'number', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (166, '13', 'purpose', '用途', 'varchar(40)', 'String', 'purpose', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (168, '13', 'purchase_name', '采购人', 'varchar(20)', 'String', 'purchaseName', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (169, '13', 'audit_status', '审核状态（ 0 未审核 1 已审核 2未通过 ）', 'char(1)', 'String', 'auditStatus', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'radio', 'mzc_audit_status', 8, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (170, '13', 'audit_opinion', '审核意见', 'varchar(255)', 'String', 'auditOpinion', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (171, '13', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 12, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (172, '13', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '0', NULL, 'EQ', 'input', '', 13, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (173, '13', 'del_flag', '删除标志（0代表存在 2代表删除）', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (174, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (175, '13', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (176, '13', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (177, '13', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2023-02-06 15:28:44', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (178, '13', 'need_status', '是否急需 ( 0 false 1 true )', 'tinyint(1)', 'Integer', 'needStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'mzc_parts_status', 6, '', '2023-02-06 15:49:32', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (179, '13', 'audit_by', '审核人', 'varchar(64)', 'String', 'auditBy', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 10, '', '2023-02-06 15:51:43', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (180, '13', 'audit_time', '审核时间', 'datetime', 'Date', 'auditTime', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'datetime', '', 11, '', '2023-02-06 15:51:43', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (181, '13', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 15, '', '2023-02-06 16:13:58', '', '2023-02-06 16:15:44');
INSERT INTO `gen_table_column` VALUES (182, '14', 'tool_id', '工具id', 'bigint(20)', 'Long', 'toolId', '1', '1', '1', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (183, '14', 'dept_id', '单位id', 'bigint(20)', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (184, '14', 'tool_name', '工具名称', 'varchar(30)', 'String', 'toolName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (185, '14', 'model', '规格型号', 'varchar(30)', 'String', 'model', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (186, '14', 'number', '数量', 'int(11)', 'Long', 'number', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (187, '14', 'performance', '性能', 'varchar(40)', 'String', 'performance', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-02-06 22:52:01', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (188, '14', 'purpose', '用途', 'varchar(60)', 'String', 'purpose', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (189, '14', 'technical', '技术指标', 'varchar(30)', 'String', 'technical', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (190, '14', 'reason', '推荐厂家及理由', 'varchar(60)', 'String', 'reason', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (191, '14', 'tool_price', '工具价格', 'decimal(10,2)', 'BigDecimal', 'toolPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (192, '14', 'dept_opinion', '申请科室意见', 'varchar(60)', 'String', 'deptOpinion', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 11, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (193, '14', 'engineering_opinion', '工程部意见', 'varchar(60)', 'String', 'engineeringOpinion', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 12, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (194, '14', 'correlation_dept_opinion', '相关科室意见', 'varchar(255)', 'String', 'correlationDeptOpinion', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 13, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (195, '14', 'stauts', '状态 (0 存在 1不存在 )', 'char(1)', 'String', 'stauts', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 14, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (196, '14', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(4)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (197, '14', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 16, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (198, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (199, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (200, '14', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (201, '14', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2023-02-06 22:52:02', '', '2023-02-06 22:54:40');
INSERT INTO `gen_table_column` VALUES (202, '15', 'inventory_id', '配件id', 'bigint(20)', 'Long', 'inventoryId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (203, '15', 'name', '配件名', 'varchar(30)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (204, '15', 'model', '配件型号', 'varchar(30)', 'String', 'model', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (205, '15', 'number', '数量', 'int(11)', 'Long', 'number', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (206, '15', 'stauts', '状态 (0 存在 1不存在 )', 'char(1)', 'String', 'stauts', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (207, '15', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'input', '', 6, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (208, '15', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(4)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (209, '15', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (210, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (211, '15', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (212, '15', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (213, '15', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-02-07 10:49:46', '', '2023-02-07 11:04:39');
INSERT INTO `gen_table_column` VALUES (214, '16', 'reimbursement_id', '报销id', 'bigint(20)', 'Long', 'reimbursementId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (215, '16', 'project', '项目', 'varchar(30)', 'String', 'project', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (216, '16', 'category', '类别', 'varchar(20)', 'String', 'category', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (217, '16', 'price', '金额', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (218, '16', 'total_price', '总金额', 'decimal(10,2)', 'BigDecimal', 'totalPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (219, '16', 'person', '负责人', 'varchar(20)', 'String', 'person', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (220, '16', 'stauts', '状态 (0 未审核 1已审核 2未通过)', 'char(1)', 'String', 'stauts', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'radio', 'mzc_audit_status', 7, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (221, '16', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(4)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (222, '16', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (223, '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (224, '16', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (225, '16', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (226, '16', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-02-07 11:24:20', '', '2023-02-07 11:39:56');
INSERT INTO `gen_table_column` VALUES (227, '17', 'invoice_id', '发票id', 'bigint(20)', 'Long', 'invoiceId', '1', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (228, '17', 'dept_id', '单位id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (229, '17', 'duty_paragraph', '税号', 'varchar(30)', 'String', 'dutyParagraph', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (230, '17', 'project', '项目', 'varchar(30)', 'String', 'project', '0', '0', NULL, '0', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (231, '17', 'price', '开票金额', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (232, '17', 'reject_time', '驳回时间', 'datetime', 'Date', 'rejectTime', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'datetime', '', 6, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (233, '17', 'status', '状态 (0 未开票 1 已开票 2已驳回)', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'radio', 'mzc_invoice_status', 7, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (234, '17', 'remake', '驳回理由', 'varchar(40)', 'String', 'remake', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (235, '17', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (236, '17', 'create_by', '开票人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (237, '17', 'create_time', '开票时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', '1', '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (238, '17', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (239, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-02-07 16:05:34', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (240, '17', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 9, '', '2023-02-07 16:25:25', '', '2023-02-07 16:27:31');
INSERT INTO `gen_table_column` VALUES (241, '18', 'wx_user_id', '微信用户id', 'bigint(20)', 'Long', 'wxUserId', '1', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-14 17:27:03', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (242, '18', 'user_id', '系统用户id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (243, '18', 'wx_open_id', '微信openid', 'varchar(32)', 'String', 'wxOpenId', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (244, '18', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (245, '18', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'radio', 'sys_user_sex', 6, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (246, '18', 'avatar', '头像', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'imageUpload', '', 7, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (247, '18', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 8, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (248, '18', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '1', '1', '0', 'EQ', 'radio', 'sys_normal_disable', 9, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (249, '18', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'input', 'sys_normal_disable', 10, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (250, '18', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (251, '18', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'datetime', '', 12, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (252, '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (253, '18', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (254, '18', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-02-14 17:27:04', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (255, '18', 'nickname', '昵称', 'varchar(30)', 'String', 'nickname', '0', '0', NULL, '0', '1', '1', '0', 'LIKE', 'input', '', 4, '', '2023-02-14 17:29:16', '', '2023-02-14 21:47:51');
INSERT INTO `gen_table_column` VALUES (256, '19', 'swiper_id', '轮播id', 'bigint(20)', 'Long', 'swiperId', '1', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (257, '19', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (258, '19', 'file_path', '文件路径', 'varchar(255)', 'String', 'filePath', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (259, '19', 'remote_path', '远程路径', 'varchar(255)', 'String', 'remotePath', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 4, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (260, '19', 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (261, '19', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 6, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (262, '19', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (263, '19', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (264, '19', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (265, '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (266, '19', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (267, '19', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-02-17 15:55:47', '', '2023-02-17 15:57:32');
INSERT INTO `gen_table_column` VALUES (268, '20', 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '1', '1', NULL, '0', NULL, '1', '0', 'EQ', 'input', '', 1, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (269, '20', 'dept_id', '维修点id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (272, '20', 'error_description', '故障描述', 'varchar(60)', 'String', 'errorDescription', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (274, '20', 'repairman', '报修人', 'varchar(20)', 'String', 'repairman', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (275, '20', 'repair_phone', '报修电话', 'varchar(11)', 'String', 'repairPhone', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (276, '20', 'work_type', '工作类别', 'char(1)', 'String', 'workType', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'select', 'mzc_order_type', 7, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (277, '20', 'expectation_time', '期望上门服务时间', 'datetime', 'Date', 'expectationTime', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'datetime', '', 8, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (280, '20', 'apply_dept_opinion', '申请科室意见', 'varchar(60)', 'String', 'applyDeptOpinion', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (281, '20', 'equipment_opinion', '装备部意见', 'varchar(60)', 'String', 'equipmentOpinion', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (282, '20', 'subhead_opinion', '分管院长审批意见', 'varchar(60)', 'String', 'subheadOpinion', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 12, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (283, '20', 'dean_opinion', '院长审批意见', 'varchar(60)', 'String', 'deanOpinion', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (284, '20', 'status', '状态（0等待处理 1系统派单 2自主接单 3开始检测 4出具报告 5提供报价 6审核 7 开始维修 8维修完成 9 验收）', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'radio', 'mzc_order_status', 18, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (285, '20', 'appraise_opinion', '评价意见', 'varchar(60)', 'String', 'appraiseOpinion', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 19, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (286, '20', 'appraise', '评价（1很差，2差，3一般，4好，5很好）', 'char(1)', 'Integer', 'appraise', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', 'mzc_order_appraise_status', 20, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (287, '20', 'user_id', '评价人（用户id）', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 21, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (288, '20', 'delete_by', '删除人', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 22, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (289, '20', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (290, '20', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (291, '20', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 25, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (292, '20', 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:50');
INSERT INTO `gen_table_column` VALUES (293, '20', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2023-02-18 22:44:20', '', '2023-02-24 08:33:51');
INSERT INTO `gen_table_column` VALUES (294, '20', 'equipment_id', '设备id', 'bigint(20)', 'Long', 'equipmentId', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 3, '', '2023-02-19 14:08:46', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (306, '20', 'engineer_id', '工程师（用户id）', 'bigint(20)', 'Long', 'engineerId', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 14, '', '2023-02-24 08:14:26', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (307, '20', 'order_type', '状态类型（1系统派单 2自主接单）', 'tinyint(1)', 'Integer', 'orderType', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'select', 'mzc_order_status', 15, '', '2023-02-24 08:14:26', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (308, '20', 'send_orders', '派单操作人', 'varchar(20)', 'String', 'sendOrders', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 16, '', '2023-02-24 08:14:26', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (309, '20', 'datetime', '派单时间', 'datetime', 'Date', 'datetime', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'datetime', '', 17, '', '2023-02-24 08:14:26', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (310, '20', 'feedback_id', '反馈单id', 'bigint(20)', 'Long', 'feedbackId', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 4, '', '2023-02-24 08:24:20', '', '2023-02-24 08:33:49');
INSERT INTO `gen_table_column` VALUES (311, '22', 'feedback_id', '反馈单id', 'bigint(20)', 'Long', 'feedbackId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (312, '22', 'parts_id', '订单配件id', 'bigint(20)', 'Long', 'partsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (313, '22', 'maintenance_start_time', '维修开始时间', 'datetime', 'Date', 'maintenanceStartTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (314, '22', 'maintenance_end_time', '维修结束时间', 'datetime', 'Date', 'maintenanceEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (315, '22', 'warranty_period', '保修时间', 'datetime', 'Date', 'warrantyPeriod', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (316, '22', 'equipment_inspection', '设备检测', 'varchar(60)', 'String', 'equipmentInspection', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (317, '22', 'total_price', '总价', 'decimal(10,2)', 'BigDecimal', 'totalPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (318, '22', 'quotation_date', '报价时间', 'datetime', 'Date', 'quotationDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (319, '22', 'offeror', '报价人', 'varchar(20)', 'String', 'offeror', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (320, '22', 'delete_by', '删除人', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (321, '22', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (322, '22', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (323, '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (324, '22', 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (325, '22', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-02-26 10:23:33', '', '2023-02-27 10:29:23');
INSERT INTO `gen_table_column` VALUES (326, '23', 'parts_id', '订单配件id', 'bigint(20)', 'Long', 'partsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (327, '23', 'parts_model', '配件型号', 'varchar(40)', 'String', 'partsModel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (328, '23', 'parts_name', '配件名', 'varchar(40)', 'String', 'partsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (329, '23', 'number', '数量', 'int(11)', 'Long', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (330, '23', 'unit', '单位', 'varchar(20)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (331, '23', 'parts_price', '配件价格', 'decimal(10,2)', 'BigDecimal', 'partsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (332, '23', 'maintenance_price', '维修价格', 'decimal(10,2)', 'BigDecimal', 'maintenancePrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (333, '23', 'unit_price', '单价', 'decimal(10,2)', 'BigDecimal', 'unitPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (334, '23', 'preferential_price', '优惠价', 'decimal(10,2)', 'BigDecimal', 'preferentialPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (335, '23', 'delete_by', '删除人', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (336, '23', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (337, '23', 'create_by', '创建人', 'char(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (338, '23', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (339, '23', 'update_by', '修改人', 'char(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (340, '23', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-02-26 10:23:33', '', '2023-02-26 10:24:34');
INSERT INTO `gen_table_column` VALUES (375, '26', 'id', '', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (376, '26', 'user_id', '发布者', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (377, '26', 'title', '新闻标题', 'varchar(200)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (378, '26', 'keywords', '文章关键字', 'varchar(50)', 'String', 'keywords', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (379, '26', 'description', '文章描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (380, '26', 'content', '内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'editor', '', 6, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (381, '26', 'thumb', '封面', 'varchar(255)', 'String', 'thumb', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 7, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (382, '26', 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (383, '26', 'clicks', '点击', 'mediumint(8) unsigned', 'Integer', 'clicks', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (384, '26', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 10, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (385, '26', 'remark', '备注', 'varchar(60)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'input', '', 11, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (386, '26', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (387, '26', 'delete_by', '删除者', 'varchar(64)', 'String', 'deleteBy', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (388, '26', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (389, '26', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (390, '26', 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');
INSERT INTO `gen_table_column` VALUES (391, '26', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2023-03-03 17:14:15', '', '2023-03-03 17:20:56');

-- ----------------------------
-- Table structure for mzc_burst
-- ----------------------------
DROP TABLE IF EXISTS `mzc_burst`;
CREATE TABLE `mzc_burst`  (
  `burst_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '不良情况id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '单位id',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `del_flag` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`burst_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '不良事件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_burst
-- ----------------------------
INSERT INTO `mzc_burst` VALUES (1, 21, '洗牙器损坏', '0', '无法开机', 'admin', '0', 'admin', '2023-02-06 08:51:33', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_complaint
-- ----------------------------
DROP TABLE IF EXISTS `mzc_complaint`;
CREATE TABLE `mzc_complaint`  (
  `complaint_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备id',
  `complaint_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '投诉类型 （0 普通投诉 1 订单投诉）',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '投诉人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态 （0 未处理 1已处理）',
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '系统回复',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`complaint_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '投诉' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_complaint
-- ----------------------------
INSERT INTO `mzc_complaint` VALUES (1, NULL, NULL, '0', NULL, '0', '0', NULL, NULL, NULL, NULL, '0', '2023-02-07 08:20:05', 'admin', NULL, NULL);
INSERT INTO `mzc_complaint` VALUES (2, 1, 4, '1', '微信用户', '13312345678', '1', NULL, '123', NULL, NULL, '0', '2023-03-01 09:00:52', '13312345678', NULL, NULL);
INSERT INTO `mzc_complaint` VALUES (3, 1, NULL, '1', '王', '13514785236', '0', '订单投诉', '投诉内容', NULL, NULL, '0', '2023-03-01 10:57:42', '13312345678', NULL, NULL);
INSERT INTO `mzc_complaint` VALUES (4, 1, NULL, '1', '王', '13514785236', '0', '1', '1', NULL, NULL, '0', '2023-03-01 11:00:07', '13312345678', NULL, NULL);
INSERT INTO `mzc_complaint` VALUES (5, 1, NULL, '1', '王', '13514785236', '0', '13', '234', NULL, NULL, '0', '2023-03-01 11:02:29', '13312345678', NULL, NULL);
INSERT INTO `mzc_complaint` VALUES (6, 1, NULL, '1', '王', '13514785236', '0', '11', '222', NULL, NULL, '0', '2023-03-01 11:04:32', '13312345678', NULL, NULL);
INSERT INTO `mzc_complaint` VALUES (7, 1, 1, '1', '王', '13514785236', '1', '11', '333', NULL, NULL, '0', '2023-03-01 11:05:21', '13312345678', '2023-03-01 22:31:55', 'admin');

-- ----------------------------
-- Table structure for mzc_deploy
-- ----------------------------
DROP TABLE IF EXISTS `mzc_deploy`;
CREATE TABLE `mzc_deploy`  (
  `deploy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '调配id',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备id',
  `dept_id_in` bigint(20) NULL DEFAULT NULL COMMENT '申请单位id',
  `dept_id_out` bigint(20) NULL DEFAULT NULL COMMENT '借配单位id',
  `cause` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '借用目的',
  `leader_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '分管领导意见',
  `department_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '调出部门负责人意见',
  `equipment_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '设备管理部负责人意见',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`deploy_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '借配' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_deploy
-- ----------------------------
INSERT INTO `mzc_deploy` VALUES (1, 1, 21, 10, '借用测试', '分管领导意见', '调出部门负责人', '设备管理部负责人', '0', NULL, '0', 'admin', 'admin', '2023-02-06 10:48:48', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_equi_scrap
-- ----------------------------
DROP TABLE IF EXISTS `mzc_equi_scrap`;
CREATE TABLE `mzc_equi_scrap`  (
  `equipment_id` bigint(20) NOT NULL COMMENT '设备ID',
  `scrap_id` bigint(20) NOT NULL COMMENT '报废ID',
  PRIMARY KEY (`equipment_id`, `scrap_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备报废关联表' ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of mzc_equi_scrap
-- ----------------------------
INSERT INTO `mzc_equi_scrap` VALUES (1, 1);

-- ----------------------------
-- Table structure for mzc_equipment
-- ----------------------------
DROP TABLE IF EXISTS `mzc_equipment`;
CREATE TABLE `mzc_equipment`  (
  `equipment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '设备关联单位id',
  `equipment_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `serial_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备序列号',
  `factory_number` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出厂编号',
  `model_number` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备型号',
  `brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `purchase_time` datetime NULL DEFAULT NULL COMMENT '购买时间',
  `scrap_time` datetime NULL DEFAULT NULL COMMENT '报废时间',
  `maintain` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '保养预警',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`equipment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mzc_equipment
-- ----------------------------
INSERT INTO `mzc_equipment` VALUES (1, 21, '拔牙钳', 'A454', '12341s', 'q2adsf14', '飞利浦', 369.00, '2023-01-28 00:00:00', '2025-01-31 00:00:00', '每年1月', '0', '无', '0', '', 'admin', '2023-01-28 10:05:44', 'admin', '2023-02-01 14:45:56');
INSERT INTO `mzc_equipment` VALUES (2, 21, '洗牙器', 'A16436', '21654154', '12sdf4', '飞利浦', 269.00, '2023-01-31 00:00:00', '2025-01-31 00:00:00', '每年1月', '0', NULL, '0', '', 'admin', '2023-01-31 15:29:11', NULL, NULL);
INSERT INTO `mzc_equipment` VALUES (3, 21, '设备名称', 'A1265', '12asdf215', '1544', '品牌', 369.00, '2023-02-01 00:00:00', '2025-02-28 00:00:00', '每年2月', '0', '备注', '0', NULL, 'admin', '2023-02-03 15:27:50', NULL, NULL);
INSERT INTO `mzc_equipment` VALUES (4, 22, '光照仪', '1234as3', '659459020934', 'AFJ324', '伯南克', NULL, NULL, NULL, '每年2月', NULL, '无', '0', NULL, 'admin', '2023-02-25 08:45:02', NULL, NULL);
INSERT INTO `mzc_equipment` VALUES (5, 21, '风扇', NULL, 'JHJDN-64', '4845GJ', '格力', NULL, NULL, NULL, '每年3月', NULL, '备注无', '0', NULL, '13312345678', '2023-03-02 16:15:12', NULL, NULL);
INSERT INTO `mzc_equipment` VALUES (6, 21, '1', '2', '4', '3', '5', NULL, NULL, NULL, '7', '0', '8', '0', NULL, '13312345678', '2023-03-02 16:23:47', NULL, NULL);
INSERT INTO `mzc_equipment` VALUES (7, 21, '1', '2', '4', '3', '5', 6.00, '2023-03-02 00:00:00', '2023-03-02 00:00:00', '7', '0', '8', '0', NULL, '13312345678', '2023-03-02 16:32:13', NULL, NULL);
INSERT INTO `mzc_equipment` VALUES (8, 21, '1', '2', '4', '3', '5', 6.00, '2023-03-02 00:00:00', '2023-03-02 00:00:00', '7', '0', '8', '0', NULL, '13312345678', '2023-03-02 16:33:08', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_inventory
-- ----------------------------
DROP TABLE IF EXISTS `mzc_inventory`;
CREATE TABLE `mzc_inventory`  (
  `inventory_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配件id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配件名',
  `model` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配件型号',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `stauts` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态 (0 存在 1不存在 )',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`inventory_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '配件清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_inventory
-- ----------------------------
INSERT INTO `mzc_inventory` VALUES (1, '螺丝刀', 'A136', 2, '0', NULL, '0', '', '2023-02-07 11:05:52', 'admin', '2023-02-07 11:08:41', 'admin');

-- ----------------------------
-- Table structure for mzc_invoice
-- ----------------------------
DROP TABLE IF EXISTS `mzc_invoice`;
CREATE TABLE `mzc_invoice`  (
  `invoice_id` bigint(20) NOT NULL COMMENT '发票id',
  `dept_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单位名称',
  `duty_paragraph` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '税号',
  `project` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '开票金额',
  `reject_time` datetime NULL DEFAULT NULL COMMENT '驳回时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态 (0 未开票 1 已开票 2已驳回)',
  `remake` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '驳回理由',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '发票' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for mzc_material
-- ----------------------------
DROP TABLE IF EXISTS `mzc_material`;
CREATE TABLE `mzc_material`  (
  `material_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '耗材id',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备id',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商id',
  `material_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '耗材名称',
  `brand` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '品牌',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '耗材类型 ( 0 普通耗材 1专用耗材 )',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '耗材' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_material
-- ----------------------------
INSERT INTO `mzc_material` VALUES (1, 1, 1, '耗材名称12', '飞利浦品牌', '0', '无备注1', '0', NULL, '2023-02-04 14:01:39', 'admin', '2023-02-04 14:30:53', 'admin');

-- ----------------------------
-- Table structure for mzc_order
-- ----------------------------
DROP TABLE IF EXISTS `mzc_order`;
CREATE TABLE `mzc_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '维修点id',
  `equipment_id` bigint(20) NULL DEFAULT NULL COMMENT '设备id',
  `feedback_id` bigint(20) NULL DEFAULT NULL COMMENT '反馈单id',
  `repairman` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '报修人',
  `repair_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '报修电话',
  `work_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '工作类别',
  `expectation_time` datetime NULL DEFAULT NULL COMMENT '期望上门服务时间',
  `error_description` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '故障描述',
  `apply_dept_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '申请科室意见',
  `equipment_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '装备部意见',
  `subhead_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '分管院长审批意见',
  `dean_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '院长审批意见',
  `engineer_id` bigint(20) NULL DEFAULT NULL COMMENT '工程师（用户id）',
  `order_type` tinyint(1) NULL DEFAULT NULL COMMENT '状态类型（1系统派单 2工程师接单）',
  `send_orders` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '派单操作人',
  `date_time` datetime NULL DEFAULT NULL COMMENT '接单派单时间 ',
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态（0等待处理 1系统派单 2工程师接单 3开始检测 4出具报告 5提供报价 6审核 7 开始维修 8维修完成 9 验收 10评价）',
  `appraise_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '评价意见',
  `appraise` tinyint(1) NULL DEFAULT NULL COMMENT '评价（1很差，2差，3一般，4好，5很好）',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `appraise_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '评价人（用户id）',
  `acceptor` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '验收人',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除人',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_order
-- ----------------------------
INSERT INTO `mzc_order` VALUES (1, 21, 1, 20, '王', '13514785236', '0', '2023-02-21 10:02:00', '报修描述', '申请科室意见', '装备部意见', '分管院长审批意见', '院长审批意见', 1, 2, '', '2023-02-26 16:06:18', '11', '非常好', 5, 1, '若依admin', '若依admin', NULL, '0', 'admin', '2023-02-21 10:03:04', '13312345678', '2023-02-28 17:23:00');
INSERT INTO `mzc_order` VALUES (5, 21, 2, NULL, '王', '13514785236', '', '2023-02-24 00:00:00', '报修描述', NULL, NULL, NULL, NULL, 1, 2, NULL, '2023-02-24 15:45:34', '2', NULL, NULL, 102, NULL, NULL, NULL, '0', '13322072702', '2023-02-24 09:12:45', 'admin', '2023-02-24 15:45:34');
INSERT INTO `mzc_order` VALUES (6, 21, 2, NULL, '王', '13514785236', '0', '2023-02-24 00:00:00', '报修描述', NULL, NULL, NULL, NULL, 102, 1, '若依admin', '2023-02-24 15:45:43', '1', NULL, NULL, 102, NULL, NULL, NULL, '0', '13322072702', '2023-02-24 09:15:48', 'admin', '2023-02-24 15:45:43');
INSERT INTO `mzc_order` VALUES (7, 21, 3, NULL, '陈', '13512364568', '0', '2023-02-24 15:51:00', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, NULL, NULL, '0', 'admin', '2023-02-24 15:52:21', NULL, NULL);
INSERT INTO `mzc_order` VALUES (8, 4, 1, NULL, '1', '13312354569', '0', '2023-02-24 17:20:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 102, NULL, NULL, NULL, '0', '13322072702', '2023-02-24 17:21:19', NULL, NULL);
INSERT INTO `mzc_order` VALUES (9, 22, 4, NULL, '王', '13312345678', '0', '2023-02-25 08:41:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, NULL, NULL, '0', 'admin', '2023-02-25 08:45:27', NULL, NULL);
INSERT INTO `mzc_order` VALUES (10, 20, 1, NULL, '微信用户', '13312345678', '0', '2023-03-02 17:57:00', '11111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 102, NULL, NULL, NULL, '0', '13312345678', '2023-03-02 17:57:53', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_order_feedback
-- ----------------------------
DROP TABLE IF EXISTS `mzc_order_feedback`;
CREATE TABLE `mzc_order_feedback`  (
  `feedback_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '反馈单id',
  `maintenance_start_time` datetime NULL DEFAULT NULL COMMENT '维修开始时间',
  `maintenance_end_time` datetime NULL DEFAULT NULL COMMENT '维修结束时间',
  `warranty_period` datetime NULL DEFAULT NULL COMMENT '保修时间',
  `equipment_inspection` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '设备检测',
  `feedback_result` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '反馈结果',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `quotation_date` datetime NULL DEFAULT NULL COMMENT '报价时间',
  `offeror` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '报价人',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除人',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`feedback_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '反馈单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_order_feedback
-- ----------------------------
INSERT INTO `mzc_order_feedback` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `mzc_order_feedback` VALUES (17, NULL, NULL, NULL, '故障描述', NULL, NULL, NULL, NULL, NULL, '0', '13312345678', '2023-02-26 15:31:28', NULL, NULL);
INSERT INTO `mzc_order_feedback` VALUES (18, NULL, NULL, NULL, '故障圆盘', NULL, NULL, NULL, NULL, NULL, '0', '13312345678', '2023-02-26 15:44:34', NULL, NULL);
INSERT INTO `mzc_order_feedback` VALUES (19, NULL, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, '0', '13312345678', '2023-02-26 15:45:53', NULL, NULL);
INSERT INTO `mzc_order_feedback` VALUES (20, '2023-02-27 22:50:47', '2023-02-27 23:12:48', NULL, '故障原因1', '维修完成', 1.00, '2023-02-27 11:59:32', 'admin', NULL, '0', '13312345678', '2023-02-26 15:48:31', '13312345678', '2023-02-27 23:12:48');

-- ----------------------------
-- Table structure for mzc_order_parts
-- ----------------------------
DROP TABLE IF EXISTS `mzc_order_parts`;
CREATE TABLE `mzc_order_parts`  (
  `parts_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单配件id',
  `feedback_id` bigint(20) NULL DEFAULT NULL COMMENT '反馈单id',
  `parts_model` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配件型号',
  `parts_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配件名',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单位',
  `parts_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '配件价格',
  `maintenance_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '维修价格',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `preferential_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠价',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除人',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`parts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '订单配件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_order_parts
-- ----------------------------
INSERT INTO `mzc_order_parts` VALUES (1, 1, '型号', '配件名', 1, '单位', 100.00, 200.00, NULL, NULL, NULL, '0', '13312345678', '2023-02-26 15:31:28', NULL, NULL);
INSERT INTO `mzc_order_parts` VALUES (2, 1, '型号', '配件名', 1, '单位', 100.00, 200.00, NULL, NULL, NULL, '0', '13312345678', '2023-02-26 15:44:34', NULL, NULL);
INSERT INTO `mzc_order_parts` VALUES (3, 1, '型号', '配件名', 1, '单位', 100.00, 200.00, NULL, NULL, NULL, '0', '13312345678', '2023-02-26 15:45:53', NULL, NULL);
INSERT INTO `mzc_order_parts` VALUES (4, 20, '型号', '配件名', 1, '单位', 200.00, 300.00, 2.00, 3.00, NULL, '0', '13312345678', '2023-02-26 15:48:31', 'admin', '2023-02-27 11:59:32');

-- ----------------------------
-- Table structure for mzc_parts
-- ----------------------------
DROP TABLE IF EXISTS `mzc_parts`;
CREATE TABLE `mzc_parts`  (
  `parts_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配件id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配件名称',
  `model` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配件型号',
  `number` int(11) NULL DEFAULT NULL COMMENT '配件数量',
  `purpose` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用途',
  `need_status` tinyint(1) NULL DEFAULT 0 COMMENT '是否急需 ( 0 false 1 true )',
  `purchase_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '采购人',
  `audit_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '审核状态（ 0 未审核 1 已审核 2未通过 ）',
  `audit_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`parts_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '配件申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_parts
-- ----------------------------
INSERT INTO `mzc_parts` VALUES (1, '螺丝刀', 'A1394', 1, '打螺丝', 1, '王志文', '1', '审核意见1', 'admin', '2023-02-06 22:10:15', '1', '无备注', '0', '', '2023-02-06 16:34:28', 'admin', '2023-02-06 22:10:15', 'admin');
INSERT INTO `mzc_parts` VALUES (2, '1', '2', 4, '3', 1, '微信用户', '0', NULL, NULL, NULL, '0', '5', '0', NULL, '2023-03-02 21:38:16', '13312345678', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_reimbursement
-- ----------------------------
DROP TABLE IF EXISTS `mzc_reimbursement`;
CREATE TABLE `mzc_reimbursement`  (
  `reimbursement_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报销id',
  `project` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目',
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '类别',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `person` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态 (0 未审核 1已审核 2未通过)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`reimbursement_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '报销' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_reimbursement
-- ----------------------------
INSERT INTO `mzc_reimbursement` VALUES (1, '交通费', '车费', 500.00, 500.00, '王志文', '1', '同意', '0', NULL, '2023-02-07 11:42:20', 'admin', '2023-03-01 21:57:52', 'admin');
INSERT INTO `mzc_reimbursement` VALUES (2, '费用项目', '类别', 100.00, NULL, NULL, '0', NULL, '2', '13312345678', '2023-03-01 21:35:06', '13312345678', NULL, NULL);
INSERT INTO `mzc_reimbursement` VALUES (3, '项目', '类别', 100.00, NULL, NULL, '0', NULL, '0', NULL, '2023-03-01 21:38:58', '13312345678', NULL, NULL);
INSERT INTO `mzc_reimbursement` VALUES (4, '1', '1', 1.00, 1.00, NULL, '0', NULL, '2', '13312345678', '2023-03-01 21:41:32', '13312345678', NULL, NULL);
INSERT INTO `mzc_reimbursement` VALUES (5, '22', '23', 23.00, 23.00, '微信用户', '1', '同意1', '0', NULL, '2023-03-01 21:42:46', '13312345678', '2023-03-01 22:04:40', 'admin');
INSERT INTO `mzc_reimbursement` VALUES (6, '24', '24', 24.00, 24.00, '微信用户1', '0', NULL, '0', NULL, '2023-03-01 21:44:10', '13312345678', '2023-03-01 21:57:35', 'admin');

-- ----------------------------
-- Table structure for mzc_scrap
-- ----------------------------
DROP TABLE IF EXISTS `mzc_scrap`;
CREATE TABLE `mzc_scrap`  (
  `scrap_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报废id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '报废关联单位id',
  `number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报废编号',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `cause` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报废原因',
  `record` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报废情况记录',
  `dept_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门意见',
  `equipment_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备部门意见',
  `president_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '院长意见',
  `sub_president` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分院长意见',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1失败 2通过）',
  `delete_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除者',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`scrap_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '报废' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mzc_scrap
-- ----------------------------
INSERT INTO `mzc_scrap` VALUES (1, 21, 'BF230131001', '王志文', '13514785236', '报废原因', '报废情况记录', '部门意见', '设备部门意见', '院长意见', '分院长意见', '0', '', '0', 'admin', '2023-01-31 09:34:15', 'admin', '2023-02-02 23:01:24');
INSERT INTO `mzc_scrap` VALUES (2, 21, 'FB230202', '王志文', '13512345678', '报废原因', '报废情况', '部门', '设备部门', '院长', '分院长', '1', '', '0', 'admin', '2023-02-02 23:02:56', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_singlepage
-- ----------------------------
DROP TABLE IF EXISTS `mzc_singlepage`;
CREATE TABLE `mzc_singlepage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '发布者',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `keywords` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `clicks` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '点击',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '单页' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_singlepage
-- ----------------------------
INSERT INTO `mzc_singlepage` VALUES (1, NULL, '新闻标题', '关键字', '描述', '<p class=\"ql-indent-1\">内容hhhh<img src=\"http://localhost:8080/profile/upload/2023/03/03/leaf_20230303172946A001.jpg\" width=\"146\" style=\"cursor: nwse-resize;\"></p>', '/profile/upload/2023/03/03/leaf_20230303173021A002.jpg', 0, 0, '0', NULL, '0', NULL, 'admin', '2023-03-03 17:30:25', 'admin', '2023-03-04 10:06:57');

-- ----------------------------
-- Table structure for mzc_supplier
-- ----------------------------
DROP TABLE IF EXISTS `mzc_supplier`;
CREATE TABLE `mzc_supplier`  (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `supplier_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `stauts` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '状态 (0 存在 1不存在 )',
  `del_flag` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_supplier
-- ----------------------------
INSERT INTO `mzc_supplier` VALUES (1, '飞利浦', '王先生', '13812349876', NULL, '0', 'admin', '2023-02-04 10:29:11', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_swiper
-- ----------------------------
DROP TABLE IF EXISTS `mzc_swiper`;
CREATE TABLE `mzc_swiper`  (
  `swiper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '轮播id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `remote_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '远程路径',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`swiper_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_swiper
-- ----------------------------
INSERT INTO `mzc_swiper` VALUES (1, '小程序轮播', '/profile/upload/2023/02/17/leaf_20230217161351A004.jpg', NULL, 0, '0', NULL, '0', 'admin', '2023-02-17 16:13:59', NULL, NULL);

-- ----------------------------
-- Table structure for mzc_tool
-- ----------------------------
DROP TABLE IF EXISTS `mzc_tool`;
CREATE TABLE `mzc_tool`  (
  `tool_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工具id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '单位id',
  `tool_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '工具名称',
  `model` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '规格型号',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `performance` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '性能',
  `purpose` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用途',
  `technical` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '技术指标',
  `reason` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推荐厂家及理由',
  `tool_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '工具价格',
  `dept_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '申请科室意见',
  `engineering_opinion` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '工程部意见',
  `correlation_dept_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '相关科室意见',
  `stauts` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态 (0 存在 1不存在 )',
  `del_flag` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`tool_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '工具' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mzc_tool
-- ----------------------------
INSERT INTO `mzc_tool` VALUES (1, 13, '麻醉针', 'A1264', 1, '无', '麻醉', 'A6913', '国标', 38.00, '申请科室同意', '工程部同意', '相关科室同意', '0', '0', '', '2023-02-07 08:30:17', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-01-12 09:59:27', 'admin', '2023-03-02 14:35:40', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id (业务员)',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '签约状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '医修', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '上海维修点', 0, NULL, '羊', '1371284', NULL, '创世纪', NULL, '0', '0', 'admin', '2023-01-18 08:35:10', '', NULL);
INSERT INTO `sys_dept` VALUES (3, 1, '0,1', '北京维修点', 0, NULL, '李', '18286', NULL, '花园小区', NULL, '0', '0', 'admin', '2023-01-18 08:36:32', 'admin', '2023-01-18 08:43:40');
INSERT INTO `sys_dept` VALUES (4, 2, '0,1,2', '口腔医院', 0, 100, '罗主任', NULL, NULL, '友谊路', '代签', '0', '0', 'admin', '2023-01-18 08:37:35', 'admin', '2023-01-18 08:44:31');
INSERT INTO `sys_dept` VALUES (5, 6, '0,1,6', '人民医院', 0, NULL, '陈工', '1870', NULL, '虎卫', NULL, '1', '0', 'admin', '2023-01-18 08:38:12', 'admin', '2023-01-18 08:43:43');
INSERT INTO `sys_dept` VALUES (6, 1, '0,1', '广州维修点', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2023-01-18 08:39:03', 'admin', '2023-01-18 08:43:37');
INSERT INTO `sys_dept` VALUES (7, 1, '0,1', '武汉维修点', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2023-01-18 08:39:40', 'admin', '2023-01-18 08:43:32');
INSERT INTO `sys_dept` VALUES (8, 7, '0,1,7', '人民医院', 0, NULL, '王', '13880', NULL, '叉镇', '负责操作维修', '0', '0', 'admin', '2023-01-18 08:40:21', '', NULL);
INSERT INTO `sys_dept` VALUES (9, 3, '0,1,3', '中心医院', 0, NULL, '许工', '18984', NULL, '儋大', '部分签约', '0', '0', 'admin', '2023-01-18 08:41:07', '', NULL);
INSERT INTO `sys_dept` VALUES (10, 9, '0,1,3,9', '血透室', 0, NULL, '郭主任', '137', NULL, '西院', NULL, '0', '0', 'admin', '2023-01-22 11:01:45', '', NULL);
INSERT INTO `sys_dept` VALUES (11, 9, '0,1,3,9', '检验科', 0, NULL, '黄健', '18284', NULL, '西部', NULL, '0', '0', 'admin', '2023-01-22 11:02:15', '', NULL);
INSERT INTO `sys_dept` VALUES (12, 9, '0,1,3,9', '肿瘤内科', 0, NULL, '护长', '137', NULL, '肿瘤内科', NULL, '0', '0', 'admin', '2023-01-22 11:03:05', '', NULL);
INSERT INTO `sys_dept` VALUES (13, 9, '0,1,3,9', '麻醉科', 0, NULL, '护长', '134', NULL, '麻醉科', NULL, '0', '0', 'admin', '2023-01-22 11:03:38', '', NULL);
INSERT INTO `sys_dept` VALUES (14, 9, '0,1,3,9', '新生儿科', 0, NULL, '护长', '13', NULL, '新生儿科', NULL, '0', '0', 'admin', '2023-01-22 11:04:09', '', NULL);
INSERT INTO `sys_dept` VALUES (15, 9, '0,1,3,9', '泌尿外科', 0, NULL, '护长', '184', NULL, '泌尿外科', NULL, '0', '0', 'admin', '2023-01-22 11:04:50', '', NULL);
INSERT INTO `sys_dept` VALUES (16, 9, '0,1,3,9', '眼科', 0, NULL, '符', '284', NULL, '眼科', NULL, '0', '0', 'admin', '2023-01-22 11:05:26', '', NULL);
INSERT INTO `sys_dept` VALUES (17, 9, '0,1,3,9', '产二科', 0, NULL, '护长', '137', NULL, '产二科', NULL, '0', '0', 'admin', '2023-01-22 11:06:02', '', NULL);
INSERT INTO `sys_dept` VALUES (18, 9, '0,1,3,9', '产一科', 0, NULL, '护长', '1384', NULL, '产一科', NULL, '0', '0', 'admin', '2023-01-22 11:06:44', '', NULL);
INSERT INTO `sys_dept` VALUES (19, 8, '0,1,7,8', '口腔科', 0, NULL, '护士', '135678', NULL, '口腔科', NULL, '0', '0', 'admin', '2023-01-22 11:11:50', 'admin', '2023-01-22 11:12:13');
INSERT INTO `sys_dept` VALUES (20, 8, '0,1,7,8', '设备科', 0, NULL, '护士', '1', NULL, '设备科', NULL, '0', '0', 'admin', '2023-01-22 11:12:46', '', NULL);
INSERT INTO `sys_dept` VALUES (21, 4, '0,1,2,4', '牙科', 0, NULL, '王医生', '38', NULL, '牙科', NULL, '0', '0', 'admin', '2023-01-22 11:17:02', '', NULL);
INSERT INTO `sys_dept` VALUES (22, 4, '0,1,2,4', '口腔科', 0, NULL, '王', '1378', NULL, '口腔医院', NULL, '0', '0', 'admin', '2023-02-25 08:43:03', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-01-12 09:59:26', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '签约', '0', 'sys_dept_type', NULL, 'primary', 'N', '0', 'admin', '2023-01-13 10:48:09', 'admin', '2023-01-13 10:48:17', '');
INSERT INTO `sys_dict_data` VALUES (101, 1, '未签', '1', 'sys_dept_type', NULL, 'danger', 'N', '0', 'admin', '2023-01-13 10:49:03', 'admin', '2023-01-13 10:49:27', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '未审核', '0', 'mzc_scrap_status', NULL, 'default', 'N', '0', 'admin', '2023-01-30 16:46:04', 'admin', '2023-01-31 09:10:49', '未审核');
INSERT INTO `sys_dict_data` VALUES (103, 0, '审核失败', '1', 'mzc_scrap_status', NULL, 'danger', 'N', '0', 'admin', '2023-01-30 16:47:04', 'admin', '2023-01-30 16:47:49', '审核失败');
INSERT INTO `sys_dict_data` VALUES (104, 0, '审核成功', '2', 'mzc_scrap_status', NULL, 'success', 'N', '0', 'admin', '2023-01-30 16:48:27', '', NULL, '审核成功');
INSERT INTO `sys_dict_data` VALUES (105, 0, '普通耗材', '0', 'mzc_material_status', NULL, 'primary', 'N', '0', 'admin', '2023-02-03 23:23:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '专用耗材', '1', 'mzc_material_status', NULL, 'success', 'N', '0', 'admin', '2023-02-03 23:23:40', 'admin', '2023-02-03 23:23:55', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '未处理', '0', 'mzc_complaint_status', NULL, 'info', 'N', '0', 'admin', '2023-02-04 23:42:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '已处理', '1', 'mzc_complaint_status', NULL, 'success', 'N', '0', 'admin', '2023-02-04 23:43:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '普通投诉', '0', 'mzc_complaint_type', NULL, 'warning', 'N', '0', 'admin', '2023-02-04 23:44:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '订单投诉', '1', 'mzc_complaint_type', NULL, 'warning', 'N', '0', 'admin', '2023-02-04 23:45:17', 'admin', '2023-02-04 23:45:46', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '未审核', '0', 'mzc_audit_status', NULL, 'info', 'N', '0', 'admin', '2023-02-06 15:57:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '已审核', '1', 'mzc_audit_status', NULL, 'success', 'N', '0', 'admin', '2023-02-06 15:58:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '未通过', '2', 'mzc_audit_status', NULL, 'warning', 'N', '0', 'admin', '2023-02-06 15:58:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, '否', '0', 'mzc_parts_status', NULL, 'info', 'N', '0', 'admin', '2023-02-06 16:22:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '是', '1', 'mzc_parts_status', NULL, 'primary', 'N', '0', 'admin', '2023-02-06 16:23:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 0, '未开票', '0', 'mzc_invoice_status', NULL, 'info', 'N', '0', 'admin', '2023-02-07 16:09:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '已开票', '1', 'mzc_invoice_status', NULL, 'success', 'N', '0', 'admin', '2023-02-07 16:10:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '已驳回', '2', 'mzc_invoice_status', NULL, 'warning', 'N', '0', 'admin', '2023-02-07 16:10:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '很差', '1', 'mzc_order_appraise_status', NULL, 'default', 'N', '0', 'admin', '2023-02-18 22:53:44', 'admin', '2023-02-18 22:53:51', NULL);
INSERT INTO `sys_dict_data` VALUES (120, 0, '差', '2', 'mzc_order_appraise_status', NULL, 'default', 'N', '0', 'admin', '2023-02-18 22:54:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, '一般', '3', 'mzc_order_appraise_status', NULL, 'default', 'N', '0', 'admin', '2023-02-18 22:54:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 0, '好', '4', 'mzc_order_appraise_status', NULL, 'default', 'N', '0', 'admin', '2023-02-18 22:56:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 0, '很好', '5', 'mzc_order_appraise_status', NULL, 'default', 'N', '0', 'admin', '2023-02-18 22:56:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 0, '等待处理', '0', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:34:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 0, '系统派单', '1', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:34:58', '13312345678', '2023-02-25 10:26:33', NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '工程师接单', '2', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:35:07', 'admin', '2023-02-25 11:04:19', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, '开始检测', '3', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:35:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 0, '出具报告', '4', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:35:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 0, '提供报价', '5', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:35:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 0, '审核', '6', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:35:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '开始维修', '7', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:36:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 0, '维修完成', '8', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:36:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, '验收', '9', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-19 13:36:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 0, '搬迁', '0', 'mzc_order_type', NULL, 'default', 'N', '0', 'admin', '2023-02-19 14:17:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 0, '检修', '1', 'mzc_order_type', NULL, 'default', 'N', '0', 'admin', '2023-02-19 14:17:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 0, '维修', '2', 'mzc_order_type', NULL, 'default', 'N', '0', 'admin', '2023-02-19 14:18:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 0, '保养', '3', 'mzc_order_type', NULL, 'default', 'N', '0', 'admin', '2023-02-19 14:18:24', 'admin', '2023-02-19 14:18:44', NULL);
INSERT INTO `sys_dict_data` VALUES (138, 0, '其他', '4', 'mzc_order_type', NULL, 'default', 'N', '0', 'admin', '2023-02-19 14:18:32', 'admin', '2023-02-19 14:18:49', NULL);
INSERT INTO `sys_dict_data` VALUES (139, 0, '评价', '10', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-02-28 16:40:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 0, '订单被投诉', '11', 'mzc_order_status', NULL, 'default', 'N', '0', 'admin', '2023-03-01 11:27:24', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-01-12 09:59:25', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '签约状态', 'sys_dept_type', '0', 'admin', '2023-01-13 10:45:36', '', NULL, '科室状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '报废状态', 'mzc_scrap_status', '0', 'admin', '2023-01-30 16:41:09', '', NULL, '报废状态列表');
INSERT INTO `sys_dict_type` VALUES (102, '耗材状态', 'mzc_material_status', '0', 'admin', '2023-02-03 23:22:32', 'admin', '2023-02-04 23:42:19', '耗材状态列表');
INSERT INTO `sys_dict_type` VALUES (103, '投诉状态', 'mzc_complaint_status', '0', 'admin', '2023-02-04 23:42:01', 'admin', '2023-02-04 23:42:30', '投诉状态列表');
INSERT INTO `sys_dict_type` VALUES (104, '投诉类型', 'mzc_complaint_type', '0', 'admin', '2023-02-04 23:44:00', 'admin', '2023-02-04 23:44:26', '投诉类型列表');
INSERT INTO `sys_dict_type` VALUES (105, '配件急需状态', 'mzc_parts_status', '0', 'admin', '2023-02-06 15:48:57', 'admin', '2023-02-06 15:49:05', '配件急需状态');
INSERT INTO `sys_dict_type` VALUES (106, '配件审核状态', 'mzc_audit_status', '0', 'admin', '2023-02-06 15:57:25', '', NULL, '配件审核状态');
INSERT INTO `sys_dict_type` VALUES (107, '发票状态', 'mzc_invoice_status', '0', 'admin', '2023-02-07 16:09:22', 'admin', '2023-02-07 16:09:30', '发票状态');
INSERT INTO `sys_dict_type` VALUES (108, '评价状态', 'mzc_order_appraise_status', '0', 'admin', '2023-02-18 22:51:26', '', NULL, '评价状态');
INSERT INTO `sys_dict_type` VALUES (109, '订单状态', 'mzc_order_status', '0', 'admin', '2023-02-18 22:57:15', 'admin', '2023-02-18 22:57:26', '订单状态');
INSERT INTO `sys_dict_type` VALUES (110, '订单类型', 'mzc_order_type', '0', 'admin', '2023-02-19 14:17:00', 'admin', '2023-02-19 14:20:39', '订单类型');

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件路径',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-01-12 09:59:29', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-01-12 09:59:29', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-01-12 09:59:29', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 10:03:07');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-12 11:14:31');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:14:34');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-12 11:40:55');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:40:59');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:41:22');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:41:55');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-12 11:42:21');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:42:33');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-12 11:44:01');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-12 11:44:44');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:44:48');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-12 11:46:22');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 11:46:28');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-12 15:30:25');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-12 15:30:28');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 15:30:30');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 16:50:32');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-12 16:58:13');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 16:58:26');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-13 08:44:53');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-13 11:14:15');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-13 11:14:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-13 15:41:10');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 08:38:52');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 10:49:52');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 11:48:17');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 16:47:57');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 22:37:09');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 08:14:32');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 09:11:54');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 10:05:19');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:00:51');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-17 16:11:23');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:11:32');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:11:45');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:11:59');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:13:25');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:13:40');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:14:19');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-17 16:16:23');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:16:27');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:16:52');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:17:26');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-17 16:29:07');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:29:14');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:29:37');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:30:30');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:31:59');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-17 16:32:56');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:33:02');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 16:36:54');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 17:05:23');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-22 09:56:33');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 09:56:33');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 09:56:37');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-22 09:56:37');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-22 09:57:13');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 09:57:13');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2023-01-22 09:57:22');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 09:57:22');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2023-01-22 10:02:33');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:02:33');
INSERT INTO `sys_logininfor` VALUES (163, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-22 10:03:12');
INSERT INTO `sys_logininfor` VALUES (164, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:03:12');
INSERT INTO `sys_logininfor` VALUES (165, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:03:28');
INSERT INTO `sys_logininfor` VALUES (166, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-22 10:03:28');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:03:54');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:03:54');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:04:18');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-22 10:04:18');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-22 10:04:38');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:04:38');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:05:07');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-22 10:05:07');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:05:14');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2023-01-22 10:05:14');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2023-01-22 10:08:48');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:08:48');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:08:54');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:08:54');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:09:04');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-22 10:09:04');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:10:32');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-22 10:10:32');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:11:11');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-22 10:11:11');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2023-01-22 10:11:22');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:11:22');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:32:56');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-22 10:32:56');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-22 10:34:07');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:34:07');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-22 10:36:30');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:36:30');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2023-01-22 10:36:41');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:36:41');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2023-01-22 10:37:07');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:37:07');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:40:05');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:40:05');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:41:12');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:41:12');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:42:50');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-22 10:42:50');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 10:43:15');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 10:43:25');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-22 10:43:28');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-22 10:43:28');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 10:43:40');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 09:11:34');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:37:43');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-28 08:37:43');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:37:59');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-28 08:37:59');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-28 08:38:03');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:38:03');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2023-01-28 08:38:07');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:38:07');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:38:31');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2023-01-28 08:38:31');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-28 08:38:34');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-28 08:38:34');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:38:42');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-01-28 08:38:42');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-01-28 08:40:04');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:40:04');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-01-28 08:41:06');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:41:06');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2023-01-28 08:42:37');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:42:37');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-01-28 08:42:56');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2023-01-28 08:42:56');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-28 08:42:59');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-28 08:42:59');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 08:43:10');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-28 08:43:33');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 08:43:35');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 15:54:12');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 10:24:21');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-29 22:52:04');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 08:59:42');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 15:04:20');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-01 09:14:13');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 09:14:39');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 15:49:45');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 09:29:05');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 10:48:24');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 11:58:13');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 16:54:33');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 23:15:43');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 08:12:52');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 16:20:29');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 10:31:04');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 10:31:35');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 10:32:19');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 10:32:24');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 10:33:28');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-09 10:34:40');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-09 10:34:47');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 11:15:52');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', 'This object has not been built', '2023-02-09 11:15:54');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', 'This object has not been built', '2023-02-09 11:16:08');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', 'This object has not been built', '2023-02-09 11:16:17');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 11:17:17');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 11:35:15');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 11:35:24');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 11:36:18');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 11:36:21');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 11:36:49');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', 'This object has not been built', '2023-02-09 11:36:51');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 11:37:39');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-09 11:38:07');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', 'This object has not been built', '2023-02-09 11:38:10');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-09 11:38:40');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-09 11:38:40');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 15:41:47');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 09:18:33');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 09:19:31');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 09:19:35');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 09:20:21');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 09:20:45');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 09:21:26');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 09:22:51');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 10:36:30');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:36:59');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 10:37:29');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:37:59');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 10:38:22');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:38:24');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:38:33');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 10:39:10');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:40:08');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 11:43:25');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 11:46:31');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 14:36:09');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 14:41:00');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-14 14:41:16');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-14 14:41:16');
INSERT INTO `sys_logininfor` VALUES (299, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-14 15:22:18');
INSERT INTO `sys_logininfor` VALUES (300, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-14 15:22:18');
INSERT INTO `sys_logininfor` VALUES (301, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:22:34');
INSERT INTO `sys_logininfor` VALUES (302, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:24:22');
INSERT INTO `sys_logininfor` VALUES (303, 'ywy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-14 15:24:29');
INSERT INTO `sys_logininfor` VALUES (304, 'ywy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-14 15:24:29');
INSERT INTO `sys_logininfor` VALUES (305, 'ywy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:24:40');
INSERT INTO `sys_logininfor` VALUES (306, 'ywy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:24:45');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:24:48');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:26:55');
INSERT INTO `sys_logininfor` VALUES (309, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:27:03');
INSERT INTO `sys_logininfor` VALUES (310, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:28:43');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:28:46');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:31:54');
INSERT INTO `sys_logininfor` VALUES (313, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:32:10');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:41:35');
INSERT INTO `sys_logininfor` VALUES (315, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:45:04');
INSERT INTO `sys_logininfor` VALUES (316, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:45:10');
INSERT INTO `sys_logininfor` VALUES (317, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:49:09');
INSERT INTO `sys_logininfor` VALUES (318, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:49:16');
INSERT INTO `sys_logininfor` VALUES (319, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 15:57:27');
INSERT INTO `sys_logininfor` VALUES (320, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 15:57:42');
INSERT INTO `sys_logininfor` VALUES (321, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 16:01:27');
INSERT INTO `sys_logininfor` VALUES (322, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 16:01:33');
INSERT INTO `sys_logininfor` VALUES (323, 'ces', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-14 17:25:54');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 17:25:56');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-16 09:41:55');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 09:42:26');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2023-02-17 10:14:56');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2023-02-17 10:15:04');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-17 10:15:25');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-17 10:15:25');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 10:15:36');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-18 22:43:38');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-18 22:43:38');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-18 22:44:00');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-20 09:11:27');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-20 09:11:27');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 09:11:36');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 21:43:24');
INSERT INTO `sys_logininfor` VALUES (339, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-21 16:11:58');
INSERT INTO `sys_logininfor` VALUES (340, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-21 16:11:59');
INSERT INTO `sys_logininfor` VALUES (341, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 16:12:15');
INSERT INTO `sys_logininfor` VALUES (342, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 16:13:40');
INSERT INTO `sys_logininfor` VALUES (343, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 16:13:48');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-21 22:01:34');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-21 22:01:35');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 22:01:41');
INSERT INTO `sys_logininfor` VALUES (347, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 23:05:10');
INSERT INTO `sys_logininfor` VALUES (348, '13322072702', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 23:05:25');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-23 15:15:52');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-23 15:15:52');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 15:16:19');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 15:50:02');
INSERT INTO `sys_logininfor` VALUES (353, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-24 17:20:14');
INSERT INTO `sys_logininfor` VALUES (354, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 08:39:26');
INSERT INTO `sys_logininfor` VALUES (355, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 08:39:35');
INSERT INTO `sys_logininfor` VALUES (356, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 08:48:22');
INSERT INTO `sys_logininfor` VALUES (357, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 08:48:31');
INSERT INTO `sys_logininfor` VALUES (358, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 08:49:40');
INSERT INTO `sys_logininfor` VALUES (359, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 08:49:45');
INSERT INTO `sys_logininfor` VALUES (360, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:00:03');
INSERT INTO `sys_logininfor` VALUES (361, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:00:18');
INSERT INTO `sys_logininfor` VALUES (362, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:01:09');
INSERT INTO `sys_logininfor` VALUES (363, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:01:16');
INSERT INTO `sys_logininfor` VALUES (364, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:02:17');
INSERT INTO `sys_logininfor` VALUES (365, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:02:26');
INSERT INTO `sys_logininfor` VALUES (366, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:04:44');
INSERT INTO `sys_logininfor` VALUES (367, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:04:55');
INSERT INTO `sys_logininfor` VALUES (368, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:07:19');
INSERT INTO `sys_logininfor` VALUES (369, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:07:31');
INSERT INTO `sys_logininfor` VALUES (370, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:08:19');
INSERT INTO `sys_logininfor` VALUES (371, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:08:33');
INSERT INTO `sys_logininfor` VALUES (372, '13322072702', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:23:25');
INSERT INTO `sys_logininfor` VALUES (373, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：13312345678 不存在', '2023-02-25 09:25:46');
INSERT INTO `sys_logininfor` VALUES (374, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：13312345678 不存在', '2023-02-25 09:25:58');
INSERT INTO `sys_logininfor` VALUES (375, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:26:07');
INSERT INTO `sys_logininfor` VALUES (376, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 09:31:17');
INSERT INTO `sys_logininfor` VALUES (377, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 09:31:29');
INSERT INTO `sys_logininfor` VALUES (378, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-25 10:21:28');
INSERT INTO `sys_logininfor` VALUES (379, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 10:21:44');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-26 10:23:06');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-26 10:23:07');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-26 10:23:11');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-28 11:09:56');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-28 11:09:56');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-28 11:10:02');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-01 16:27:15');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 16:27:20');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 08:24:16');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-03 10:35:48');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-03 10:35:48');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 10:35:52');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-04 11:23:29');
INSERT INTO `sys_logininfor` VALUES (393, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-04 11:31:53');
INSERT INTO `sys_logininfor` VALUES (394, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-04 11:34:07');
INSERT INTO `sys_logininfor` VALUES (395, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-04 11:34:18');
INSERT INTO `sys_logininfor` VALUES (396, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-04 11:34:59');
INSERT INTO `sys_logininfor` VALUES (397, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-04 11:35:04');
INSERT INTO `sys_logininfor` VALUES (398, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-04 11:35:42');
INSERT INTO `sys_logininfor` VALUES (399, '13312345678', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-04 11:35:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-12 09:59:21', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-01-12 09:59:21', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-01-12 09:59:21', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2023-01-12 09:59:21', 'admin', '2023-01-12 10:28:39', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-01-12 09:59:21', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-01-12 09:59:21', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 4, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-01-12 09:59:21', 'admin', '2023-01-18 11:11:41', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '单位管理', 1, 3, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-01-12 09:59:21', 'admin', '2023-01-18 11:11:36', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2023-01-12 09:59:21', 'admin', '2023-01-18 11:11:09', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-01-12 09:59:21', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-01-12 09:59:21', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-01-12 09:59:21', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-01-12 09:59:21', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-01-12 09:59:21', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-01-12 09:59:21', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-01-12 09:59:21', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-01-12 09:59:21', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-01-12 09:59:21', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-01-12 09:59:21', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-01-12 09:59:21', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-01-12 09:59:21', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-01-12 09:59:21', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-01-12 09:59:21', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-01-12 09:59:21', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-01-12 09:59:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '设备管理', 0, 0, 'equipment', '', NULL, 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-01-18 16:32:50', 'admin', '2023-02-19 14:35:02', '');
INSERT INTO `sys_menu` VALUES (2001, '设备列表', 2000, 1, 'equipmentList', 'yixiu/equipment/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:equipment:list', 'component', 'admin', '2023-01-24 10:35:25', 'admin', '2023-02-04 13:55:13', '设备列表菜单');
INSERT INTO `sys_menu` VALUES (2002, '设备列表查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:equipment:query', '#', 'admin', '2023-01-24 10:35:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '设备列表新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:equipment:add', '#', 'admin', '2023-01-24 10:35:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '设备列表修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:equipment:edit', '#', 'admin', '2023-01-24 10:35:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '设备列表删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:equipment:remove', '#', 'admin', '2023-01-24 10:35:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '设备列表导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:equipment:export', '#', 'admin', '2023-01-24 10:35:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '设备二维码', 2001, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:equipment:qrCode', '#', 'admin', '2023-01-29 22:20:44', 'admin', '2023-01-29 22:21:03', '');
INSERT INTO `sys_menu` VALUES (2008, '报废申请', 2000, 1, 'scrap', 'yixiu/scrap/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:scrap:list', 'clipboard', 'admin', '2023-01-30 17:31:39', 'admin', '2023-01-30 17:33:08', '报废申请菜单');
INSERT INTO `sys_menu` VALUES (2009, '报废申请查询', 2008, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:scrap:query', '#', 'admin', '2023-01-30 17:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '报废申请新增', 2008, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:scrap:add', '#', 'admin', '2023-01-30 17:31:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '报废申请修改', 2008, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:scrap:edit', '#', 'admin', '2023-01-30 17:31:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '报废申请删除', 2008, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:scrap:remove', '#', 'admin', '2023-01-30 17:31:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '报废申请导出', 2008, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:scrap:export', '#', 'admin', '2023-01-30 17:31:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '耗材管理', 0, 0, 'material', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'date-range', 'admin', '2023-02-03 23:26:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '耗材列表', 2014, 1, 'materialList', 'yixiu/material/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:material:list', 'date', 'admin', '2023-02-03 23:35:06', 'admin', '2023-02-04 13:54:48', '耗材菜单');
INSERT INTO `sys_menu` VALUES (2016, '耗材查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:material:query', '#', 'admin', '2023-02-03 23:35:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '耗材新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:material:add', '#', 'admin', '2023-02-03 23:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '耗材修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:material:edit', '#', 'admin', '2023-02-03 23:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '耗材删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:material:remove', '#', 'admin', '2023-02-03 23:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '耗材导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:material:export', '#', 'admin', '2023-02-03 23:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '供应商管理', 2014, 1, 'supplier', 'yixiu/supplier/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:supplier:list', 'peoples', 'admin', '2023-02-04 10:06:21', 'admin', '2023-02-04 10:06:50', '供应商菜单');
INSERT INTO `sys_menu` VALUES (2022, '供应商查询', 2021, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:supplier:query', '#', 'admin', '2023-02-04 10:06:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '供应商新增', 2021, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:supplier:add', '#', 'admin', '2023-02-04 10:06:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '供应商修改', 2021, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:supplier:edit', '#', 'admin', '2023-02-04 10:06:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '供应商删除', 2021, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:supplier:remove', '#', 'admin', '2023-02-04 10:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '供应商导出', 2021, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:supplier:export', '#', 'admin', '2023-02-04 10:06:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '投诉列表', 0, 0, 'complaint', 'yixiu/complaint/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:complaint:list', 'validCode', 'admin', '2023-02-04 23:59:01', 'admin', '2023-02-04 23:59:58', '投诉菜单');
INSERT INTO `sys_menu` VALUES (2028, '投诉查询', 2027, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:complaint:query', '#', 'admin', '2023-02-04 23:59:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '投诉新增', 2027, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:complaint:add', '#', 'admin', '2023-02-04 23:59:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '投诉修改', 2027, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:complaint:edit', '#', 'admin', '2023-02-04 23:59:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '投诉删除', 2027, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:complaint:remove', '#', 'admin', '2023-02-04 23:59:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '投诉导出', 2027, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:complaint:export', '#', 'admin', '2023-02-04 23:59:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '不良事件', 0, 0, 'burst', 'yixiu/burst/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:burst:list', '404', 'admin', '2023-02-06 08:31:18', 'admin', '2023-02-06 08:32:05', '不良事件菜单');
INSERT INTO `sys_menu` VALUES (2034, '不良事件查询', 2033, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:burst:query', '#', 'admin', '2023-02-06 08:31:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '不良事件新增', 2033, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:burst:add', '#', 'admin', '2023-02-06 08:31:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '不良事件修改', 2033, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:burst:edit', '#', 'admin', '2023-02-06 08:31:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '不良事件删除', 2033, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:burst:remove', '#', 'admin', '2023-02-06 08:31:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '不良事件导出', 2033, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:burst:export', '#', 'admin', '2023-02-06 08:31:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '借配管理', 0, 0, 'deploy', 'yixiu/deploy/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:deploy:list', 'tree-table', 'admin', '2023-02-06 10:10:21', 'admin', '2023-02-07 08:19:24', '借配菜单');
INSERT INTO `sys_menu` VALUES (2040, '借配查询', 2039, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:deploy:query', '#', 'admin', '2023-02-06 10:10:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '借配新增', 2039, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:deploy:add', '#', 'admin', '2023-02-06 10:10:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '借配修改', 2039, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:deploy:edit', '#', 'admin', '2023-02-06 10:10:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '借配删除', 2039, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:deploy:remove', '#', 'admin', '2023-02-06 10:10:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '借配导出', 2039, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:deploy:export', '#', 'admin', '2023-02-06 10:10:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '后勤管理', 0, 0, 'logistics', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'skill', 'admin', '2023-02-06 15:46:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '配件申请', 2045, 0, 'parts', 'yixiu/parts/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:parts:list', 'tool', 'admin', '2023-02-06 16:01:28', 'admin', '2023-02-06 16:02:37', '配件申请菜单');
INSERT INTO `sys_menu` VALUES (2047, '配件申请查询', 2046, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:parts:query', '#', 'admin', '2023-02-06 16:01:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '配件申请新增', 2046, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:parts:add', '#', 'admin', '2023-02-06 16:01:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '配件申请修改', 2046, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:parts:edit', '#', 'admin', '2023-02-06 16:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '配件申请删除', 2046, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:parts:remove', '#', 'admin', '2023-02-06 16:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '配件申请导出', 2046, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:parts:export', '#', 'admin', '2023-02-06 16:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '配件审核', 2039, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:parts:audit', '#', 'admin', '2023-02-06 16:39:20', 'admin', '2023-02-06 16:40:01', '');
INSERT INTO `sys_menu` VALUES (2053, '工具申请', 2045, 1, 'tool', 'yixiu/tool/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:tool:list', 'job', 'admin', '2023-02-07 08:15:57', 'admin', '2023-02-07 08:19:08', '工具菜单');
INSERT INTO `sys_menu` VALUES (2054, '工具查询', 2053, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:tool:query', '#', 'admin', '2023-02-07 08:15:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '工具新增', 2053, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:tool:add', '#', 'admin', '2023-02-07 08:15:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '工具修改', 2053, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:tool:edit', '#', 'admin', '2023-02-07 08:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '工具删除', 2053, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:tool:remove', '#', 'admin', '2023-02-07 08:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '工具导出', 2053, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:tool:export', '#', 'admin', '2023-02-07 08:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '配件清单', 2045, 1, 'inventory', 'yixiu/inventory/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:inventory:list', 'documentation', 'admin', '2023-02-07 10:52:28', 'admin', '2023-02-07 10:53:13', '配件清单菜单');
INSERT INTO `sys_menu` VALUES (2060, '配件清单查询', 2059, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:inventory:query', '#', 'admin', '2023-02-07 10:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '配件清单新增', 2059, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:inventory:add', '#', 'admin', '2023-02-07 10:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '配件清单修改', 2059, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:inventory:edit', '#', 'admin', '2023-02-07 10:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '配件清单删除', 2059, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:inventory:remove', '#', 'admin', '2023-02-07 10:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '配件清单导出', 2059, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:inventory:export', '#', 'admin', '2023-02-07 10:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '财务管理', 0, 0, 'finance', NULL, NULL, 1, 0, 'M', '0', '0', '', 'money', 'admin', '2023-02-07 11:21:41', 'admin', '2023-02-07 11:28:33', '');
INSERT INTO `sys_menu` VALUES (2066, '报销列表', 2065, 1, 'reimbursement', 'yixiu/reimbursement/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:reimbursement:list', 'number', 'admin', '2023-02-07 11:27:30', 'admin', '2023-02-07 11:28:59', '报销菜单');
INSERT INTO `sys_menu` VALUES (2067, '报销查询', 2066, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:reimbursement:query', '#', 'admin', '2023-02-07 11:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '报销新增', 2066, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:reimbursement:add', '#', 'admin', '2023-02-07 11:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '报销修改', 2066, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:reimbursement:edit', '#', 'admin', '2023-02-07 11:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '报销删除', 2066, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:reimbursement:remove', '#', 'admin', '2023-02-07 11:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '报销导出', 2066, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:reimbursement:export', '#', 'admin', '2023-02-07 11:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '发票列表', 2065, 0, 'invoice', 'yixiu/invoice/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:invoice:list', 'monitor', 'admin', '2023-02-07 16:28:41', 'admin', '2023-02-07 16:29:25', '发票菜单');
INSERT INTO `sys_menu` VALUES (2073, '发票查询', 2072, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:invoice:query', '#', 'admin', '2023-02-07 16:28:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '发票新增', 2072, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:invoice:add', '#', 'admin', '2023-02-07 16:28:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '发票修改', 2072, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:invoice:edit', '#', 'admin', '2023-02-07 16:28:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '发票删除', 2072, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:invoice:remove', '#', 'admin', '2023-02-07 16:28:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '发票导出', 2072, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:invoice:export', '#', 'admin', '2023-02-07 16:28:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '轮播图', 1, 1, 'swiper', 'yixiu/swiper/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:swiper:list', 'upload', 'admin', '2023-02-17 15:58:37', 'admin', '2023-02-17 16:00:10', '轮播图菜单');
INSERT INTO `sys_menu` VALUES (2085, '轮播图查询', 2084, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:swiper:query', '#', 'admin', '2023-02-17 15:58:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '轮播图新增', 2084, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:swiper:add', '#', 'admin', '2023-02-17 15:58:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '轮播图修改', 2084, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:swiper:edit', '#', 'admin', '2023-02-17 15:58:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '轮播图删除', 2084, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:swiper:remove', '#', 'admin', '2023-02-17 15:58:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '轮播图导出', 2084, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:swiper:export', '#', 'admin', '2023-02-17 15:58:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '订单管理', 0, 0, 'order', 'yixiu/order/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:order:list', 'row', 'admin', '2023-02-19 14:25:12', 'admin', '2023-03-03 17:23:27', '订单菜单');
INSERT INTO `sys_menu` VALUES (2091, '订单查询', 2090, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:order:query', '#', 'admin', '2023-02-19 14:25:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '订单新增', 2090, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:order:add', '#', 'admin', '2023-02-19 14:25:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '订单修改', 2090, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:order:edit', '#', 'admin', '2023-02-19 14:25:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '订单删除', 2090, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:order:remove', '#', 'admin', '2023-02-19 14:25:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '订单导出', 2090, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:order:export', '#', 'admin', '2023-02-19 14:25:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '自主接单', 2090, 6, '#', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:pick', '#', '13322072702', '2023-02-21 23:01:33', 'admin', '2023-02-24 10:06:24', '');
INSERT INTO `sys_menu` VALUES (2097, '系统派单', 2090, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:send', '#', 'admin', '2023-02-24 15:22:24', 'admin', '2023-02-24 15:22:50', '');
INSERT INTO `sys_menu` VALUES (2098, '订单检测', 2090, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:detection', '#', 'admin', '2023-02-26 13:22:10', 'admin', '2023-02-26 13:22:16', '');
INSERT INTO `sys_menu` VALUES (2099, '检测报告', 2090, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:report', '#', 'admin', '2023-02-26 14:47:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '配件报价', 2090, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:feedback', '#', 'admin', '2023-02-26 16:19:55', 'admin', '2023-02-27 10:51:52', '');
INSERT INTO `sys_menu` VALUES (2101, '订单审核', 2090, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:audit', '#', 'admin', '2023-02-27 14:56:08', 'admin', '2023-02-27 14:56:30', '');
INSERT INTO `sys_menu` VALUES (2102, '开始维修', 2090, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:startRepair', '#', 'admin', '2023-02-27 22:44:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '维修完成', 2090, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:endRepair', '#', 'admin', '2023-02-27 23:12:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '订单验收', 2090, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:acceptance', '#', 'admin', '2023-02-28 16:32:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '订单评价', 2090, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'yixiu:order:evaluation', '#', 'admin', '2023-02-28 16:59:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '单页管理', 0, 0, 'singlepage', 'yixiu/singlepage/index', NULL, 1, 0, 'C', '0', '0', 'yixiu:singlepage:list', 'documentation', 'admin', '2023-03-03 17:22:18', 'admin', '2023-03-03 17:25:31', '单页菜单');
INSERT INTO `sys_menu` VALUES (2107, '单页查询', 2106, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:singlepage:query', '#', 'admin', '2023-03-03 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '单页新增', 2106, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:singlepage:add', '#', 'admin', '2023-03-03 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '单页修改', 2106, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:singlepage:edit', '#', 'admin', '2023-03-03 17:22:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '单页删除', 2106, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:singlepage:remove', '#', 'admin', '2023-03-03 17:22:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '单页导出', 2106, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'yixiu:singlepage:export', '#', 'admin', '2023-03-03 17:22:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-01-12 09:59:30', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-01-12 09:59:30', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 639 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-01-12 09:59:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-01-12 09:59:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-01-12 09:59:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-01-12 09:59:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-01-12 09:59:20', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '0', '2', 'admin', '2023-01-12 09:59:20', 'admin', '2023-01-17 22:07:01', '普通角色');
INSERT INTO `sys_role` VALUES (100, '业务员', 'business', 3, '1', 1, 1, '0', '0', 'admin', '2023-01-13 16:13:56', 'admin', '2023-03-04 11:25:51', '业务员');
INSERT INTO `sys_role` VALUES (101, '科室人员', 'administration', 4, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:04:51', '', NULL, '科室人员');
INSERT INTO `sys_role` VALUES (102, '科室负责人', 'administrativeDirector', 5, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:06:09', '', NULL, '科室负责人');
INSERT INTO `sys_role` VALUES (103, '装备部负责人', 'equipmentDirector', 6, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:07:21', 'admin', '2023-01-13 17:07:46', '装备部负责人');
INSERT INTO `sys_role` VALUES (104, '维修点负责人', 'maintainDirector', 7, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:08:30', 'admin', '2023-01-13 17:08:40', '维修点负责人');
INSERT INTO `sys_role` VALUES (105, '分管院长', 'vicePresident', 8, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:09:28', 'admin', '2023-01-13 17:09:36', '分管院长');
INSERT INTO `sys_role` VALUES (106, '院长', 'dean', 9, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:10:03', '', NULL, '院长');
INSERT INTO `sys_role` VALUES (107, '后勤人员', 'rearServices', 10, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:10:47', 'admin', '2023-01-13 17:10:51', '后勤人员');
INSERT INTO `sys_role` VALUES (108, '财务人员', 'finance', 11, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:11:17', '', NULL, '财务人员');
INSERT INTO `sys_role` VALUES (109, '游客', 'tourist', 12, '1', 1, 1, '0', '0', 'admin', '2023-02-15 17:07:32', 'admin', '2023-02-21 10:08:34', NULL);
INSERT INTO `sys_role` VALUES (110, '工程师', 'engineer', 13, '2', 1, 1, '0', '0', 'admin', '2023-02-21 10:09:02', 'admin', '2023-03-04 11:58:56', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (110, 1);
INSERT INTO `sys_role_dept` VALUES (110, 2);
INSERT INTO `sys_role_dept` VALUES (110, 4);
INSERT INTO `sys_role_dept` VALUES (110, 22);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2047);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (100, 2059);
INSERT INTO `sys_role_menu` VALUES (100, 2060);
INSERT INTO `sys_role_menu` VALUES (100, 2061);
INSERT INTO `sys_role_menu` VALUES (100, 2062);
INSERT INTO `sys_role_menu` VALUES (100, 2063);
INSERT INTO `sys_role_menu` VALUES (100, 2064);
INSERT INTO `sys_role_menu` VALUES (100, 2065);
INSERT INTO `sys_role_menu` VALUES (100, 2066);
INSERT INTO `sys_role_menu` VALUES (100, 2067);
INSERT INTO `sys_role_menu` VALUES (100, 2068);
INSERT INTO `sys_role_menu` VALUES (100, 2069);
INSERT INTO `sys_role_menu` VALUES (100, 2070);
INSERT INTO `sys_role_menu` VALUES (100, 2071);
INSERT INTO `sys_role_menu` VALUES (100, 2072);
INSERT INTO `sys_role_menu` VALUES (100, 2073);
INSERT INTO `sys_role_menu` VALUES (100, 2074);
INSERT INTO `sys_role_menu` VALUES (100, 2075);
INSERT INTO `sys_role_menu` VALUES (100, 2076);
INSERT INTO `sys_role_menu` VALUES (100, 2077);
INSERT INTO `sys_role_menu` VALUES (100, 2084);
INSERT INTO `sys_role_menu` VALUES (100, 2085);
INSERT INTO `sys_role_menu` VALUES (100, 2086);
INSERT INTO `sys_role_menu` VALUES (100, 2087);
INSERT INTO `sys_role_menu` VALUES (100, 2088);
INSERT INTO `sys_role_menu` VALUES (100, 2089);
INSERT INTO `sys_role_menu` VALUES (100, 2090);
INSERT INTO `sys_role_menu` VALUES (100, 2091);
INSERT INTO `sys_role_menu` VALUES (100, 2092);
INSERT INTO `sys_role_menu` VALUES (100, 2093);
INSERT INTO `sys_role_menu` VALUES (100, 2094);
INSERT INTO `sys_role_menu` VALUES (100, 2095);
INSERT INTO `sys_role_menu` VALUES (100, 2096);
INSERT INTO `sys_role_menu` VALUES (100, 2097);
INSERT INTO `sys_role_menu` VALUES (100, 2098);
INSERT INTO `sys_role_menu` VALUES (100, 2099);
INSERT INTO `sys_role_menu` VALUES (100, 2100);
INSERT INTO `sys_role_menu` VALUES (100, 2101);
INSERT INTO `sys_role_menu` VALUES (100, 2102);
INSERT INTO `sys_role_menu` VALUES (100, 2103);
INSERT INTO `sys_role_menu` VALUES (100, 2104);
INSERT INTO `sys_role_menu` VALUES (100, 2105);
INSERT INTO `sys_role_menu` VALUES (100, 2106);
INSERT INTO `sys_role_menu` VALUES (100, 2107);
INSERT INTO `sys_role_menu` VALUES (100, 2108);
INSERT INTO `sys_role_menu` VALUES (100, 2109);
INSERT INTO `sys_role_menu` VALUES (100, 2110);
INSERT INTO `sys_role_menu` VALUES (100, 2111);
INSERT INTO `sys_role_menu` VALUES (101, 4);
INSERT INTO `sys_role_menu` VALUES (102, 4);
INSERT INTO `sys_role_menu` VALUES (103, 4);
INSERT INTO `sys_role_menu` VALUES (104, 4);
INSERT INTO `sys_role_menu` VALUES (105, 4);
INSERT INTO `sys_role_menu` VALUES (106, 4);
INSERT INTO `sys_role_menu` VALUES (107, 4);
INSERT INTO `sys_role_menu` VALUES (108, 4);
INSERT INTO `sys_role_menu` VALUES (110, 1);
INSERT INTO `sys_role_menu` VALUES (110, 2);
INSERT INTO `sys_role_menu` VALUES (110, 3);
INSERT INTO `sys_role_menu` VALUES (110, 4);
INSERT INTO `sys_role_menu` VALUES (110, 100);
INSERT INTO `sys_role_menu` VALUES (110, 101);
INSERT INTO `sys_role_menu` VALUES (110, 102);
INSERT INTO `sys_role_menu` VALUES (110, 103);
INSERT INTO `sys_role_menu` VALUES (110, 104);
INSERT INTO `sys_role_menu` VALUES (110, 105);
INSERT INTO `sys_role_menu` VALUES (110, 106);
INSERT INTO `sys_role_menu` VALUES (110, 107);
INSERT INTO `sys_role_menu` VALUES (110, 108);
INSERT INTO `sys_role_menu` VALUES (110, 109);
INSERT INTO `sys_role_menu` VALUES (110, 110);
INSERT INTO `sys_role_menu` VALUES (110, 111);
INSERT INTO `sys_role_menu` VALUES (110, 112);
INSERT INTO `sys_role_menu` VALUES (110, 113);
INSERT INTO `sys_role_menu` VALUES (110, 114);
INSERT INTO `sys_role_menu` VALUES (110, 115);
INSERT INTO `sys_role_menu` VALUES (110, 116);
INSERT INTO `sys_role_menu` VALUES (110, 117);
INSERT INTO `sys_role_menu` VALUES (110, 500);
INSERT INTO `sys_role_menu` VALUES (110, 501);
INSERT INTO `sys_role_menu` VALUES (110, 1000);
INSERT INTO `sys_role_menu` VALUES (110, 1001);
INSERT INTO `sys_role_menu` VALUES (110, 1002);
INSERT INTO `sys_role_menu` VALUES (110, 1003);
INSERT INTO `sys_role_menu` VALUES (110, 1004);
INSERT INTO `sys_role_menu` VALUES (110, 1005);
INSERT INTO `sys_role_menu` VALUES (110, 1006);
INSERT INTO `sys_role_menu` VALUES (110, 1007);
INSERT INTO `sys_role_menu` VALUES (110, 1008);
INSERT INTO `sys_role_menu` VALUES (110, 1009);
INSERT INTO `sys_role_menu` VALUES (110, 1010);
INSERT INTO `sys_role_menu` VALUES (110, 1011);
INSERT INTO `sys_role_menu` VALUES (110, 1012);
INSERT INTO `sys_role_menu` VALUES (110, 1013);
INSERT INTO `sys_role_menu` VALUES (110, 1014);
INSERT INTO `sys_role_menu` VALUES (110, 1015);
INSERT INTO `sys_role_menu` VALUES (110, 1016);
INSERT INTO `sys_role_menu` VALUES (110, 1017);
INSERT INTO `sys_role_menu` VALUES (110, 1018);
INSERT INTO `sys_role_menu` VALUES (110, 1019);
INSERT INTO `sys_role_menu` VALUES (110, 1020);
INSERT INTO `sys_role_menu` VALUES (110, 1021);
INSERT INTO `sys_role_menu` VALUES (110, 1022);
INSERT INTO `sys_role_menu` VALUES (110, 1023);
INSERT INTO `sys_role_menu` VALUES (110, 1024);
INSERT INTO `sys_role_menu` VALUES (110, 1025);
INSERT INTO `sys_role_menu` VALUES (110, 1026);
INSERT INTO `sys_role_menu` VALUES (110, 1027);
INSERT INTO `sys_role_menu` VALUES (110, 1028);
INSERT INTO `sys_role_menu` VALUES (110, 1029);
INSERT INTO `sys_role_menu` VALUES (110, 1030);
INSERT INTO `sys_role_menu` VALUES (110, 1031);
INSERT INTO `sys_role_menu` VALUES (110, 1032);
INSERT INTO `sys_role_menu` VALUES (110, 1033);
INSERT INTO `sys_role_menu` VALUES (110, 1034);
INSERT INTO `sys_role_menu` VALUES (110, 1035);
INSERT INTO `sys_role_menu` VALUES (110, 1036);
INSERT INTO `sys_role_menu` VALUES (110, 1037);
INSERT INTO `sys_role_menu` VALUES (110, 1038);
INSERT INTO `sys_role_menu` VALUES (110, 1039);
INSERT INTO `sys_role_menu` VALUES (110, 1040);
INSERT INTO `sys_role_menu` VALUES (110, 1041);
INSERT INTO `sys_role_menu` VALUES (110, 1042);
INSERT INTO `sys_role_menu` VALUES (110, 1043);
INSERT INTO `sys_role_menu` VALUES (110, 1044);
INSERT INTO `sys_role_menu` VALUES (110, 1045);
INSERT INTO `sys_role_menu` VALUES (110, 1046);
INSERT INTO `sys_role_menu` VALUES (110, 1047);
INSERT INTO `sys_role_menu` VALUES (110, 1048);
INSERT INTO `sys_role_menu` VALUES (110, 1049);
INSERT INTO `sys_role_menu` VALUES (110, 1050);
INSERT INTO `sys_role_menu` VALUES (110, 1051);
INSERT INTO `sys_role_menu` VALUES (110, 1052);
INSERT INTO `sys_role_menu` VALUES (110, 1053);
INSERT INTO `sys_role_menu` VALUES (110, 1054);
INSERT INTO `sys_role_menu` VALUES (110, 1055);
INSERT INTO `sys_role_menu` VALUES (110, 1056);
INSERT INTO `sys_role_menu` VALUES (110, 1057);
INSERT INTO `sys_role_menu` VALUES (110, 1058);
INSERT INTO `sys_role_menu` VALUES (110, 1059);
INSERT INTO `sys_role_menu` VALUES (110, 1060);
INSERT INTO `sys_role_menu` VALUES (110, 2000);
INSERT INTO `sys_role_menu` VALUES (110, 2001);
INSERT INTO `sys_role_menu` VALUES (110, 2002);
INSERT INTO `sys_role_menu` VALUES (110, 2003);
INSERT INTO `sys_role_menu` VALUES (110, 2004);
INSERT INTO `sys_role_menu` VALUES (110, 2005);
INSERT INTO `sys_role_menu` VALUES (110, 2006);
INSERT INTO `sys_role_menu` VALUES (110, 2007);
INSERT INTO `sys_role_menu` VALUES (110, 2008);
INSERT INTO `sys_role_menu` VALUES (110, 2009);
INSERT INTO `sys_role_menu` VALUES (110, 2010);
INSERT INTO `sys_role_menu` VALUES (110, 2011);
INSERT INTO `sys_role_menu` VALUES (110, 2012);
INSERT INTO `sys_role_menu` VALUES (110, 2013);
INSERT INTO `sys_role_menu` VALUES (110, 2014);
INSERT INTO `sys_role_menu` VALUES (110, 2015);
INSERT INTO `sys_role_menu` VALUES (110, 2016);
INSERT INTO `sys_role_menu` VALUES (110, 2017);
INSERT INTO `sys_role_menu` VALUES (110, 2018);
INSERT INTO `sys_role_menu` VALUES (110, 2019);
INSERT INTO `sys_role_menu` VALUES (110, 2020);
INSERT INTO `sys_role_menu` VALUES (110, 2021);
INSERT INTO `sys_role_menu` VALUES (110, 2022);
INSERT INTO `sys_role_menu` VALUES (110, 2023);
INSERT INTO `sys_role_menu` VALUES (110, 2024);
INSERT INTO `sys_role_menu` VALUES (110, 2025);
INSERT INTO `sys_role_menu` VALUES (110, 2026);
INSERT INTO `sys_role_menu` VALUES (110, 2027);
INSERT INTO `sys_role_menu` VALUES (110, 2028);
INSERT INTO `sys_role_menu` VALUES (110, 2029);
INSERT INTO `sys_role_menu` VALUES (110, 2030);
INSERT INTO `sys_role_menu` VALUES (110, 2031);
INSERT INTO `sys_role_menu` VALUES (110, 2032);
INSERT INTO `sys_role_menu` VALUES (110, 2033);
INSERT INTO `sys_role_menu` VALUES (110, 2034);
INSERT INTO `sys_role_menu` VALUES (110, 2035);
INSERT INTO `sys_role_menu` VALUES (110, 2036);
INSERT INTO `sys_role_menu` VALUES (110, 2037);
INSERT INTO `sys_role_menu` VALUES (110, 2038);
INSERT INTO `sys_role_menu` VALUES (110, 2039);
INSERT INTO `sys_role_menu` VALUES (110, 2040);
INSERT INTO `sys_role_menu` VALUES (110, 2041);
INSERT INTO `sys_role_menu` VALUES (110, 2042);
INSERT INTO `sys_role_menu` VALUES (110, 2043);
INSERT INTO `sys_role_menu` VALUES (110, 2044);
INSERT INTO `sys_role_menu` VALUES (110, 2045);
INSERT INTO `sys_role_menu` VALUES (110, 2046);
INSERT INTO `sys_role_menu` VALUES (110, 2047);
INSERT INTO `sys_role_menu` VALUES (110, 2048);
INSERT INTO `sys_role_menu` VALUES (110, 2049);
INSERT INTO `sys_role_menu` VALUES (110, 2050);
INSERT INTO `sys_role_menu` VALUES (110, 2051);
INSERT INTO `sys_role_menu` VALUES (110, 2052);
INSERT INTO `sys_role_menu` VALUES (110, 2053);
INSERT INTO `sys_role_menu` VALUES (110, 2054);
INSERT INTO `sys_role_menu` VALUES (110, 2055);
INSERT INTO `sys_role_menu` VALUES (110, 2056);
INSERT INTO `sys_role_menu` VALUES (110, 2057);
INSERT INTO `sys_role_menu` VALUES (110, 2058);
INSERT INTO `sys_role_menu` VALUES (110, 2059);
INSERT INTO `sys_role_menu` VALUES (110, 2060);
INSERT INTO `sys_role_menu` VALUES (110, 2061);
INSERT INTO `sys_role_menu` VALUES (110, 2062);
INSERT INTO `sys_role_menu` VALUES (110, 2063);
INSERT INTO `sys_role_menu` VALUES (110, 2064);
INSERT INTO `sys_role_menu` VALUES (110, 2065);
INSERT INTO `sys_role_menu` VALUES (110, 2066);
INSERT INTO `sys_role_menu` VALUES (110, 2067);
INSERT INTO `sys_role_menu` VALUES (110, 2068);
INSERT INTO `sys_role_menu` VALUES (110, 2069);
INSERT INTO `sys_role_menu` VALUES (110, 2070);
INSERT INTO `sys_role_menu` VALUES (110, 2071);
INSERT INTO `sys_role_menu` VALUES (110, 2072);
INSERT INTO `sys_role_menu` VALUES (110, 2073);
INSERT INTO `sys_role_menu` VALUES (110, 2074);
INSERT INTO `sys_role_menu` VALUES (110, 2075);
INSERT INTO `sys_role_menu` VALUES (110, 2076);
INSERT INTO `sys_role_menu` VALUES (110, 2077);
INSERT INTO `sys_role_menu` VALUES (110, 2084);
INSERT INTO `sys_role_menu` VALUES (110, 2085);
INSERT INTO `sys_role_menu` VALUES (110, 2086);
INSERT INTO `sys_role_menu` VALUES (110, 2087);
INSERT INTO `sys_role_menu` VALUES (110, 2088);
INSERT INTO `sys_role_menu` VALUES (110, 2089);
INSERT INTO `sys_role_menu` VALUES (110, 2090);
INSERT INTO `sys_role_menu` VALUES (110, 2091);
INSERT INTO `sys_role_menu` VALUES (110, 2092);
INSERT INTO `sys_role_menu` VALUES (110, 2093);
INSERT INTO `sys_role_menu` VALUES (110, 2094);
INSERT INTO `sys_role_menu` VALUES (110, 2095);
INSERT INTO `sys_role_menu` VALUES (110, 2096);
INSERT INTO `sys_role_menu` VALUES (110, 2097);
INSERT INTO `sys_role_menu` VALUES (110, 2098);
INSERT INTO `sys_role_menu` VALUES (110, 2099);
INSERT INTO `sys_role_menu` VALUES (110, 2100);
INSERT INTO `sys_role_menu` VALUES (110, 2101);
INSERT INTO `sys_role_menu` VALUES (110, 2102);
INSERT INTO `sys_role_menu` VALUES (110, 2103);
INSERT INTO `sys_role_menu` VALUES (110, 2104);
INSERT INTO `sys_role_menu` VALUES (110, 2105);
INSERT INTO `sys_role_menu` VALUES (110, 2106);
INSERT INTO `sys_role_menu` VALUES (110, 2107);
INSERT INTO `sys_role_menu` VALUES (110, 2108);
INSERT INTO `sys_role_menu` VALUES (110, 2109);
INSERT INTO `sys_role_menu` VALUES (110, 2110);
INSERT INTO `sys_role_menu` VALUES (110, 2111);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 109, 'admin', '若依admin', '00', 'ry@163.com', '15888888888', '1', '', '', '$2a$10$VLGeuQwG4tJu1k18ibcV4OlbCRRLqeg0fALTx2a9c9c0n00c/Qsm.', '0', '0', '127.0.0.1', '2023-03-04 11:23:30', 'admin', '2023-01-12 09:59:19', '', '2023-03-04 11:23:29', '管理员');
INSERT INTO `sys_user` VALUES (100, 4, 'ywy', '王志文', '00', '', '', '0', '', '', '$2a$10$pFfsJYc9sfA7ApRXHL0Z9uQQZglByUPzKlZIXyeCZDOGA90wGPa7i', '0', '0', '127.0.0.1', '2023-02-14 15:24:40', 'admin', '2023-01-13 16:17:27', 'admin', '2023-02-14 15:24:40', NULL);
INSERT INTO `sys_user` VALUES (101, 2, 'ces', '测试', '00', '', '', '0', '', NULL, '$2a$10$soUhsNTFjSNNRfiIKb9Td.VXMk79PUko5ZazVXZcklIa2C3WBwGtK', '0', '0', '127.0.0.1', '2023-02-14 16:01:33', 'admin', '2023-01-18 11:03:43', 'admin', '2023-02-14 16:01:33', '备注');
INSERT INTO `sys_user` VALUES (102, 4, '13312345678', '微信用户', '00', '', '13312345678', '2', '/profile/avatar/2023/03/01/sK3SZtG9kh8Ne35495a332bf517778fde02f348b895e_20230301162911A032.jpeg', 'ofRQm44wwrKLCpOIbfk0w1KMSVY8', '$2a$10$VLGeuQwG4tJu1k18ibcV4OlbCRRLqeg0fALTx2a9c9c0n00c/Qsm.', '0', '0', '127.0.0.1', '2023-03-05 16:11:07', '', '2023-02-16 15:33:30', 'admin', '2023-03-05 16:11:06', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 101);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 110);

SET FOREIGN_KEY_CHECKS = 1;
