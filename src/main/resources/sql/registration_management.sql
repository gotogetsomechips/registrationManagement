/*
 Navicat Premium Dump SQL

 Source Server         : yuzhouchen
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : registration_management

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 03/05/2025 02:29:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for household
-- ----------------------------
DROP TABLE IF EXISTS `household`;
CREATE TABLE `household`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `household_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在区',
  `house_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房屋号',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单元',
  `house_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '户型',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `status` int NULL DEFAULT 1 COMMENT '状态(1:正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_household_name`(`household_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '户籍信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of household
-- ----------------------------
INSERT INTO `household` VALUES (1, '张三', '男', '13800000001', '海淀区', '101', '1单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (2, '李四', '女', '13800000002', '朝阳区', '102', '2单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (3, '王五', '男', '13800000003', '西城区', '103', '1单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (4, '赵六', '女', '13800000004', '东城区', '104', '3单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (5, '钱七', '男', '13800000005', '海淀区', '105', '2单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (6, '孙八', '女', '13800000006', '丰台区', '106', '1单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (7, '周九', '男', '13800000007', '昌平区', '107', '2单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (8, '吴十', '女', '13800000008', '朝阳区', '108', '3单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (9, '郑一', '男', '13800000009', '大兴区', '109', '1单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (10, '王二', '女', '13800000010', '通州区', '110', '2单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (11, '冯三', '男', '13800000011', '海淀区', '111', '1单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (12, '陈四', '女', '13800000012', '朝阳区', '112', '3单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (13, '褚五', '男', '13800000013', '丰台区', '113', '1单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (14, '卫六', '女', '13800000014', '昌平区', '114', '2单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (15, '蒋七', '男', '13800000015', '大兴区', '115', '1单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (16, '沈八', '女', '13800000016', '西城区', '116', '3单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (17, '韩九', '男', '13800000017', '东城区', '117', '2单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (18, '杨十', '女', '13800000018', '通州区', '118', '1单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (19, '朱一', '男', '13800000019', '昌平区', '119', '2单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (20, '秦二', '女', '13800000020', '丰台区', '120', '1单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (21, '尤三', '男', '13800000021', '朝阳区', '121', '3单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (22, '许四', '女', '13800000022', '海淀区', '122', '1单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (23, '何五', '男', '13800000023', '通州区', '123', '2单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (24, '吕六', '女', '13800000024', '西城区', '124', '3单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (25, '施七', '男', '13800000025', '东城区', '125', '1单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (26, '张八', '女', '13800000026', '昌平区', '126', '2单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (27, '孔九', '男', '13800000027', '海淀区', '127', '1单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (28, '曹十', '女', '13800000028', '丰台区', '128', '3单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (29, '严一', '男', '13800000029', '朝阳区', '129', '2单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (30, '华二', '女', '13800000030', '通州区', '130', '1单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (31, '金三', '男', '13800000031', '大兴区', '131', '2单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (32, '魏四', '女', '13800000032', '东城区', '132', '3单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (33, '陶五', '男', '13800000033', '西城区', '133', '1单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (34, '姜六', '女', '13800000034', '海淀区', '134', '2单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (35, '戚七', '男', '13800000035', '昌平区', '135', '3单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (36, '谢八', '女', '13800000036', '丰台区', '136', '1单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (37, '邹九', '男', '13800000037', '朝阳区', '137', '2单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (38, '喻十', '女', '13800000038', '大兴区', '138', '3单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (39, '柏一', '男', '13800000039', '东城区', '139', '1单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (40, '水二', '女', '13800000040', '西城区', '140', '2单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (41, '窦三', '男', '13800000041', '通州区', '141', '1单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (42, '章四', '女', '13800000042', '海淀区', '142', '3单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (43, '云五', '男', '13800000043', '丰台区', '143', '2单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (44, '苏六', '女', '13800000044', '朝阳区', '144', '1单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (45, '潘七', '男', '13800000045', '通州区', '145', '2单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (46, '葛八', '女', '13800000046', '昌平区', '146', '3单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (47, '奚九', '男', '13800000047', '西城区', '147', '1单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (48, '范十', '女', '13800000041', '海淀区', '148', '2单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 23:09:45', 'admin', 1, '');
INSERT INTO `household` VALUES (49, '范十', '男', '13800000049', '朝阳区', '149', '3单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 23:09:56', 'admin', 1, '');
INSERT INTO `household` VALUES (50, '郎二', '女', '13800000050', '丰台区', '150', '1单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (51, '鲁三1', '男', '13800000051', '通州区', '151', '2单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 23:26:52', 'admin', 1, '');
INSERT INTO `household` VALUES (52, '韦四', '女', '13800000052', '大兴区', '152', '3单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (53, '昌五', '男', '13800000053', '昌平区', '153', '1单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (54, '马六', '女', '13800000054', '东城区', '154', '2单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (55, '苗七', '男', '13800000055', '西城区', '155', '3单元', '三室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (56, '凤八', '女', '13800000056', '朝阳区', '156', '1单元', '两室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (57, '花九', '男', '13800000057', '丰台区', '157', '2单元', '三室两厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (58, '方十', '女', '13800000058', '海淀区', '158', '3单元', '一室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (59, '俞一', '男', '13800000059', '通州区', '159', '1单元', '两室一厅', '2025-05-02 22:57:40', 'admin', '2025-05-02 22:57:40', 'admin', 1, NULL);
INSERT INTO `household` VALUES (61, '鲁三', '男', '19314851127', '朝阳区', '148', '2单元', '一室一厅', '2025-05-02 23:10:15', 'admin', '2025-05-02 23:27:26', NULL, 1, '');
INSERT INTO `household` VALUES (63, '鲁三21', '男', '13333366531', '海淀区', '151', '3单元', '两室两厅', '2025-05-02 23:27:56', 'admin', '2025-05-02 23:27:56', NULL, 1, '');

-- ----------------------------
-- Table structure for outmigration
-- ----------------------------
DROP TABLE IF EXISTS `outmigration`;
CREATE TABLE `outmigration`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `amount` decimal(10, 2) NOT NULL COMMENT '迁出金额',
  `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缴费方式',
  `collector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收费人员',
  `out_time` datetime NOT NULL COMMENT '迁出时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '迁出记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outmigration
-- ----------------------------
INSERT INTO `outmigration` VALUES (1, '张三', '男', 100.00, '现金', '李四', '2024-01-01 10:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (2, '李四', '女', 120.00, '微信', '王五', '2024-01-02 11:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (3, '王五', '男', 150.00, '支付宝', '赵六', '2024-01-03 12:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (4, '赵六', '女', 80.00, '现金', '孙七', '2024-01-04 09:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (5, '孙七', '男', 200.00, '微信', '周八', '2024-01-05 13:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (6, '周八', '女', 130.00, '支付宝', '吴九', '2024-01-06 14:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (7, '吴九', '男', 90.00, '现金', '郑十', '2024-01-07 08:30:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (8, '郑十', '女', 110.00, '微信', '钱一', '2024-01-08 15:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (9, '钱一', '男', 160.00, '支付宝', '张二', '2024-01-09 10:20:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (10, '张二', '女', 95.00, '现金', '李三', '2024-01-10 11:40:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (11, '李三', '男', 105.00, '微信', '王四', '2024-01-11 10:10:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (12, '王四', '女', 115.00, '支付宝', '赵五', '2024-01-12 12:30:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (13, '赵五', '男', 125.00, '现金', '孙六', '2024-01-13 14:50:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (14, '孙六', '女', 135.00, '微信', '周七', '2024-01-14 16:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (15, '周七', '男', 145.00, '支付宝', '吴八', '2024-01-15 13:30:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (16, '吴八', '女', 155.00, '现金', '郑九', '2024-01-16 15:15:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (17, '郑九', '男', 165.00, '微信', '钱十', '2024-01-17 11:50:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (18, '钱十', '女', 175.00, '支付宝', '张三', '2024-01-18 09:45:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (19, '赵一', '男', 185.00, '现金', '李四', '2024-01-19 10:30:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (20, '孙一', '女', 195.00, '微信', '王五', '2024-01-20 13:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (21, '周一', '男', 205.00, '支付宝', '赵六', '2024-01-21 14:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (22, '吴一', '女', 215.00, '现金', '孙七', '2024-01-22 15:30:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (23, '郑一', '男', 225.00, '微信', '周八', '2024-01-23 11:20:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (24, '钱一', '女', 235.00, '支付宝', '吴九', '2024-01-24 09:10:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (25, '张四', '男', 245.00, '现金', '郑十', '2024-01-25 13:10:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (26, '李五', '女', 255.00, '微信', '钱一', '2024-01-26 14:20:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (27, '王六', '男', 265.00, '支付宝', '张二', '2024-01-27 12:45:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (28, '赵七', '女', 275.00, '现金', '李三', '2024-01-28 16:10:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (29, '孙八', '男', 285.00, '微信', '王四', '2024-01-29 08:55:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (30, '周九', '女', 295.00, '支付宝', '赵五', '2024-01-30 10:15:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (31, '吴十', '男', 305.00, '现金', '孙六', '2024-01-31 11:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (32, '郑三', '女', 315.00, '微信', '周七', '2024-02-01 14:40:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (33, '钱四', '男', 325.00, '支付宝', '吴八', '2024-02-02 13:35:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (34, '张五', '女', 335.00, '现金', '郑九', '2024-02-03 09:25:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (35, '李六', '男', 345.00, '微信', '钱十', '2024-02-04 15:45:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (36, '王七', '女', 355.00, '支付宝', '张三', '2024-02-05 11:55:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (37, '赵八', '男', 365.00, '现金', '李四', '2024-02-06 10:05:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (38, '孙九', '女', 375.00, '微信', '王五', '2024-02-07 14:25:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (39, '周十', '男', 385.00, '支付宝', '赵六', '2024-02-08 16:35:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (40, '吴三', '女', 395.00, '现金', '孙七', '2024-02-09 12:15:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (41, '郑四', '男', 405.00, '微信', '周八', '2024-02-10 09:35:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (42, '钱五', '女', 415.00, '支付宝', '吴九', '2024-02-11 13:55:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (43, '张六', '男', 425.00, '现金', '郑十', '2024-02-12 11:25:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (44, '李七', '女', 435.00, '微信', '钱一', '2024-02-13 10:40:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (45, '王八', '男', 445.00, '支付宝', '张二', '2024-02-14 15:05:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (47, '孙十', '男', 465.00, '微信', '王四', '2024-02-16 16:25:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (48, '周三', '女', 475.00, '支付宝', '赵五', '2024-02-17 09:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (49, '吴四', '男', 485.00, '现金', '孙六', '2024-02-18 12:10:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (50, '郑五', '女', 495.00, '微信', '周七', '2024-02-19 13:20:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (51, '钱六', '男', 505.00, '支付宝', '吴八', '2024-02-20 11:30:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (52, '张七', '女', 515.00, '现金', '郑九', '2024-02-21 10:20:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (53, '李八', '男', 525.00, '微信', '钱十', '2024-02-22 09:10:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (54, '王九', '女', 535.00, '支付宝', '张三', '2024-02-23 15:35:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 00:06:09');
INSERT INTO `outmigration` VALUES (55, '赵十1', '男', 545.00, '现金', '李四', '2024-02-24 00:00:00', '无', 'admin', '2025-05-03 00:06:09', 'admin', '2025-05-03 01:02:18');
INSERT INTO `outmigration` VALUES (56, '李', '男', 545.00, '现金', '123', '2025-05-02 00:00:00', '1', 'admin', '2025-05-03 01:02:36', NULL, '2025-05-03 01:03:31');
INSERT INTO `outmigration` VALUES (57, '赵十1', '男', 123.00, '支付宝', '李四', '2025-05-03 00:00:00', '', 'admin', '2025-05-03 01:10:12', NULL, '2025-05-03 01:10:12');

-- ----------------------------
-- Table structure for sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_feedback`;
CREATE TABLE `sys_feedback`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedback_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈人姓名',
  `feedback_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈人电话',
  `feedback_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈标题',
  `feedback_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '反馈内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：1-未处理，2-处理中，3-已处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_feedback
-- ----------------------------
INSERT INTO `sys_feedback` VALUES (1, '张三', '13800138001', '停水问题', '我们小区已经停水两天了，请尽快解决', '2025-04-30 20:44:23', '2025-04-30 20:44:23', 1);
INSERT INTO `sys_feedback` VALUES (2, '李四', '13800138002', '垃圾清理', '小区垃圾站堆积严重，需要清理', '2025-04-30 20:44:23', '2025-04-30 20:44:23', 1);
INSERT INTO `sys_feedback` VALUES (3, '王五', '13800138003', '电梯故障', '3号楼2单元电梯故障，需要维修', '2025-04-30 20:44:23', '2025-04-30 20:44:23', 1);
INSERT INTO `sys_feedback` VALUES (4, '赵六', '13800138004', '噪音扰民', '晚上有施工噪音，影响休息', '2025-04-28 22:10:33', '2025-04-28 22:10:33', 1);
INSERT INTO `sys_feedback` VALUES (5, '钱七', '13800138005', '路灯损坏', '小区路灯坏了几天了', '2025-04-27 19:44:01', '2025-04-27 19:44:01', 1);
INSERT INTO `sys_feedback` VALUES (6, '孙八', '13800138006', '垃圾未清理', '楼下垃圾堆放无人清理', '2025-04-26 08:23:11', '2025-04-26 08:23:11', 1);
INSERT INTO `sys_feedback` VALUES (7, '周九', '13800138007', '物业费问题', '物业收费标准不合理', '2025-04-25 14:35:27', '2025-04-25 14:35:27', 1);
INSERT INTO `sys_feedback` VALUES (8, '吴十', '13800138008', '管道漏水', '厨房下水道漏水严重', '2025-04-25 11:10:44', '2025-04-25 11:10:44', 1);
INSERT INTO `sys_feedback` VALUES (9, '郑一', '13800138009', '停车难', '停车位紧张，希望增加车位', '2025-04-24 18:01:59', '2025-04-24 18:01:59', 1);
INSERT INTO `sys_feedback` VALUES (10, '王二', '13800138010', '绿化缺失', '小区绿化带被破坏', '2025-04-23 13:10:05', '2025-04-23 13:10:05', 1);
INSERT INTO `sys_feedback` VALUES (11, '冯三', '13800138011', '围栏破损', '围栏开口，存在安全隐患', '2025-04-22 09:20:00', '2025-04-22 09:20:00', 1);
INSERT INTO `sys_feedback` VALUES (12, '陈四', '13800138012', '电压不稳', '家中电器经常跳闸', '2025-04-21 21:01:22', '2025-04-21 21:01:22', 1);
INSERT INTO `sys_feedback` VALUES (13, '褚五', '13800138013', '下水道堵塞', '厕所排水不畅，已积水', '2025-04-20 07:55:10', '2025-04-20 07:55:10', 1);
INSERT INTO `sys_feedback` VALUES (14, '卫六', '13800138014', '监控问题', '监控画面模糊，失效区域多1', '2025-04-19 16:13:47', '2025-05-02 22:46:21', 1);
INSERT INTO `sys_feedback` VALUES (17, '韩九', '13800138017', '消防通道堵塞', '楼道堆放杂物影响逃生', '2025-04-16 12:22:30', '2025-04-16 12:22:30', 1);
INSERT INTO `sys_feedback` VALUES (18, '杨十', '13800138018', '水压太低', '高峰期水压低，难以用水', '2025-04-15 08:36:00', '2025-04-15 08:36:00', 1);
INSERT INTO `sys_feedback` VALUES (19, '朱一', '13800138019', '屋顶漏雨', '顶楼渗水问题严重', '2025-04-14 06:30:55', '2025-04-14 06:30:55', 1);
INSERT INTO `sys_feedback` VALUES (20, '秦二', '13800138020', '快递堆积', '快递柜经常爆满', '2025-04-13 15:01:10', '2025-04-13 15:01:10', 1);
INSERT INTO `sys_feedback` VALUES (21, '尤三', '13800138021', '门口积水', '下雨积水无法通行', '2025-04-12 10:12:12', '2025-04-12 10:12:12', 1);
INSERT INTO `sys_feedback` VALUES (22, '许四', '13800138022', '电瓶车乱停', '楼道里停满电瓶车', '2025-04-11 14:22:40', '2025-04-11 14:22:40', 1);
INSERT INTO `sys_feedback` VALUES (23, '何五', '13800138023', '照明不足', '地下车库灯光太暗', '2025-04-10 09:55:50', '2025-04-10 09:55:50', 1);
INSERT INTO `sys_feedback` VALUES (24, '吕六', '13800138024', '保洁不到位', '公共区域卫生脏乱', '2025-04-09 13:00:33', '2025-04-09 13:00:33', 1);
INSERT INTO `sys_feedback` VALUES (25, '施七', '13800138025', '蚊虫多', '绿化带积水滋生蚊虫', '2025-04-08 08:48:00', '2025-04-08 08:48:00', 1);
INSERT INTO `sys_feedback` VALUES (26, '张六', '13800138026', '楼梯扶手松动', '爬楼梯存在安全隐患', '2025-04-07 19:22:01', '2025-04-07 19:22:01', 1);
INSERT INTO `sys_feedback` VALUES (27, '孔八', '13800138027', '健身器材破损', '小区健身器材需要维修', '2025-04-06 16:35:44', '2025-04-06 16:35:44', 1);
INSERT INTO `sys_feedback` VALUES (28, '曹九', '13800138028', '墙体裂缝', '墙面出现大裂缝', '2025-04-05 11:45:33', '2025-04-05 11:45:33', 1);
INSERT INTO `sys_feedback` VALUES (29, '严十', '13800138029', '顶层噪音', '邻居装修噪音大', '2025-04-04 14:26:11', '2025-04-04 14:26:11', 1);
INSERT INTO `sys_feedback` VALUES (30, '华一', '13800138030', '小孩乱跑', '孩子在公共区域吵闹', '2025-04-03 20:31:55', '2025-04-03 20:31:55', 1);
INSERT INTO `sys_feedback` VALUES (31, '金二', '13800138031', '雨棚破损', '楼道雨棚破了，下雨漏水', '2025-04-02 07:50:20', '2025-04-02 07:50:20', 1);
INSERT INTO `sys_feedback` VALUES (32, '魏三', '13800138032', '天台门锁坏', '天台门经常被打开', '2025-04-01 15:30:00', '2025-04-01 15:30:00', 1);
INSERT INTO `sys_feedback` VALUES (33, '陶四', '13800138033', '小广告泛滥', '电梯内贴满广告', '2025-03-31 09:20:05', '2025-03-31 09:20:05', 1);
INSERT INTO `sys_feedback` VALUES (34, '姜五', '13800138034', '物业态度差', '服务态度不好，希望改进', '2025-03-30 18:18:18', '2025-03-30 18:18:18', 1);
INSERT INTO `sys_feedback` VALUES (35, '戚六', '13800138035', '楼梯灯不亮', '晚上出入不方便', '2025-03-29 11:11:11', '2025-03-29 11:11:11', 1);
INSERT INTO `sys_feedback` VALUES (36, '谢七', '13800138036', '保安缺岗', '门岗经常没人', '2025-03-28 12:55:33', '2025-03-28 12:55:33', 1);
INSERT INTO `sys_feedback` VALUES (37, '邹八', '13800138037', '狗粪未清理', '宠物粪便未清理，味道难闻', '2025-03-27 08:22:22', '2025-03-27 08:22:22', 1);
INSERT INTO `sys_feedback` VALUES (38, '喻九', '13800138038', '水龙头滴水', '卫生间龙头关不紧', '2025-03-26 10:00:00', '2025-03-26 10:00:00', 1);
INSERT INTO `sys_feedback` VALUES (39, '柏十', '13800138039', '洗衣机漏电', '公用洗衣机存在漏电风险', '2025-03-25 15:45:10', '2025-03-25 15:45:10', 1);
INSERT INTO `sys_feedback` VALUES (40, '水一', '13800138040', '电费不透明', '电费账单不清晰', '2025-03-24 09:29:33', '2025-03-24 09:29:33', 1);
INSERT INTO `sys_feedback` VALUES (41, '窦二', '13800138041', '顶楼阳光房', '违规搭建阳光房', '2025-03-23 17:11:22', '2025-03-23 17:11:22', 1);
INSERT INTO `sys_feedback` VALUES (42, '章三', '13800138042', '楼下烟味重', '有人在楼道吸烟', '2025-03-22 13:44:55', '2025-03-22 13:44:55', 1);
INSERT INTO `sys_feedback` VALUES (43, '云四', '13800138043', '无障碍设施缺失', '老人出行不便', '2025-03-21 07:00:00', '2025-03-21 07:00:00', 1);
INSERT INTO `sys_feedback` VALUES (44, '苏五', '13800138044', '车库渗水', '地库出现大面积积水', '2025-03-20 21:11:59', '2025-03-20 21:11:59', 1);
INSERT INTO `sys_feedback` VALUES (45, '潘六', '13800138045', '电瓶车起火', '存在消防隐患', '2025-03-19 20:08:08', '2025-03-19 20:08:08', 1);
INSERT INTO `sys_feedback` VALUES (46, '葛七', '13800138046', '围墙倒塌', '暴雨后围墙塌了', '2025-03-18 08:10:20', '2025-03-18 08:10:20', 1);
INSERT INTO `sys_feedback` VALUES (48, '范九', '13800138048', '道路破损', '小区路面坑洼', '2025-03-16 18:19:19', '2025-03-16 18:19:19', 1);
INSERT INTO `sys_feedback` VALUES (50, '郎一', '13800138050', '玻璃破碎', '单元门玻璃碎了', '2025-03-14 09:45:22', '2025-03-14 09:45:22', 1);
INSERT INTO `sys_feedback` VALUES (51, '鲁二', '13800138051', '楼上漏水', '天花板漏水', '2025-03-13 13:33:33', '2025-03-13 13:33:33', 1);
INSERT INTO `sys_feedback` VALUES (53, '昌四', '13800138053', '电箱损坏', '配电箱裸露有电', '2025-03-11 15:55:55', '2025-03-11 15:55:55', 1);
INSERT INTO `sys_feedback` VALUES (54, '马五', '13800138054', '门口摊贩', '非法摊贩占道经营', '2025-03-10 16:45:00', '2025-03-10 16:45:00', 1);
INSERT INTO `sys_feedback` VALUES (55, '苗六', '13800138055', '楼道漏水', '雨天屋内漏水', '2025-03-09 17:59:00', '2025-03-09 17:59:00', 1);
INSERT INTO `sys_feedback` VALUES (56, '凤七', '13800138056', '楼道小偷', '有可疑人员出现', '2025-03-08 10:10:10', '2025-03-08 10:10:10', 1);
INSERT INTO `sys_feedback` VALUES (57, '花八', '13800138057', '水管爆裂', '水管突然爆裂', '2025-03-07 11:00:00', '2025-03-07 11:00:00', 1);
INSERT INTO `sys_feedback` VALUES (58, '方九', '13800138058', '地板裂缝', '家中地板开裂', '2025-03-06 14:14:14', '2025-03-06 14:14:14', 1);
INSERT INTO `sys_feedback` VALUES (59, '石十', '13800138059', '物业通知缺失', '重要通知未发送', '2025-03-05 13:31:00', '2025-03-05 13:31:00', 1);
INSERT INTO `sys_feedback` VALUES (65, '龚一1', '13800138058', '123', '123', '2025-05-02 22:46:31', '2025-05-02 22:46:31', 1);

-- ----------------------------
-- Table structure for sys_immigration
-- ----------------------------
DROP TABLE IF EXISTS `sys_immigration`;
CREATE TABLE `sys_immigration`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `immigration_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `immigration_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '迁入编号',
  `immigration_date` datetime NOT NULL COMMENT '迁入日期',
  `immigration_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_immigration_name`(`immigration_name` ASC) USING BTREE,
  INDEX `idx_immigration_number`(`immigration_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '移民信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_immigration
-- ----------------------------
INSERT INTO `sys_immigration` VALUES (1, '张三', 'IM20230001', '2023-01-15 00:00:00', '从北京迁入', '2025-05-02 23:28:22', 'admin', '2025-05-02 23:28:22', NULL);
INSERT INTO `sys_immigration` VALUES (2, '李四', 'IM20230002', '2023-02-20 00:00:00', '从上海迁入', '2025-05-02 23:28:22', 'admin', '2025-05-02 23:28:22', NULL);
INSERT INTO `sys_immigration` VALUES (3, '王五', 'IM20230003', '2023-03-10 00:00:00', '从广州迁入', '2025-05-02 23:28:22', 'admin', '2025-05-02 23:28:22', NULL);
INSERT INTO `sys_immigration` VALUES (4, '赵一', 'IM20230004', '2023-04-01 00:00:00', '从深圳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (5, '钱二', 'IM20230005', '2023-04-05 00:00:00', '从杭州迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (6, '孙三', 'IM20230006', '2023-04-10 00:00:00', '从南京迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (7, '李四', 'IM20230007', '2023-04-12 00:00:00', '从重庆迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (8, '周五', 'IM20230008', '2023-04-15 00:00:00', '从成都迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (9, '吴六', 'IM20230009', '2023-04-18 00:00:00', '从西安迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (10, '郑七', 'IM20230010', '2023-04-20 00:00:00', '从武汉迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (11, '王八', 'IM20230011', '2023-04-22 00:00:00', '从长沙迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (12, '冯九', 'IM20230012', '2023-04-25 00:00:00', '从合肥迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (13, '陈十', 'IM20230013', '2023-04-28 00:00:00', '从济南迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (14, '褚十一', 'IM20230014', '2023-05-01 00:00:00', '从青岛迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (15, '卫十二', 'IM20230015', '2023-05-03 00:00:00', '从大连迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (16, '蒋十三', 'IM20230016', '2023-05-05 00:00:00', '从沈阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (17, '沈十四', 'IM20230017', '2023-05-07 00:00:00', '从哈尔滨迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (18, '韩十五', 'IM20230018', '2023-05-09 00:00:00', '从长春迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (19, '杨十六', 'IM20230019', '2023-05-11 00:00:00', '从天津迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (20, '朱十七', 'IM20230020', '2023-05-13 00:00:00', '从拉萨迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (21, '秦十八', 'IM20230021', '2023-05-15 00:00:00', '从呼和浩特迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (22, '尤十九', 'IM20230022', '2023-05-17 00:00:00', '从乌鲁木齐迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (23, '许二十', 'IM20230023', '2023-05-19 00:00:00', '从银川迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (24, '何二一', 'IM20230024', '2023-05-21 00:00:00', '从兰州迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (25, '吕二二', 'IM20230025', '2023-05-23 00:00:00', '从南昌迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (26, '施二三', 'IM20230026', '2023-05-25 00:00:00', '从福州迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (27, '张二四', 'IM20230027', '2023-05-27 00:00:00', '从贵阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (28, '孔二五', 'IM20230028', '2023-05-29 00:00:00', '从昆明迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (29, '曹二六', 'IM20230029', '2023-06-01 00:00:00', '从海口迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (30, '严二七', 'IM20230030', '2023-06-03 00:00:00', '从石家庄迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (31, '华二八', 'IM20230031', '2023-06-05 00:00:00', '从太原迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (32, '金二九', 'IM20230032', '2023-06-07 00:00:00', '从珠海迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (33, '魏三十', 'IM20230033', '2023-06-09 00:00:00', '从厦门迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (34, '陶三一', 'IM20230034', '2023-06-11 00:00:00', '从桂林迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (35, '姜三二', 'IM20230035', '2023-06-13 00:00:00', '从洛阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (36, '戚三三', 'IM20230036', '2023-06-15 00:00:00', '从烟台迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (37, '谢三四', 'IM20230037', '2023-06-17 00:00:00', '从襄阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (38, '邹三五', 'IM20230038', '2023-06-19 00:00:00', '从包头迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (39, '喻三六', 'IM20230039', '2023-06-21 00:00:00', '从唐山迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (40, '柏三七', 'IM20230040', '2023-06-23 00:00:00', '从柳州迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (41, '水三八', 'IM20230041', '2023-06-25 00:00:00', '从威海迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (42, '窦三九', 'IM20230042', '2023-06-27 00:00:00', '从泰安迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (43, '章四十', 'IM20230043', '2023-06-29 00:00:00', '从宜昌迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (44, '云四一', 'IM20230044', '2023-07-01 00:00:00', '从漳州迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (45, '苏四二', 'IM20230045', '2023-07-03 00:00:00', '从张家口迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (46, '潘四三', 'IM20230046', '2023-07-05 00:00:00', '从湘潭迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (47, '葛四四', 'IM20230047', '2023-07-07 00:00:00', '从遵义迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (48, '奚四五', 'IM20230048', '2023-07-09 00:00:00', '从珠海迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (49, '范四六', 'IM20230049', '2023-07-11 00:00:00', '从丽江迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (50, '彭四七', 'IM20230050', '2023-07-13 00:00:00', '从延安迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (51, '郎四八', 'IM20230051', '2023-07-15 00:00:00', '从秦皇岛迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (52, '鲁四九', 'IM20230052', '2023-07-17 00:00:00', '从咸阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (54, '昌五一', 'IM20230054', '2023-07-21 00:00:00', '从宝鸡迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (55, '马五二', 'IM20230055', '2023-07-23 00:00:00', '从三亚迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (56, '苗五三', 'IM20230056', '2023-07-25 00:00:00', '从齐齐哈尔迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (57, '凤五四', 'IM20230057', '2023-07-27 00:00:00', '从鞍山迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (58, '花五五', 'IM20230058', '2023-07-29 00:00:00', '从德阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (59, '方五六', 'IM20230059', '2023-07-31 00:00:00', '从绵阳迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (60, '俞五七', 'IM20230060', '2023-08-02 00:00:00', '从广元迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (61, '任五八', 'IM20230061', '2023-08-04 00:00:00', '从邯郸迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (62, '袁五九', 'IM20230062', '2023-08-06 00:00:00', '从焦作迁入', '2025-05-02 23:30:58', 'admin', '2025-05-02 23:30:58', NULL);
INSERT INTO `sys_immigration` VALUES (63, '柳六十1', 'IM20230063', '2023-08-02 00:00:00', '从商丘迁入1', '2025-05-02 23:30:58', 'admin', '2025-05-03 00:11:55', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `user_sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `user_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `user_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '普通用户' COMMENT '用户类型(管理员/普通用户)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `status` tinyint NULL DEFAULT 1 COMMENT '账号状态(0-锁定,1-正常)',
  `try_count` int NULL DEFAULT 0 COMMENT '尝试次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (4, 'user3', '123456', '用户3', '男', '13800000003', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-05-03 02:23:46', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (5, 'user4', '123456', '用户4', '女', '13800000004', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (6, 'user5', '123456', '用户5', '男', '13800000005', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (7, 'user6', '123456', '用户6', '女', '13800000006', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (8, 'user7', '123456', '用户7', '男', '13800000007', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (14, 'user13', '123456', '用户13', '男', '13800000013', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (15, 'user14', '123456', '用户14', '女', '13800000014', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (16, 'user15', '123456', '用户15', '男', '13800000015', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (17, 'user16', '123456', '用户16', '女', '13800000016', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (18, 'user17', '123456', '用户17', '男', '13800000017', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (19, 'user18', '123', '用户18', '女', '13800000018', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-30 18:23:04', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (20, 'user19', '123456', '用户19', '男', '13800000019', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (21, 'user20', '123456', '用户20', '女', '13800000020', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (22, 'user21', '123456', '用户21', '男', '13800000021', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (23, 'user22', '123456', '用户22', '女', '13800000022', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (24, 'user23', '123456', '用户23', '男', '13800000023', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (25, 'user24', '123456', '用户24', '女', '13800000024', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (26, 'user25', '123456', '用户25', '男', '13800000025', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (27, 'user26', '123456', '用户26', '女', '13800000026', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (28, 'user27', '123456', '用户27', '男', '13800000027', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (30, 'user29', '123456', '用户29', '男', '13800000029', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (31, 'user30', '123456', '用户30', '女', '13800000030', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (32, 'user361', '12345688', '用户31', '男', '13800000031', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-05-02 22:28:13', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (35, 'user34', '123456', '用户34', '女', '13800000034', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (36, 'user35', '123456', '用户35', '男', '13800000035', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (37, 'user36', '123456', '用户36', '女', '13800000036', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (38, 'user37', '123456', '用户37', '男', '13800000037', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (42, 'user41', '123456', '用户41', '男', '13800000041', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (43, 'user42', '123456', '用户42', '女', '13800000042', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (44, 'user43', '123456', '用户43', '男', '13800000043', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (45, 'user44', '123456', '用户44', '女', '13800000044', '普通用户账号', '普通用户', '2025-04-29 18:50:29', 'system', '2025-04-29 18:50:29', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (74, 'admin12', '12312123', '12312', '男', '13331333312', '213', '管理员', '2025-04-30 20:20:50', 'admin', '2025-04-30 20:21:00', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (75, 'zhangsan1', '1123123123', '123', '男', '13331333312', '', '管理员', '2025-05-02 22:18:41', 'admin', '2025-05-02 22:18:41', NULL, 1, 0);
INSERT INTO `sys_user` VALUES (76, 'user31231', '123123123', '大苏打撒', NULL, NULL, NULL, '普通用户', '2025-05-03 02:26:11', 'self_register', '2025-05-03 02:26:11', NULL, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
