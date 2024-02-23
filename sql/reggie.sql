/*
 Navicat Premium Data Transfer

 Source Server         : excelsior
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : reggie

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 23/02/2024 22:11:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '收货人',
  `sex` tinyint NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1417414526093082626, 1417012167126876162, '小明', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL, '昌平区金燕龙办公楼', '公司', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1417414926166769666, 1417012167126876162, '小李', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, '测试', '家', 0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1676181093591068673, 1, '树树', 1, '17338676087', NULL, NULL, NULL, NULL, NULL, NULL, '江南大学', '学校', 0, '2023-07-04 18:48:09', '2023-07-05 09:01:40', 1, 1, 0);
INSERT INTO `address_book` VALUES (1676184746498498561, 1, '胡桃', 1, '17338676087', NULL, NULL, NULL, NULL, NULL, NULL, '无锡市滨湖区江南大学', '学校', 1, '2023-07-04 19:02:40', '2023-07-06 12:11:43', 1, 1, 0);
INSERT INTO `address_book` VALUES (1676442369210769409, 1, '小早柚', 1, '17338676087', NULL, NULL, NULL, NULL, NULL, NULL, 'JNU', '学校', 0, '2023-07-05 12:06:22', '2023-07-06 11:35:21', 1, 1, 0);
INSERT INTO `address_book` VALUES (1676796467556130817, 1, '树树', 1, '17338676087', NULL, NULL, NULL, NULL, NULL, NULL, '无锡市滨湖区江南大学', '学校', 0, '2023-07-06 11:33:26', '2023-07-06 11:33:32', 1, 1, 0);
INSERT INTO `address_book` VALUES (1676805909148344321, 1, '12', 1, '17338676087', NULL, NULL, NULL, NULL, NULL, NULL, '无锡市滨湖区江南大学', '家', 0, '2023-07-06 12:10:57', '2023-07-06 12:11:06', 1, 1, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1675868612435914753, 1, '奶茶', 1, '2023-07-03 22:06:28', '2023-07-03 22:06:28', 1, 1);
INSERT INTO `category` VALUES (1675868642005757953, 1, '川菜', 2, '2023-07-03 22:06:35', '2023-07-03 22:06:35', 1, 1);
INSERT INTO `category` VALUES (1675868674759077889, 1, '东北菜', 2, '2023-07-03 22:06:43', '2023-07-03 22:06:43', 1, 1);
INSERT INTO `category` VALUES (1675868713438949378, 1, '烧烤', 2, '2023-07-03 22:06:52', '2023-07-03 22:06:52', 1, 1);
INSERT INTO `category` VALUES (1675868761597947905, 1, '好吃小派蒙', 1, '2023-07-03 22:07:04', '2023-07-03 22:07:04', 1, 1);
INSERT INTO `category` VALUES (1675884081259753474, 1, '清淡早餐', 2, '2023-07-03 23:07:56', '2023-07-03 23:07:56', 1, 1);
INSERT INTO `category` VALUES (1675890683404627969, 2, '夜间烧烤', 2, '2023-07-03 23:34:10', '2023-07-03 23:34:10', 1, 1);
INSERT INTO `category` VALUES (1675890758415560705, 2, 'party美食', 2, '2023-07-03 23:34:28', '2023-07-04 18:39:19', 1, 1);
INSERT INTO `category` VALUES (1675890858890113026, 2, '原神联动套餐', 1, '2023-07-03 23:34:52', '2023-07-03 23:34:52', 1, 1);
INSERT INTO `category` VALUES (1676393055511961602, 1, '肯德基', 1, '2023-07-05 08:50:25', '2023-07-05 08:50:25', 1, 1);
INSERT INTO `category` VALUES (1676395133269499905, 2, '肯德基套餐', 1, '2023-07-05 08:58:40', '2023-07-05 08:58:40', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1675868998639038465, '麻辣饺子', 1675868642005757953, 2300.00, '', 'f3986170-5d2f-4f31-951c-7284c422e77e.jpg', '辣辣辣', 1, 0, '2023-07-03 22:08:00', '2023-07-03 22:08:00', 1, 1, 0);
INSERT INTO `dish` VALUES (1675869134324772866, '锅包肉', 1675868674759077889, 5700.00, '', 'b9dbc43d-580c-42a3-9576-acea338c4cfb.jpg', '', 1, 0, '2023-07-03 22:08:32', '2023-07-03 22:08:32', 1, 1, 0);
INSERT INTO `dish` VALUES (1675882379035029506, '杨枝甘露', 1675868612435914753, 1300.00, '', '38a8776b-18cc-474a-9ce9-1a09f981d09b.jpg', '', 1, 0, '2023-07-03 23:01:10', '2023-07-03 23:01:10', 1, 1, 0);
INSERT INTO `dish` VALUES (1675882503366782978, '回锅肉', 1675868642005757953, 4800.00, '', '798c0aeb-218b-43a7-9057-d4b4d1f8f39f.jpg', '', 1, 0, '2023-07-03 23:01:40', '2023-07-03 23:01:40', 1, 1, 0);
INSERT INTO `dish` VALUES (1675882617422491650, '不知名素菜', 1675868642005757953, 1600.00, '', 'b7558fe7-e62a-4868-9b3b-5faa97933e82.jpg', '', 1, 0, '2023-07-03 23:02:07', '2023-07-03 23:02:07', 1, 1, 0);
INSERT INTO `dish` VALUES (1675882717276286978, '奥利奥', 1675868612435914753, 1500.00, '', 'ff3e8df7-3b4c-49e1-af20-b40170705a79.jpg', '', 1, 0, '2023-07-03 23:02:31', '2023-07-03 23:02:31', 1, 1, 0);
INSERT INTO `dish` VALUES (1675882860780204033, '好吃炸串', 1675868713438949378, 600.00, '', 'd95387a5-835b-4a29-b206-57e35b25b06e.jpg', '', 1, 0, '2023-07-03 23:03:05', '2023-07-03 23:03:05', 1, 1, 0);
INSERT INTO `dish` VALUES (1675883046109720578, '香香鸡翅', 1675868642005757953, 3600.00, '', '00ddf525-77bb-40e2-9910-b7ee60cb70b2.jpg', '', 1, 0, '2023-07-03 23:03:49', '2023-07-03 23:03:49', 1, 1, 0);
INSERT INTO `dish` VALUES (1675883176485466114, '苕皮', 1675868713438949378, 400.00, '', '51356dda-64dd-4b07-b02a-4b95f552e4a3.jpg', '', 1, 0, '2023-07-03 23:04:20', '2023-07-03 23:04:20', 1, 1, 0);
INSERT INTO `dish` VALUES (1675883315094630402, '真鲫鱼', 1675868642005757953, 6200.00, '', '86e25383-2898-4616-a45b-065717f1136e.jpg', '', 1, 0, '2023-07-03 23:04:53', '2023-07-03 23:04:53', 1, 1, 0);
INSERT INTO `dish` VALUES (1675883482816458753, '烤鸡翅-斯哈斯哈', 1675868713438949378, 900.00, '', 'f5d724ce-2400-4034-b286-fd5a90ab6cb2.jpg', '超好吃', 1, 0, '2023-07-03 23:05:33', '2023-07-03 23:05:33', 1, 1, 0);
INSERT INTO `dish` VALUES (1675883826069909505, '烤金针菇', 1675868713438949378, 200.00, '', 'b9b61f70-54ae-4197-b213-32733eb50633.jpg', '', 1, 0, '2023-07-03 23:06:55', '2023-07-03 23:06:55', 1, 1, 0);
INSERT INTO `dish` VALUES (1675883933125324802, '麻辣鱼', 1675868642005757953, 8600.00, '', 'aa3ddd38-444e-4235-8b3c-dccfc46336b6.jpg', '', 1, 0, '2023-07-03 23:07:21', '2023-07-03 23:07:21', 1, 1, 0);
INSERT INTO `dish` VALUES (1675884202508693505, '饺子', 1675884081259753474, 1800.00, '', '9bf45fdb-4e27-4450-97d2-b8b9ac714294.jpg', '', 1, 0, '2023-07-03 23:08:25', '2023-07-03 23:08:25', 1, 1, 0);
INSERT INTO `dish` VALUES (1675884509942788097, '皮蛋瘦肉粥', 1675884081259753474, 350.00, '', 'f6064198-7147-497e-931e-949bd1fda231.jpg', '', 1, 0, '2023-07-03 23:09:38', '2023-07-03 23:09:38', 1, 1, 0);
INSERT INTO `dish` VALUES (1675884691195441154, '蛋黄牛肉粥', 1675884081259753474, 600.00, '', 'ab572d20-6baa-4aa5-9e35-d181464b65bb.jpg', '', 1, 0, '2023-07-03 23:10:21', '2023-07-03 23:10:21', 1, 1, 0);
INSERT INTO `dish` VALUES (1675887506903019521, '肉丝', 1675868674759077889, 2600.00, '', 'c3a9c260-ba70-4c7c-9d79-053dee4b8910.jpg', '', 1, 0, '2023-07-03 23:21:33', '2023-07-03 23:21:33', 1, 1, 0);
INSERT INTO `dish` VALUES (1675887626985943042, '柠檬水', 1675868612435914753, 800.00, '', 'c80affdf-2f00-4d8a-8dfd-9f5d08a19343.jpg', '', 1, 0, '2023-07-03 23:22:01', '2023-07-03 23:22:01', 1, 1, 0);
INSERT INTO `dish` VALUES (1675887748767559681, '芋圆奶茶', 1675868612435914753, 800.00, '', '8e4574f3-657f-4b68-9690-57fcf96f45e3.jpg', '', 1, 0, '2023-07-03 23:22:30', '2023-07-03 23:22:30', 1, 1, 0);
INSERT INTO `dish` VALUES (1675887906112679937, '牛肉米线', 1675868674759077889, 2200.00, '', '0494c477-6e58-428f-aa52-3296c72ba5c1.jpg', '', 1, 0, '2023-07-03 23:23:08', '2023-07-03 23:23:08', 1, 1, 0);
INSERT INTO `dish` VALUES (1675888099344265217, '烤面筋', 1675868713438949378, 500.00, '', '194f8064-df9f-4280-9ea7-0fcbd3f8c18c.jpg', '', 1, 0, '2023-07-03 23:23:54', '2023-07-03 23:23:54', 1, 1, 0);
INSERT INTO `dish` VALUES (1675888223822819330, '三鲜米线', 1675884081259753474, 1500.00, '', '92d99faf-e0c3-48db-a2f4-452e3c9913f5.jpg', '', 1, 0, '2023-07-03 23:24:24', '2023-07-03 23:24:24', 1, 1, 0);
INSERT INTO `dish` VALUES (1675888326621016065, '小笼包', 1675884081259753474, 1000.00, '', '0885a2ca-0194-4e63-aad9-760445971ad1.jpg', '', 1, 0, '2023-07-03 23:24:48', '2023-07-03 23:24:48', 1, 1, 0);
INSERT INTO `dish` VALUES (1675888503457067010, '干蘑菇吧？', 1675868674759077889, 3200.00, '', 'c6430b0f-d099-4249-af44-44084f07d2fd.jpg', '', 1, 0, '2023-07-03 23:25:30', '2023-07-03 23:25:30', 1, 1, 0);
INSERT INTO `dish` VALUES (1675888660353396737, '脆骨', 1675868713438949378, 400.00, '', 'e6ce5908-cdf0-47e5-96bb-1fa1432f1214.jpg', '', 1, 0, '2023-07-03 23:26:08', '2023-07-03 23:26:08', 1, 1, 0);
INSERT INTO `dish` VALUES (1675888799310688257, '宫保鸡丁', 1675868674759077889, 3500.00, '', '04b26551-c4cc-4659-b120-e5ceeb2cbf20.jpg', '', 1, 0, '2023-07-03 23:26:41', '2023-07-03 23:26:41', 1, 1, 0);
INSERT INTO `dish` VALUES (1675889013958389761, '乌漆嘛黑', 1675868612435914753, 2600.00, '', '1504daff-f129-4bc8-9612-b2285f2f692c.jpg', '', 1, 0, '2023-07-03 23:27:32', '2023-07-03 23:27:32', 1, 1, 0);
INSERT INTO `dish` VALUES (1675889346193403906, '蒸虾头', 1675868674759077889, 2700.00, '', 'bb16666a-b552-485f-b935-a59ed356265f.jpeg', '', 1, 0, '2023-07-03 23:28:51', '2023-07-03 23:28:51', 1, 1, 0);
INSERT INTO `dish` VALUES (1676179181424652290, '可爱黄豆', 1675868761597947905, 1200.00, '', '049ca649-91f9-45dd-9748-2b9e90c887f7.jpg', '', 1, 0, '2023-07-04 18:40:33', '2023-07-04 18:40:33', 1, 1, 0);
INSERT INTO `dish` VALUES (1676184929550508034, '12', 1675868761597947905, 1200.00, '', '7830309c-5920-4440-a116-04e7d14dea7d.jpg', '12', 1, 0, '2023-07-04 19:03:24', '2023-07-04 19:03:24', 1, 1, 0);
INSERT INTO `dish` VALUES (1676394312343543810, '鸡肉汉堡', 1676393055511961602, 1000.00, '', '83953c74-0745-488d-95f1-e87974780969.jpg', '', 1, 0, '2023-07-05 08:55:25', '2023-07-05 08:55:25', 1, 1, 0);
INSERT INTO `dish` VALUES (1676394365099499521, '鸡米花', 1676393055511961602, 1300.00, '', 'f9b1823c-ffa4-4802-8588-c68a82358361.jpg', '', 1, 0, '2023-07-05 08:55:37', '2023-07-05 08:55:37', 1, 1, 0);
INSERT INTO `dish` VALUES (1676394429956022273, '鸡肉卷', 1676393055511961602, 1000.00, '', 'eb846263-b202-4e88-8bfc-459afb451075.jpg', '', 1, 0, '2023-07-05 08:55:53', '2023-07-05 08:55:53', 1, 1, 0);
INSERT INTO `dish` VALUES (1676395564406202370, '炸鸡', 1676393055511961602, 2900.00, '', '63aa9fda-e1e5-49d4-9869-7aa8fa1c8744.jpg', '', 1, 0, '2023-07-05 09:00:23', '2023-07-05 12:04:30', 1, 1, 0);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1675868998639038466, 1675868998639038465, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 22:08:00', '2023-07-03 22:08:00', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675882379097944066, 1675882379035029506, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-03 23:01:10', '2023-07-03 23:01:10', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675882379097944067, 1675882379035029506, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-07-03 23:01:10', '2023-07-03 23:01:10', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675882503366782979, 1675882503366782978, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:01:40', '2023-07-03 23:01:40', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675882717276286979, 1675882717276286978, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-03 23:02:31', '2023-07-03 23:02:31', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675882717276286980, 1675882717276286978, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-07-03 23:02:31', '2023-07-03 23:02:31', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675882860780204034, 1675882860780204033, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:03:05', '2023-07-03 23:03:05', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883046176829442, 1675883046109720578, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:03:49', '2023-07-03 23:03:49', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883176485466115, 1675883176485466114, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:04:20', '2023-07-03 23:04:20', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883315094630403, 1675883315094630402, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-03 23:04:53', '2023-07-03 23:04:53', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883315094630404, 1675883315094630402, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:04:53', '2023-07-03 23:04:53', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883482816458754, 1675883482816458753, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:05:33', '2023-07-03 23:05:33', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883826069909506, 1675883826069909505, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:06:55', '2023-07-03 23:06:55', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883933125324803, 1675883933125324802, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-03 23:07:21', '2023-07-03 23:07:21', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675883933125324804, 1675883933125324802, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:07:21', '2023-07-03 23:07:21', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675884328983736323, 1675884328983736322, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-06 11:49:41', '2023-07-06 11:49:41', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887506903019522, 1675887506903019521, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:21:33', '2023-07-03 23:21:33', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887626985943043, 1675887626985943042, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-03 23:22:01', '2023-07-03 23:22:01', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887626985943044, 1675887626985943042, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-07-03 23:22:01', '2023-07-03 23:22:01', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887748767559682, 1675887748767559681, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-03 23:22:30', '2023-07-03 23:22:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887748767559683, 1675887748767559681, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-07-03 23:22:30', '2023-07-03 23:22:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887906112679938, 1675887906112679937, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:23:08', '2023-07-03 23:23:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675887906112679939, 1675887906112679937, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-03 23:23:08', '2023-07-03 23:23:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675888099344265218, 1675888099344265217, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:23:54', '2023-07-03 23:23:54', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675888223822819331, 1675888223822819330, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-03 23:24:24', '2023-07-03 23:24:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675888799310688258, 1675888799310688257, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-07-03 23:26:41', '2023-07-03 23:26:41', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675889013958389762, 1675889013958389761, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-03 23:27:32', '2023-07-03 23:27:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675889013958389763, 1675889013958389761, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-07-03 23:27:32', '2023-07-03 23:27:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675889560279068675, 1675889560279068674, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-03 23:29:42', '2023-07-03 23:29:42', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675889560279068676, 1675889560279068674, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-07-03 23:29:42', '2023-07-03 23:29:42', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1675889911925321731, 1675889911925321730, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-03 23:31:06', '2023-07-03 23:31:06', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1676179181449818114, 1676179181424652290, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-04 18:40:33', '2023-07-04 18:40:33', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1676395397036695555, 1676395397036695554, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-05 08:59:43', '2023-07-05 08:59:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1676441747451338755, 1676441747451338754, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-07-05 12:03:54', '2023-07-05 12:03:54', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1676441747514253313, 1676441747451338754, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-05 12:03:54', '2023-07-05 12:03:54', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1676800556306276354, 1675884328983736322, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-07-06 11:49:41', '2023-07-06 11:49:41', 1, 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2021-05-10 02:24:09', 1, 1);
INSERT INTO `employee` VALUES (1675864198690127874, '范老师', '1033200299', 'e10adc3949ba59abbe56e057f20f883e', '17338676459', '0', '500220200204181864', 1, '2023-07-03 21:48:56', '2023-07-03 21:48:56', 1, 1);
INSERT INTO `employee` VALUES (1675864422020038657, '露露', '露老师', 'e10adc3949ba59abbe56e057f20f883e', '17988486954', '0', '500227900204181864', 0, '2023-07-03 21:49:49', '2023-07-03 21:50:33', 1, 1);
INSERT INTO `employee` VALUES (1675864585954410497, '树树', 'excelsior657', 'e10adc3949ba59abbe56e057f20f883e', '17338676087', '1', '500225200204181667', 1, '2023-07-03 21:50:28', '2023-07-03 21:50:28', 1, 1);
INSERT INTO `employee` VALUES (1675881269322854401, '小早柚', '小旱抽', 'e10adc3949ba59abbe56e057f20f883e', '15236789548', '0', '233225200204181667', 1, '2023-07-03 22:56:46', '2023-07-03 22:56:46', 1, 1);
INSERT INTO `employee` VALUES (1675881359986929665, '胡桃', 'hutao', 'e10adc3949ba59abbe56e057f20f883e', '15236789548', '0', '233225200204181667', 1, '2023-07-03 22:57:07', '2023-07-03 22:57:07', 1, 1);
INSERT INTO `employee` VALUES (1675881540593659906, '影', '雷电将军', 'e10adc3949ba59abbe56e057f20f883e', '15236789548', '0', '233225200204181667', 1, '2023-07-03 22:57:50', '2023-07-03 22:57:50', 1, 1);
INSERT INTO `employee` VALUES (1675882050868490241, '真wu', '晴晴12', 'e10adc3949ba59abbe56e057f20f883e', '15236789548', '0', '233225200204181667', 0, '2023-07-03 22:59:52', '2023-07-06 12:13:28', 1, 1);
INSERT INTO `employee` VALUES (1676441320831901697, '胡桃2', 'hutao3', 'e10adc3949ba59abbe56e057f20f883e', '17338676087', '0', '500225200204181935', 1, '2023-07-05 12:02:12', '2023-07-06 11:35:45', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1676395054408196097, 1675890858890113026, '家庭全鸡美好时光餐', 3990.00, 1, '', '', '4a93810f-078e-4e11-80f6-1fcfc2c1599a.jpg', '2023-07-05 08:58:22', '2023-07-05 08:58:22', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1676395259740348418, 1676395133269499905, '12', 1200.00, 1, '', '', '78387ddf-4e35-4602-9b39-ee8a4adc88c4.jpg', '2023-07-05 08:59:10', '2023-07-05 08:59:10', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1676805176185331713, 1675890858890113026, '12e', 1200.00, 1, '', '', '09bd56ba-af37-46b5-9288-a4926b17ff10.jpg', '2023-07-06 12:08:02', '2023-07-06 12:08:02', 1, 1, 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int NOT NULL COMMENT '份数',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1676395054475304961, '1676395054408196097', '1676394482275770370', '炸鸡', 2800.00, 1, 0, '2023-07-05 08:58:22', '2023-07-05 08:58:22', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395054475304962, '1676395054408196097', '1676394429956022273', '鸡肉卷', 1000.00, 1, 0, '2023-07-05 08:58:22', '2023-07-05 08:58:22', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395054475304963, '1676395054408196097', '1676394365099499521', '鸡米花', 1300.00, 1, 0, '2023-07-05 08:58:22', '2023-07-05 08:58:22', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395054475304964, '1676395054408196097', '1676394312343543810', '鸡肉汉堡', 1000.00, 1, 0, '2023-07-05 08:58:22', '2023-07-05 08:58:22', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395054475304965, '1676395054408196097', '1676393180401557505', '茫茫杨枝甘露蛋挞', 900.00, 1, 0, '2023-07-05 08:58:22', '2023-07-05 08:58:22', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395259740348419, '1676395259740348418', '1676394482275770370', '炸鸡', 2800.00, 1, 0, '2023-07-05 08:59:10', '2023-07-05 08:59:10', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395259740348420, '1676395259740348418', '1676394429956022273', '鸡肉卷', 1000.00, 1, 0, '2023-07-05 08:59:10', '2023-07-05 08:59:10', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676395259740348421, '1676395259740348418', '1676394312343543810', '鸡肉汉堡', 1000.00, 1, 0, '2023-07-05 08:59:10', '2023-07-05 08:59:10', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676805176185331714, '1676805176185331713', '1676395564406202370', '炸鸡', 2900.00, 1, 0, '2023-07-06 12:08:02', '2023-07-06 12:08:02', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676805176185331715, '1676805176185331713', '1676394429956022273', '鸡肉卷', 1000.00, 1, 0, '2023-07-06 12:08:02', '2023-07-06 12:08:02', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1676805176185331716, '1676805176185331713', '1675884509942788097', '皮蛋瘦肉粥', 350.00, 1, 0, '2023-07-06 12:08:02', '2023-07-06 12:08:02', 1, 1, 0);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1676805814591954945, '奥利奥', 'ff3e8df7-3b4c-49e1-af20-b40170705a79.jpg', 1, 1675882717276286978, NULL, '半糖,少冰', 1, 15.00, '2023-07-06 12:10:34');
INSERT INTO `shopping_cart` VALUES (1676805831176232962, '杨枝甘露', '38a8776b-18cc-474a-9ce9-1a09f981d09b.jpg', 1, 1675882379035029506, NULL, '多糖,少冰', 1, 13.00, '2023-07-06 12:10:38');
INSERT INTO `shopping_cart` VALUES (1705139567163686914, '饺子', '9bf45fdb-4e27-4450-97d2-b8b9ac714294.jpg', 1, 1675884202508693505, NULL, NULL, 1, 18.00, '2023-09-22 16:38:47');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `status` int NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1676180891589193730, NULL, '17338676087', NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
