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

 Date: 18/01/2023 11:13:05
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-01-12 09:59:27', '', NULL, '是否开启验证码功能（true开启，false关闭）');
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '医修', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '海口维修点', 0, NULL, '羊学翰', '13719408284', NULL, '海口市秀英区永万路120号诚方创世纪B409', NULL, '0', '0', 'admin', '2023-01-18 08:35:10', '', NULL);
INSERT INTO `sys_dept` VALUES (3, 1, '0,1', '儋州维修点', 0, NULL, '李开唐', '18289766186', NULL, '广场花园小区A2栋1203A', NULL, '0', '0', 'admin', '2023-01-18 08:36:32', 'admin', '2023-01-18 08:43:40');
INSERT INTO `sys_dept` VALUES (4, 2, '0,1,2', '海南口腔医院', 0, 100, '罗主任', NULL, NULL, '友谊路123号', '代签', '0', '0', 'admin', '2023-01-18 08:37:35', 'admin', '2023-01-18 08:44:31');
INSERT INTO `sys_dept` VALUES (5, 6, '0,1,6', '琼中县人民医院', 0, NULL, '陈工', '18789555770', NULL, '琼中县营根镇虎卫路', NULL, '1', '0', 'admin', '2023-01-18 08:38:12', 'admin', '2023-01-18 08:43:43');
INSERT INTO `sys_dept` VALUES (6, 1, '0,1', '琼中维修点', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2023-01-18 08:39:03', 'admin', '2023-01-18 08:43:37');
INSERT INTO `sys_dept` VALUES (7, 1, '0,1', '白沙维修点', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2023-01-18 08:39:40', 'admin', '2023-01-18 08:43:32');
INSERT INTO `sys_dept` VALUES (8, 7, '0,1,7', '白沙县人民医院', 0, NULL, '王恒颖', '13876627080', NULL, '白沙县牙叉镇', '负责操作维修', '0', '0', 'admin', '2023-01-18 08:40:21', '', NULL);
INSERT INTO `sys_dept` VALUES (9, 3, '0,1,3', '海南西部中心医院', 0, NULL, '许工', '18976871984', NULL, '儋州市那大镇伏波东路2号', '部分签约', '0', '0', 'admin', '2023-01-18 08:41:07', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 324 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-01-12 10:24:01');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-01-12 10:24:11');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-12 10:28:18');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-12 10:28:40');
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2023-01-12 16:59:39');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"sys_user\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-12 17:03:34');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-12 17:03:40');
INSERT INTO `sys_oper_log` VALUES (107, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"签约状态\",\"dictType\":\"sys_dept_type\",\"params\":{},\"remark\":\"科室状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 10:45:36');
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"签约\",\"dictSort\":1,\"dictType\":\"sys_dept_type\",\"dictValue\":\"0\",\"listClass\":\"success\",\"params\":{},\"remark\":\"签约\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 10:48:10');
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-13 10:48:09\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"签约\",\"dictSort\":1,\"dictType\":\"sys_dept_type\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 10:48:17');
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1\",\"dictSort\":0,\"dictType\":\"sys_dept_type\",\"dictValue\":\"未签\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 10:49:03');
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-13 10:49:03\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"未签\",\"dictSort\":0,\"dictType\":\"sys_dept_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 10:49:19');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-13 10:49:03\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"未签\",\"dictSort\":1,\"dictType\":\"sys_dept_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 10:49:27');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"单位管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 11:26:37');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 11:26:59');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"单位管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 11:27:08');
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"业务员\",\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 16:13:56');
INSERT INTO `sys_oper_log` VALUES (117, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"ywy\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"王志文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 16:17:27');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2023-01-13 16:20:14');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 16:20:20');
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 16:20:23');
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"科室人员\",\"roleId\":101,\"roleKey\":\"administration\",\"roleName\":\"科室人员\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:04:51');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"科室负责人\",\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:06:10');
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"装备部负责人\",\"roleId\":103,\"roleKey\":\"equipment\",\"roleName\":\"装备部负责人\",\"roleSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:07:21');
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-01-13 17:07:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"装备部负责人\",\"roleId\":103,\"roleKey\":\"equipmentDirector\",\"roleName\":\"装备部负责人\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:07:47');
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"维修点负责人\",\"roleId\":104,\"roleKey\":\"maintain\",\"roleName\":\"维修点负责人\",\"roleSort\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:08:30');
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-01-13 17:08:30\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"维修点负责人\",\"roleId\":104,\"roleKey\":\"maintainDirector\",\"roleName\":\"维修点负责人\",\"roleSort\":7,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:08:41');
INSERT INTO `sys_oper_log` VALUES (127, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"分管院长\",\"roleId\":105,\"roleKey\":\"vicePresident\",\"roleName\":\"分管院长\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:09:28');
INSERT INTO `sys_oper_log` VALUES (128, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-01-13 17:09:28\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"分管院长\",\"roleId\":105,\"roleKey\":\"vicePresident\",\"roleName\":\"分管院长\",\"roleSort\":8,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:09:36');
INSERT INTO `sys_oper_log` VALUES (129, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"院长\",\"roleId\":106,\"roleKey\":\"dean\",\"roleName\":\"院长\",\"roleSort\":9,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:10:03');
INSERT INTO `sys_oper_log` VALUES (130, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"后勤人员\",\"roleId\":107,\"roleKey\":\"rearServices\",\"roleName\":\"后勤人员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:10:47');
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-01-13 17:10:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"后勤人员\",\"roleId\":107,\"roleKey\":\"rearServices\",\"roleName\":\"后勤人员\",\"roleSort\":10,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:10:52');
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"财务人员\",\"roleId\":108,\"roleKey\":\"finance\",\"roleName\":\"财务人员\",\"roleSort\":11,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:11:18');
INSERT INTO `sys_oper_log` VALUES (133, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:12:43');
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 17:12:50');
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-16 09:41:22');
INSERT INTO `sys_oper_log` VALUES (136, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"财务部门\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":107,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 08:16:37');
INSERT INTO `sys_oper_log` VALUES (137, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{\"1\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:22:19');
INSERT INTO `sys_oper_log` VALUES (138, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{\"1\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:22:22');
INSERT INTO `sys_oper_log` VALUES (139, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:27:48');
INSERT INTO `sys_oper_log` VALUES (140, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:29:17');
INSERT INTO `sys_oper_log` VALUES (141, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:29:24');
INSERT INTO `sys_oper_log` VALUES (142, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:31:51');
INSERT INTO `sys_oper_log` VALUES (143, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:31:57');
INSERT INTO `sys_oper_log` VALUES (144, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:33:26');
INSERT INTO `sys_oper_log` VALUES (145, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:35:49');
INSERT INTO `sys_oper_log` VALUES (146, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"财务部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 10:38:00');
INSERT INTO `sys_oper_log` VALUES (147, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:38:00');
INSERT INTO `sys_oper_log` VALUES (148, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:38:26');
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"财务部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"\\t\\r\\n儋州维修点\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 10:38:30');
INSERT INTO `sys_oper_log` VALUES (150, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:38:31');
INSERT INTO `sys_oper_log` VALUES (151, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:38:37');
INSERT INTO `sys_oper_log` VALUES (152, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:43:14');
INSERT INTO `sys_oper_log` VALUES (153, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:54:59');
INSERT INTO `sys_oper_log` VALUES (154, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 10:55:05');
INSERT INTO `sys_oper_log` VALUES (155, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:00:56');
INSERT INTO `sys_oper_log` VALUES (156, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:01:12');
INSERT INTO `sys_oper_log` VALUES (157, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:17:32');
INSERT INTO `sys_oper_log` VALUES (158, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:17:55');
INSERT INTO `sys_oper_log` VALUES (159, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:17:59');
INSERT INTO `sys_oper_log` VALUES (160, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:18:15');
INSERT INTO `sys_oper_log` VALUES (161, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:18:40');
INSERT INTO `sys_oper_log` VALUES (162, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:19:21');
INSERT INTO `sys_oper_log` VALUES (163, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:19:24');
INSERT INTO `sys_oper_log` VALUES (164, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:20:58');
INSERT INTO `sys_oper_log` VALUES (165, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:21:15');
INSERT INTO `sys_oper_log` VALUES (166, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:21:19');
INSERT INTO `sys_oper_log` VALUES (167, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:21:39');
INSERT INTO `sys_oper_log` VALUES (168, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:21:47');
INSERT INTO `sys_oper_log` VALUES (169, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:32:07');
INSERT INTO `sys_oper_log` VALUES (170, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 16:32:10');
INSERT INTO `sys_oper_log` VALUES (171, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:02:16');
INSERT INTO `sys_oper_log` VALUES (172, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:02:36');
INSERT INTO `sys_oper_log` VALUES (173, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:04:07');
INSERT INTO `sys_oper_log` VALUES (174, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:22:56');
INSERT INTO `sys_oper_log` VALUES (175, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:25:24');
INSERT INTO `sys_oper_log` VALUES (176, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:25:31');
INSERT INTO `sys_oper_log` VALUES (177, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 17:26:55');
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:01:55');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"运维部门\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":107,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:02:00');
INSERT INTO `sys_oper_log` VALUES (180, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-01-12 09:59:20\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:02:08');
INSERT INTO `sys_oper_log` VALUES (181, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:03:07');
INSERT INTO `sys_oper_log` VALUES (182, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:06:33');
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:06:43');
INSERT INTO `sys_oper_log` VALUES (184, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:06:55');
INSERT INTO `sys_oper_log` VALUES (185, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:07:01');
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:46:35');
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:46:46');
INSERT INTO `sys_oper_log` VALUES (188, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:46:53');
INSERT INTO `sys_oper_log` VALUES (189, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:50:08');
INSERT INTO `sys_oper_log` VALUES (190, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:50:34');
INSERT INTO `sys_oper_log` VALUES (191, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:51:23');
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:52:18');
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:52:53');
INSERT INTO `sys_oper_log` VALUES (194, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:53:08');
INSERT INTO `sys_oper_log` VALUES (195, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:56:39');
INSERT INTO `sys_oper_log` VALUES (196, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:56:54');
INSERT INTO `sys_oper_log` VALUES (197, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:57:18');
INSERT INTO `sys_oper_log` VALUES (198, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:57:22');
INSERT INTO `sys_oper_log` VALUES (199, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 22:57:41');
INSERT INTO `sys_oper_log` VALUES (200, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 22:58:20');
INSERT INTO `sys_oper_log` VALUES (201, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:00:15');
INSERT INTO `sys_oper_log` VALUES (202, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"remark\":\"备注\",\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'', '2023-01-17 23:00:25');
INSERT INTO `sys_oper_log` VALUES (203, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"remark\":\"备注\",\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'', '2023-01-17 23:00:34');
INSERT INTO `sys_oper_log` VALUES (204, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"remark\":\"备注\",\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:02:14');
INSERT INTO `sys_oper_log` VALUES (205, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"},{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:02:33');
INSERT INTO `sys_oper_log` VALUES (206, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"remark\":\"备注\",\"status\":\"1\",\"updateBy\":\"admin\",\"user\":{\"admin\":false,\"params\":{},\"userId\":100},\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:02:36');
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 09:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-01-12 09:59:19\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依测试\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:02:55');
INSERT INTO `sys_oper_log` VALUES (208, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:03:05');
INSERT INTO `sys_oper_log` VALUES (209, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15888888888\",\"remark\":\"备注\",\"status\":\"1\",\"updateBy\":\"admin\",\"user\":{\"admin\":false,\"params\":{},\"userId\":2},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:03:10');
INSERT INTO `sys_oper_log` VALUES (210, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:09:13');
INSERT INTO `sys_oper_log` VALUES (211, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:09:19');
INSERT INTO `sys_oper_log` VALUES (212, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:10:05');
INSERT INTO `sys_oper_log` VALUES (213, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:10:07');
INSERT INTO `sys_oper_log` VALUES (214, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"技术部\",\"email\":\"12345@qq.com\",\"leader\":\"负责人\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"phone\":\"13512345678\",\"remark\":\"备注\",\"status\":\"0\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:10:41');
INSERT INTO `sys_oper_log` VALUES (215, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:15:23');
INSERT INTO `sys_oper_log` VALUES (216, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:15:39');
INSERT INTO `sys_oper_log` VALUES (217, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"客服部\",\"email\":\"12345@qq.com\",\"leader\":\"负责人\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"phone\":\"15351234567\",\"remark\":\"备注\",\"status\":\"0\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:16:09');
INSERT INTO `sys_oper_log` VALUES (218, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:16:35');
INSERT INTO `sys_oper_log` VALUES (219, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"单位地址\",\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":201,\"deptName\":\"客服部\",\"email\":\"12345@qq.com\",\"leader\":\"负责人\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"parentName\":\"海口维修点\",\"phone\":\"15351234567\",\"remark\":\"备注\",\"status\":\"1\",\"updateBy\":\"admin\",\"user\":{\"admin\":false,\"params\":{},\"userId\":100},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:16:39');
INSERT INTO `sys_oper_log` VALUES (220, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/200', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:20:35');
INSERT INTO `sys_oper_log` VALUES (221, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/201', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:20:39');
INSERT INTO `sys_oper_log` VALUES (222, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:20:42');
INSERT INTO `sys_oper_log` VALUES (223, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:20:44');
INSERT INTO `sys_oper_log` VALUES (224, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:20:46');
INSERT INTO `sys_oper_log` VALUES (225, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:20:50');
INSERT INTO `sys_oper_log` VALUES (226, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:20:57');
INSERT INTO `sys_oper_log` VALUES (227, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:21:06');
INSERT INTO `sys_oper_log` VALUES (228, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:21:10');
INSERT INTO `sys_oper_log` VALUES (229, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:21:13');
INSERT INTO `sys_oper_log` VALUES (230, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:21:18');
INSERT INTO `sys_oper_log` VALUES (231, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:21:22');
INSERT INTO `sys_oper_log` VALUES (232, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:21:29');
INSERT INTO `sys_oper_log` VALUES (233, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:21:34');
INSERT INTO `sys_oper_log` VALUES (234, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:21:37');
INSERT INTO `sys_oper_log` VALUES (235, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-17 23:21:46');
INSERT INTO `sys_oper_log` VALUES (236, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '2 []', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:22:01');
INSERT INTO `sys_oper_log` VALUES (237, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:22:19');
INSERT INTO `sys_oper_log` VALUES (238, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:22:23');
INSERT INTO `sys_oper_log` VALUES (239, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:22:26');
INSERT INTO `sys_oper_log` VALUES (240, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:22:30');
INSERT INTO `sys_oper_log` VALUES (241, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:23:20');
INSERT INTO `sys_oper_log` VALUES (242, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '2 []', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:23:38');
INSERT INTO `sys_oper_log` VALUES (243, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:23:51');
INSERT INTO `sys_oper_log` VALUES (244, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:23:59');
INSERT INTO `sys_oper_log` VALUES (245, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:24:02');
INSERT INTO `sys_oper_log` VALUES (246, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:24:05');
INSERT INTO `sys_oper_log` VALUES (247, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:24:42');
INSERT INTO `sys_oper_log` VALUES (248, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 23:24:45');
INSERT INTO `sys_oper_log` VALUES (249, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:25:40');
INSERT INTO `sys_oper_log` VALUES (250, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 23:25:54');
INSERT INTO `sys_oper_log` VALUES (251, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-17 23:26:44');
INSERT INTO `sys_oper_log` VALUES (252, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-17 23:26:58');
INSERT INTO `sys_oper_log` VALUES (253, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:33:21');
INSERT INTO `sys_oper_log` VALUES (254, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:33:28');
INSERT INTO `sys_oper_log` VALUES (255, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:33:42');
INSERT INTO `sys_oper_log` VALUES (256, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"海口市秀英区永万路120号诚方创世纪B409\",\"ancestors\":\"0,1\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"海口维修点\",\"leader\":\"羊学翰\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"phone\":\"13719408284\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:35:10');
INSERT INTO `sys_oper_log` VALUES (257, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:35:15');
INSERT INTO `sys_oper_log` VALUES (258, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"广场花园小区A2栋1203A\",\"ancestors\":\"0,1\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"儋州维修点\",\"leader\":\"李开唐\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"18289766186\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:36:33');
INSERT INTO `sys_oper_log` VALUES (259, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:36:55');
INSERT INTO `sys_oper_log` VALUES (260, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"友谊路123号\",\"ancestors\":\"0,1,2\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"remark\":\"代签\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:37:35');
INSERT INTO `sys_oper_log` VALUES (261, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:37:41');
INSERT INTO `sys_oper_log` VALUES (262, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"琼中县营根镇虎卫路\",\"ancestors\":\"0,1,2\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"琼中县人民医院\",\"leader\":\"陈工\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"phone\":\"18789555770\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:38:13');
INSERT INTO `sys_oper_log` VALUES (263, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:38:21');
INSERT INTO `sys_oper_log` VALUES (264, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:38:49');
INSERT INTO `sys_oper_log` VALUES (265, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,1\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"琼中维修点\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:39:03');
INSERT INTO `sys_oper_log` VALUES (266, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:39:08');
INSERT INTO `sys_oper_log` VALUES (267, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:39:09');
INSERT INTO `sys_oper_log` VALUES (268, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"琼中县营根镇虎卫路\",\"ancestors\":\"0,1,6\",\"children\":[],\"deptId\":5,\"deptName\":\"琼中县人民医院\",\"leader\":\"陈工\",\"orderNum\":1,\"params\":{},\"parentId\":6,\"parentName\":\"海口维修点\",\"phone\":\"18789555770\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:39:14');
INSERT INTO `sys_oper_log` VALUES (269, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:39:29');
INSERT INTO `sys_oper_log` VALUES (270, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,1\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"白沙维修点\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:39:40');
INSERT INTO `sys_oper_log` VALUES (271, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:39:52');
INSERT INTO `sys_oper_log` VALUES (272, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"白沙县牙叉镇\",\"ancestors\":\"0,1,7\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"白沙县人民医院\",\"leader\":\"王恒颖\",\"orderNum\":0,\"params\":{},\"parentId\":7,\"phone\":\"13876627080\",\"remark\":\"负责操作维修\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:40:21');
INSERT INTO `sys_oper_log` VALUES (273, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:40:31');
INSERT INTO `sys_oper_log` VALUES (274, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"儋州市那大镇伏波东路2号\",\"ancestors\":\"0,1,3\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"海南西部中心医院\",\"leader\":\"许工\",\"orderNum\":0,\"params\":{},\"parentId\":3,\"phone\":\"18976871984\",\"remark\":\"部分签约\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:41:07');
INSERT INTO `sys_oper_log` VALUES (275, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:41:18');
INSERT INTO `sys_oper_log` VALUES (276, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:41:30');
INSERT INTO `sys_oper_log` VALUES (277, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:41:36');
INSERT INTO `sys_oper_log` VALUES (278, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:41:56');
INSERT INTO `sys_oper_log` VALUES (279, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:43:31');
INSERT INTO `sys_oper_log` VALUES (280, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,1\",\"children\":[],\"deptId\":7,\"deptName\":\"白沙维修点\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"parentName\":\"医修\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:43:33');
INSERT INTO `sys_oper_log` VALUES (281, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:43:36');
INSERT INTO `sys_oper_log` VALUES (282, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,1\",\"children\":[],\"deptId\":6,\"deptName\":\"琼中维修点\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"parentName\":\"医修\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:43:37');
INSERT INTO `sys_oper_log` VALUES (283, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:43:39');
INSERT INTO `sys_oper_log` VALUES (284, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"广场花园小区A2栋1203A\",\"ancestors\":\"0,1\",\"children\":[],\"deptId\":3,\"deptName\":\"儋州维修点\",\"leader\":\"李开唐\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"parentName\":\"医修\",\"phone\":\"18289766186\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:43:40');
INSERT INTO `sys_oper_log` VALUES (285, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:43:42');
INSERT INTO `sys_oper_log` VALUES (286, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"琼中县营根镇虎卫路\",\"ancestors\":\"0,1,6\",\"children\":[],\"deptId\":5,\"deptName\":\"琼中县人民医院\",\"leader\":\"陈工\",\"orderNum\":0,\"params\":{},\"parentId\":6,\"parentName\":\"琼中维修点\",\"phone\":\"18789555770\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:43:43');
INSERT INTO `sys_oper_log` VALUES (287, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 08:43:45');
INSERT INTO `sys_oper_log` VALUES (288, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"友谊路123号\",\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"parentName\":\"海口维修点\",\"remark\":\"代签\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:43:46');
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:44:20');
INSERT INTO `sys_oper_log` VALUES (290, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-18 08:44:26');
INSERT INTO `sys_oper_log` VALUES (291, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"password\":\"$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW\",\"phonenumber\":\"\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ywy\"}]}', 0, NULL, '2023-01-18 08:44:30');
INSERT INTO `sys_oper_log` VALUES (292, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"address\":\"友谊路123号\",\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"parentName\":\"海口维修点\",\"remark\":\"代签\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:44:31');
INSERT INTO `sys_oper_log` VALUES (293, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:48:05');
INSERT INTO `sys_oper_log` VALUES (294, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:57:32');
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 08:57:35');
INSERT INTO `sys_oper_log` VALUES (296, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:03:45');
INSERT INTO `sys_oper_log` VALUES (297, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:04:43');
INSERT INTO `sys_oper_log` VALUES (298, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[102,105],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:05:08');
INSERT INTO `sys_oper_log` VALUES (299, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":105,\"roleKey\":\"vicePresident\",\"roleName\":\"分管院长\",\"roleSort\":8,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:09:43');
INSERT INTO `sys_oper_log` VALUES (300, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[105],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:10:14');
INSERT INTO `sys_oper_log` VALUES (301, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[106],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":105,\"roleKey\":\"vicePresident\",\"roleName\":\"分管院长\",\"roleSort\":8,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:11:02');
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":106,\"roleKey\":\"dean\",\"roleName\":\"院长\",\"roleSort\":9,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:25:09');
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":100,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"administration\",\"roleName\":\"科室人员\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:39:48');
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":102,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:40:11');
INSERT INTO `sys_oper_log` VALUES (305, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 09:41:05');
INSERT INTO `sys_oper_log` VALUES (306, '务员信息', 4, 'com.ruoyi.web.controller.system.SysUserController.getBusinessUserInfo()', 'GET', 1, 'admin', NULL, '/system/user/businessUserInfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-01-18 09:43:10');
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":103,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 09:45:05');
INSERT INTO `sys_oper_log` VALUES (308, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":100,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":103,\"roleKey\":\"equipmentDirector\",\"roleName\":\"装备部负责人\",\"roleSort\":6,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 10:07:21');
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleId\":100,\"roleIds\":101,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 10:28:54');
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleId\":102,\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 10:57:15');
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleId\":102,\"roleIds\":[101,102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 10:57:28');
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleId\":103,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"administrativeDirector\",\"roleName\":\"科室负责人\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:02:36');
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleId\":100,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":103,\"roleKey\":\"equipmentDirector\",\"roleName\":\"装备部负责人\",\"roleSort\":6,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:02:41');
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-13 16:17:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1,2\",\"children\":[],\"deptId\":4,\"deptName\":\"海南口腔医院\",\"leader\":\"罗主任\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"status\":\"0\"},\"deptId\":4,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"王志文\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleId\":101,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"business\",\"roleName\":\"业务员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"ywy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:02:53');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:03:22');
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:03:24');
INSERT INTO `sys_oper_log` VALUES (317, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":2,\"nickName\":\"测试\",\"params\":{},\"postIds\":[],\"remark\":\"备注\",\"roleId\":106,\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"ces\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:03:43');
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-01-18 11:03:43\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,1\",\"children\":[],\"deptId\":2,\"deptName\":\"海口维修点\",\"leader\":\"羊学翰\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"status\":\"0\"},\"deptId\":2,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"测试\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"备注\",\"roleId\":100,\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":106,\"roleKey\":\"dean\",\"roleName\":\"院长\",\"roleSort\":9,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"ces\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:03:59');
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-01-18 11:09:59');
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-01-18 11:10:08');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:11:09');
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"单位管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:11:36');
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2023-01-12 09:59:21\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-18 11:11:42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-01-12 09:59:20', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '0', '2', 'admin', '2023-01-12 09:59:20', 'admin', '2023-01-17 22:07:01', '普通角色');
INSERT INTO `sys_role` VALUES (100, '业务员', 'business', 3, '1', 0, 0, '0', '0', 'admin', '2023-01-13 16:13:56', 'admin', '2023-01-16 09:41:21', '业务员');
INSERT INTO `sys_role` VALUES (101, '科室人员', 'administration', 4, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:04:51', '', NULL, '科室人员');
INSERT INTO `sys_role` VALUES (102, '科室负责人', 'administrativeDirector', 5, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:06:09', '', NULL, '科室负责人');
INSERT INTO `sys_role` VALUES (103, '装备部负责人', 'equipmentDirector', 6, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:07:21', 'admin', '2023-01-13 17:07:46', '装备部负责人');
INSERT INTO `sys_role` VALUES (104, '维修点负责人', 'maintainDirector', 7, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:08:30', 'admin', '2023-01-13 17:08:40', '维修点负责人');
INSERT INTO `sys_role` VALUES (105, '分管院长', 'vicePresident', 8, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:09:28', 'admin', '2023-01-13 17:09:36', '分管院长');
INSERT INTO `sys_role` VALUES (106, '院长', 'dean', 9, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:10:03', '', NULL, '院长');
INSERT INTO `sys_role` VALUES (107, '后勤人员', 'rearServices', 10, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:10:47', 'admin', '2023-01-13 17:10:51', '后勤人员');
INSERT INTO `sys_role` VALUES (108, '财务人员', 'finance', 11, '1', 1, 1, '0', '0', 'admin', '2023-01-13 17:11:17', '', NULL, '财务人员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 4);
INSERT INTO `sys_role_menu` VALUES (101, 4);
INSERT INTO `sys_role_menu` VALUES (102, 4);
INSERT INTO `sys_role_menu` VALUES (103, 4);
INSERT INTO `sys_role_menu` VALUES (104, 4);
INSERT INTO `sys_role_menu` VALUES (105, 4);
INSERT INTO `sys_role_menu` VALUES (106, 4);
INSERT INTO `sys_role_menu` VALUES (107, 4);
INSERT INTO `sys_role_menu` VALUES (108, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
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
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '若依admin', '00', 'ry@163.com', '15888888888', '1', '', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-17 17:05:24', 'admin', '2023-01-12 09:59:19', '', '2023-01-17 17:05:23', '管理员');
INSERT INTO `sys_user` VALUES (100, 4, 'ywy', '王志文', '00', '', '', '0', '', NULL, '$2a$10$/.y2pUzwXP1N4tVJhz3Fn.do5JT9Xm99olM3eeLL8mqnBnTrwLPDW', '0', '0', '', NULL, 'admin', '2023-01-13 16:17:27', 'admin', '2023-01-18 11:03:23', NULL);
INSERT INTO `sys_user` VALUES (101, 2, 'ces', '测试', '00', '', '', '0', '', NULL, '$2a$10$soUhsNTFjSNNRfiIKb9Td.VXMk79PUko5ZazVXZcklIa2C3WBwGtK', '0', '0', '', NULL, 'admin', '2023-01-18 11:03:43', 'admin', '2023-01-18 11:03:58', '备注');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 101);
INSERT INTO `sys_user_role` VALUES (101, 100);

SET FOREIGN_KEY_CHECKS = 1;
