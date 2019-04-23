/*
 Navicat Premium Data Transfer

 Source Server         : 0001localhost
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost:3306
 Source Schema         : cyx

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 18/04/2019 11:25:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cyx_access
-- ----------------------------
DROP TABLE IF EXISTS `cyx_access`;
CREATE TABLE `cyx_access`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `node_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `groupId`(`role_id`) USING BTREE,
  INDEX `nodeId`(`node_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_access
-- ----------------------------
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'vkqcwn1520320816oyqxml', '1', '0', 'modulename');
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'sjoxen1550469322qprvrc', '-1', NULL, 'group');
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'fbepbd1550469413znyoco', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'unicwr1550650007yrqvjf', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'nhruda1550650063xhqunx', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'nkfdfx1550650103dpzbno', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'gekkmp1550650474lhprer', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('zfqndp1553410402udpngr', 'fprnbn1550469507vtmstw', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('wprjgv1553411626ppbmvy', 'vkqcwn1520320816oyqxml', '1', '0', 'modulename');
INSERT INTO `cyx_access` VALUES ('wprjgv1553411626ppbmvy', 'ymnrow1550469585slffnv', '-1', NULL, 'group');
INSERT INTO `cyx_access` VALUES ('wprjgv1553411626ppbmvy', 'npdbjp1550469741pgynsz', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('xgxblw1555550593ucsnjj', 'uldpjr1555490260mqzhla', '1', '0', 'modulename');
INSERT INTO `cyx_access` VALUES ('xgxblw1555550593ucsnjj', 'wcxgvq1555490364nsmcoe', '-1', NULL, 'group');
INSERT INTO `cyx_access` VALUES ('xgxblw1555550593ucsnjj', 'pyzpea1555490464xvkxkb', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('xgxblw1555550593ucsnjj', 'nfgqof1555490477wgrxme', '2', NULL, NULL);
INSERT INTO `cyx_access` VALUES ('xgxblw1555550593ucsnjj', 'dtxqgg1555490496tuxzlc', '2', NULL, NULL);

-- ----------------------------
-- Table structure for cyx_dboperationhistory
-- ----------------------------
DROP TABLE IF EXISTS `cyx_dboperationhistory`;
CREATE TABLE `cyx_dboperationhistory`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tablename` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `controllername` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tableversion` int(11) NULL DEFAULT NULL,
  `tableprimarykey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operationtype` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `operatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_dboperationhistory
-- ----------------------------
INSERT INTO `cyx_dboperationhistory` VALUES ('dstxst1555550168vuwztp', 'Node', '节点管理', 2, 'dtxqgg1555490496tuxzlc', '修改节点', '', 1555550168, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('ewzrac1555490478vnvceh', 'Node', '节点管理', 1, 'nfgqof1555490477wgrxme', '添加节点', '', 1555490478, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('jndsbv1555490336vbigid', 'Node', '节点管理', 2, 'uldpjr1555490260mqzhla', '修改节点', '', 1555490336, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('lbqhtf1555490496lnmfvv', 'Node', '节点管理', 1, 'dtxqgg1555490496tuxzlc', '添加节点', '', 1555490496, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('pmgwde1555490464pszgec', 'Node', '节点管理', 1, 'pyzpea1555490464xvkxkb', '添加节点', '', 1555490464, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('tzgzll1555490260eygkeb', 'Node', '节点管理', 1, 'uldpjr1555490260mqzhla', '添加节点', '', 1555490260, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('xjyrou1555490372gtkbpf', 'Node', '节点管理', 3, 'uldpjr1555490260mqzhla', '修改节点', '', 1555490372, '1', NULL);
INSERT INTO `cyx_dboperationhistory` VALUES ('yeiwoi1555490364qqhant', 'Node', '节点管理', 1, 'wcxgvq1555490364nsmcoe', '添加节点', '', 1555490364, '1', NULL);

-- ----------------------------
-- Table structure for cyx_district
-- ----------------------------
DROP TABLE IF EXISTS `cyx_district`;
CREATE TABLE `cyx_district`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纬度',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3272 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '高德行政区域数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_district
-- ----------------------------
INSERT INTO `cyx_district` VALUES (1, 0, '0', '100000', '中华人民共和国', '116.3683244', '39.915085', 'country');
INSERT INTO `cyx_district` VALUES (2, 1, '010', '110000', '北京市', '116.407394', '39.904211', 'province');
INSERT INTO `cyx_district` VALUES (3, 2, '010', '110100', '北京市', '116.407394', '39.904211', 'city');
INSERT INTO `cyx_district` VALUES (4, 3, '010', '110101', '东城区', '116.41649', '39.928341', 'district');
INSERT INTO `cyx_district` VALUES (5, 3, '010', '110102', '西城区', '116.365873', '39.912235', 'district');
INSERT INTO `cyx_district` VALUES (6, 3, '010', '110105', '朝阳区', '116.443205', '39.921506', 'district');
INSERT INTO `cyx_district` VALUES (7, 3, '010', '110106', '丰台区', '116.287039', '39.858421', 'district');
INSERT INTO `cyx_district` VALUES (8, 3, '010', '110107', '石景山区', '116.222933', '39.906611', 'district');
INSERT INTO `cyx_district` VALUES (9, 3, '010', '110108', '海淀区', '116.298262', '39.95993', 'district');
INSERT INTO `cyx_district` VALUES (10, 3, '010', '110109', '门头沟区', '116.101719', '39.940338', 'district');
INSERT INTO `cyx_district` VALUES (11, 3, '010', '110111', '房山区', '116.143486', '39.748823', 'district');
INSERT INTO `cyx_district` VALUES (12, 3, '010', '110112', '通州区', '116.656434', '39.909946', 'district');
INSERT INTO `cyx_district` VALUES (13, 3, '010', '110113', '顺义区', '116.654642', '40.130211', 'district');
INSERT INTO `cyx_district` VALUES (14, 3, '010', '110114', '昌平区', '116.231254', '40.220804', 'district');
INSERT INTO `cyx_district` VALUES (15, 3, '010', '110115', '大兴区', '116.341483', '39.726917', 'district');
INSERT INTO `cyx_district` VALUES (16, 3, '010', '110116', '怀柔区', '116.631931', '40.316053', 'district');
INSERT INTO `cyx_district` VALUES (17, 3, '010', '110117', '平谷区', '117.121351', '40.140595', 'district');
INSERT INTO `cyx_district` VALUES (18, 3, '010', '110118', '密云区', '116.843047', '40.376894', 'district');
INSERT INTO `cyx_district` VALUES (19, 3, '010', '110119', '延庆区', '115.974981', '40.456591', 'district');
INSERT INTO `cyx_district` VALUES (20, 1, '022', '120000', '天津市', '117.200983', '39.084158', 'province');
INSERT INTO `cyx_district` VALUES (21, 20, '022', '120100', '天津市', '117.200983', '39.084158', 'city');
INSERT INTO `cyx_district` VALUES (22, 21, '022', '120101', '和平区', '117.214699', '39.117196', 'district');
INSERT INTO `cyx_district` VALUES (23, 21, '022', '120102', '河东区', '117.251584', '39.128294', 'district');
INSERT INTO `cyx_district` VALUES (24, 21, '022', '120103', '河西区', '117.223371', '39.109563', 'district');
INSERT INTO `cyx_district` VALUES (25, 21, '022', '120104', '南开区', '117.150738', '39.138205', 'district');
INSERT INTO `cyx_district` VALUES (26, 21, '022', '120105', '河北区', '117.196648', '39.147869', 'district');
INSERT INTO `cyx_district` VALUES (27, 21, '022', '120106', '红桥区', '117.151533', '39.167345', 'district');
INSERT INTO `cyx_district` VALUES (28, 21, '022', '120110', '东丽区', '117.31362', '39.086802', 'district');
INSERT INTO `cyx_district` VALUES (29, 21, '022', '120111', '西青区', '117.008826', '39.141152', 'district');
INSERT INTO `cyx_district` VALUES (30, 21, '022', '120112', '津南区', '117.35726', '38.937928', 'district');
INSERT INTO `cyx_district` VALUES (31, 21, '022', '120113', '北辰区', '117.135488', '39.224791', 'district');
INSERT INTO `cyx_district` VALUES (32, 21, '022', '120114', '武清区', '117.044387', '39.384119', 'district');
INSERT INTO `cyx_district` VALUES (33, 21, '022', '120115', '宝坻区', '117.309874', '39.717564', 'district');
INSERT INTO `cyx_district` VALUES (34, 21, '022', '120116', '滨海新区', '117.698407', '39.01727', 'district');
INSERT INTO `cyx_district` VALUES (35, 21, '022', '120117', '宁河区', '117.826724', '39.330087', 'district');
INSERT INTO `cyx_district` VALUES (36, 21, '022', '120118', '静海区', '116.974232', '38.94745', 'district');
INSERT INTO `cyx_district` VALUES (37, 21, '022', '120119', '蓟州区', '117.408296', '40.045851', 'district');
INSERT INTO `cyx_district` VALUES (38, 1, '0', '130000', '河北省', '114.530235', '38.037433', 'province');
INSERT INTO `cyx_district` VALUES (39, 38, '0311', '130100', '石家庄市', '114.514793', '38.042228', 'city');
INSERT INTO `cyx_district` VALUES (40, 39, '0311', '130102', '长安区', '114.539395', '38.036347', 'district');
INSERT INTO `cyx_district` VALUES (41, 39, '0311', '130104', '桥西区', '114.461088', '38.004193', 'district');
INSERT INTO `cyx_district` VALUES (42, 39, '0311', '130105', '新华区', '114.463377', '38.05095', 'district');
INSERT INTO `cyx_district` VALUES (43, 39, '0311', '130107', '井陉矿区', '114.062062', '38.065151', 'district');
INSERT INTO `cyx_district` VALUES (44, 39, '0311', '130108', '裕华区', '114.531202', '38.00643', 'district');
INSERT INTO `cyx_district` VALUES (45, 39, '0311', '130109', '藁城区', '114.847023', '38.021453', 'district');
INSERT INTO `cyx_district` VALUES (46, 39, '0311', '130110', '鹿泉区', '114.313654', '38.085953', 'district');
INSERT INTO `cyx_district` VALUES (47, 39, '0311', '130111', '栾城区', '114.648318', '37.900199', 'district');
INSERT INTO `cyx_district` VALUES (48, 39, '0311', '130121', '井陉县', '114.145242', '38.032118', 'district');
INSERT INTO `cyx_district` VALUES (49, 39, '0311', '130123', '正定县', '114.570941', '38.146444', 'district');
INSERT INTO `cyx_district` VALUES (50, 39, '0311', '130125', '行唐县', '114.552714', '38.438377', 'district');
INSERT INTO `cyx_district` VALUES (51, 39, '0311', '130126', '灵寿县', '114.382614', '38.308665', 'district');
INSERT INTO `cyx_district` VALUES (52, 39, '0311', '130127', '高邑县', '114.611121', '37.615534', 'district');
INSERT INTO `cyx_district` VALUES (53, 39, '0311', '130128', '深泽县', '115.20092', '38.184033', 'district');
INSERT INTO `cyx_district` VALUES (54, 39, '0311', '130129', '赞皇县', '114.386111', '37.665663', 'district');
INSERT INTO `cyx_district` VALUES (55, 39, '0311', '130130', '无极县', '114.97634', '38.179192', 'district');
INSERT INTO `cyx_district` VALUES (56, 39, '0311', '130131', '平山县', '114.195918', '38.247888', 'district');
INSERT INTO `cyx_district` VALUES (57, 39, '0311', '130132', '元氏县', '114.525409', '37.766513', 'district');
INSERT INTO `cyx_district` VALUES (58, 39, '0311', '130133', '赵县', '114.776297', '37.756578', 'district');
INSERT INTO `cyx_district` VALUES (59, 39, '0311', '130181', '辛集市', '115.217658', '37.943121', 'district');
INSERT INTO `cyx_district` VALUES (60, 39, '0311', '130183', '晋州市', '115.044213', '38.033671', 'district');
INSERT INTO `cyx_district` VALUES (61, 39, '0311', '130184', '新乐市', '114.683776', '38.343319', 'district');
INSERT INTO `cyx_district` VALUES (62, 38, '0315', '130200', '唐山市', '118.180193', '39.630867', 'city');
INSERT INTO `cyx_district` VALUES (63, 62, '0315', '130202', '路南区', '118.154354', '39.625058', 'district');
INSERT INTO `cyx_district` VALUES (64, 62, '0315', '130203', '路北区', '118.200692', '39.624437', 'district');
INSERT INTO `cyx_district` VALUES (65, 62, '0315', '130204', '古冶区', '118.447635', '39.733578', 'district');
INSERT INTO `cyx_district` VALUES (66, 62, '0315', '130205', '开平区', '118.261841', '39.671001', 'district');
INSERT INTO `cyx_district` VALUES (67, 62, '0315', '130207', '丰南区', '118.085169', '39.576031', 'district');
INSERT INTO `cyx_district` VALUES (68, 62, '0315', '130208', '丰润区', '118.162215', '39.832582', 'district');
INSERT INTO `cyx_district` VALUES (69, 62, '0315', '130209', '曹妃甸区', '118.460379', '39.27307', 'district');
INSERT INTO `cyx_district` VALUES (70, 62, '0315', '130223', '滦县', '118.703598', '39.740593', 'district');
INSERT INTO `cyx_district` VALUES (71, 62, '0315', '130224', '滦南县', '118.682379', '39.518996', 'district');
INSERT INTO `cyx_district` VALUES (72, 62, '0315', '130225', '乐亭县', '118.912571', '39.425608', 'district');
INSERT INTO `cyx_district` VALUES (73, 62, '0315', '130227', '迁西县', '118.314715', '40.1415', 'district');
INSERT INTO `cyx_district` VALUES (74, 62, '0315', '130229', '玉田县', '117.738658', '39.900401', 'district');
INSERT INTO `cyx_district` VALUES (75, 62, '0315', '130281', '遵化市', '117.965892', '40.189201', 'district');
INSERT INTO `cyx_district` VALUES (76, 62, '0315', '130283', '迁安市', '118.701144', '39.999174', 'district');
INSERT INTO `cyx_district` VALUES (77, 38, '0335', '130300', '秦皇岛市', '119.518197', '39.888701', 'city');
INSERT INTO `cyx_district` VALUES (78, 77, '0335', '130302', '海港区', '119.564962', '39.94756', 'district');
INSERT INTO `cyx_district` VALUES (79, 77, '0335', '130303', '山海关区', '119.775799', '39.978848', 'district');
INSERT INTO `cyx_district` VALUES (80, 77, '0335', '130304', '北戴河区', '119.484522', '39.834596', 'district');
INSERT INTO `cyx_district` VALUES (81, 77, '0335', '130306', '抚宁区', '119.244847', '39.876253', 'district');
INSERT INTO `cyx_district` VALUES (82, 77, '0335', '130321', '青龙满族自治县', '118.949684', '40.407578', 'district');
INSERT INTO `cyx_district` VALUES (83, 77, '0335', '130322', '昌黎县', '119.199551', '39.700911', 'district');
INSERT INTO `cyx_district` VALUES (84, 77, '0335', '130324', '卢龙县', '118.892986', '39.891946', 'district');
INSERT INTO `cyx_district` VALUES (85, 38, '0310', '130400', '邯郸市', '114.538959', '36.625594', 'city');
INSERT INTO `cyx_district` VALUES (86, 85, '0310', '130402', '邯山区', '114.531002', '36.594313', 'district');
INSERT INTO `cyx_district` VALUES (87, 85, '0310', '130403', '丛台区', '114.492896', '36.636409', 'district');
INSERT INTO `cyx_district` VALUES (88, 85, '0310', '130404', '复兴区', '114.462061', '36.639033', 'district');
INSERT INTO `cyx_district` VALUES (89, 85, '0310', '130406', '峰峰矿区', '114.212802', '36.419739', 'district');
INSERT INTO `cyx_district` VALUES (90, 85, '0310', '130423', '临漳县', '114.619536', '36.335025', 'district');
INSERT INTO `cyx_district` VALUES (91, 85, '0310', '130424', '成安县', '114.670032', '36.444317', 'district');
INSERT INTO `cyx_district` VALUES (92, 85, '0310', '130425', '大名县', '115.147814', '36.285616', 'district');
INSERT INTO `cyx_district` VALUES (93, 85, '0310', '130426', '涉县', '113.6914', '36.584994', 'district');
INSERT INTO `cyx_district` VALUES (94, 85, '0310', '130427', '磁县', '114.373946', '36.374011', 'district');
INSERT INTO `cyx_district` VALUES (95, 85, '0310', '130428', '肥乡区', '114.800166', '36.548131', 'district');
INSERT INTO `cyx_district` VALUES (96, 85, '0310', '130429', '永年区', '114.543832', '36.743966', 'district');
INSERT INTO `cyx_district` VALUES (97, 85, '0310', '130430', '邱县', '115.200589', '36.811148', 'district');
INSERT INTO `cyx_district` VALUES (98, 85, '0310', '130431', '鸡泽县', '114.889376', '36.91034', 'district');
INSERT INTO `cyx_district` VALUES (99, 85, '0310', '130432', '广平县', '114.948606', '36.483484', 'district');
INSERT INTO `cyx_district` VALUES (100, 85, '0310', '130433', '馆陶县', '115.282467', '36.547556', 'district');
INSERT INTO `cyx_district` VALUES (101, 85, '0310', '130434', '魏县', '114.93892', '36.359868', 'district');
INSERT INTO `cyx_district` VALUES (102, 85, '0310', '130435', '曲周县', '114.957504', '36.76607', 'district');
INSERT INTO `cyx_district` VALUES (103, 85, '0310', '130481', '武安市', '114.203697', '36.696506', 'district');
INSERT INTO `cyx_district` VALUES (104, 38, '0319', '130500', '邢台市', '114.504677', '37.070834', 'city');
INSERT INTO `cyx_district` VALUES (105, 104, '0319', '130502', '桥东区', '114.507058', '37.071287', 'district');
INSERT INTO `cyx_district` VALUES (106, 104, '0319', '130503', '桥西区', '114.468601', '37.059827', 'district');
INSERT INTO `cyx_district` VALUES (107, 104, '0319', '130521', '邢台县', '114.561132', '37.05073', 'district');
INSERT INTO `cyx_district` VALUES (108, 104, '0319', '130522', '临城县', '114.498761', '37.444498', 'district');
INSERT INTO `cyx_district` VALUES (109, 104, '0319', '130523', '内丘县', '114.512128', '37.286669', 'district');
INSERT INTO `cyx_district` VALUES (110, 104, '0319', '130524', '柏乡县', '114.693425', '37.482422', 'district');
INSERT INTO `cyx_district` VALUES (111, 104, '0319', '130525', '隆尧县', '114.770419', '37.350172', 'district');
INSERT INTO `cyx_district` VALUES (112, 104, '0319', '130526', '任县', '114.671936', '37.120982', 'district');
INSERT INTO `cyx_district` VALUES (113, 104, '0319', '130527', '南和县', '114.683863', '37.005017', 'district');
INSERT INTO `cyx_district` VALUES (114, 104, '0319', '130528', '宁晋县', '114.93992', '37.624564', 'district');
INSERT INTO `cyx_district` VALUES (115, 104, '0319', '130529', '巨鹿县', '115.037477', '37.221112', 'district');
INSERT INTO `cyx_district` VALUES (116, 104, '0319', '130530', '新河县', '115.250907', '37.520862', 'district');
INSERT INTO `cyx_district` VALUES (117, 104, '0319', '130531', '广宗县', '115.142626', '37.074661', 'district');
INSERT INTO `cyx_district` VALUES (118, 104, '0319', '130532', '平乡县', '115.030075', '37.063148', 'district');
INSERT INTO `cyx_district` VALUES (119, 104, '0319', '130533', '威县', '115.266703', '36.975478', 'district');
INSERT INTO `cyx_district` VALUES (120, 104, '0319', '130534', '清河县', '115.667208', '37.039991', 'district');
INSERT INTO `cyx_district` VALUES (121, 104, '0319', '130535', '临西县', '115.501048', '36.870811', 'district');
INSERT INTO `cyx_district` VALUES (122, 104, '0319', '130581', '南宫市', '115.408747', '37.359264', 'district');
INSERT INTO `cyx_district` VALUES (123, 104, '0319', '130582', '沙河市', '114.503339', '36.854929', 'district');
INSERT INTO `cyx_district` VALUES (124, 38, '0312', '130600', '保定市', '115.464589', '38.874434', 'city');
INSERT INTO `cyx_district` VALUES (125, 124, '0312', '130602', '竞秀区', '115.45877', '38.877449', 'district');
INSERT INTO `cyx_district` VALUES (126, 124, '0312', '130606', '莲池区', '115.497097', '38.883582', 'district');
INSERT INTO `cyx_district` VALUES (127, 124, '0312', '130607', '满城区', '115.322334', '38.949119', 'district');
INSERT INTO `cyx_district` VALUES (128, 124, '0312', '130608', '清苑区', '115.489959', '38.765148', 'district');
INSERT INTO `cyx_district` VALUES (129, 124, '0312', '130609', '徐水区', '115.655774', '39.018736', 'district');
INSERT INTO `cyx_district` VALUES (130, 124, '0312', '130623', '涞水县', '115.713904', '39.394316', 'district');
INSERT INTO `cyx_district` VALUES (131, 124, '0312', '130624', '阜平县', '114.195104', '38.849152', 'district');
INSERT INTO `cyx_district` VALUES (132, 124, '0312', '130626', '定兴县', '115.808296', '39.263145', 'district');
INSERT INTO `cyx_district` VALUES (133, 124, '0312', '130627', '唐县', '114.982972', '38.748203', 'district');
INSERT INTO `cyx_district` VALUES (134, 124, '0312', '130628', '高阳县', '115.778965', '38.700088', 'district');
INSERT INTO `cyx_district` VALUES (135, 124, '0312', '130629', '容城县', '115.861657', '39.042784', 'district');
INSERT INTO `cyx_district` VALUES (136, 124, '0312', '130630', '涞源县', '114.694283', '39.360247', 'district');
INSERT INTO `cyx_district` VALUES (137, 124, '0312', '130631', '望都县', '115.155128', '38.695842', 'district');
INSERT INTO `cyx_district` VALUES (138, 124, '0312', '130632', '安新县', '115.935603', '38.935369', 'district');
INSERT INTO `cyx_district` VALUES (139, 124, '0312', '130633', '易县', '115.497457', '39.349393', 'district');
INSERT INTO `cyx_district` VALUES (140, 124, '0312', '130634', '曲阳县', '114.745008', '38.622248', 'district');
INSERT INTO `cyx_district` VALUES (141, 124, '0312', '130635', '蠡县', '115.583854', '38.488055', 'district');
INSERT INTO `cyx_district` VALUES (142, 124, '0312', '130636', '顺平县', '115.13547', '38.837487', 'district');
INSERT INTO `cyx_district` VALUES (143, 124, '0312', '130637', '博野县', '115.46438', '38.457364', 'district');
INSERT INTO `cyx_district` VALUES (144, 124, '0312', '130638', '雄县', '116.10865', '38.99455', 'district');
INSERT INTO `cyx_district` VALUES (145, 124, '0312', '130681', '涿州市', '115.974422', '39.485282', 'district');
INSERT INTO `cyx_district` VALUES (146, 124, '0312', '130682', '定州市', '114.990392', '38.516461', 'district');
INSERT INTO `cyx_district` VALUES (147, 124, '0312', '130683', '安国市', '115.326646', '38.418439', 'district');
INSERT INTO `cyx_district` VALUES (148, 124, '0312', '130684', '高碑店市', '115.873886', '39.326839', 'district');
INSERT INTO `cyx_district` VALUES (149, 38, '0313', '130700', '张家口市', '114.886252', '40.768493', 'city');
INSERT INTO `cyx_district` VALUES (150, 149, '0313', '130702', '桥东区', '114.894189', '40.788434', 'district');
INSERT INTO `cyx_district` VALUES (151, 149, '0313', '130703', '桥西区', '114.869657', '40.819581', 'district');
INSERT INTO `cyx_district` VALUES (152, 149, '0313', '130705', '宣化区', '115.099494', '40.608793', 'district');
INSERT INTO `cyx_district` VALUES (153, 149, '0313', '130706', '下花园区', '115.287352', '40.502652', 'district');
INSERT INTO `cyx_district` VALUES (154, 149, '0313', '130708', '万全区', '114.740557', '40.766965', 'district');
INSERT INTO `cyx_district` VALUES (155, 149, '0313', '130709', '崇礼区', '115.282668', '40.974675', 'district');
INSERT INTO `cyx_district` VALUES (156, 149, '0313', '130722', '张北县', '114.720077', '41.158596', 'district');
INSERT INTO `cyx_district` VALUES (157, 149, '0313', '130723', '康保县', '114.600404', '41.852368', 'district');
INSERT INTO `cyx_district` VALUES (158, 149, '0313', '130724', '沽源县', '115.688692', '41.669668', 'district');
INSERT INTO `cyx_district` VALUES (159, 149, '0313', '130725', '尚义县', '113.969618', '41.076226', 'district');
INSERT INTO `cyx_district` VALUES (160, 149, '0313', '130726', '蔚县', '114.588903', '39.840842', 'district');
INSERT INTO `cyx_district` VALUES (161, 149, '0313', '130727', '阳原县', '114.150348', '40.104663', 'district');
INSERT INTO `cyx_district` VALUES (162, 149, '0313', '130728', '怀安县', '114.385791', '40.674193', 'district');
INSERT INTO `cyx_district` VALUES (163, 149, '0313', '130730', '怀来县', '115.517861', '40.415343', 'district');
INSERT INTO `cyx_district` VALUES (164, 149, '0313', '130731', '涿鹿县', '115.205345', '40.379562', 'district');
INSERT INTO `cyx_district` VALUES (165, 149, '0313', '130732', '赤城县', '115.831498', '40.912921', 'district');
INSERT INTO `cyx_district` VALUES (166, 38, '0314', '130800', '承德市', '117.962749', '40.952942', 'city');
INSERT INTO `cyx_district` VALUES (167, 166, '0314', '130802', '双桥区', '117.943466', '40.974643', 'district');
INSERT INTO `cyx_district` VALUES (168, 166, '0314', '130803', '双滦区', '117.799888', '40.959236', 'district');
INSERT INTO `cyx_district` VALUES (169, 166, '0314', '130804', '鹰手营子矿区', '117.659499', '40.546361', 'district');
INSERT INTO `cyx_district` VALUES (170, 166, '0314', '130821', '承德县', '118.173824', '40.768238', 'district');
INSERT INTO `cyx_district` VALUES (171, 166, '0314', '130822', '兴隆县', '117.500558', '40.417358', 'district');
INSERT INTO `cyx_district` VALUES (172, 166, '0314', '130823', '平泉县', '118.701951', '41.018405', 'district');
INSERT INTO `cyx_district` VALUES (173, 166, '0314', '130824', '滦平县', '117.332801', '40.941482', 'district');
INSERT INTO `cyx_district` VALUES (174, 166, '0314', '130825', '隆化县', '117.738937', '41.313791', 'district');
INSERT INTO `cyx_district` VALUES (175, 166, '0314', '130826', '丰宁满族自治县', '116.646051', '41.209069', 'district');
INSERT INTO `cyx_district` VALUES (176, 166, '0314', '130827', '宽城满族自治县', '118.485313', '40.611391', 'district');
INSERT INTO `cyx_district` VALUES (177, 166, '0314', '130828', '围场满族蒙古族自治县', '117.760159', '41.938529', 'district');
INSERT INTO `cyx_district` VALUES (178, 38, '0317', '130900', '沧州市', '116.838834', '38.304477', 'city');
INSERT INTO `cyx_district` VALUES (179, 178, '0317', '130902', '新华区', '116.866284', '38.314416', 'district');
INSERT INTO `cyx_district` VALUES (180, 178, '0317', '130903', '运河区', '116.843673', '38.283749', 'district');
INSERT INTO `cyx_district` VALUES (181, 178, '0317', '130921', '沧县', '117.007478', '38.219856', 'district');
INSERT INTO `cyx_district` VALUES (182, 178, '0317', '130922', '青县', '116.804305', '38.583021', 'district');
INSERT INTO `cyx_district` VALUES (183, 178, '0317', '130923', '东光县', '116.537067', '37.888248', 'district');
INSERT INTO `cyx_district` VALUES (184, 178, '0317', '130924', '海兴县', '117.497651', '38.143169', 'district');
INSERT INTO `cyx_district` VALUES (185, 178, '0317', '130925', '盐山县', '117.230602', '38.058087', 'district');
INSERT INTO `cyx_district` VALUES (186, 178, '0317', '130926', '肃宁县', '115.829758', '38.422801', 'district');
INSERT INTO `cyx_district` VALUES (187, 178, '0317', '130927', '南皮县', '116.708347', '38.038421', 'district');
INSERT INTO `cyx_district` VALUES (188, 178, '0317', '130928', '吴桥县', '116.391508', '37.627661', 'district');
INSERT INTO `cyx_district` VALUES (189, 178, '0317', '130929', '献县', '116.122725', '38.190185', 'district');
INSERT INTO `cyx_district` VALUES (190, 178, '0317', '130930', '孟村回族自治县', '117.104298', '38.053409', 'district');
INSERT INTO `cyx_district` VALUES (191, 178, '0317', '130981', '泊头市', '116.578367', '38.083437', 'district');
INSERT INTO `cyx_district` VALUES (192, 178, '0317', '130982', '任丘市', '116.082917', '38.683591', 'district');
INSERT INTO `cyx_district` VALUES (193, 178, '0317', '130983', '黄骅市', '117.329949', '38.371402', 'district');
INSERT INTO `cyx_district` VALUES (194, 178, '0317', '130984', '河间市', '116.099517', '38.446624', 'district');
INSERT INTO `cyx_district` VALUES (195, 38, '0316', '131000', '廊坊市', '116.683752', '39.538047', 'city');
INSERT INTO `cyx_district` VALUES (196, 195, '0316', '131002', '安次区', '116.694544', '39.502569', 'district');
INSERT INTO `cyx_district` VALUES (197, 195, '0316', '131003', '广阳区', '116.71069', '39.522786', 'district');
INSERT INTO `cyx_district` VALUES (198, 195, '0316', '131022', '固安县', '116.298657', '39.438214', 'district');
INSERT INTO `cyx_district` VALUES (199, 195, '0316', '131023', '永清县', '116.50568', '39.330689', 'district');
INSERT INTO `cyx_district` VALUES (200, 195, '0316', '131024', '香河县', '117.006093', '39.761424', 'district');
INSERT INTO `cyx_district` VALUES (201, 195, '0316', '131025', '大城县', '116.653793', '38.705449', 'district');
INSERT INTO `cyx_district` VALUES (202, 195, '0316', '131026', '文安县', '116.457898', '38.87292', 'district');
INSERT INTO `cyx_district` VALUES (203, 195, '0316', '131028', '大厂回族自治县', '116.989574', '39.886547', 'district');
INSERT INTO `cyx_district` VALUES (204, 195, '0316', '131081', '霸州市', '116.391484', '39.125744', 'district');
INSERT INTO `cyx_district` VALUES (205, 195, '0316', '131082', '三河市', '117.078294', '39.982718', 'district');
INSERT INTO `cyx_district` VALUES (206, 38, '0318', '131100', '衡水市', '115.670177', '37.73892', 'city');
INSERT INTO `cyx_district` VALUES (207, 206, '0318', '131102', '桃城区', '115.67545', '37.735465', 'district');
INSERT INTO `cyx_district` VALUES (208, 206, '0318', '131103', '冀州区', '115.579308', '37.550856', 'district');
INSERT INTO `cyx_district` VALUES (209, 206, '0318', '131121', '枣强县', '115.724259', '37.513417', 'district');
INSERT INTO `cyx_district` VALUES (210, 206, '0318', '131122', '武邑县', '115.887531', '37.801665', 'district');
INSERT INTO `cyx_district` VALUES (211, 206, '0318', '131123', '武强县', '115.982461', '38.041368', 'district');
INSERT INTO `cyx_district` VALUES (212, 206, '0318', '131124', '饶阳县', '115.725833', '38.235892', 'district');
INSERT INTO `cyx_district` VALUES (213, 206, '0318', '131125', '安平县', '115.519278', '38.234501', 'district');
INSERT INTO `cyx_district` VALUES (214, 206, '0318', '131126', '故城县', '115.965874', '37.347409', 'district');
INSERT INTO `cyx_district` VALUES (215, 206, '0318', '131127', '景县', '116.270648', '37.69229', 'district');
INSERT INTO `cyx_district` VALUES (216, 206, '0318', '131128', '阜城县', '116.175262', '37.862505', 'district');
INSERT INTO `cyx_district` VALUES (217, 206, '0318', '131182', '深州市', '115.559574', '38.001535', 'district');
INSERT INTO `cyx_district` VALUES (218, 1, '0', '140000', '山西省', '112.562678', '37.873499', 'province');
INSERT INTO `cyx_district` VALUES (219, 218, '0351', '140100', '太原市', '112.548879', '37.87059', 'city');
INSERT INTO `cyx_district` VALUES (220, 219, '0351', '140105', '小店区', '112.565659', '37.736525', 'district');
INSERT INTO `cyx_district` VALUES (221, 219, '0351', '140106', '迎泽区', '112.5634', '37.863451', 'district');
INSERT INTO `cyx_district` VALUES (222, 219, '0351', '140107', '杏花岭区', '112.570604', '37.893955', 'district');
INSERT INTO `cyx_district` VALUES (223, 219, '0351', '140108', '尖草坪区', '112.486691', '37.940387', 'district');
INSERT INTO `cyx_district` VALUES (224, 219, '0351', '140109', '万柏林区', '112.515937', '37.85958', 'district');
INSERT INTO `cyx_district` VALUES (225, 219, '0351', '140110', '晋源区', '112.47794', '37.715193', 'district');
INSERT INTO `cyx_district` VALUES (226, 219, '0351', '140121', '清徐县', '112.358667', '37.607443', 'district');
INSERT INTO `cyx_district` VALUES (227, 219, '0351', '140122', '阳曲县', '112.672952', '38.058488', 'district');
INSERT INTO `cyx_district` VALUES (228, 219, '0351', '140123', '娄烦县', '111.797083', '38.067932', 'district');
INSERT INTO `cyx_district` VALUES (229, 219, '0351', '140181', '古交市', '112.175853', '37.907129', 'district');
INSERT INTO `cyx_district` VALUES (230, 218, '0352', '140200', '大同市', '113.300129', '40.076763', 'city');
INSERT INTO `cyx_district` VALUES (231, 230, '0352', '140202', '城区', '113.298026', '40.075666', 'district');
INSERT INTO `cyx_district` VALUES (232, 230, '0352', '140203', '矿区', '113.177206', '40.036858', 'district');
INSERT INTO `cyx_district` VALUES (233, 230, '0352', '140211', '南郊区', '113.149693', '40.005404', 'district');
INSERT INTO `cyx_district` VALUES (234, 230, '0352', '140212', '新荣区', '113.140004', '40.255866', 'district');
INSERT INTO `cyx_district` VALUES (235, 230, '0352', '140221', '阳高县', '113.748944', '40.361059', 'district');
INSERT INTO `cyx_district` VALUES (236, 230, '0352', '140222', '天镇县', '114.090867', '40.420237', 'district');
INSERT INTO `cyx_district` VALUES (237, 230, '0352', '140223', '广灵县', '114.282758', '39.760281', 'district');
INSERT INTO `cyx_district` VALUES (238, 230, '0352', '140224', '灵丘县', '114.23435', '39.442406', 'district');
INSERT INTO `cyx_district` VALUES (239, 230, '0352', '140225', '浑源县', '113.699475', '39.693406', 'district');
INSERT INTO `cyx_district` VALUES (240, 230, '0352', '140226', '左云县', '112.703008', '40.013442', 'district');
INSERT INTO `cyx_district` VALUES (241, 230, '0352', '140227', '大同县', '113.61244', '40.040294', 'district');
INSERT INTO `cyx_district` VALUES (242, 218, '0353', '140300', '阳泉市', '113.580519', '37.856971', 'city');
INSERT INTO `cyx_district` VALUES (243, 242, '0353', '140302', '城区', '113.600669', '37.847436', 'district');
INSERT INTO `cyx_district` VALUES (244, 242, '0353', '140303', '矿区', '113.555279', '37.868494', 'district');
INSERT INTO `cyx_district` VALUES (245, 242, '0353', '140311', '郊区', '113.594163', '37.944679', 'district');
INSERT INTO `cyx_district` VALUES (246, 242, '0353', '140321', '平定县', '113.630107', '37.804988', 'district');
INSERT INTO `cyx_district` VALUES (247, 242, '0353', '140322', '盂县', '113.41233', '38.085619', 'district');
INSERT INTO `cyx_district` VALUES (248, 218, '0355', '140400', '长治市', '113.116404', '36.195409', 'city');
INSERT INTO `cyx_district` VALUES (249, 248, '0355', '140402', '城区', '113.123088', '36.20353', 'district');
INSERT INTO `cyx_district` VALUES (250, 248, '0355', '140411', '郊区', '113.101211', '36.218388', 'district');
INSERT INTO `cyx_district` VALUES (251, 248, '0355', '140421', '长治县', '113.051407', '36.052858', 'district');
INSERT INTO `cyx_district` VALUES (252, 248, '0355', '140423', '襄垣县', '113.051491', '36.535817', 'district');
INSERT INTO `cyx_district` VALUES (253, 248, '0355', '140424', '屯留县', '112.891998', '36.315663', 'district');
INSERT INTO `cyx_district` VALUES (254, 248, '0355', '140425', '平顺县', '113.435961', '36.200179', 'district');
INSERT INTO `cyx_district` VALUES (255, 248, '0355', '140426', '黎城县', '113.387155', '36.502328', 'district');
INSERT INTO `cyx_district` VALUES (256, 248, '0355', '140427', '壶关县', '113.207049', '36.115448', 'district');
INSERT INTO `cyx_district` VALUES (257, 248, '0355', '140428', '长子县', '112.8779', '36.122334', 'district');
INSERT INTO `cyx_district` VALUES (258, 248, '0355', '140429', '武乡县', '112.864561', '36.837625', 'district');
INSERT INTO `cyx_district` VALUES (259, 248, '0355', '140430', '沁县', '112.699226', '36.756063', 'district');
INSERT INTO `cyx_district` VALUES (260, 248, '0355', '140431', '沁源县', '112.337446', '36.5002', 'district');
INSERT INTO `cyx_district` VALUES (261, 248, '0355', '140481', '潞城市', '113.228852', '36.334104', 'district');
INSERT INTO `cyx_district` VALUES (262, 218, '0356', '140500', '晋城市', '112.851486', '35.490684', 'city');
INSERT INTO `cyx_district` VALUES (263, 262, '0356', '140502', '城区', '112.853555', '35.501571', 'district');
INSERT INTO `cyx_district` VALUES (264, 262, '0356', '140521', '沁水县', '112.186738', '35.690141', 'district');
INSERT INTO `cyx_district` VALUES (265, 262, '0356', '140522', '阳城县', '112.414738', '35.486029', 'district');
INSERT INTO `cyx_district` VALUES (266, 262, '0356', '140524', '陵川县', '113.280688', '35.775685', 'district');
INSERT INTO `cyx_district` VALUES (267, 262, '0356', '140525', '泽州县', '112.899137', '35.617221', 'district');
INSERT INTO `cyx_district` VALUES (268, 262, '0356', '140581', '高平市', '112.92392', '35.797997', 'district');
INSERT INTO `cyx_district` VALUES (269, 218, '0349', '140600', '朔州市', '112.432991', '39.331855', 'city');
INSERT INTO `cyx_district` VALUES (270, 269, '0349', '140602', '朔城区', '112.432312', '39.319519', 'district');
INSERT INTO `cyx_district` VALUES (271, 269, '0349', '140603', '平鲁区', '112.28833', '39.512155', 'district');
INSERT INTO `cyx_district` VALUES (272, 269, '0349', '140621', '山阴县', '112.816413', '39.527893', 'district');
INSERT INTO `cyx_district` VALUES (273, 269, '0349', '140622', '应县', '113.191098', '39.554247', 'district');
INSERT INTO `cyx_district` VALUES (274, 269, '0349', '140623', '右玉县', '112.466989', '39.989063', 'district');
INSERT INTO `cyx_district` VALUES (275, 269, '0349', '140624', '怀仁县', '113.131717', '39.821627', 'district');
INSERT INTO `cyx_district` VALUES (276, 218, '0354', '140700', '晋中市', '112.752652', '37.687357', 'city');
INSERT INTO `cyx_district` VALUES (277, 276, '0354', '140702', '榆次区', '112.708224', '37.697794', 'district');
INSERT INTO `cyx_district` VALUES (278, 276, '0354', '140721', '榆社县', '112.975209', '37.070916', 'district');
INSERT INTO `cyx_district` VALUES (279, 276, '0354', '140722', '左权县', '113.379403', '37.082943', 'district');
INSERT INTO `cyx_district` VALUES (280, 276, '0354', '140723', '和顺县', '113.570415', '37.32957', 'district');
INSERT INTO `cyx_district` VALUES (281, 276, '0354', '140724', '昔阳县', '113.706977', '37.61253', 'district');
INSERT INTO `cyx_district` VALUES (282, 276, '0354', '140725', '寿阳县', '113.176373', '37.895191', 'district');
INSERT INTO `cyx_district` VALUES (283, 276, '0354', '140726', '太谷县', '112.551305', '37.421307', 'district');
INSERT INTO `cyx_district` VALUES (284, 276, '0354', '140727', '祁县', '112.335542', '37.357869', 'district');
INSERT INTO `cyx_district` VALUES (285, 276, '0354', '140728', '平遥县', '112.176136', '37.189421', 'district');
INSERT INTO `cyx_district` VALUES (286, 276, '0354', '140729', '灵石县', '111.77864', '36.847927', 'district');
INSERT INTO `cyx_district` VALUES (287, 276, '0354', '140781', '介休市', '111.916711', '37.026944', 'district');
INSERT INTO `cyx_district` VALUES (288, 218, '0359', '140800', '运城市', '111.00746', '35.026516', 'city');
INSERT INTO `cyx_district` VALUES (289, 288, '0359', '140802', '盐湖区', '110.998272', '35.015101', 'district');
INSERT INTO `cyx_district` VALUES (290, 288, '0359', '140821', '临猗县', '110.774547', '35.144277', 'district');
INSERT INTO `cyx_district` VALUES (291, 288, '0359', '140822', '万荣县', '110.838024', '35.415253', 'district');
INSERT INTO `cyx_district` VALUES (292, 288, '0359', '140823', '闻喜县', '111.22472', '35.356644', 'district');
INSERT INTO `cyx_district` VALUES (293, 288, '0359', '140824', '稷山县', '110.983333', '35.604025', 'district');
INSERT INTO `cyx_district` VALUES (294, 288, '0359', '140825', '新绛县', '111.224734', '35.616251', 'district');
INSERT INTO `cyx_district` VALUES (295, 288, '0359', '140826', '绛县', '111.568236', '35.49119', 'district');
INSERT INTO `cyx_district` VALUES (296, 288, '0359', '140827', '垣曲县', '111.670108', '35.297369', 'district');
INSERT INTO `cyx_district` VALUES (297, 288, '0359', '140828', '夏县', '111.220456', '35.141363', 'district');
INSERT INTO `cyx_district` VALUES (298, 288, '0359', '140829', '平陆县', '111.194133', '34.82926', 'district');
INSERT INTO `cyx_district` VALUES (299, 288, '0359', '140830', '芮城县', '110.694369', '34.693579', 'district');
INSERT INTO `cyx_district` VALUES (300, 288, '0359', '140881', '永济市', '110.447543', '34.8671', 'district');
INSERT INTO `cyx_district` VALUES (301, 288, '0359', '140882', '河津市', '110.712063', '35.596383', 'district');
INSERT INTO `cyx_district` VALUES (302, 218, '0350', '140900', '忻州市', '112.734174', '38.416663', 'city');
INSERT INTO `cyx_district` VALUES (303, 302, '0350', '140902', '忻府区', '112.746046', '38.404242', 'district');
INSERT INTO `cyx_district` VALUES (304, 302, '0350', '140921', '定襄县', '112.957237', '38.473506', 'district');
INSERT INTO `cyx_district` VALUES (305, 302, '0350', '140922', '五台县', '113.255309', '38.728315', 'district');
INSERT INTO `cyx_district` VALUES (306, 302, '0350', '140923', '代县', '112.960282', '39.066917', 'district');
INSERT INTO `cyx_district` VALUES (307, 302, '0350', '140924', '繁峙县', '113.265563', '39.188811', 'district');
INSERT INTO `cyx_district` VALUES (308, 302, '0350', '140925', '宁武县', '112.304722', '39.001524', 'district');
INSERT INTO `cyx_district` VALUES (309, 302, '0350', '140926', '静乐县', '111.939498', '38.359306', 'district');
INSERT INTO `cyx_district` VALUES (310, 302, '0350', '140927', '神池县', '112.211296', '39.090552', 'district');
INSERT INTO `cyx_district` VALUES (311, 302, '0350', '140928', '五寨县', '111.846904', '38.910726', 'district');
INSERT INTO `cyx_district` VALUES (312, 302, '0350', '140929', '岢岚县', '111.57285', '38.70418', 'district');
INSERT INTO `cyx_district` VALUES (313, 302, '0350', '140930', '河曲县', '111.138472', '39.384482', 'district');
INSERT INTO `cyx_district` VALUES (314, 302, '0350', '140931', '保德县', '111.086564', '39.022487', 'district');
INSERT INTO `cyx_district` VALUES (315, 302, '0350', '140932', '偏关县', '111.508831', '39.436306', 'district');
INSERT INTO `cyx_district` VALUES (316, 302, '0350', '140981', '原平市', '112.711058', '38.731402', 'district');
INSERT INTO `cyx_district` VALUES (317, 218, '0357', '141000', '临汾市', '111.518975', '36.088005', 'city');
INSERT INTO `cyx_district` VALUES (318, 317, '0357', '141002', '尧都区', '111.579554', '36.07884', 'district');
INSERT INTO `cyx_district` VALUES (319, 317, '0357', '141021', '曲沃县', '111.47586', '35.641086', 'district');
INSERT INTO `cyx_district` VALUES (320, 317, '0357', '141022', '翼城县', '111.718951', '35.738576', 'district');
INSERT INTO `cyx_district` VALUES (321, 317, '0357', '141023', '襄汾县', '111.441725', '35.876293', 'district');
INSERT INTO `cyx_district` VALUES (322, 317, '0357', '141024', '洪洞县', '111.674965', '36.253747', 'district');
INSERT INTO `cyx_district` VALUES (323, 317, '0357', '141025', '古县', '111.920465', '36.266914', 'district');
INSERT INTO `cyx_district` VALUES (324, 317, '0357', '141026', '安泽县', '112.250144', '36.147787', 'district');
INSERT INTO `cyx_district` VALUES (325, 317, '0357', '141027', '浮山县', '111.848883', '35.968124', 'district');
INSERT INTO `cyx_district` VALUES (326, 317, '0357', '141028', '吉县', '110.681763', '36.098188', 'district');
INSERT INTO `cyx_district` VALUES (327, 317, '0357', '141029', '乡宁县', '110.847021', '35.970389', 'district');
INSERT INTO `cyx_district` VALUES (328, 317, '0357', '141030', '大宁县', '110.75291', '36.465102', 'district');
INSERT INTO `cyx_district` VALUES (329, 317, '0357', '141031', '隰县', '110.940637', '36.69333', 'district');
INSERT INTO `cyx_district` VALUES (330, 317, '0357', '141032', '永和县', '110.632006', '36.759507', 'district');
INSERT INTO `cyx_district` VALUES (331, 317, '0357', '141033', '蒲县', '111.096439', '36.411826', 'district');
INSERT INTO `cyx_district` VALUES (332, 317, '0357', '141034', '汾西县', '111.56395', '36.652854', 'district');
INSERT INTO `cyx_district` VALUES (333, 317, '0357', '141081', '侯马市', '111.372002', '35.619105', 'district');
INSERT INTO `cyx_district` VALUES (334, 317, '0357', '141082', '霍州市', '111.755398', '36.56893', 'district');
INSERT INTO `cyx_district` VALUES (335, 218, '0358', '141100', '吕梁市', '111.144699', '37.519126', 'city');
INSERT INTO `cyx_district` VALUES (336, 335, '0358', '141102', '离石区', '111.150695', '37.51786', 'district');
INSERT INTO `cyx_district` VALUES (337, 335, '0358', '141121', '文水县', '112.028866', '37.438101', 'district');
INSERT INTO `cyx_district` VALUES (338, 335, '0358', '141122', '交城县', '112.156064', '37.551963', 'district');
INSERT INTO `cyx_district` VALUES (339, 335, '0358', '141123', '兴县', '111.127667', '38.462389', 'district');
INSERT INTO `cyx_district` VALUES (340, 335, '0358', '141124', '临县', '110.992093', '37.950758', 'district');
INSERT INTO `cyx_district` VALUES (341, 335, '0358', '141125', '柳林县', '110.889007', '37.429772', 'district');
INSERT INTO `cyx_district` VALUES (342, 335, '0358', '141126', '石楼县', '110.834634', '36.99857', 'district');
INSERT INTO `cyx_district` VALUES (343, 335, '0358', '141127', '岚县', '111.671917', '38.279299', 'district');
INSERT INTO `cyx_district` VALUES (344, 335, '0358', '141128', '方山县', '111.244098', '37.894631', 'district');
INSERT INTO `cyx_district` VALUES (345, 335, '0358', '141129', '中阳县', '111.179657', '37.357058', 'district');
INSERT INTO `cyx_district` VALUES (346, 335, '0358', '141130', '交口县', '111.181151', '36.982186', 'district');
INSERT INTO `cyx_district` VALUES (347, 335, '0358', '141181', '孝义市', '111.778818', '37.146294', 'district');
INSERT INTO `cyx_district` VALUES (348, 335, '0358', '141182', '汾阳市', '111.770477', '37.261756', 'district');
INSERT INTO `cyx_district` VALUES (349, 1, '0', '150000', '内蒙古自治区', '111.76629', '40.81739', 'province');
INSERT INTO `cyx_district` VALUES (350, 349, '0471', '150100', '呼和浩特市', '111.749995', '40.842356', 'city');
INSERT INTO `cyx_district` VALUES (351, 350, '0471', '150102', '新城区', '111.665544', '40.858289', 'district');
INSERT INTO `cyx_district` VALUES (352, 350, '0471', '150103', '回民区', '111.623692', '40.808608', 'district');
INSERT INTO `cyx_district` VALUES (353, 350, '0471', '150104', '玉泉区', '111.673881', '40.753655', 'district');
INSERT INTO `cyx_district` VALUES (354, 350, '0471', '150105', '赛罕区', '111.701355', '40.792667', 'district');
INSERT INTO `cyx_district` VALUES (355, 350, '0471', '150121', '土默特左旗', '111.163902', '40.729572', 'district');
INSERT INTO `cyx_district` VALUES (356, 350, '0471', '150122', '托克托县', '111.194312', '40.277431', 'district');
INSERT INTO `cyx_district` VALUES (357, 350, '0471', '150123', '和林格尔县', '111.821843', '40.378787', 'district');
INSERT INTO `cyx_district` VALUES (358, 350, '0471', '150124', '清水河县', '111.647609', '39.921095', 'district');
INSERT INTO `cyx_district` VALUES (359, 350, '0471', '150125', '武川县', '111.451303', '41.096471', 'district');
INSERT INTO `cyx_district` VALUES (360, 349, '0472', '150200', '包头市', '109.953504', '40.621157', 'city');
INSERT INTO `cyx_district` VALUES (361, 360, '0472', '150202', '东河区', '110.044106', '40.576319', 'district');
INSERT INTO `cyx_district` VALUES (362, 360, '0472', '150203', '昆都仑区', '109.837707', '40.642578', 'district');
INSERT INTO `cyx_district` VALUES (363, 360, '0472', '150204', '青山区', '109.901572', '40.643246', 'district');
INSERT INTO `cyx_district` VALUES (364, 360, '0472', '150205', '石拐区', '110.060254', '40.681748', 'district');
INSERT INTO `cyx_district` VALUES (365, 360, '0472', '150206', '白云鄂博矿区', '109.973803', '41.769511', 'district');
INSERT INTO `cyx_district` VALUES (366, 360, '0472', '150207', '九原区', '109.967449', '40.610561', 'district');
INSERT INTO `cyx_district` VALUES (367, 360, '0472', '150221', '土默特右旗', '110.524262', '40.569426', 'district');
INSERT INTO `cyx_district` VALUES (368, 360, '0472', '150222', '固阳县', '110.060514', '41.034105', 'district');
INSERT INTO `cyx_district` VALUES (369, 360, '0472', '150223', '达尔罕茂明安联合旗', '110.432626', '41.698992', 'district');
INSERT INTO `cyx_district` VALUES (370, 349, '0473', '150300', '乌海市', '106.794216', '39.655248', 'city');
INSERT INTO `cyx_district` VALUES (371, 370, '0473', '150302', '海勃湾区', '106.822778', '39.691156', 'district');
INSERT INTO `cyx_district` VALUES (372, 370, '0473', '150303', '海南区', '106.891424', '39.441364', 'district');
INSERT INTO `cyx_district` VALUES (373, 370, '0473', '150304', '乌达区', '106.726099', '39.505925', 'district');
INSERT INTO `cyx_district` VALUES (374, 349, '0476', '150400', '赤峰市', '118.88694', '42.257843', 'city');
INSERT INTO `cyx_district` VALUES (375, 374, '0476', '150402', '红山区', '118.953854', '42.296588', 'district');
INSERT INTO `cyx_district` VALUES (376, 374, '0476', '150403', '元宝山区', '119.288611', '42.038902', 'district');
INSERT INTO `cyx_district` VALUES (377, 374, '0476', '150404', '松山区', '118.916208', '42.299798', 'district');
INSERT INTO `cyx_district` VALUES (378, 374, '0476', '150421', '阿鲁科尔沁旗', '120.0657', '43.872298', 'district');
INSERT INTO `cyx_district` VALUES (379, 374, '0476', '150422', '巴林左旗', '119.362931', '43.960889', 'district');
INSERT INTO `cyx_district` VALUES (380, 374, '0476', '150423', '巴林右旗', '118.66518', '43.534414', 'district');
INSERT INTO `cyx_district` VALUES (381, 374, '0476', '150424', '林西县', '118.05545', '43.61812', 'district');
INSERT INTO `cyx_district` VALUES (382, 374, '0476', '150425', '克什克腾旗', '117.545797', '43.264988', 'district');
INSERT INTO `cyx_district` VALUES (383, 374, '0476', '150426', '翁牛特旗', '119.00658', '42.936188', 'district');
INSERT INTO `cyx_district` VALUES (384, 374, '0476', '150428', '喀喇沁旗', '118.701937', '41.927363', 'district');
INSERT INTO `cyx_district` VALUES (385, 374, '0476', '150429', '宁城县', '119.318876', '41.601375', 'district');
INSERT INTO `cyx_district` VALUES (386, 374, '0476', '150430', '敖汉旗', '119.921603', '42.290781', 'district');
INSERT INTO `cyx_district` VALUES (387, 349, '0475', '150500', '通辽市', '122.243444', '43.652889', 'city');
INSERT INTO `cyx_district` VALUES (388, 387, '0475', '150502', '科尔沁区', '122.255671', '43.623078', 'district');
INSERT INTO `cyx_district` VALUES (389, 387, '0475', '150521', '科尔沁左翼中旗', '123.312264', '44.126625', 'district');
INSERT INTO `cyx_district` VALUES (390, 387, '0475', '150522', '科尔沁左翼后旗', '122.35677', '42.935105', 'district');
INSERT INTO `cyx_district` VALUES (391, 387, '0475', '150523', '开鲁县', '121.319308', '43.601244', 'district');
INSERT INTO `cyx_district` VALUES (392, 387, '0475', '150524', '库伦旗', '121.8107', '42.735656', 'district');
INSERT INTO `cyx_district` VALUES (393, 387, '0475', '150525', '奈曼旗', '120.658282', '42.867226', 'district');
INSERT INTO `cyx_district` VALUES (394, 387, '0475', '150526', '扎鲁特旗', '120.911676', '44.556389', 'district');
INSERT INTO `cyx_district` VALUES (395, 387, '0475', '150581', '霍林郭勒市', '119.68187', '45.533962', 'district');
INSERT INTO `cyx_district` VALUES (396, 349, '0477', '150600', '鄂尔多斯市', '109.781327', '39.608266', 'city');
INSERT INTO `cyx_district` VALUES (397, 396, '0477', '150602', '东胜区', '109.963333', '39.822593', 'district');
INSERT INTO `cyx_district` VALUES (398, 396, '0477', '150603', '康巴什区', '109.790076', '39.607472', 'district');
INSERT INTO `cyx_district` VALUES (399, 396, '0477', '150621', '达拉特旗', '110.033833', '40.412438', 'district');
INSERT INTO `cyx_district` VALUES (400, 396, '0477', '150622', '准格尔旗', '111.240171', '39.864361', 'district');
INSERT INTO `cyx_district` VALUES (401, 396, '0477', '150623', '鄂托克前旗', '107.477514', '38.182362', 'district');
INSERT INTO `cyx_district` VALUES (402, 396, '0477', '150624', '鄂托克旗', '107.97616', '39.08965', 'district');
INSERT INTO `cyx_district` VALUES (403, 396, '0477', '150625', '杭锦旗', '108.736208', '39.833309', 'district');
INSERT INTO `cyx_district` VALUES (404, 396, '0477', '150626', '乌审旗', '108.817607', '38.604136', 'district');
INSERT INTO `cyx_district` VALUES (405, 396, '0477', '150627', '伊金霍洛旗', '109.74774', '39.564659', 'district');
INSERT INTO `cyx_district` VALUES (406, 349, '0470', '150700', '呼伦贝尔市', '119.765558', '49.211576', 'city');
INSERT INTO `cyx_district` VALUES (407, 406, '0470', '150702', '海拉尔区', '119.736176', '49.212188', 'district');
INSERT INTO `cyx_district` VALUES (408, 406, '0470', '150703', '扎赉诺尔区', '117.670248', '49.510375', 'district');
INSERT INTO `cyx_district` VALUES (409, 406, '0470', '150721', '阿荣旗', '123.459049', '48.126584', 'district');
INSERT INTO `cyx_district` VALUES (410, 406, '0470', '150722', '莫力达瓦达斡尔族自治旗', '124.519023', '48.477728', 'district');
INSERT INTO `cyx_district` VALUES (411, 406, '0470', '150723', '鄂伦春自治旗', '123.726201', '50.591842', 'district');
INSERT INTO `cyx_district` VALUES (412, 406, '0470', '150724', '鄂温克族自治旗', '119.755239', '49.146592', 'district');
INSERT INTO `cyx_district` VALUES (413, 406, '0470', '150725', '陈巴尔虎旗', '119.424026', '49.328916', 'district');
INSERT INTO `cyx_district` VALUES (414, 406, '0470', '150726', '新巴尔虎左旗', '118.269819', '48.218241', 'district');
INSERT INTO `cyx_district` VALUES (415, 406, '0470', '150727', '新巴尔虎右旗', '116.82369', '48.672101', 'district');
INSERT INTO `cyx_district` VALUES (416, 406, '0470', '150781', '满洲里市', '117.378529', '49.597841', 'district');
INSERT INTO `cyx_district` VALUES (417, 406, '0470', '150782', '牙克石市', '120.711775', '49.285629', 'district');
INSERT INTO `cyx_district` VALUES (418, 406, '0470', '150783', '扎兰屯市', '122.737467', '48.013733', 'district');
INSERT INTO `cyx_district` VALUES (419, 406, '0470', '150784', '额尔古纳市', '120.180506', '50.243102', 'district');
INSERT INTO `cyx_district` VALUES (420, 406, '0470', '150785', '根河市', '121.520388', '50.780344', 'district');
INSERT INTO `cyx_district` VALUES (421, 349, '0478', '150800', '巴彦淖尔市', '107.387657', '40.743213', 'city');
INSERT INTO `cyx_district` VALUES (422, 421, '0478', '150802', '临河区', '107.363918', '40.751187', 'district');
INSERT INTO `cyx_district` VALUES (423, 421, '0478', '150821', '五原县', '108.267561', '41.088421', 'district');
INSERT INTO `cyx_district` VALUES (424, 421, '0478', '150822', '磴口县', '107.008248', '40.330523', 'district');
INSERT INTO `cyx_district` VALUES (425, 421, '0478', '150823', '乌拉特前旗', '108.652114', '40.737018', 'district');
INSERT INTO `cyx_district` VALUES (426, 421, '0478', '150824', '乌拉特中旗', '108.513645', '41.587732', 'district');
INSERT INTO `cyx_district` VALUES (427, 421, '0478', '150825', '乌拉特后旗', '107.074621', '41.084282', 'district');
INSERT INTO `cyx_district` VALUES (428, 421, '0478', '150826', '杭锦后旗', '107.151245', '40.88602', 'district');
INSERT INTO `cyx_district` VALUES (429, 349, '0474', '150900', '乌兰察布市', '113.132584', '40.994785', 'city');
INSERT INTO `cyx_district` VALUES (430, 429, '0474', '150902', '集宁区', '113.116453', '41.034134', 'district');
INSERT INTO `cyx_district` VALUES (431, 429, '0474', '150921', '卓资县', '112.577528', '40.894691', 'district');
INSERT INTO `cyx_district` VALUES (432, 429, '0474', '150922', '化德县', '114.010437', '41.90456', 'district');
INSERT INTO `cyx_district` VALUES (433, 429, '0474', '150923', '商都县', '113.577816', '41.562113', 'district');
INSERT INTO `cyx_district` VALUES (434, 429, '0474', '150924', '兴和县', '113.834173', '40.872301', 'district');
INSERT INTO `cyx_district` VALUES (435, 429, '0474', '150925', '凉城县', '112.503971', '40.531555', 'district');
INSERT INTO `cyx_district` VALUES (436, 429, '0474', '150926', '察哈尔右翼前旗', '113.214733', '40.785631', 'district');
INSERT INTO `cyx_district` VALUES (437, 429, '0474', '150927', '察哈尔右翼中旗', '112.635577', '41.277462', 'district');
INSERT INTO `cyx_district` VALUES (438, 429, '0474', '150928', '察哈尔右翼后旗', '113.191035', '41.436069', 'district');
INSERT INTO `cyx_district` VALUES (439, 429, '0474', '150929', '四子王旗', '111.706617', '41.533462', 'district');
INSERT INTO `cyx_district` VALUES (440, 429, '0474', '150981', '丰镇市', '113.109892', '40.436983', 'district');
INSERT INTO `cyx_district` VALUES (441, 349, '0482', '152200', '兴安盟', '122.037657', '46.082462', 'city');
INSERT INTO `cyx_district` VALUES (442, 441, '0482', '152201', '乌兰浩特市', '122.093123', '46.072731', 'district');
INSERT INTO `cyx_district` VALUES (443, 441, '0482', '152202', '阿尔山市', '119.943575', '47.17744', 'district');
INSERT INTO `cyx_district` VALUES (444, 441, '0482', '152221', '科尔沁右翼前旗', '121.952621', '46.079833', 'district');
INSERT INTO `cyx_district` VALUES (445, 441, '0482', '152222', '科尔沁右翼中旗', '121.47653', '45.060837', 'district');
INSERT INTO `cyx_district` VALUES (446, 441, '0482', '152223', '扎赉特旗', '122.899656', '46.723237', 'district');
INSERT INTO `cyx_district` VALUES (447, 441, '0482', '152224', '突泉县', '121.593799', '45.38193', 'district');
INSERT INTO `cyx_district` VALUES (448, 349, '0479', '152500', '锡林郭勒盟', '116.048222', '43.933454', 'city');
INSERT INTO `cyx_district` VALUES (449, 448, '0479', '152501', '二连浩特市', '111.951002', '43.6437', 'district');
INSERT INTO `cyx_district` VALUES (450, 448, '0479', '152502', '锡林浩特市', '116.086029', '43.933403', 'district');
INSERT INTO `cyx_district` VALUES (451, 448, '0479', '152522', '阿巴嘎旗', '114.950248', '44.022995', 'district');
INSERT INTO `cyx_district` VALUES (452, 448, '0479', '152523', '苏尼特左旗', '113.667248', '43.85988', 'district');
INSERT INTO `cyx_district` VALUES (453, 448, '0479', '152524', '苏尼特右旗', '112.641783', '42.742892', 'district');
INSERT INTO `cyx_district` VALUES (454, 448, '0479', '152525', '东乌珠穆沁旗', '116.974494', '45.498221', 'district');
INSERT INTO `cyx_district` VALUES (455, 448, '0479', '152526', '西乌珠穆沁旗', '117.608911', '44.587882', 'district');
INSERT INTO `cyx_district` VALUES (456, 448, '0479', '152527', '太仆寺旗', '115.282986', '41.877135', 'district');
INSERT INTO `cyx_district` VALUES (457, 448, '0479', '152528', '镶黄旗', '113.847287', '42.232371', 'district');
INSERT INTO `cyx_district` VALUES (458, 448, '0479', '152529', '正镶白旗', '115.029848', '42.28747', 'district');
INSERT INTO `cyx_district` VALUES (459, 448, '0479', '152530', '正蓝旗', '115.99247', '42.241638', 'district');
INSERT INTO `cyx_district` VALUES (460, 448, '0479', '152531', '多伦县', '116.485555', '42.203591', 'district');
INSERT INTO `cyx_district` VALUES (461, 349, '0483', '152900', '阿拉善盟', '105.728957', '38.851921', 'city');
INSERT INTO `cyx_district` VALUES (462, 461, '0483', '152921', '阿拉善左旗', '105.666275', '38.833389', 'district');
INSERT INTO `cyx_district` VALUES (463, 461, '0483', '152922', '阿拉善右旗', '101.666917', '39.216185', 'district');
INSERT INTO `cyx_district` VALUES (464, 461, '0483', '152923', '额济纳旗', '101.055731', '41.95455', 'district');
INSERT INTO `cyx_district` VALUES (465, 1, '0', '210000', '辽宁省', '123.431382', '41.836175', 'province');
INSERT INTO `cyx_district` VALUES (466, 465, '024', '210100', '沈阳市', '123.465035', '41.677284', 'city');
INSERT INTO `cyx_district` VALUES (467, 466, '024', '210102', '和平区', '123.420368', '41.789833', 'district');
INSERT INTO `cyx_district` VALUES (468, 466, '024', '210103', '沈河区', '123.458691', '41.796177', 'district');
INSERT INTO `cyx_district` VALUES (469, 466, '024', '210104', '大东区', '123.469948', '41.805137', 'district');
INSERT INTO `cyx_district` VALUES (470, 466, '024', '210105', '皇姑区', '123.442378', '41.824516', 'district');
INSERT INTO `cyx_district` VALUES (471, 466, '024', '210106', '铁西区', '123.333968', '41.820807', 'district');
INSERT INTO `cyx_district` VALUES (472, 466, '024', '210111', '苏家屯区', '123.344062', '41.664757', 'district');
INSERT INTO `cyx_district` VALUES (473, 466, '024', '210112', '浑南区', '123.449714', '41.714914', 'district');
INSERT INTO `cyx_district` VALUES (474, 466, '024', '210113', '沈北新区', '123.583196', '41.912487', 'district');
INSERT INTO `cyx_district` VALUES (475, 466, '024', '210114', '于洪区', '123.308119', '41.793721', 'district');
INSERT INTO `cyx_district` VALUES (476, 466, '024', '210115', '辽中区', '122.765409', '41.516826', 'district');
INSERT INTO `cyx_district` VALUES (477, 466, '024', '210123', '康平县', '123.343699', '42.72793', 'district');
INSERT INTO `cyx_district` VALUES (478, 466, '024', '210124', '法库县', '123.440294', '42.50108', 'district');
INSERT INTO `cyx_district` VALUES (479, 466, '024', '210181', '新民市', '122.836723', '41.985186', 'district');
INSERT INTO `cyx_district` VALUES (480, 465, '0411', '210200', '大连市', '121.614848', '38.914086', 'city');
INSERT INTO `cyx_district` VALUES (481, 480, '0411', '210202', '中山区', '121.644926', '38.918574', 'district');
INSERT INTO `cyx_district` VALUES (482, 480, '0411', '210203', '西岗区', '121.612324', '38.914687', 'district');
INSERT INTO `cyx_district` VALUES (483, 480, '0411', '210204', '沙河口区', '121.594297', '38.904788', 'district');
INSERT INTO `cyx_district` VALUES (484, 480, '0411', '210211', '甘井子区', '121.525466', '38.953343', 'district');
INSERT INTO `cyx_district` VALUES (485, 480, '0411', '210212', '旅顺口区', '121.261953', '38.851705', 'district');
INSERT INTO `cyx_district` VALUES (486, 480, '0411', '210213', '金州区', '121.782655', '39.050001', 'district');
INSERT INTO `cyx_district` VALUES (487, 480, '0411', '210214', '普兰店区', '121.938269', '39.392095', 'district');
INSERT INTO `cyx_district` VALUES (488, 480, '0411', '210224', '长海县', '122.588494', '39.272728', 'district');
INSERT INTO `cyx_district` VALUES (489, 480, '0411', '210281', '瓦房店市', '121.979543', '39.626897', 'district');
INSERT INTO `cyx_district` VALUES (490, 480, '0411', '210283', '庄河市', '122.967424', '39.680843', 'district');
INSERT INTO `cyx_district` VALUES (491, 465, '0412', '210300', '鞍山市', '122.994329', '41.108647', 'city');
INSERT INTO `cyx_district` VALUES (492, 491, '0412', '210302', '铁东区', '122.991052', '41.089933', 'district');
INSERT INTO `cyx_district` VALUES (493, 491, '0412', '210303', '铁西区', '122.969629', '41.119884', 'district');
INSERT INTO `cyx_district` VALUES (494, 491, '0412', '210304', '立山区', '123.029091', '41.150401', 'district');
INSERT INTO `cyx_district` VALUES (495, 491, '0412', '210311', '千山区', '122.944751', '41.068901', 'district');
INSERT INTO `cyx_district` VALUES (496, 491, '0412', '210321', '台安县', '122.436196', '41.412767', 'district');
INSERT INTO `cyx_district` VALUES (497, 491, '0412', '210323', '岫岩满族自治县', '123.280935', '40.29088', 'district');
INSERT INTO `cyx_district` VALUES (498, 491, '0412', '210381', '海城市', '122.685217', '40.882377', 'district');
INSERT INTO `cyx_district` VALUES (499, 465, '0413', '210400', '抚顺市', '123.957208', '41.880872', 'city');
INSERT INTO `cyx_district` VALUES (500, 499, '0413', '210402', '新抚区', '123.912872', '41.862026', 'district');
INSERT INTO `cyx_district` VALUES (501, 499, '0413', '210403', '东洲区', '124.038685', '41.853191', 'district');
INSERT INTO `cyx_district` VALUES (502, 499, '0413', '210404', '望花区', '123.784225', '41.853641', 'district');
INSERT INTO `cyx_district` VALUES (503, 499, '0413', '210411', '顺城区', '123.945075', '41.883235', 'district');
INSERT INTO `cyx_district` VALUES (504, 499, '0413', '210421', '抚顺县', '124.097978', '41.922644', 'district');
INSERT INTO `cyx_district` VALUES (505, 499, '0413', '210422', '新宾满族自治县', '125.039978', '41.734256', 'district');
INSERT INTO `cyx_district` VALUES (506, 499, '0413', '210423', '清原满族自治县', '124.924083', '42.100538', 'district');
INSERT INTO `cyx_district` VALUES (507, 465, '0414', '210500', '本溪市', '123.685142', '41.486981', 'city');
INSERT INTO `cyx_district` VALUES (508, 507, '0414', '210502', '平山区', '123.769088', '41.299587', 'district');
INSERT INTO `cyx_district` VALUES (509, 507, '0414', '210503', '溪湖区', '123.767646', '41.329219', 'district');
INSERT INTO `cyx_district` VALUES (510, 507, '0414', '210504', '明山区', '123.817214', '41.308719', 'district');
INSERT INTO `cyx_district` VALUES (511, 507, '0414', '210505', '南芬区', '123.744802', '41.100445', 'district');
INSERT INTO `cyx_district` VALUES (512, 507, '0414', '210521', '本溪满族自治县', '124.120635', '41.302009', 'district');
INSERT INTO `cyx_district` VALUES (513, 507, '0414', '210522', '桓仁满族自治县', '125.361007', '41.267127', 'district');
INSERT INTO `cyx_district` VALUES (514, 465, '0415', '210600', '丹东市', '124.35445', '40.000787', 'city');
INSERT INTO `cyx_district` VALUES (515, 514, '0415', '210602', '元宝区', '124.395661', '40.136434', 'district');
INSERT INTO `cyx_district` VALUES (516, 514, '0415', '210603', '振兴区', '124.383237', '40.129944', 'district');
INSERT INTO `cyx_district` VALUES (517, 514, '0415', '210604', '振安区', '124.470034', '40.201553', 'district');
INSERT INTO `cyx_district` VALUES (518, 514, '0415', '210624', '宽甸满族自治县', '124.783659', '40.731316', 'district');
INSERT INTO `cyx_district` VALUES (519, 514, '0415', '210681', '东港市', '124.152705', '39.863008', 'district');
INSERT INTO `cyx_district` VALUES (520, 514, '0415', '210682', '凤城市', '124.066919', '40.452297', 'district');
INSERT INTO `cyx_district` VALUES (521, 465, '0416', '210700', '锦州市', '121.126846', '41.095685', 'city');
INSERT INTO `cyx_district` VALUES (522, 521, '0416', '210702', '古塔区', '121.128279', '41.117245', 'district');
INSERT INTO `cyx_district` VALUES (523, 521, '0416', '210703', '凌河区', '121.150877', '41.114989', 'district');
INSERT INTO `cyx_district` VALUES (524, 521, '0416', '210711', '太和区', '121.103892', '41.109147', 'district');
INSERT INTO `cyx_district` VALUES (525, 521, '0416', '210726', '黑山县', '122.126292', '41.653593', 'district');
INSERT INTO `cyx_district` VALUES (526, 521, '0416', '210727', '义县', '121.23908', '41.533086', 'district');
INSERT INTO `cyx_district` VALUES (527, 521, '0416', '210781', '凌海市', '121.35549', '41.160567', 'district');
INSERT INTO `cyx_district` VALUES (528, 521, '0416', '210782', '北镇市', '121.777395', '41.58844', 'district');
INSERT INTO `cyx_district` VALUES (529, 465, '0417', '210800', '营口市', '122.219458', '40.625364', 'city');
INSERT INTO `cyx_district` VALUES (530, 529, '0417', '210802', '站前区', '122.259033', '40.672563', 'district');
INSERT INTO `cyx_district` VALUES (531, 529, '0417', '210803', '西市区', '122.206419', '40.666213', 'district');
INSERT INTO `cyx_district` VALUES (532, 529, '0417', '210804', '鲅鱼圈区', '122.121521', '40.226661', 'district');
INSERT INTO `cyx_district` VALUES (533, 529, '0417', '210811', '老边区', '122.380087', '40.680191', 'district');
INSERT INTO `cyx_district` VALUES (534, 529, '0417', '210881', '盖州市', '122.349012', '40.40074', 'district');
INSERT INTO `cyx_district` VALUES (535, 529, '0417', '210882', '大石桥市', '122.509006', '40.644482', 'district');
INSERT INTO `cyx_district` VALUES (536, 465, '0418', '210900', '阜新市', '121.670273', '42.021602', 'city');
INSERT INTO `cyx_district` VALUES (537, 536, '0418', '210902', '海州区', '121.657638', '42.011162', 'district');
INSERT INTO `cyx_district` VALUES (538, 536, '0418', '210903', '新邱区', '121.792535', '42.087632', 'district');
INSERT INTO `cyx_district` VALUES (539, 536, '0418', '210904', '太平区', '121.678604', '42.010669', 'district');
INSERT INTO `cyx_district` VALUES (540, 536, '0418', '210905', '清河门区', '121.416105', '41.7831', 'district');
INSERT INTO `cyx_district` VALUES (541, 536, '0418', '210911', '细河区', '121.68054', '42.025494', 'district');
INSERT INTO `cyx_district` VALUES (542, 536, '0418', '210921', '阜新蒙古族自治县', '121.757901', '42.065175', 'district');
INSERT INTO `cyx_district` VALUES (543, 536, '0418', '210922', '彰武县', '122.538793', '42.386543', 'district');
INSERT INTO `cyx_district` VALUES (544, 465, '0419', '211000', '辽阳市', '123.236974', '41.267794', 'city');
INSERT INTO `cyx_district` VALUES (545, 544, '0419', '211002', '白塔区', '123.174325', '41.270347', 'district');
INSERT INTO `cyx_district` VALUES (546, 544, '0419', '211003', '文圣区', '123.231408', '41.283754', 'district');
INSERT INTO `cyx_district` VALUES (547, 544, '0419', '211004', '宏伟区', '123.196672', '41.217649', 'district');
INSERT INTO `cyx_district` VALUES (548, 544, '0419', '211005', '弓长岭区', '123.419803', '41.151847', 'district');
INSERT INTO `cyx_district` VALUES (549, 544, '0419', '211011', '太子河区', '123.18144', '41.295023', 'district');
INSERT INTO `cyx_district` VALUES (550, 544, '0419', '211021', '辽阳县', '123.105694', '41.205329', 'district');
INSERT INTO `cyx_district` VALUES (551, 544, '0419', '211081', '灯塔市', '123.339312', '41.426372', 'district');
INSERT INTO `cyx_district` VALUES (552, 465, '0427', '211100', '盘锦市', '122.170584', '40.719847', 'city');
INSERT INTO `cyx_district` VALUES (553, 552, '0427', '211102', '双台子区', '122.039787', '41.19965', 'district');
INSERT INTO `cyx_district` VALUES (554, 552, '0427', '211103', '兴隆台区', '122.070769', '41.119898', 'district');
INSERT INTO `cyx_district` VALUES (555, 552, '0427', '211104', '大洼区', '122.082574', '41.002279', 'district');
INSERT INTO `cyx_district` VALUES (556, 552, '0427', '211122', '盘山县', '121.996411', '41.242639', 'district');
INSERT INTO `cyx_district` VALUES (557, 465, '0410', '211200', '铁岭市', '123.726035', '42.223828', 'city');
INSERT INTO `cyx_district` VALUES (558, 557, '0410', '211202', '银州区', '123.842305', '42.286129', 'district');
INSERT INTO `cyx_district` VALUES (559, 557, '0410', '211204', '清河区', '124.159191', '42.546565', 'district');
INSERT INTO `cyx_district` VALUES (560, 557, '0410', '211221', '铁岭县', '123.728933', '42.223395', 'district');
INSERT INTO `cyx_district` VALUES (561, 557, '0410', '211223', '西丰县', '124.727392', '42.73803', 'district');
INSERT INTO `cyx_district` VALUES (562, 557, '0410', '211224', '昌图县', '124.111099', '42.785791', 'district');
INSERT INTO `cyx_district` VALUES (563, 557, '0410', '211281', '调兵山市', '123.567117', '42.467521', 'district');
INSERT INTO `cyx_district` VALUES (564, 557, '0410', '211282', '开原市', '124.038268', '42.546307', 'district');
INSERT INTO `cyx_district` VALUES (565, 465, '0421', '211300', '朝阳市', '120.450879', '41.573762', 'city');
INSERT INTO `cyx_district` VALUES (566, 565, '0421', '211302', '双塔区', '120.453744', '41.565627', 'district');
INSERT INTO `cyx_district` VALUES (567, 565, '0421', '211303', '龙城区', '120.413376', '41.576749', 'district');
INSERT INTO `cyx_district` VALUES (568, 565, '0421', '211321', '朝阳县', '120.389754', '41.497825', 'district');
INSERT INTO `cyx_district` VALUES (569, 565, '0421', '211322', '建平县', '119.64328', '41.403128', 'district');
INSERT INTO `cyx_district` VALUES (570, 565, '0421', '211324', '喀喇沁左翼蒙古族自治县', '119.741223', '41.12815', 'district');
INSERT INTO `cyx_district` VALUES (571, 565, '0421', '211381', '北票市', '120.77073', '41.800683', 'district');
INSERT INTO `cyx_district` VALUES (572, 565, '0421', '211382', '凌源市', '119.401574', '41.245445', 'district');
INSERT INTO `cyx_district` VALUES (573, 465, '0429', '211400', '葫芦岛市', '120.836939', '40.71104', 'city');
INSERT INTO `cyx_district` VALUES (574, 573, '0429', '211402', '连山区', '120.869231', '40.774461', 'district');
INSERT INTO `cyx_district` VALUES (575, 573, '0429', '211403', '龙港区', '120.893786', '40.735519', 'district');
INSERT INTO `cyx_district` VALUES (576, 573, '0429', '211404', '南票区', '120.749727', '41.107107', 'district');
INSERT INTO `cyx_district` VALUES (577, 573, '0429', '211421', '绥中县', '120.344311', '40.32558', 'district');
INSERT INTO `cyx_district` VALUES (578, 573, '0429', '211422', '建昌县', '119.837124', '40.824367', 'district');
INSERT INTO `cyx_district` VALUES (579, 573, '0429', '211481', '兴城市', '120.756479', '40.609731', 'district');
INSERT INTO `cyx_district` VALUES (580, 1, '0', '220000', '吉林省', '125.32568', '43.897016', 'province');
INSERT INTO `cyx_district` VALUES (581, 580, '0431', '220100', '长春市', '125.323513', '43.817251', 'city');
INSERT INTO `cyx_district` VALUES (582, 581, '0431', '220102', '南关区', '125.350173', '43.863989', 'district');
INSERT INTO `cyx_district` VALUES (583, 581, '0431', '220103', '宽城区', '125.326581', '43.943612', 'district');
INSERT INTO `cyx_district` VALUES (584, 581, '0431', '220104', '朝阳区', '125.288254', '43.833762', 'district');
INSERT INTO `cyx_district` VALUES (585, 581, '0431', '220105', '二道区', '125.374327', '43.865577', 'district');
INSERT INTO `cyx_district` VALUES (586, 581, '0431', '220106', '绿园区', '125.256135', '43.880975', 'district');
INSERT INTO `cyx_district` VALUES (587, 581, '0431', '220112', '双阳区', '125.664662', '43.525311', 'district');
INSERT INTO `cyx_district` VALUES (588, 581, '0431', '220113', '九台区', '125.839573', '44.151742', 'district');
INSERT INTO `cyx_district` VALUES (589, 581, '0431', '220122', '农安县', '125.184887', '44.432763', 'district');
INSERT INTO `cyx_district` VALUES (590, 581, '0431', '220182', '榆树市', '126.533187', '44.840318', 'district');
INSERT INTO `cyx_district` VALUES (591, 581, '0431', '220183', '德惠市', '125.728755', '44.522056', 'district');
INSERT INTO `cyx_district` VALUES (592, 580, '0432', '220200', '吉林市', '126.549572', '43.837883', 'city');
INSERT INTO `cyx_district` VALUES (593, 592, '0432', '220202', '昌邑区', '126.574709', '43.881818', 'district');
INSERT INTO `cyx_district` VALUES (594, 592, '0432', '220203', '龙潭区', '126.562197', '43.910802', 'district');
INSERT INTO `cyx_district` VALUES (595, 592, '0432', '220204', '船营区', '126.540966', '43.833445', 'district');
INSERT INTO `cyx_district` VALUES (596, 592, '0432', '220211', '丰满区', '126.562274', '43.821601', 'district');
INSERT INTO `cyx_district` VALUES (597, 592, '0432', '220221', '永吉县', '126.497741', '43.672582', 'district');
INSERT INTO `cyx_district` VALUES (598, 592, '0432', '220281', '蛟河市', '127.344229', '43.724007', 'district');
INSERT INTO `cyx_district` VALUES (599, 592, '0432', '220282', '桦甸市', '126.746309', '42.972096', 'district');
INSERT INTO `cyx_district` VALUES (600, 592, '0432', '220283', '舒兰市', '126.965607', '44.406105', 'district');
INSERT INTO `cyx_district` VALUES (601, 592, '0432', '220284', '磐石市', '126.060427', '42.946285', 'district');
INSERT INTO `cyx_district` VALUES (602, 580, '0434', '220300', '四平市', '124.350398', '43.166419', 'city');
INSERT INTO `cyx_district` VALUES (603, 602, '0434', '220302', '铁西区', '124.345722', '43.146155', 'district');
INSERT INTO `cyx_district` VALUES (604, 602, '0434', '220303', '铁东区', '124.409591', '43.162105', 'district');
INSERT INTO `cyx_district` VALUES (605, 602, '0434', '220322', '梨树县', '124.33539', '43.30706', 'district');
INSERT INTO `cyx_district` VALUES (606, 602, '0434', '220323', '伊通满族自治县', '125.305393', '43.345754', 'district');
INSERT INTO `cyx_district` VALUES (607, 602, '0434', '220381', '公主岭市', '124.822929', '43.504676', 'district');
INSERT INTO `cyx_district` VALUES (608, 602, '0434', '220382', '双辽市', '123.502723', '43.518302', 'district');
INSERT INTO `cyx_district` VALUES (609, 580, '0437', '220400', '辽源市', '125.14366', '42.887766', 'city');
INSERT INTO `cyx_district` VALUES (610, 609, '0437', '220402', '龙山区', '125.136627', '42.90158', 'district');
INSERT INTO `cyx_district` VALUES (611, 609, '0437', '220403', '西安区', '125.149281', '42.927324', 'district');
INSERT INTO `cyx_district` VALUES (612, 609, '0437', '220421', '东丰县', '125.531021', '42.677371', 'district');
INSERT INTO `cyx_district` VALUES (613, 609, '0437', '220422', '东辽县', '124.991424', '42.92625', 'district');
INSERT INTO `cyx_district` VALUES (614, 580, '0435', '220500', '通化市', '125.939697', '41.728401', 'city');
INSERT INTO `cyx_district` VALUES (615, 614, '0435', '220502', '东昌区', '125.927101', '41.702859', 'district');
INSERT INTO `cyx_district` VALUES (616, 614, '0435', '220503', '二道江区', '126.042678', '41.774044', 'district');
INSERT INTO `cyx_district` VALUES (617, 614, '0435', '220521', '通化县', '125.759259', '41.679808', 'district');
INSERT INTO `cyx_district` VALUES (618, 614, '0435', '220523', '辉南县', '126.046783', '42.684921', 'district');
INSERT INTO `cyx_district` VALUES (619, 614, '0435', '220524', '柳河县', '125.744735', '42.284605', 'district');
INSERT INTO `cyx_district` VALUES (620, 614, '0435', '220581', '梅河口市', '125.710859', '42.539253', 'district');
INSERT INTO `cyx_district` VALUES (621, 614, '0435', '220582', '集安市', '126.19403', '41.125307', 'district');
INSERT INTO `cyx_district` VALUES (622, 580, '0439', '220600', '白山市', '126.41473', '41.943972', 'city');
INSERT INTO `cyx_district` VALUES (623, 622, '0439', '220602', '浑江区', '126.416093', '41.945409', 'district');
INSERT INTO `cyx_district` VALUES (624, 622, '0439', '220605', '江源区', '126.591178', '42.056747', 'district');
INSERT INTO `cyx_district` VALUES (625, 622, '0439', '220621', '抚松县', '127.449763', '42.221207', 'district');
INSERT INTO `cyx_district` VALUES (626, 622, '0439', '220622', '靖宇县', '126.813583', '42.388896', 'district');
INSERT INTO `cyx_district` VALUES (627, 622, '0439', '220623', '长白朝鲜族自治县', '128.200789', '41.420018', 'district');
INSERT INTO `cyx_district` VALUES (628, 622, '0439', '220681', '临江市', '126.918087', '41.811979', 'district');
INSERT INTO `cyx_district` VALUES (629, 580, '0438', '220700', '松原市', '124.825042', '45.141548', 'city');
INSERT INTO `cyx_district` VALUES (630, 629, '0438', '220702', '宁江区', '124.86562', '45.209915', 'district');
INSERT INTO `cyx_district` VALUES (631, 629, '0438', '220721', '前郭尔罗斯蒙古族自治县', '124.823417', '45.118061', 'district');
INSERT INTO `cyx_district` VALUES (632, 629, '0438', '220722', '长岭县', '123.967483', '44.275895', 'district');
INSERT INTO `cyx_district` VALUES (633, 629, '0438', '220723', '乾安县', '124.041139', '45.003773', 'district');
INSERT INTO `cyx_district` VALUES (634, 629, '0438', '220781', '扶余市', '126.049803', '44.9892', 'district');
INSERT INTO `cyx_district` VALUES (635, 580, '0436', '220800', '白城市', '122.838714', '45.619884', 'city');
INSERT INTO `cyx_district` VALUES (636, 635, '0436', '220802', '洮北区', '122.851029', '45.621716', 'district');
INSERT INTO `cyx_district` VALUES (637, 635, '0436', '220821', '镇赉县', '123.199607', '45.84835', 'district');
INSERT INTO `cyx_district` VALUES (638, 635, '0436', '220822', '通榆县', '123.088238', '44.81291', 'district');
INSERT INTO `cyx_district` VALUES (639, 635, '0436', '220881', '洮南市', '122.798579', '45.356807', 'district');
INSERT INTO `cyx_district` VALUES (640, 635, '0436', '220882', '大安市', '124.292626', '45.506996', 'district');
INSERT INTO `cyx_district` VALUES (641, 580, '1433', '222400', '延边朝鲜族自治州', '129.471868', '42.909408', 'city');
INSERT INTO `cyx_district` VALUES (642, 641, '1433', '222401', '延吉市', '129.508804', '42.89125', 'district');
INSERT INTO `cyx_district` VALUES (643, 641, '1433', '222402', '图们市', '129.84371', '42.968044', 'district');
INSERT INTO `cyx_district` VALUES (644, 641, '1433', '222403', '敦化市', '128.232131', '43.372642', 'district');
INSERT INTO `cyx_district` VALUES (645, 641, '1433', '222404', '珲春市', '130.366036', '42.862821', 'district');
INSERT INTO `cyx_district` VALUES (646, 641, '1433', '222405', '龙井市', '129.427066', '42.76631', 'district');
INSERT INTO `cyx_district` VALUES (647, 641, '1433', '222406', '和龙市', '129.010106', '42.546675', 'district');
INSERT INTO `cyx_district` VALUES (648, 641, '1433', '222424', '汪清县', '129.771607', '43.312522', 'district');
INSERT INTO `cyx_district` VALUES (649, 641, '1433', '222426', '安图县', '128.899772', '43.11195', 'district');
INSERT INTO `cyx_district` VALUES (650, 1, '0', '230000', '黑龙江省', '126.661665', '45.742366', 'province');
INSERT INTO `cyx_district` VALUES (651, 650, '0451', '230100', '哈尔滨市', '126.534967', '45.803775', 'city');
INSERT INTO `cyx_district` VALUES (652, 651, '0451', '230102', '道里区', '126.616973', '45.75577', 'district');
INSERT INTO `cyx_district` VALUES (653, 651, '0451', '230103', '南岗区', '126.668784', '45.760174', 'district');
INSERT INTO `cyx_district` VALUES (654, 651, '0451', '230104', '道外区', '126.64939', '45.792057', 'district');
INSERT INTO `cyx_district` VALUES (655, 651, '0451', '230108', '平房区', '126.637611', '45.597911', 'district');
INSERT INTO `cyx_district` VALUES (656, 651, '0451', '230109', '松北区', '126.516914', '45.794504', 'district');
INSERT INTO `cyx_district` VALUES (657, 651, '0451', '230110', '香坊区', '126.662593', '45.707716', 'district');
INSERT INTO `cyx_district` VALUES (658, 651, '0451', '230111', '呼兰区', '126.587905', '45.889457', 'district');
INSERT INTO `cyx_district` VALUES (659, 651, '0451', '230112', '阿城区', '126.958098', '45.548669', 'district');
INSERT INTO `cyx_district` VALUES (660, 651, '0451', '230113', '双城区', '126.312624', '45.383218', 'district');
INSERT INTO `cyx_district` VALUES (661, 651, '0451', '230123', '依兰县', '129.567877', '46.325419', 'district');
INSERT INTO `cyx_district` VALUES (662, 651, '0451', '230124', '方正县', '128.829536', '45.851694', 'district');
INSERT INTO `cyx_district` VALUES (663, 651, '0451', '230125', '宾县', '127.466634', '45.745917', 'district');
INSERT INTO `cyx_district` VALUES (664, 651, '0451', '230126', '巴彦县', '127.403781', '46.086549', 'district');
INSERT INTO `cyx_district` VALUES (665, 651, '0451', '230127', '木兰县', '128.043466', '45.950582', 'district');
INSERT INTO `cyx_district` VALUES (666, 651, '0451', '230128', '通河县', '128.746124', '45.990205', 'district');
INSERT INTO `cyx_district` VALUES (667, 651, '0451', '230129', '延寿县', '128.331643', '45.451897', 'district');
INSERT INTO `cyx_district` VALUES (668, 651, '0451', '230183', '尚志市', '128.009894', '45.209586', 'district');
INSERT INTO `cyx_district` VALUES (669, 651, '0451', '230184', '五常市', '127.167618', '44.931991', 'district');
INSERT INTO `cyx_district` VALUES (670, 650, '0452', '230200', '齐齐哈尔市', '123.918186', '47.354348', 'city');
INSERT INTO `cyx_district` VALUES (671, 670, '0452', '230202', '龙沙区', '123.957531', '47.317308', 'district');
INSERT INTO `cyx_district` VALUES (672, 670, '0452', '230203', '建华区', '123.955464', '47.354364', 'district');
INSERT INTO `cyx_district` VALUES (673, 670, '0452', '230204', '铁锋区', '123.978293', '47.340517', 'district');
INSERT INTO `cyx_district` VALUES (674, 670, '0452', '230205', '昂昂溪区', '123.8224', '47.15516', 'district');
INSERT INTO `cyx_district` VALUES (675, 670, '0452', '230206', '富拉尔基区', '123.629189', '47.208843', 'district');
INSERT INTO `cyx_district` VALUES (676, 670, '0452', '230207', '碾子山区', '122.887775', '47.516872', 'district');
INSERT INTO `cyx_district` VALUES (677, 670, '0452', '230208', '梅里斯达斡尔族区', '123.75291', '47.309537', 'district');
INSERT INTO `cyx_district` VALUES (678, 670, '0452', '230221', '龙江县', '123.205323', '47.338665', 'district');
INSERT INTO `cyx_district` VALUES (679, 670, '0452', '230223', '依安县', '125.306278', '47.893548', 'district');
INSERT INTO `cyx_district` VALUES (680, 670, '0452', '230224', '泰来县', '123.416631', '46.393694', 'district');
INSERT INTO `cyx_district` VALUES (681, 670, '0452', '230225', '甘南县', '123.507429', '47.922405', 'district');
INSERT INTO `cyx_district` VALUES (682, 670, '0452', '230227', '富裕县', '124.473793', '47.774347', 'district');
INSERT INTO `cyx_district` VALUES (683, 670, '0452', '230229', '克山县', '125.875705', '48.037031', 'district');
INSERT INTO `cyx_district` VALUES (684, 670, '0452', '230230', '克东县', '126.24872', '48.04206', 'district');
INSERT INTO `cyx_district` VALUES (685, 670, '0452', '230231', '拜泉县', '126.100213', '47.595851', 'district');
INSERT INTO `cyx_district` VALUES (686, 670, '0452', '230281', '讷河市', '124.88287', '48.466592', 'district');
INSERT INTO `cyx_district` VALUES (687, 650, '0467', '230300', '鸡西市', '130.969333', '45.295075', 'city');
INSERT INTO `cyx_district` VALUES (688, 687, '0467', '230302', '鸡冠区', '130.981185', '45.304355', 'district');
INSERT INTO `cyx_district` VALUES (689, 687, '0467', '230303', '恒山区', '130.904963', '45.210668', 'district');
INSERT INTO `cyx_district` VALUES (690, 687, '0467', '230304', '滴道区', '130.843613', '45.348763', 'district');
INSERT INTO `cyx_district` VALUES (691, 687, '0467', '230305', '梨树区', '130.69699', '45.092046', 'district');
INSERT INTO `cyx_district` VALUES (692, 687, '0467', '230306', '城子河区', '131.011304', '45.33697', 'district');
INSERT INTO `cyx_district` VALUES (693, 687, '0467', '230307', '麻山区', '130.478187', '45.212088', 'district');
INSERT INTO `cyx_district` VALUES (694, 687, '0467', '230321', '鸡东县', '131.124079', '45.260412', 'district');
INSERT INTO `cyx_district` VALUES (695, 687, '0467', '230381', '虎林市', '132.93721', '45.762685', 'district');
INSERT INTO `cyx_district` VALUES (696, 687, '0467', '230382', '密山市', '131.846635', '45.529774', 'district');
INSERT INTO `cyx_district` VALUES (697, 650, '0468', '230400', '鹤岗市', '130.297943', '47.350189', 'city');
INSERT INTO `cyx_district` VALUES (698, 697, '0468', '230402', '向阳区', '130.294235', '47.342468', 'district');
INSERT INTO `cyx_district` VALUES (699, 697, '0468', '230403', '工农区', '130.274684', '47.31878', 'district');
INSERT INTO `cyx_district` VALUES (700, 697, '0468', '230404', '南山区', '130.286788', '47.315174', 'district');
INSERT INTO `cyx_district` VALUES (701, 697, '0468', '230405', '兴安区', '130.239245', '47.252849', 'district');
INSERT INTO `cyx_district` VALUES (702, 697, '0468', '230406', '东山区', '130.317002', '47.338537', 'district');
INSERT INTO `cyx_district` VALUES (703, 697, '0468', '230407', '兴山区', '130.303481', '47.357702', 'district');
INSERT INTO `cyx_district` VALUES (704, 697, '0468', '230421', '萝北县', '130.85155', '47.576444', 'district');
INSERT INTO `cyx_district` VALUES (705, 697, '0468', '230422', '绥滨县', '131.852759', '47.289115', 'district');
INSERT INTO `cyx_district` VALUES (706, 650, '0469', '230500', '双鸭山市', '131.141195', '46.676418', 'city');
INSERT INTO `cyx_district` VALUES (707, 706, '0469', '230502', '尖山区', '131.158415', '46.64635', 'district');
INSERT INTO `cyx_district` VALUES (708, 706, '0469', '230503', '岭东区', '131.164723', '46.592721', 'district');
INSERT INTO `cyx_district` VALUES (709, 706, '0469', '230505', '四方台区', '131.337592', '46.597264', 'district');
INSERT INTO `cyx_district` VALUES (710, 706, '0469', '230506', '宝山区', '131.401589', '46.577167', 'district');
INSERT INTO `cyx_district` VALUES (711, 706, '0469', '230521', '集贤县', '131.141311', '46.728412', 'district');
INSERT INTO `cyx_district` VALUES (712, 706, '0469', '230522', '友谊县', '131.808063', '46.767299', 'district');
INSERT INTO `cyx_district` VALUES (713, 706, '0469', '230523', '宝清县', '132.196853', '46.327457', 'district');
INSERT INTO `cyx_district` VALUES (714, 706, '0469', '230524', '饶河县', '134.013872', '46.798163', 'district');
INSERT INTO `cyx_district` VALUES (715, 650, '0459', '230600', '大庆市', '125.103784', '46.589309', 'city');
INSERT INTO `cyx_district` VALUES (716, 715, '0459', '230602', '萨尔图区', '125.135591', '46.629092', 'district');
INSERT INTO `cyx_district` VALUES (717, 715, '0459', '230603', '龙凤区', '125.135326', '46.562247', 'district');
INSERT INTO `cyx_district` VALUES (718, 715, '0459', '230604', '让胡路区', '124.870596', '46.652357', 'district');
INSERT INTO `cyx_district` VALUES (719, 715, '0459', '230605', '红岗区', '124.891039', '46.398418', 'district');
INSERT INTO `cyx_district` VALUES (720, 715, '0459', '230606', '大同区', '124.812364', '46.039827', 'district');
INSERT INTO `cyx_district` VALUES (721, 715, '0459', '230621', '肇州县', '125.268643', '45.699066', 'district');
INSERT INTO `cyx_district` VALUES (722, 715, '0459', '230622', '肇源县', '125.078223', '45.51932', 'district');
INSERT INTO `cyx_district` VALUES (723, 715, '0459', '230623', '林甸县', '124.863603', '47.171717', 'district');
INSERT INTO `cyx_district` VALUES (724, 715, '0459', '230624', '杜尔伯特蒙古族自治县', '124.442572', '46.862817', 'district');
INSERT INTO `cyx_district` VALUES (725, 650, '0458', '230700', '伊春市', '128.841125', '47.727535', 'city');
INSERT INTO `cyx_district` VALUES (726, 725, '0458', '230702', '伊春区', '128.907257', '47.728237', 'district');
INSERT INTO `cyx_district` VALUES (727, 725, '0458', '230703', '南岔区', '129.283467', '47.138034', 'district');
INSERT INTO `cyx_district` VALUES (728, 725, '0458', '230704', '友好区', '128.836291', '47.841032', 'district');
INSERT INTO `cyx_district` VALUES (729, 725, '0458', '230705', '西林区', '129.312851', '47.480735', 'district');
INSERT INTO `cyx_district` VALUES (730, 725, '0458', '230706', '翠峦区', '128.669754', '47.726394', 'district');
INSERT INTO `cyx_district` VALUES (731, 725, '0458', '230707', '新青区', '129.533599', '48.290455', 'district');
INSERT INTO `cyx_district` VALUES (732, 725, '0458', '230708', '美溪区', '129.129314', '47.63509', 'district');
INSERT INTO `cyx_district` VALUES (733, 725, '0458', '230709', '金山屯区', '129.429117', '47.413074', 'district');
INSERT INTO `cyx_district` VALUES (734, 725, '0458', '230710', '五营区', '129.245343', '48.10791', 'district');
INSERT INTO `cyx_district` VALUES (735, 725, '0458', '230711', '乌马河区', '128.799477', '47.727687', 'district');
INSERT INTO `cyx_district` VALUES (736, 725, '0458', '230712', '汤旺河区', '129.571108', '48.454651', 'district');
INSERT INTO `cyx_district` VALUES (737, 725, '0458', '230713', '带岭区', '129.020888', '47.028379', 'district');
INSERT INTO `cyx_district` VALUES (738, 725, '0458', '230714', '乌伊岭区', '129.43792', '48.590322', 'district');
INSERT INTO `cyx_district` VALUES (739, 725, '0458', '230715', '红星区', '129.390983', '48.239431', 'district');
INSERT INTO `cyx_district` VALUES (740, 725, '0458', '230716', '上甘岭区', '129.02426', '47.974707', 'district');
INSERT INTO `cyx_district` VALUES (741, 725, '0458', '230722', '嘉荫县', '130.403134', '48.888972', 'district');
INSERT INTO `cyx_district` VALUES (742, 725, '0458', '230781', '铁力市', '128.032424', '46.986633', 'district');
INSERT INTO `cyx_district` VALUES (743, 650, '0454', '230800', '佳木斯市', '130.318878', '46.799777', 'city');
INSERT INTO `cyx_district` VALUES (744, 743, '0454', '230803', '向阳区', '130.365346', '46.80779', 'district');
INSERT INTO `cyx_district` VALUES (745, 743, '0454', '230804', '前进区', '130.375062', '46.814102', 'district');
INSERT INTO `cyx_district` VALUES (746, 743, '0454', '230805', '东风区', '130.403664', '46.822571', 'district');
INSERT INTO `cyx_district` VALUES (747, 743, '0454', '230811', '郊区', '130.327194', '46.810085', 'district');
INSERT INTO `cyx_district` VALUES (748, 743, '0454', '230822', '桦南县', '130.553343', '46.239184', 'district');
INSERT INTO `cyx_district` VALUES (749, 743, '0454', '230826', '桦川县', '130.71908', '47.023001', 'district');
INSERT INTO `cyx_district` VALUES (750, 743, '0454', '230828', '汤原县', '129.905072', '46.730706', 'district');
INSERT INTO `cyx_district` VALUES (751, 743, '0454', '230881', '同江市', '132.510919', '47.642707', 'district');
INSERT INTO `cyx_district` VALUES (752, 743, '0454', '230882', '富锦市', '132.037686', '47.250107', 'district');
INSERT INTO `cyx_district` VALUES (753, 743, '0454', '230883', '抚远市', '134.307884', '48.364687', 'district');
INSERT INTO `cyx_district` VALUES (754, 650, '0464', '230900', '七台河市', '131.003082', '45.771396', 'city');
INSERT INTO `cyx_district` VALUES (755, 754, '0464', '230902', '新兴区', '130.932143', '45.81593', 'district');
INSERT INTO `cyx_district` VALUES (756, 754, '0464', '230903', '桃山区', '131.020202', '45.765705', 'district');
INSERT INTO `cyx_district` VALUES (757, 754, '0464', '230904', '茄子河区', '131.068075', '45.785215', 'district');
INSERT INTO `cyx_district` VALUES (758, 754, '0464', '230921', '勃利县', '130.59217', '45.755063', 'district');
INSERT INTO `cyx_district` VALUES (759, 650, '0453', '231000', '牡丹江市', '129.633168', '44.551653', 'city');
INSERT INTO `cyx_district` VALUES (760, 759, '0453', '231002', '东安区', '129.626641', '44.58136', 'district');
INSERT INTO `cyx_district` VALUES (761, 759, '0453', '231003', '阳明区', '129.635615', '44.596104', 'district');
INSERT INTO `cyx_district` VALUES (762, 759, '0453', '231004', '爱民区', '129.591537', '44.596042', 'district');
INSERT INTO `cyx_district` VALUES (763, 759, '0453', '231005', '西安区', '129.616058', '44.577625', 'district');
INSERT INTO `cyx_district` VALUES (764, 759, '0453', '231025', '林口县', '130.284033', '45.278046', 'district');
INSERT INTO `cyx_district` VALUES (765, 759, '0453', '231081', '绥芬河市', '131.152545', '44.412308', 'district');
INSERT INTO `cyx_district` VALUES (766, 759, '0453', '231083', '海林市', '129.380481', '44.594213', 'district');
INSERT INTO `cyx_district` VALUES (767, 759, '0453', '231084', '宁安市', '129.482851', '44.34072', 'district');
INSERT INTO `cyx_district` VALUES (768, 759, '0453', '231085', '穆棱市', '130.524436', '44.918813', 'district');
INSERT INTO `cyx_district` VALUES (769, 759, '0453', '231086', '东宁市', '131.122915', '44.087585', 'district');
INSERT INTO `cyx_district` VALUES (770, 650, '0456', '231100', '黑河市', '127.528293', '50.245129', 'city');
INSERT INTO `cyx_district` VALUES (771, 770, '0456', '231102', '爱辉区', '127.50045', '50.252105', 'district');
INSERT INTO `cyx_district` VALUES (772, 770, '0456', '231121', '嫩江县', '125.221192', '49.185766', 'district');
INSERT INTO `cyx_district` VALUES (773, 770, '0456', '231123', '逊克县', '128.478749', '49.564252', 'district');
INSERT INTO `cyx_district` VALUES (774, 770, '0456', '231124', '孙吴县', '127.336303', '49.425647', 'district');
INSERT INTO `cyx_district` VALUES (775, 770, '0456', '231181', '北安市', '126.490864', '48.241365', 'district');
INSERT INTO `cyx_district` VALUES (776, 770, '0456', '231182', '五大连池市', '126.205516', '48.517257', 'district');
INSERT INTO `cyx_district` VALUES (777, 650, '0455', '231200', '绥化市', '126.968887', '46.653845', 'city');
INSERT INTO `cyx_district` VALUES (778, 777, '0455', '231202', '北林区', '126.985504', '46.6375', 'district');
INSERT INTO `cyx_district` VALUES (779, 777, '0455', '231221', '望奎县', '126.486075', '46.832719', 'district');
INSERT INTO `cyx_district` VALUES (780, 777, '0455', '231222', '兰西县', '126.288117', '46.25245', 'district');
INSERT INTO `cyx_district` VALUES (781, 777, '0455', '231223', '青冈县', '126.099195', '46.70391', 'district');
INSERT INTO `cyx_district` VALUES (782, 777, '0455', '231224', '庆安县', '127.507824', '46.880102', 'district');
INSERT INTO `cyx_district` VALUES (783, 777, '0455', '231225', '明水县', '125.906301', '47.173426', 'district');
INSERT INTO `cyx_district` VALUES (784, 777, '0455', '231226', '绥棱县', '127.114832', '47.236015', 'district');
INSERT INTO `cyx_district` VALUES (785, 777, '0455', '231281', '安达市', '125.346156', '46.419633', 'district');
INSERT INTO `cyx_district` VALUES (786, 777, '0455', '231282', '肇东市', '125.961814', '46.051126', 'district');
INSERT INTO `cyx_district` VALUES (787, 777, '0455', '231283', '海伦市', '126.930106', '47.45117', 'district');
INSERT INTO `cyx_district` VALUES (788, 650, '0457', '232700', '大兴安岭地区', '124.711526', '52.335262', 'city');
INSERT INTO `cyx_district` VALUES (789, 788, '0457', '232701', '加格达奇区', '124.139595', '50.408735', 'district');
INSERT INTO `cyx_district` VALUES (790, 788, '0457', '232721', '呼玛县', '126.652396', '51.726091', 'district');
INSERT INTO `cyx_district` VALUES (791, 788, '0457', '232722', '塔河县', '124.709996', '52.334456', 'district');
INSERT INTO `cyx_district` VALUES (792, 788, '0457', '232723', '漠河县', '122.538591', '52.972272', 'district');
INSERT INTO `cyx_district` VALUES (793, 1, '021', '310000', '上海市', '121.473662', '31.230372', 'province');
INSERT INTO `cyx_district` VALUES (794, 793, '021', '310100', '上海市', '121.473662', '31.230372', 'city');
INSERT INTO `cyx_district` VALUES (795, 794, '021', '310101', '黄浦区', '121.484428', '31.231739', 'district');
INSERT INTO `cyx_district` VALUES (796, 794, '021', '310104', '徐汇区', '121.436128', '31.188464', 'district');
INSERT INTO `cyx_district` VALUES (797, 794, '021', '310105', '长宁区', '121.424622', '31.220372', 'district');
INSERT INTO `cyx_district` VALUES (798, 794, '021', '310106', '静安区', '121.447453', '31.227906', 'district');
INSERT INTO `cyx_district` VALUES (799, 794, '021', '310107', '普陀区', '121.395514', '31.249603', 'district');
INSERT INTO `cyx_district` VALUES (800, 794, '021', '310109', '虹口区', '121.505133', '31.2646', 'district');
INSERT INTO `cyx_district` VALUES (801, 794, '021', '310110', '杨浦区', '121.525727', '31.259822', 'district');
INSERT INTO `cyx_district` VALUES (802, 794, '021', '310112', '闵行区', '121.380831', '31.1129', 'district');
INSERT INTO `cyx_district` VALUES (803, 794, '021', '310113', '宝山区', '121.489612', '31.405457', 'district');
INSERT INTO `cyx_district` VALUES (804, 794, '021', '310114', '嘉定区', '121.265374', '31.375869', 'district');
INSERT INTO `cyx_district` VALUES (805, 794, '021', '310115', '浦东新区', '121.544379', '31.221517', 'district');
INSERT INTO `cyx_district` VALUES (806, 794, '021', '310116', '金山区', '121.342455', '30.741798', 'district');
INSERT INTO `cyx_district` VALUES (807, 794, '021', '310117', '松江区', '121.227747', '31.032243', 'district');
INSERT INTO `cyx_district` VALUES (808, 794, '021', '310118', '青浦区', '121.124178', '31.150681', 'district');
INSERT INTO `cyx_district` VALUES (809, 794, '021', '310120', '奉贤区', '121.474055', '30.917766', 'district');
INSERT INTO `cyx_district` VALUES (810, 794, '021', '310151', '崇明区', '121.397421', '31.623728', 'district');
INSERT INTO `cyx_district` VALUES (811, 1, '0', '320000', '江苏省', '118.762765', '32.060875', 'province');
INSERT INTO `cyx_district` VALUES (812, 811, '025', '320100', '南京市', '118.796682', '32.05957', 'city');
INSERT INTO `cyx_district` VALUES (813, 812, '025', '320102', '玄武区', '118.797757', '32.048498', 'district');
INSERT INTO `cyx_district` VALUES (814, 812, '025', '320104', '秦淮区', '118.79476', '32.039113', 'district');
INSERT INTO `cyx_district` VALUES (815, 812, '025', '320105', '建邺区', '118.731793', '32.003731', 'district');
INSERT INTO `cyx_district` VALUES (816, 812, '025', '320106', '鼓楼区', '118.770182', '32.066601', 'district');
INSERT INTO `cyx_district` VALUES (817, 812, '025', '320111', '浦口区', '118.628003', '32.058903', 'district');
INSERT INTO `cyx_district` VALUES (818, 812, '025', '320113', '栖霞区', '118.909153', '32.096388', 'district');
INSERT INTO `cyx_district` VALUES (819, 812, '025', '320114', '雨花台区', '118.779051', '31.99126', 'district');
INSERT INTO `cyx_district` VALUES (820, 812, '025', '320115', '江宁区', '118.840015', '31.952612', 'district');
INSERT INTO `cyx_district` VALUES (821, 812, '025', '320116', '六合区', '118.822132', '32.323584', 'district');
INSERT INTO `cyx_district` VALUES (822, 812, '025', '320117', '溧水区', '119.028288', '31.651099', 'district');
INSERT INTO `cyx_district` VALUES (823, 812, '025', '320118', '高淳区', '118.89222', '31.327586', 'district');
INSERT INTO `cyx_district` VALUES (824, 811, '0510', '320200', '无锡市', '120.31191', '31.491169', 'city');
INSERT INTO `cyx_district` VALUES (825, 824, '0510', '320205', '锡山区', '120.357858', '31.589715', 'district');
INSERT INTO `cyx_district` VALUES (826, 824, '0510', '320206', '惠山区', '120.298433', '31.680335', 'district');
INSERT INTO `cyx_district` VALUES (827, 824, '0510', '320211', '滨湖区', '120.283811', '31.527276', 'district');
INSERT INTO `cyx_district` VALUES (828, 824, '0510', '320213', '梁溪区', '120.303108', '31.566155', 'district');
INSERT INTO `cyx_district` VALUES (829, 824, '0510', '320214', '新吴区', '120.352782', '31.550966', 'district');
INSERT INTO `cyx_district` VALUES (830, 824, '0510', '320281', '江阴市', '120.286129', '31.921345', 'district');
INSERT INTO `cyx_district` VALUES (831, 824, '0510', '320282', '宜兴市', '119.823308', '31.340637', 'district');
INSERT INTO `cyx_district` VALUES (832, 811, '0516', '320300', '徐州市', '117.284124', '34.205768', 'city');
INSERT INTO `cyx_district` VALUES (833, 832, '0516', '320302', '鼓楼区', '117.185576', '34.288646', 'district');
INSERT INTO `cyx_district` VALUES (834, 832, '0516', '320303', '云龙区', '117.251076', '34.253164', 'district');
INSERT INTO `cyx_district` VALUES (835, 832, '0516', '320305', '贾汪区', '117.464958', '34.436936', 'district');
INSERT INTO `cyx_district` VALUES (836, 832, '0516', '320311', '泉山区', '117.194469', '34.225522', 'district');
INSERT INTO `cyx_district` VALUES (837, 832, '0516', '320312', '铜山区', '117.169461', '34.180779', 'district');
INSERT INTO `cyx_district` VALUES (838, 832, '0516', '320321', '丰县', '116.59539', '34.693906', 'district');
INSERT INTO `cyx_district` VALUES (839, 832, '0516', '320322', '沛县', '116.936353', '34.760761', 'district');
INSERT INTO `cyx_district` VALUES (840, 832, '0516', '320324', '睢宁县', '117.941563', '33.912597', 'district');
INSERT INTO `cyx_district` VALUES (841, 832, '0516', '320381', '新沂市', '118.354537', '34.36958', 'district');
INSERT INTO `cyx_district` VALUES (842, 832, '0516', '320382', '邳州市', '118.012531', '34.338888', 'district');
INSERT INTO `cyx_district` VALUES (843, 811, '0519', '320400', '常州市', '119.974061', '31.811226', 'city');
INSERT INTO `cyx_district` VALUES (844, 843, '0519', '320402', '天宁区', '119.999219', '31.792787', 'district');
INSERT INTO `cyx_district` VALUES (845, 843, '0519', '320404', '钟楼区', '119.902369', '31.802089', 'district');
INSERT INTO `cyx_district` VALUES (846, 843, '0519', '320411', '新北区', '119.971697', '31.830427', 'district');
INSERT INTO `cyx_district` VALUES (847, 843, '0519', '320412', '武进区', '119.942437', '31.701187', 'district');
INSERT INTO `cyx_district` VALUES (848, 843, '0519', '320413', '金坛区', '119.597811', '31.723219', 'district');
INSERT INTO `cyx_district` VALUES (849, 843, '0519', '320481', '溧阳市', '119.48421', '31.416911', 'district');
INSERT INTO `cyx_district` VALUES (850, 811, '0512', '320500', '苏州市', '120.585728', '31.2974', 'city');
INSERT INTO `cyx_district` VALUES (851, 850, '0512', '320505', '虎丘区', '120.434238', '31.329601', 'district');
INSERT INTO `cyx_district` VALUES (852, 850, '0512', '320506', '吴中区', '120.632308', '31.263183', 'district');
INSERT INTO `cyx_district` VALUES (853, 850, '0512', '320507', '相城区', '120.642626', '31.369089', 'district');
INSERT INTO `cyx_district` VALUES (854, 850, '0512', '320508', '姑苏区', '120.617369', '31.33565', 'district');
INSERT INTO `cyx_district` VALUES (855, 850, '0512', '320509', '吴江区', '120.645157', '31.138677', 'district');
INSERT INTO `cyx_district` VALUES (856, 850, '0512', '320581', '常熟市', '120.752481', '31.654375', 'district');
INSERT INTO `cyx_district` VALUES (857, 850, '0512', '320582', '张家港市', '120.555982', '31.875571', 'district');
INSERT INTO `cyx_district` VALUES (858, 850, '0512', '320583', '昆山市', '120.980736', '31.385597', 'district');
INSERT INTO `cyx_district` VALUES (859, 850, '0512', '320585', '太仓市', '121.13055', '31.457735', 'district');
INSERT INTO `cyx_district` VALUES (860, 811, '0513', '320600', '南通市', '120.894676', '31.981143', 'city');
INSERT INTO `cyx_district` VALUES (861, 860, '0513', '320602', '崇川区', '120.857434', '32.009875', 'district');
INSERT INTO `cyx_district` VALUES (862, 860, '0513', '320611', '港闸区', '120.818526', '32.032441', 'district');
INSERT INTO `cyx_district` VALUES (863, 860, '0513', '320612', '通州区', '121.073828', '32.06568', 'district');
INSERT INTO `cyx_district` VALUES (864, 860, '0513', '320621', '海安县', '120.467343', '32.533572', 'district');
INSERT INTO `cyx_district` VALUES (865, 860, '0513', '320623', '如东县', '121.185201', '32.331765', 'district');
INSERT INTO `cyx_district` VALUES (866, 860, '0513', '320681', '启东市', '121.655432', '31.793278', 'district');
INSERT INTO `cyx_district` VALUES (867, 860, '0513', '320682', '如皋市', '120.573803', '32.371562', 'district');
INSERT INTO `cyx_district` VALUES (868, 860, '0513', '320684', '海门市', '121.18181', '31.869483', 'district');
INSERT INTO `cyx_district` VALUES (869, 811, '0518', '320700', '连云港市', '119.221611', '34.596653', 'city');
INSERT INTO `cyx_district` VALUES (870, 869, '0518', '320703', '连云区', '119.338788', '34.760249', 'district');
INSERT INTO `cyx_district` VALUES (871, 869, '0518', '320706', '海州区', '119.163509', '34.572274', 'district');
INSERT INTO `cyx_district` VALUES (872, 869, '0518', '320707', '赣榆区', '119.17333', '34.841348', 'district');
INSERT INTO `cyx_district` VALUES (873, 869, '0518', '320722', '东海县', '118.752842', '34.542308', 'district');
INSERT INTO `cyx_district` VALUES (874, 869, '0518', '320723', '灌云县', '119.239381', '34.284381', 'district');
INSERT INTO `cyx_district` VALUES (875, 869, '0518', '320724', '灌南县', '119.315651', '34.087134', 'district');
INSERT INTO `cyx_district` VALUES (876, 811, '0517', '320800', '淮安市', '119.113185', '33.551052', 'city');
INSERT INTO `cyx_district` VALUES (877, 876, '0517', '320802', '清江浦区', '119.026718', '33.552627', 'district');
INSERT INTO `cyx_district` VALUES (878, 876, '0517', '320803', '淮安区', '119.141099', '33.502868', 'district');
INSERT INTO `cyx_district` VALUES (879, 876, '0517', '320804', '淮阴区', '119.034725', '33.631892', 'district');
INSERT INTO `cyx_district` VALUES (880, 876, '0517', '320813', '洪泽区', '118.873241', '33.294214', 'district');
INSERT INTO `cyx_district` VALUES (881, 876, '0517', '320826', '涟水县', '119.260227', '33.781331', 'district');
INSERT INTO `cyx_district` VALUES (882, 876, '0517', '320830', '盱眙县', '118.54436', '33.011971', 'district');
INSERT INTO `cyx_district` VALUES (883, 876, '0517', '320831', '金湖县', '119.020584', '33.025433', 'district');
INSERT INTO `cyx_district` VALUES (884, 811, '0515', '320900', '盐城市', '120.163107', '33.347708', 'city');
INSERT INTO `cyx_district` VALUES (885, 884, '0515', '320902', '亭湖区', '120.197358', '33.390536', 'district');
INSERT INTO `cyx_district` VALUES (886, 884, '0515', '320903', '盐都区', '120.153712', '33.338283', 'district');
INSERT INTO `cyx_district` VALUES (887, 884, '0515', '320904', '大丰区', '120.50085', '33.200333', 'district');
INSERT INTO `cyx_district` VALUES (888, 884, '0515', '320921', '响水县', '119.578364', '34.199479', 'district');
INSERT INTO `cyx_district` VALUES (889, 884, '0515', '320922', '滨海县', '119.82083', '33.990334', 'district');
INSERT INTO `cyx_district` VALUES (890, 884, '0515', '320923', '阜宁县', '119.802527', '33.759325', 'district');
INSERT INTO `cyx_district` VALUES (891, 884, '0515', '320924', '射阳县', '120.229986', '33.758361', 'district');
INSERT INTO `cyx_district` VALUES (892, 884, '0515', '320925', '建湖县', '119.7886', '33.439067', 'district');
INSERT INTO `cyx_district` VALUES (893, 884, '0515', '320981', '东台市', '120.320328', '32.868426', 'district');
INSERT INTO `cyx_district` VALUES (894, 811, '0514', '321000', '扬州市', '119.412939', '32.394209', 'city');
INSERT INTO `cyx_district` VALUES (895, 894, '0514', '321002', '广陵区', '119.431849', '32.39472', 'district');
INSERT INTO `cyx_district` VALUES (896, 894, '0514', '321003', '邗江区', '119.397994', '32.377655', 'district');
INSERT INTO `cyx_district` VALUES (897, 894, '0514', '321012', '江都区', '119.569989', '32.434672', 'district');
INSERT INTO `cyx_district` VALUES (898, 894, '0514', '321023', '宝应县', '119.360729', '33.240391', 'district');
INSERT INTO `cyx_district` VALUES (899, 894, '0514', '321081', '仪征市', '119.184766', '32.272258', 'district');
INSERT INTO `cyx_district` VALUES (900, 894, '0514', '321084', '高邮市', '119.459161', '32.781659', 'district');
INSERT INTO `cyx_district` VALUES (901, 811, '0511', '321100', '镇江市', '119.425836', '32.187849', 'city');
INSERT INTO `cyx_district` VALUES (902, 901, '0511', '321102', '京口区', '119.47016', '32.19828', 'district');
INSERT INTO `cyx_district` VALUES (903, 901, '0511', '321111', '润州区', '119.411959', '32.195264', 'district');
INSERT INTO `cyx_district` VALUES (904, 901, '0511', '321112', '丹徒区', '119.433853', '32.131962', 'district');
INSERT INTO `cyx_district` VALUES (905, 901, '0511', '321181', '丹阳市', '119.606439', '32.010214', 'district');
INSERT INTO `cyx_district` VALUES (906, 901, '0511', '321182', '扬中市', '119.797634', '32.23483', 'district');
INSERT INTO `cyx_district` VALUES (907, 901, '0511', '321183', '句容市', '119.168695', '31.944998', 'district');
INSERT INTO `cyx_district` VALUES (908, 811, '0523', '321200', '泰州市', '119.922933', '32.455536', 'city');
INSERT INTO `cyx_district` VALUES (909, 908, '0523', '321202', '海陵区', '119.919424', '32.491016', 'district');
INSERT INTO `cyx_district` VALUES (910, 908, '0523', '321203', '高港区', '119.881717', '32.318821', 'district');
INSERT INTO `cyx_district` VALUES (911, 908, '0523', '321204', '姜堰区', '120.127934', '32.509155', 'district');
INSERT INTO `cyx_district` VALUES (912, 908, '0523', '321281', '兴化市', '119.852541', '32.910459', 'district');
INSERT INTO `cyx_district` VALUES (913, 908, '0523', '321282', '靖江市', '120.277138', '31.982751', 'district');
INSERT INTO `cyx_district` VALUES (914, 908, '0523', '321283', '泰兴市', '120.051743', '32.171853', 'district');
INSERT INTO `cyx_district` VALUES (915, 811, '0527', '321300', '宿迁市', '118.275198', '33.963232', 'city');
INSERT INTO `cyx_district` VALUES (916, 915, '0527', '321302', '宿城区', '118.242533', '33.963029', 'district');
INSERT INTO `cyx_district` VALUES (917, 915, '0527', '321311', '宿豫区', '118.330781', '33.946822', 'district');
INSERT INTO `cyx_district` VALUES (918, 915, '0527', '321322', '沭阳县', '118.804784', '34.111022', 'district');
INSERT INTO `cyx_district` VALUES (919, 915, '0527', '321323', '泗阳县', '118.703424', '33.722478', 'district');
INSERT INTO `cyx_district` VALUES (920, 915, '0527', '321324', '泗洪县', '118.223591', '33.476051', 'district');
INSERT INTO `cyx_district` VALUES (921, 1, '0', '330000', '浙江省', '120.152585', '30.266597', 'province');
INSERT INTO `cyx_district` VALUES (922, 921, '0571', '330100', '杭州市', '120.209789', '30.24692', 'city');
INSERT INTO `cyx_district` VALUES (923, 922, '0571', '330102', '上城区', '120.169312', '30.242404', 'district');
INSERT INTO `cyx_district` VALUES (924, 922, '0571', '330103', '下城区', '120.180891', '30.281677', 'district');
INSERT INTO `cyx_district` VALUES (925, 922, '0571', '330104', '江干区', '120.205001', '30.257012', 'district');
INSERT INTO `cyx_district` VALUES (926, 922, '0571', '330105', '拱墅区', '120.141406', '30.319037', 'district');
INSERT INTO `cyx_district` VALUES (927, 922, '0571', '330106', '西湖区', '120.130194', '30.259463', 'district');
INSERT INTO `cyx_district` VALUES (928, 922, '0571', '330108', '滨江区', '120.211623', '30.208847', 'district');
INSERT INTO `cyx_district` VALUES (929, 922, '0571', '330109', '萧山区', '120.264253', '30.183806', 'district');
INSERT INTO `cyx_district` VALUES (930, 922, '0571', '330110', '余杭区', '120.299401', '30.419045', 'district');
INSERT INTO `cyx_district` VALUES (931, 922, '0571', '330111', '富阳区', '119.960076', '30.048692', 'district');
INSERT INTO `cyx_district` VALUES (932, 922, '0571', '330122', '桐庐县', '119.691467', '29.79299', 'district');
INSERT INTO `cyx_district` VALUES (933, 922, '0571', '330127', '淳安县', '119.042037', '29.608886', 'district');
INSERT INTO `cyx_district` VALUES (934, 922, '0571', '330182', '建德市', '119.281231', '29.474759', 'district');
INSERT INTO `cyx_district` VALUES (935, 922, '0571', '330185', '临安市', '119.724734', '30.233873', 'district');
INSERT INTO `cyx_district` VALUES (936, 921, '0574', '330200', '宁波市', '121.622485', '29.859971', 'city');
INSERT INTO `cyx_district` VALUES (937, 936, '0574', '330203', '海曙区', '121.550752', '29.874903', 'district');
INSERT INTO `cyx_district` VALUES (938, 936, '0574', '330205', '江北区', '121.555081', '29.886781', 'district');
INSERT INTO `cyx_district` VALUES (939, 936, '0574', '330206', '北仑区', '121.844172', '29.899778', 'district');
INSERT INTO `cyx_district` VALUES (940, 936, '0574', '330211', '镇海区', '121.596496', '29.965203', 'district');
INSERT INTO `cyx_district` VALUES (941, 936, '0574', '330212', '鄞州区', '121.546603', '29.816511', 'district');
INSERT INTO `cyx_district` VALUES (942, 936, '0574', '330225', '象山县', '121.869339', '29.476705', 'district');
INSERT INTO `cyx_district` VALUES (943, 936, '0574', '330226', '宁海县', '121.429477', '29.287939', 'district');
INSERT INTO `cyx_district` VALUES (944, 936, '0574', '330281', '余姚市', '121.154629', '30.037106', 'district');
INSERT INTO `cyx_district` VALUES (945, 936, '0574', '330282', '慈溪市', '121.266561', '30.170261', 'district');
INSERT INTO `cyx_district` VALUES (946, 936, '0574', '330283', '奉化区', '121.406997', '29.655144', 'district');
INSERT INTO `cyx_district` VALUES (947, 921, '0577', '330300', '温州市', '120.699361', '27.993828', 'city');
INSERT INTO `cyx_district` VALUES (948, 947, '0577', '330302', '鹿城区', '120.655271', '28.015737', 'district');
INSERT INTO `cyx_district` VALUES (949, 947, '0577', '330303', '龙湾区', '120.811213', '27.932747', 'district');
INSERT INTO `cyx_district` VALUES (950, 947, '0577', '330304', '瓯海区', '120.61491', '27.966844', 'district');
INSERT INTO `cyx_district` VALUES (951, 947, '0577', '330305', '洞头区', '121.157249', '27.836154', 'district');
INSERT INTO `cyx_district` VALUES (952, 947, '0577', '330324', '永嘉县', '120.692025', '28.153607', 'district');
INSERT INTO `cyx_district` VALUES (953, 947, '0577', '330326', '平阳县', '120.565793', '27.661918', 'district');
INSERT INTO `cyx_district` VALUES (954, 947, '0577', '330327', '苍南县', '120.427619', '27.519773', 'district');
INSERT INTO `cyx_district` VALUES (955, 947, '0577', '330328', '文成县', '120.091498', '27.786996', 'district');
INSERT INTO `cyx_district` VALUES (956, 947, '0577', '330329', '泰顺县', '119.717649', '27.556884', 'district');
INSERT INTO `cyx_district` VALUES (957, 947, '0577', '330381', '瑞安市', '120.655148', '27.778657', 'district');
INSERT INTO `cyx_district` VALUES (958, 947, '0577', '330382', '乐清市', '120.983906', '28.113725', 'district');
INSERT INTO `cyx_district` VALUES (959, 921, '0573', '330400', '嘉兴市', '120.75547', '30.746191', 'city');
INSERT INTO `cyx_district` VALUES (960, 959, '0573', '330402', '南湖区', '120.783024', '30.747842', 'district');
INSERT INTO `cyx_district` VALUES (961, 959, '0573', '330411', '秀洲区', '120.710082', '30.765188', 'district');
INSERT INTO `cyx_district` VALUES (962, 959, '0573', '330421', '嘉善县', '120.926028', '30.830864', 'district');
INSERT INTO `cyx_district` VALUES (963, 959, '0573', '330424', '海盐县', '120.946263', '30.526435', 'district');
INSERT INTO `cyx_district` VALUES (964, 959, '0573', '330481', '海宁市', '120.680239', '30.511539', 'district');
INSERT INTO `cyx_district` VALUES (965, 959, '0573', '330482', '平湖市', '121.015142', '30.677233', 'district');
INSERT INTO `cyx_district` VALUES (966, 959, '0573', '330483', '桐乡市', '120.565098', '30.630173', 'district');
INSERT INTO `cyx_district` VALUES (967, 921, '0572', '330500', '湖州市', '120.086809', '30.89441', 'city');
INSERT INTO `cyx_district` VALUES (968, 967, '0572', '330502', '吴兴区', '120.185838', '30.857151', 'district');
INSERT INTO `cyx_district` VALUES (969, 967, '0572', '330503', '南浔区', '120.418513', '30.849689', 'district');
INSERT INTO `cyx_district` VALUES (970, 967, '0572', '330521', '德清县', '119.9774', '30.54251', 'district');
INSERT INTO `cyx_district` VALUES (971, 967, '0572', '330522', '长兴县', '119.910952', '31.026665', 'district');
INSERT INTO `cyx_district` VALUES (972, 967, '0572', '330523', '安吉县', '119.680353', '30.638674', 'district');
INSERT INTO `cyx_district` VALUES (973, 921, '0575', '330600', '绍兴市', '120.580364', '30.030192', 'city');
INSERT INTO `cyx_district` VALUES (974, 973, '0575', '330602', '越城区', '120.582633', '29.988244', 'district');
INSERT INTO `cyx_district` VALUES (975, 973, '0575', '330603', '柯桥区', '120.495085', '30.081929', 'district');
INSERT INTO `cyx_district` VALUES (976, 973, '0575', '330604', '上虞区', '120.868122', '30.03312', 'district');
INSERT INTO `cyx_district` VALUES (977, 973, '0575', '330624', '新昌县', '120.903866', '29.499831', 'district');
INSERT INTO `cyx_district` VALUES (978, 973, '0575', '330681', '诸暨市', '120.246863', '29.708692', 'district');
INSERT INTO `cyx_district` VALUES (979, 973, '0575', '330683', '嵊州市', '120.831025', '29.56141', 'district');
INSERT INTO `cyx_district` VALUES (980, 921, '0579', '330700', '金华市', '119.647229', '29.079208', 'city');
INSERT INTO `cyx_district` VALUES (981, 980, '0579', '330702', '婺城区', '119.571728', '29.0872', 'district');
INSERT INTO `cyx_district` VALUES (982, 980, '0579', '330703', '金东区', '119.69278', '29.099723', 'district');
INSERT INTO `cyx_district` VALUES (983, 980, '0579', '330723', '武义县', '119.816562', '28.89267', 'district');
INSERT INTO `cyx_district` VALUES (984, 980, '0579', '330726', '浦江县', '119.892222', '29.452476', 'district');
INSERT INTO `cyx_district` VALUES (985, 980, '0579', '330727', '磐安县', '120.450005', '29.054548', 'district');
INSERT INTO `cyx_district` VALUES (986, 980, '0579', '330781', '兰溪市', '119.460472', '29.2084', 'district');
INSERT INTO `cyx_district` VALUES (987, 980, '0579', '330782', '义乌市', '120.075106', '29.306775', 'district');
INSERT INTO `cyx_district` VALUES (988, 980, '0579', '330783', '东阳市', '120.241566', '29.289648', 'district');
INSERT INTO `cyx_district` VALUES (989, 980, '0579', '330784', '永康市', '120.047651', '28.888555', 'district');
INSERT INTO `cyx_district` VALUES (990, 921, '0570', '330800', '衢州市', '118.859457', '28.970079', 'city');
INSERT INTO `cyx_district` VALUES (991, 990, '0570', '330802', '柯城区', '118.871516', '28.96862', 'district');
INSERT INTO `cyx_district` VALUES (992, 990, '0570', '330803', '衢江区', '118.95946', '28.97978', 'district');
INSERT INTO `cyx_district` VALUES (993, 990, '0570', '330822', '常山县', '118.511235', '28.901462', 'district');
INSERT INTO `cyx_district` VALUES (994, 990, '0570', '330824', '开化县', '118.415495', '29.137336', 'district');
INSERT INTO `cyx_district` VALUES (995, 990, '0570', '330825', '龙游县', '119.172189', '29.028439', 'district');
INSERT INTO `cyx_district` VALUES (996, 990, '0570', '330881', '江山市', '118.626991', '28.737331', 'district');
INSERT INTO `cyx_district` VALUES (997, 921, '0580', '330900', '舟山市', '122.207106', '29.985553', 'city');
INSERT INTO `cyx_district` VALUES (998, 997, '0580', '330902', '定海区', '122.106773', '30.019858', 'district');
INSERT INTO `cyx_district` VALUES (999, 997, '0580', '330903', '普陀区', '122.323867', '29.97176', 'district');
INSERT INTO `cyx_district` VALUES (1000, 997, '0580', '330921', '岱山县', '122.226237', '30.264139', 'district');
INSERT INTO `cyx_district` VALUES (1001, 997, '0580', '330922', '嵊泗县', '122.451382', '30.725686', 'district');
INSERT INTO `cyx_district` VALUES (1002, 921, '0576', '331000', '台州市', '121.42076', '28.65638', 'city');
INSERT INTO `cyx_district` VALUES (1003, 1002, '0576', '331002', '椒江区', '121.442978', '28.672981', 'district');
INSERT INTO `cyx_district` VALUES (1004, 1002, '0576', '331003', '黄岩区', '121.261972', '28.650083', 'district');
INSERT INTO `cyx_district` VALUES (1005, 1002, '0576', '331004', '路桥区', '121.365123', '28.582654', 'district');
INSERT INTO `cyx_district` VALUES (1006, 1002, '0576', '331021', '玉环县', '121.231805', '28.135929', 'district');
INSERT INTO `cyx_district` VALUES (1007, 1002, '0576', '331022', '三门县', '121.395711', '29.104789', 'district');
INSERT INTO `cyx_district` VALUES (1008, 1002, '0576', '331023', '天台县', '121.006595', '29.144064', 'district');
INSERT INTO `cyx_district` VALUES (1009, 1002, '0576', '331024', '仙居县', '120.728801', '28.846966', 'district');
INSERT INTO `cyx_district` VALUES (1010, 1002, '0576', '331081', '温岭市', '121.385604', '28.372506', 'district');
INSERT INTO `cyx_district` VALUES (1011, 1002, '0576', '331082', '临海市', '121.144556', '28.858881', 'district');
INSERT INTO `cyx_district` VALUES (1012, 921, '0578', '331100', '丽水市', '119.922796', '28.46763', 'city');
INSERT INTO `cyx_district` VALUES (1013, 1012, '0578', '331102', '莲都区', '119.912626', '28.445928', 'district');
INSERT INTO `cyx_district` VALUES (1014, 1012, '0578', '331121', '青田县', '120.289478', '28.139837', 'district');
INSERT INTO `cyx_district` VALUES (1015, 1012, '0578', '331122', '缙云县', '120.091572', '28.659283', 'district');
INSERT INTO `cyx_district` VALUES (1016, 1012, '0578', '331123', '遂昌县', '119.276103', '28.592148', 'district');
INSERT INTO `cyx_district` VALUES (1017, 1012, '0578', '331124', '松阳县', '119.481511', '28.448803', 'district');
INSERT INTO `cyx_district` VALUES (1018, 1012, '0578', '331125', '云和县', '119.573397', '28.11579', 'district');
INSERT INTO `cyx_district` VALUES (1019, 1012, '0578', '331126', '庆元县', '119.06259', '27.61922', 'district');
INSERT INTO `cyx_district` VALUES (1020, 1012, '0578', '331127', '景宁畲族自治县', '119.635739', '27.9733', 'district');
INSERT INTO `cyx_district` VALUES (1021, 1012, '0578', '331181', '龙泉市', '119.141473', '28.074649', 'district');
INSERT INTO `cyx_district` VALUES (1022, 1, '0', '340000', '安徽省', '117.329949', '31.733806', 'province');
INSERT INTO `cyx_district` VALUES (1023, 1022, '0551', '340100', '合肥市', '117.227219', '31.820591', 'city');
INSERT INTO `cyx_district` VALUES (1024, 1023, '0551', '340102', '瑶海区', '117.309546', '31.857917', 'district');
INSERT INTO `cyx_district` VALUES (1025, 1023, '0551', '340103', '庐阳区', '117.264786', '31.878589', 'district');
INSERT INTO `cyx_district` VALUES (1026, 1023, '0551', '340104', '蜀山区', '117.260521', '31.85124', 'district');
INSERT INTO `cyx_district` VALUES (1027, 1023, '0551', '340111', '包河区', '117.309519', '31.793859', 'district');
INSERT INTO `cyx_district` VALUES (1028, 1023, '0551', '340121', '长丰县', '117.167564', '32.478018', 'district');
INSERT INTO `cyx_district` VALUES (1029, 1023, '0551', '340122', '肥东县', '117.469382', '31.88794', 'district');
INSERT INTO `cyx_district` VALUES (1030, 1023, '0551', '340123', '肥西县', '117.157981', '31.706809', 'district');
INSERT INTO `cyx_district` VALUES (1031, 1023, '0551', '340124', '庐江县', '117.2882', '31.256524', 'district');
INSERT INTO `cyx_district` VALUES (1032, 1023, '0551', '340181', '巢湖市', '117.890354', '31.624522', 'district');
INSERT INTO `cyx_district` VALUES (1033, 1022, '0553', '340200', '芜湖市', '118.432941', '31.352859', 'city');
INSERT INTO `cyx_district` VALUES (1034, 1033, '0553', '340202', '镜湖区', '118.385009', '31.340728', 'district');
INSERT INTO `cyx_district` VALUES (1035, 1033, '0553', '340203', '弋江区', '118.372655', '31.311756', 'district');
INSERT INTO `cyx_district` VALUES (1036, 1033, '0553', '340207', '鸠江区', '118.391734', '31.369373', 'district');
INSERT INTO `cyx_district` VALUES (1037, 1033, '0553', '340208', '三山区', '118.268101', '31.219568', 'district');
INSERT INTO `cyx_district` VALUES (1038, 1033, '0553', '340221', '芜湖县', '118.576124', '31.134809', 'district');
INSERT INTO `cyx_district` VALUES (1039, 1033, '0553', '340222', '繁昌县', '118.198703', '31.101782', 'district');
INSERT INTO `cyx_district` VALUES (1040, 1033, '0553', '340223', '南陵县', '118.334359', '30.914922', 'district');
INSERT INTO `cyx_district` VALUES (1041, 1033, '0553', '340225', '无为县', '117.902366', '31.303167', 'district');
INSERT INTO `cyx_district` VALUES (1042, 1022, '0552', '340300', '蚌埠市', '117.388512', '32.91663', 'city');
INSERT INTO `cyx_district` VALUES (1043, 1042, '0552', '340302', '龙子湖区', '117.379778', '32.950611', 'district');
INSERT INTO `cyx_district` VALUES (1044, 1042, '0552', '340303', '蚌山区', '117.373595', '32.917048', 'district');
INSERT INTO `cyx_district` VALUES (1045, 1042, '0552', '340304', '禹会区', '117.342155', '32.929799', 'district');
INSERT INTO `cyx_district` VALUES (1046, 1042, '0552', '340311', '淮上区', '117.35933', '32.965435', 'district');
INSERT INTO `cyx_district` VALUES (1047, 1042, '0552', '340321', '怀远县', '117.205237', '32.970031', 'district');
INSERT INTO `cyx_district` VALUES (1048, 1042, '0552', '340322', '五河县', '117.879486', '33.127823', 'district');
INSERT INTO `cyx_district` VALUES (1049, 1042, '0552', '340323', '固镇县', '117.316913', '33.31688', 'district');
INSERT INTO `cyx_district` VALUES (1050, 1022, '0554', '340400', '淮南市', '117.018399', '32.587117', 'city');
INSERT INTO `cyx_district` VALUES (1051, 1050, '0554', '340402', '大通区', '117.053314', '32.631519', 'district');
INSERT INTO `cyx_district` VALUES (1052, 1050, '0554', '340403', '田家庵区', '117.017349', '32.647277', 'district');
INSERT INTO `cyx_district` VALUES (1053, 1050, '0554', '340404', '谢家集区', '116.859188', '32.600037', 'district');
INSERT INTO `cyx_district` VALUES (1054, 1050, '0554', '340405', '八公山区', '116.83349', '32.631379', 'district');
INSERT INTO `cyx_district` VALUES (1055, 1050, '0554', '340406', '潘集区', '116.834715', '32.77208', 'district');
INSERT INTO `cyx_district` VALUES (1056, 1050, '0554', '340421', '凤台县', '116.71105', '32.709444', 'district');
INSERT INTO `cyx_district` VALUES (1057, 1050, '0554', '340422', '寿县', '116.798232', '32.545109', 'district');
INSERT INTO `cyx_district` VALUES (1058, 1022, '0555', '340500', '马鞍山市', '118.507011', '31.67044', 'city');
INSERT INTO `cyx_district` VALUES (1059, 1058, '0555', '340503', '花山区', '118.492565', '31.71971', 'district');
INSERT INTO `cyx_district` VALUES (1060, 1058, '0555', '340504', '雨山区', '118.498578', '31.682132', 'district');
INSERT INTO `cyx_district` VALUES (1061, 1058, '0555', '340506', '博望区', '118.844538', '31.558471', 'district');
INSERT INTO `cyx_district` VALUES (1062, 1058, '0555', '340521', '当涂县', '118.497972', '31.571213', 'district');
INSERT INTO `cyx_district` VALUES (1063, 1058, '0555', '340522', '含山县', '118.101421', '31.735598', 'district');
INSERT INTO `cyx_district` VALUES (1064, 1058, '0555', '340523', '和县', '118.353667', '31.742293', 'district');
INSERT INTO `cyx_district` VALUES (1065, 1022, '0561', '340600', '淮北市', '116.798265', '33.955844', 'city');
INSERT INTO `cyx_district` VALUES (1066, 1065, '0561', '340602', '杜集区', '116.828133', '33.991451', 'district');
INSERT INTO `cyx_district` VALUES (1067, 1065, '0561', '340603', '相山区', '116.794344', '33.959892', 'district');
INSERT INTO `cyx_district` VALUES (1068, 1065, '0561', '340604', '烈山区', '116.813042', '33.895139', 'district');
INSERT INTO `cyx_district` VALUES (1069, 1065, '0561', '340621', '濉溪县', '116.766298', '33.915477', 'district');
INSERT INTO `cyx_district` VALUES (1070, 1022, '0562', '340700', '铜陵市', '117.81154', '30.945515', 'city');
INSERT INTO `cyx_district` VALUES (1071, 1070, '0562', '340705', '铜官区', '117.85616', '30.936272', 'district');
INSERT INTO `cyx_district` VALUES (1072, 1070, '0562', '340706', '义安区', '117.791544', '30.952823', 'district');
INSERT INTO `cyx_district` VALUES (1073, 1070, '0562', '340711', '郊区', '117.768026', '30.821069', 'district');
INSERT INTO `cyx_district` VALUES (1074, 1070, '0562', '340722', '枞阳县', '117.250594', '30.706018', 'district');
INSERT INTO `cyx_district` VALUES (1075, 1022, '0556', '340800', '安庆市', '117.115101', '30.531919', 'city');
INSERT INTO `cyx_district` VALUES (1076, 1075, '0556', '340802', '迎江区', '117.09115', '30.511548', 'district');
INSERT INTO `cyx_district` VALUES (1077, 1075, '0556', '340803', '大观区', '117.013469', '30.553697', 'district');
INSERT INTO `cyx_district` VALUES (1078, 1075, '0556', '340811', '宜秀区', '116.987542', '30.613332', 'district');
INSERT INTO `cyx_district` VALUES (1079, 1075, '0556', '340822', '怀宁县', '116.829475', '30.733824', 'district');
INSERT INTO `cyx_district` VALUES (1080, 1075, '0556', '340824', '潜山县', '116.581371', '30.631136', 'district');
INSERT INTO `cyx_district` VALUES (1081, 1075, '0556', '340825', '太湖县', '116.308795', '30.45422', 'district');
INSERT INTO `cyx_district` VALUES (1082, 1075, '0556', '340826', '宿松县', '116.129105', '30.153746', 'district');
INSERT INTO `cyx_district` VALUES (1083, 1075, '0556', '340827', '望江县', '116.706498', '30.128002', 'district');
INSERT INTO `cyx_district` VALUES (1084, 1075, '0556', '340828', '岳西县', '116.359692', '30.849762', 'district');
INSERT INTO `cyx_district` VALUES (1085, 1075, '0556', '340881', '桐城市', '116.936748', '31.035848', 'district');
INSERT INTO `cyx_district` VALUES (1086, 1022, '0559', '341000', '黄山市', '118.338272', '29.715185', 'city');
INSERT INTO `cyx_district` VALUES (1087, 1086, '0559', '341002', '屯溪区', '118.315329', '29.696108', 'district');
INSERT INTO `cyx_district` VALUES (1088, 1086, '0559', '341003', '黄山区', '118.141567', '30.272942', 'district');
INSERT INTO `cyx_district` VALUES (1089, 1086, '0559', '341004', '徽州区', '118.336743', '29.827271', 'district');
INSERT INTO `cyx_district` VALUES (1090, 1086, '0559', '341021', '歙县', '118.415345', '29.861379', 'district');
INSERT INTO `cyx_district` VALUES (1091, 1086, '0559', '341022', '休宁县', '118.193618', '29.784124', 'district');
INSERT INTO `cyx_district` VALUES (1092, 1086, '0559', '341023', '黟县', '117.938373', '29.924805', 'district');
INSERT INTO `cyx_district` VALUES (1093, 1086, '0559', '341024', '祁门县', '117.717396', '29.854055', 'district');
INSERT INTO `cyx_district` VALUES (1094, 1022, '0550', '341100', '滁州市', '118.327944', '32.255636', 'city');
INSERT INTO `cyx_district` VALUES (1095, 1094, '0550', '341102', '琅琊区', '118.305961', '32.294631', 'district');
INSERT INTO `cyx_district` VALUES (1096, 1094, '0550', '341103', '南谯区', '118.41697', '32.200197', 'district');
INSERT INTO `cyx_district` VALUES (1097, 1094, '0550', '341122', '来安县', '118.435718', '32.452199', 'district');
INSERT INTO `cyx_district` VALUES (1098, 1094, '0550', '341124', '全椒县', '118.274149', '32.08593', 'district');
INSERT INTO `cyx_district` VALUES (1099, 1094, '0550', '341125', '定远县', '117.698562', '32.530981', 'district');
INSERT INTO `cyx_district` VALUES (1100, 1094, '0550', '341126', '凤阳县', '117.531622', '32.874735', 'district');
INSERT INTO `cyx_district` VALUES (1101, 1094, '0550', '341181', '天长市', '119.004816', '32.667571', 'district');
INSERT INTO `cyx_district` VALUES (1102, 1094, '0550', '341182', '明光市', '118.018193', '32.78196', 'district');
INSERT INTO `cyx_district` VALUES (1103, 1022, '1558', '341200', '阜阳市', '115.814504', '32.890479', 'city');
INSERT INTO `cyx_district` VALUES (1104, 1103, '1558', '341202', '颍州区', '115.806942', '32.883468', 'district');
INSERT INTO `cyx_district` VALUES (1105, 1103, '1558', '341203', '颍东区', '115.856762', '32.912477', 'district');
INSERT INTO `cyx_district` VALUES (1106, 1103, '1558', '341204', '颍泉区', '115.80835', '32.925211', 'district');
INSERT INTO `cyx_district` VALUES (1107, 1103, '1558', '341221', '临泉县', '115.263115', '33.039715', 'district');
INSERT INTO `cyx_district` VALUES (1108, 1103, '1558', '341222', '太和县', '115.621941', '33.160327', 'district');
INSERT INTO `cyx_district` VALUES (1109, 1103, '1558', '341225', '阜南县', '115.595643', '32.658297', 'district');
INSERT INTO `cyx_district` VALUES (1110, 1103, '1558', '341226', '颍上县', '116.256772', '32.653211', 'district');
INSERT INTO `cyx_district` VALUES (1111, 1103, '1558', '341282', '界首市', '115.374821', '33.258244', 'district');
INSERT INTO `cyx_district` VALUES (1112, 1022, '0557', '341300', '宿州市', '116.964195', '33.647309', 'city');
INSERT INTO `cyx_district` VALUES (1113, 1112, '0557', '341302', '埇桥区', '116.977203', '33.64059', 'district');
INSERT INTO `cyx_district` VALUES (1114, 1112, '0557', '341321', '砀山县', '116.367095', '34.442561', 'district');
INSERT INTO `cyx_district` VALUES (1115, 1112, '0557', '341322', '萧县', '116.947349', '34.188732', 'district');
INSERT INTO `cyx_district` VALUES (1116, 1112, '0557', '341323', '灵璧县', '117.549395', '33.554604', 'district');
INSERT INTO `cyx_district` VALUES (1117, 1112, '0557', '341324', '泗县', '117.910629', '33.482982', 'district');
INSERT INTO `cyx_district` VALUES (1118, 1022, '0564', '341500', '六安市', '116.520139', '31.735456', 'city');
INSERT INTO `cyx_district` VALUES (1119, 1118, '0564', '341502', '金安区', '116.539173', '31.750119', 'district');
INSERT INTO `cyx_district` VALUES (1120, 1118, '0564', '341503', '裕安区', '116.479829', '31.738183', 'district');
INSERT INTO `cyx_district` VALUES (1121, 1118, '0564', '341504', '叶集区', '115.925271', '31.863693', 'district');
INSERT INTO `cyx_district` VALUES (1122, 1118, '0564', '341522', '霍邱县', '116.277911', '32.353038', 'district');
INSERT INTO `cyx_district` VALUES (1123, 1118, '0564', '341523', '舒城县', '116.948736', '31.462234', 'district');
INSERT INTO `cyx_district` VALUES (1124, 1118, '0564', '341524', '金寨县', '115.934366', '31.72717', 'district');
INSERT INTO `cyx_district` VALUES (1125, 1118, '0564', '341525', '霍山县', '116.351892', '31.410561', 'district');
INSERT INTO `cyx_district` VALUES (1126, 1022, '0558', '341600', '亳州市', '115.77867', '33.844592', 'city');
INSERT INTO `cyx_district` VALUES (1127, 1126, '0558', '341602', '谯城区', '115.779025', '33.876235', 'district');
INSERT INTO `cyx_district` VALUES (1128, 1126, '0558', '341621', '涡阳县', '116.215665', '33.492921', 'district');
INSERT INTO `cyx_district` VALUES (1129, 1126, '0558', '341622', '蒙城县', '116.564247', '33.26583', 'district');
INSERT INTO `cyx_district` VALUES (1130, 1126, '0558', '341623', '利辛县', '116.208564', '33.144515', 'district');
INSERT INTO `cyx_district` VALUES (1131, 1022, '0566', '341700', '池州市', '117.491592', '30.664779', 'city');
INSERT INTO `cyx_district` VALUES (1132, 1131, '0566', '341702', '贵池区', '117.567264', '30.687219', 'district');
INSERT INTO `cyx_district` VALUES (1133, 1131, '0566', '341721', '东至县', '117.027618', '30.111163', 'district');
INSERT INTO `cyx_district` VALUES (1134, 1131, '0566', '341722', '石台县', '117.486306', '30.210313', 'district');
INSERT INTO `cyx_district` VALUES (1135, 1131, '0566', '341723', '青阳县', '117.84743', '30.63923', 'district');
INSERT INTO `cyx_district` VALUES (1136, 1022, '0563', '341800', '宣城市', '118.75868', '30.940195', 'city');
INSERT INTO `cyx_district` VALUES (1137, 1136, '0563', '341802', '宣州区', '118.785561', '30.944076', 'district');
INSERT INTO `cyx_district` VALUES (1138, 1136, '0563', '341821', '郎溪县', '119.179656', '31.126412', 'district');
INSERT INTO `cyx_district` VALUES (1139, 1136, '0563', '341822', '广德县', '119.420935', '30.877555', 'district');
INSERT INTO `cyx_district` VALUES (1140, 1136, '0563', '341823', '泾县', '118.419859', '30.688634', 'district');
INSERT INTO `cyx_district` VALUES (1141, 1136, '0563', '341824', '绩溪县', '118.578519', '30.067533', 'district');
INSERT INTO `cyx_district` VALUES (1142, 1136, '0563', '341825', '旌德县', '118.549861', '30.298142', 'district');
INSERT INTO `cyx_district` VALUES (1143, 1136, '0563', '341881', '宁国市', '118.983171', '30.633882', 'district');
INSERT INTO `cyx_district` VALUES (1144, 1, '0', '350000', '福建省', '119.295143', '26.100779', 'province');
INSERT INTO `cyx_district` VALUES (1145, 1144, '0591', '350100', '福州市', '119.296389', '26.074268', 'city');
INSERT INTO `cyx_district` VALUES (1146, 1145, '0591', '350102', '鼓楼区', '119.303917', '26.081983', 'district');
INSERT INTO `cyx_district` VALUES (1147, 1145, '0591', '350103', '台江区', '119.314041', '26.052843', 'district');
INSERT INTO `cyx_district` VALUES (1148, 1145, '0591', '350104', '仓山区', '119.273545', '26.046743', 'district');
INSERT INTO `cyx_district` VALUES (1149, 1145, '0591', '350105', '马尾区', '119.455588', '25.9895', 'district');
INSERT INTO `cyx_district` VALUES (1150, 1145, '0591', '350111', '晋安区', '119.328521', '26.082107', 'district');
INSERT INTO `cyx_district` VALUES (1151, 1145, '0591', '350121', '闽侯县', '119.131724', '26.150047', 'district');
INSERT INTO `cyx_district` VALUES (1152, 1145, '0591', '350122', '连江县', '119.539704', '26.197364', 'district');
INSERT INTO `cyx_district` VALUES (1153, 1145, '0591', '350123', '罗源县', '119.549776', '26.489558', 'district');
INSERT INTO `cyx_district` VALUES (1154, 1145, '0591', '350124', '闽清县', '118.863361', '26.221197', 'district');
INSERT INTO `cyx_district` VALUES (1155, 1145, '0591', '350125', '永泰县', '118.932592', '25.866694', 'district');
INSERT INTO `cyx_district` VALUES (1156, 1145, '0591', '350128', '平潭县', '119.790168', '25.49872', 'district');
INSERT INTO `cyx_district` VALUES (1157, 1145, '0591', '350181', '福清市', '119.384201', '25.72071', 'district');
INSERT INTO `cyx_district` VALUES (1158, 1145, '0591', '350182', '长乐市', '119.523266', '25.962888', 'district');
INSERT INTO `cyx_district` VALUES (1159, 1144, '0592', '350200', '厦门市', '118.089204', '24.479664', 'city');
INSERT INTO `cyx_district` VALUES (1160, 1159, '0592', '350203', '思明区', '118.082649', '24.445484', 'district');
INSERT INTO `cyx_district` VALUES (1161, 1159, '0592', '350205', '海沧区', '118.032984', '24.484685', 'district');
INSERT INTO `cyx_district` VALUES (1162, 1159, '0592', '350206', '湖里区', '118.146768', '24.512904', 'district');
INSERT INTO `cyx_district` VALUES (1163, 1159, '0592', '350211', '集美区', '118.097337', '24.575969', 'district');
INSERT INTO `cyx_district` VALUES (1164, 1159, '0592', '350212', '同安区', '118.152041', '24.723234', 'district');
INSERT INTO `cyx_district` VALUES (1165, 1159, '0592', '350213', '翔安区', '118.248034', '24.618543', 'district');
INSERT INTO `cyx_district` VALUES (1166, 1144, '0594', '350300', '莆田市', '119.007777', '25.454084', 'city');
INSERT INTO `cyx_district` VALUES (1167, 1166, '0594', '350302', '城厢区', '118.993884', '25.419319', 'district');
INSERT INTO `cyx_district` VALUES (1168, 1166, '0594', '350303', '涵江区', '119.116289', '25.45872', 'district');
INSERT INTO `cyx_district` VALUES (1169, 1166, '0594', '350304', '荔城区', '119.015061', '25.431941', 'district');
INSERT INTO `cyx_district` VALUES (1170, 1166, '0594', '350305', '秀屿区', '119.105494', '25.31836', 'district');
INSERT INTO `cyx_district` VALUES (1171, 1166, '0594', '350322', '仙游县', '118.691637', '25.362093', 'district');
INSERT INTO `cyx_district` VALUES (1172, 1144, '0598', '350400', '三明市', '117.638678', '26.263406', 'city');
INSERT INTO `cyx_district` VALUES (1173, 1172, '0598', '350402', '梅列区', '117.645855', '26.271711', 'district');
INSERT INTO `cyx_district` VALUES (1174, 1172, '0598', '350403', '三元区', '117.608044', '26.234019', 'district');
INSERT INTO `cyx_district` VALUES (1175, 1172, '0598', '350421', '明溪县', '117.202226', '26.355856', 'district');
INSERT INTO `cyx_district` VALUES (1176, 1172, '0598', '350423', '清流县', '116.816909', '26.177796', 'district');
INSERT INTO `cyx_district` VALUES (1177, 1172, '0598', '350424', '宁化县', '116.654365', '26.261754', 'district');
INSERT INTO `cyx_district` VALUES (1178, 1172, '0598', '350425', '大田县', '117.847115', '25.692699', 'district');
INSERT INTO `cyx_district` VALUES (1179, 1172, '0598', '350426', '尤溪县', '118.190467', '26.170171', 'district');
INSERT INTO `cyx_district` VALUES (1180, 1172, '0598', '350427', '沙县', '117.792396', '26.397199', 'district');
INSERT INTO `cyx_district` VALUES (1181, 1172, '0598', '350428', '将乐县', '117.471372', '26.728952', 'district');
INSERT INTO `cyx_district` VALUES (1182, 1172, '0598', '350429', '泰宁县', '117.17574', '26.900259', 'district');
INSERT INTO `cyx_district` VALUES (1183, 1172, '0598', '350430', '建宁县', '116.848443', '26.833588', 'district');
INSERT INTO `cyx_district` VALUES (1184, 1172, '0598', '350481', '永安市', '117.365052', '25.941937', 'district');
INSERT INTO `cyx_district` VALUES (1185, 1144, '0595', '350500', '泉州市', '118.675676', '24.874132', 'city');
INSERT INTO `cyx_district` VALUES (1186, 1185, '0595', '350502', '鲤城区', '118.587097', '24.907424', 'district');
INSERT INTO `cyx_district` VALUES (1187, 1185, '0595', '350503', '丰泽区', '118.613172', '24.891173', 'district');
INSERT INTO `cyx_district` VALUES (1188, 1185, '0595', '350504', '洛江区', '118.671193', '24.939796', 'district');
INSERT INTO `cyx_district` VALUES (1189, 1185, '0595', '350505', '泉港区', '118.916309', '25.119815', 'district');
INSERT INTO `cyx_district` VALUES (1190, 1185, '0595', '350521', '惠安县', '118.796607', '25.030801', 'district');
INSERT INTO `cyx_district` VALUES (1191, 1185, '0595', '350524', '安溪县', '118.186288', '25.055954', 'district');
INSERT INTO `cyx_district` VALUES (1192, 1185, '0595', '350525', '永春县', '118.294048', '25.321565', 'district');
INSERT INTO `cyx_district` VALUES (1193, 1185, '0595', '350526', '德化县', '118.241094', '25.491493', 'district');
INSERT INTO `cyx_district` VALUES (1194, 1185, '0595', '350527', '金门县', '118.323221', '24.436417', 'district');
INSERT INTO `cyx_district` VALUES (1195, 1185, '0595', '350581', '石狮市', '118.648066', '24.732204', 'district');
INSERT INTO `cyx_district` VALUES (1196, 1185, '0595', '350582', '晋江市', '118.551682', '24.781636', 'district');
INSERT INTO `cyx_district` VALUES (1197, 1185, '0595', '350583', '南安市', '118.386279', '24.960385', 'district');
INSERT INTO `cyx_district` VALUES (1198, 1144, '0596', '350600', '漳州市', '117.647093', '24.513025', 'city');
INSERT INTO `cyx_district` VALUES (1199, 1198, '0596', '350602', '芗城区', '117.653968', '24.510787', 'district');
INSERT INTO `cyx_district` VALUES (1200, 1198, '0596', '350603', '龙文区', '117.709754', '24.503113', 'district');
INSERT INTO `cyx_district` VALUES (1201, 1198, '0596', '350622', '云霄县', '117.339573', '23.957936', 'district');
INSERT INTO `cyx_district` VALUES (1202, 1198, '0596', '350623', '漳浦县', '117.613808', '24.117102', 'district');
INSERT INTO `cyx_district` VALUES (1203, 1198, '0596', '350624', '诏安县', '117.175184', '23.711579', 'district');
INSERT INTO `cyx_district` VALUES (1204, 1198, '0596', '350625', '长泰县', '117.759153', '24.625449', 'district');
INSERT INTO `cyx_district` VALUES (1205, 1198, '0596', '350626', '东山县', '117.430061', '23.701262', 'district');
INSERT INTO `cyx_district` VALUES (1206, 1198, '0596', '350627', '南靖县', '117.35732', '24.514654', 'district');
INSERT INTO `cyx_district` VALUES (1207, 1198, '0596', '350628', '平和县', '117.315017', '24.363508', 'district');
INSERT INTO `cyx_district` VALUES (1208, 1198, '0596', '350629', '华安县', '117.534103', '25.004425', 'district');
INSERT INTO `cyx_district` VALUES (1209, 1198, '0596', '350681', '龙海市', '117.818197', '24.446706', 'district');
INSERT INTO `cyx_district` VALUES (1210, 1144, '0599', '350700', '南平市', '118.17771', '26.641774', 'city');
INSERT INTO `cyx_district` VALUES (1211, 1210, '0599', '350702', '延平区', '118.182036', '26.637438', 'district');
INSERT INTO `cyx_district` VALUES (1212, 1210, '0599', '350703', '建阳区', '118.120464', '27.331876', 'district');
INSERT INTO `cyx_district` VALUES (1213, 1210, '0599', '350721', '顺昌县', '117.810357', '26.793288', 'district');
INSERT INTO `cyx_district` VALUES (1214, 1210, '0599', '350722', '浦城县', '118.541256', '27.917263', 'district');
INSERT INTO `cyx_district` VALUES (1215, 1210, '0599', '350723', '光泽县', '117.334106', '27.540987', 'district');
INSERT INTO `cyx_district` VALUES (1216, 1210, '0599', '350724', '松溪县', '118.785468', '27.526232', 'district');
INSERT INTO `cyx_district` VALUES (1217, 1210, '0599', '350725', '政和县', '118.857642', '27.366104', 'district');
INSERT INTO `cyx_district` VALUES (1218, 1210, '0599', '350781', '邵武市', '117.492533', '27.340326', 'district');
INSERT INTO `cyx_district` VALUES (1219, 1210, '0599', '350782', '武夷山市', '118.035309', '27.756647', 'district');
INSERT INTO `cyx_district` VALUES (1220, 1210, '0599', '350783', '建瓯市', '118.304966', '27.022774', 'district');
INSERT INTO `cyx_district` VALUES (1221, 1144, '0597', '350800', '龙岩市', '117.017295', '25.075119', 'city');
INSERT INTO `cyx_district` VALUES (1222, 1221, '0597', '350802', '新罗区', '117.037155', '25.098312', 'district');
INSERT INTO `cyx_district` VALUES (1223, 1221, '0597', '350803', '永定区', '116.732091', '24.723961', 'district');
INSERT INTO `cyx_district` VALUES (1224, 1221, '0597', '350821', '长汀县', '116.357581', '25.833531', 'district');
INSERT INTO `cyx_district` VALUES (1225, 1221, '0597', '350823', '上杭县', '116.420098', '25.049518', 'district');
INSERT INTO `cyx_district` VALUES (1226, 1221, '0597', '350824', '武平县', '116.100414', '25.095386', 'district');
INSERT INTO `cyx_district` VALUES (1227, 1221, '0597', '350825', '连城县', '116.754472', '25.710538', 'district');
INSERT INTO `cyx_district` VALUES (1228, 1221, '0597', '350881', '漳平市', '117.419998', '25.290184', 'district');
INSERT INTO `cyx_district` VALUES (1229, 1144, '0593', '350900', '宁德市', '119.547932', '26.665617', 'city');
INSERT INTO `cyx_district` VALUES (1230, 1229, '0593', '350902', '蕉城区', '119.526299', '26.66061', 'district');
INSERT INTO `cyx_district` VALUES (1231, 1229, '0593', '350921', '霞浦县', '120.005146', '26.885703', 'district');
INSERT INTO `cyx_district` VALUES (1232, 1229, '0593', '350922', '古田县', '118.746284', '26.577837', 'district');
INSERT INTO `cyx_district` VALUES (1233, 1229, '0593', '350923', '屏南县', '118.985895', '26.908276', 'district');
INSERT INTO `cyx_district` VALUES (1234, 1229, '0593', '350924', '寿宁县', '119.514986', '27.454479', 'district');
INSERT INTO `cyx_district` VALUES (1235, 1229, '0593', '350925', '周宁县', '119.339025', '27.104591', 'district');
INSERT INTO `cyx_district` VALUES (1236, 1229, '0593', '350926', '柘荣县', '119.900609', '27.233933', 'district');
INSERT INTO `cyx_district` VALUES (1237, 1229, '0593', '350981', '福安市', '119.64785', '27.08834', 'district');
INSERT INTO `cyx_district` VALUES (1238, 1229, '0593', '350982', '福鼎市', '120.216977', '27.324479', 'district');
INSERT INTO `cyx_district` VALUES (1239, 1, '0', '360000', '江西省', '115.81635', '28.63666', 'province');
INSERT INTO `cyx_district` VALUES (1240, 1239, '0791', '360100', '南昌市', '115.858198', '28.682892', 'city');
INSERT INTO `cyx_district` VALUES (1241, 1240, '0791', '360102', '东湖区', '115.903526', '28.698731', 'district');
INSERT INTO `cyx_district` VALUES (1242, 1240, '0791', '360103', '西湖区', '115.877233', '28.657595', 'district');
INSERT INTO `cyx_district` VALUES (1243, 1240, '0791', '360104', '青云谱区', '115.925749', '28.621169', 'district');
INSERT INTO `cyx_district` VALUES (1244, 1240, '0791', '360105', '湾里区', '115.730847', '28.714796', 'district');
INSERT INTO `cyx_district` VALUES (1245, 1240, '0791', '360111', '青山湖区', '115.962144', '28.682984', 'district');
INSERT INTO `cyx_district` VALUES (1246, 1240, '0791', '360112', '新建区', '115.815277', '28.692864', 'district');
INSERT INTO `cyx_district` VALUES (1247, 1240, '0791', '360121', '南昌县', '115.933742', '28.558296', 'district');
INSERT INTO `cyx_district` VALUES (1248, 1240, '0791', '360123', '安义县', '115.548658', '28.846', 'district');
INSERT INTO `cyx_district` VALUES (1249, 1240, '0791', '360124', '进贤县', '116.241288', '28.377343', 'district');
INSERT INTO `cyx_district` VALUES (1250, 1239, '0798', '360200', '景德镇市', '117.178222', '29.268945', 'city');
INSERT INTO `cyx_district` VALUES (1251, 1250, '0798', '360202', '昌江区', '117.18363', '29.273565', 'district');
INSERT INTO `cyx_district` VALUES (1252, 1250, '0798', '360203', '珠山区', '117.202919', '29.299938', 'district');
INSERT INTO `cyx_district` VALUES (1253, 1250, '0798', '360222', '浮梁县', '117.215066', '29.352253', 'district');
INSERT INTO `cyx_district` VALUES (1254, 1250, '0798', '360281', '乐平市', '117.151796', '28.97844', 'district');
INSERT INTO `cyx_district` VALUES (1255, 1239, '0799', '360300', '萍乡市', '113.887083', '27.658373', 'city');
INSERT INTO `cyx_district` VALUES (1256, 1255, '0799', '360302', '安源区', '113.870704', '27.61511', 'district');
INSERT INTO `cyx_district` VALUES (1257, 1255, '0799', '360313', '湘东区', '113.733047', '27.640075', 'district');
INSERT INTO `cyx_district` VALUES (1258, 1255, '0799', '360321', '莲花县', '113.961488', '27.127664', 'district');
INSERT INTO `cyx_district` VALUES (1259, 1255, '0799', '360322', '上栗县', '113.795311', '27.880301', 'district');
INSERT INTO `cyx_district` VALUES (1260, 1255, '0799', '360323', '芦溪县', '114.029827', '27.630806', 'district');
INSERT INTO `cyx_district` VALUES (1261, 1239, '0792', '360400', '九江市', '115.952914', '29.662117', 'city');
INSERT INTO `cyx_district` VALUES (1262, 1261, '0792', '360402', '濂溪区', '115.992842', '29.668064', 'district');
INSERT INTO `cyx_district` VALUES (1263, 1261, '0792', '360403', '浔阳区', '115.990301', '29.727593', 'district');
INSERT INTO `cyx_district` VALUES (1264, 1261, '0792', '360421', '九江县', '115.911323', '29.608431', 'district');
INSERT INTO `cyx_district` VALUES (1265, 1261, '0792', '360423', '武宁县', '115.092757', '29.246591', 'district');
INSERT INTO `cyx_district` VALUES (1266, 1261, '0792', '360424', '修水县', '114.546836', '29.025726', 'district');
INSERT INTO `cyx_district` VALUES (1267, 1261, '0792', '360425', '永修县', '115.831956', '29.011871', 'district');
INSERT INTO `cyx_district` VALUES (1268, 1261, '0792', '360426', '德安县', '115.767447', '29.298696', 'district');
INSERT INTO `cyx_district` VALUES (1269, 1261, '0792', '360427', '庐山市', '116.04506', '29.448128', 'district');
INSERT INTO `cyx_district` VALUES (1270, 1261, '0792', '360428', '都昌县', '116.203979', '29.273239', 'district');
INSERT INTO `cyx_district` VALUES (1271, 1261, '0792', '360429', '湖口县', '116.251947', '29.731101', 'district');
INSERT INTO `cyx_district` VALUES (1272, 1261, '0792', '360430', '彭泽县', '116.56438', '29.876991', 'district');
INSERT INTO `cyx_district` VALUES (1273, 1261, '0792', '360481', '瑞昌市', '115.681335', '29.675834', 'district');
INSERT INTO `cyx_district` VALUES (1274, 1261, '0792', '360482', '共青城市', '115.808844', '29.248316', 'district');
INSERT INTO `cyx_district` VALUES (1275, 1239, '0790', '360500', '新余市', '114.917346', '27.817808', 'city');
INSERT INTO `cyx_district` VALUES (1276, 1275, '0790', '360502', '渝水区', '114.944549', '27.800148', 'district');
INSERT INTO `cyx_district` VALUES (1277, 1275, '0790', '360521', '分宜县', '114.692049', '27.814757', 'district');
INSERT INTO `cyx_district` VALUES (1278, 1239, '0701', '360600', '鹰潭市', '117.042173', '28.272537', 'city');
INSERT INTO `cyx_district` VALUES (1279, 1278, '0701', '360602', '月湖区', '117.102475', '28.267018', 'district');
INSERT INTO `cyx_district` VALUES (1280, 1278, '0701', '360622', '余江县', '116.85926', '28.198652', 'district');
INSERT INTO `cyx_district` VALUES (1281, 1278, '0701', '360681', '贵溪市', '117.245497', '28.292519', 'district');
INSERT INTO `cyx_district` VALUES (1282, 1239, '0797', '360700', '赣州市', '114.933546', '25.830694', 'city');
INSERT INTO `cyx_district` VALUES (1283, 1282, '0797', '360702', '章贡区', '114.921171', '25.817816', 'district');
INSERT INTO `cyx_district` VALUES (1284, 1282, '0797', '360703', '南康区', '114.765412', '25.66145', 'district');
INSERT INTO `cyx_district` VALUES (1285, 1282, '0797', '360721', '赣县区', '115.011561', '25.86069', 'district');
INSERT INTO `cyx_district` VALUES (1286, 1282, '0797', '360722', '信丰县', '114.922922', '25.386379', 'district');
INSERT INTO `cyx_district` VALUES (1287, 1282, '0797', '360723', '大余县', '114.362112', '25.401313', 'district');
INSERT INTO `cyx_district` VALUES (1288, 1282, '0797', '360724', '上犹县', '114.551138', '25.785172', 'district');
INSERT INTO `cyx_district` VALUES (1289, 1282, '0797', '360725', '崇义县', '114.308267', '25.681784', 'district');
INSERT INTO `cyx_district` VALUES (1290, 1282, '0797', '360726', '安远县', '115.393922', '25.136927', 'district');
INSERT INTO `cyx_district` VALUES (1291, 1282, '0797', '360727', '龙南县', '114.789873', '24.911069', 'district');
INSERT INTO `cyx_district` VALUES (1292, 1282, '0797', '360728', '定南县', '115.027845', '24.78441', 'district');
INSERT INTO `cyx_district` VALUES (1293, 1282, '0797', '360729', '全南县', '114.530125', '24.742403', 'district');
INSERT INTO `cyx_district` VALUES (1294, 1282, '0797', '360730', '宁都县', '116.009472', '26.470116', 'district');
INSERT INTO `cyx_district` VALUES (1295, 1282, '0797', '360731', '于都县', '115.415508', '25.952068', 'district');
INSERT INTO `cyx_district` VALUES (1296, 1282, '0797', '360732', '兴国县', '115.363189', '26.337937', 'district');
INSERT INTO `cyx_district` VALUES (1297, 1282, '0797', '360733', '会昌县', '115.786056', '25.600272', 'district');
INSERT INTO `cyx_district` VALUES (1298, 1282, '0797', '360734', '寻乌县', '115.637933', '24.969167', 'district');
INSERT INTO `cyx_district` VALUES (1299, 1282, '0797', '360735', '石城县', '116.346995', '26.314775', 'district');
INSERT INTO `cyx_district` VALUES (1300, 1282, '0797', '360781', '瑞金市', '116.027134', '25.885555', 'district');
INSERT INTO `cyx_district` VALUES (1301, 1239, '0796', '360800', '吉安市', '114.966567', '27.090763', 'city');
INSERT INTO `cyx_district` VALUES (1302, 1301, '0796', '360802', '吉州区', '114.994763', '27.143801', 'district');
INSERT INTO `cyx_district` VALUES (1303, 1301, '0796', '360803', '青原区', '115.014811', '27.081977', 'district');
INSERT INTO `cyx_district` VALUES (1304, 1301, '0796', '360821', '吉安县', '114.907875', '27.039787', 'district');
INSERT INTO `cyx_district` VALUES (1305, 1301, '0796', '360822', '吉水县', '115.135507', '27.229632', 'district');
INSERT INTO `cyx_district` VALUES (1306, 1301, '0796', '360823', '峡江县', '115.316566', '27.582901', 'district');
INSERT INTO `cyx_district` VALUES (1307, 1301, '0796', '360824', '新干县', '115.387052', '27.740191', 'district');
INSERT INTO `cyx_district` VALUES (1308, 1301, '0796', '360825', '永丰县', '115.421344', '27.316939', 'district');
INSERT INTO `cyx_district` VALUES (1309, 1301, '0796', '360826', '泰和县', '114.92299', '26.801628', 'district');
INSERT INTO `cyx_district` VALUES (1310, 1301, '0796', '360827', '遂川县', '114.520537', '26.313737', 'district');
INSERT INTO `cyx_district` VALUES (1311, 1301, '0796', '360828', '万安县', '114.759364', '26.456553', 'district');
INSERT INTO `cyx_district` VALUES (1312, 1301, '0796', '360829', '安福县', '114.619893', '27.392873', 'district');
INSERT INTO `cyx_district` VALUES (1313, 1301, '0796', '360830', '永新县', '114.243072', '26.944962', 'district');
INSERT INTO `cyx_district` VALUES (1314, 1301, '0796', '360881', '井冈山市', '114.289228', '26.748081', 'district');
INSERT INTO `cyx_district` VALUES (1315, 1239, '0795', '360900', '宜春市', '114.416785', '27.815743', 'city');
INSERT INTO `cyx_district` VALUES (1316, 1315, '0795', '360902', '袁州区', '114.427858', '27.797091', 'district');
INSERT INTO `cyx_district` VALUES (1317, 1315, '0795', '360921', '奉新县', '115.400491', '28.688423', 'district');
INSERT INTO `cyx_district` VALUES (1318, 1315, '0795', '360922', '万载县', '114.444854', '28.105689', 'district');
INSERT INTO `cyx_district` VALUES (1319, 1315, '0795', '360923', '上高县', '114.947683', '28.238061', 'district');
INSERT INTO `cyx_district` VALUES (1320, 1315, '0795', '360924', '宜丰县', '114.802852', '28.394565', 'district');
INSERT INTO `cyx_district` VALUES (1321, 1315, '0795', '360925', '靖安县', '115.362628', '28.861478', 'district');
INSERT INTO `cyx_district` VALUES (1322, 1315, '0795', '360926', '铜鼓县', '114.371172', '28.520769', 'district');
INSERT INTO `cyx_district` VALUES (1323, 1315, '0795', '360981', '丰城市', '115.771093', '28.159141', 'district');
INSERT INTO `cyx_district` VALUES (1324, 1315, '0795', '360982', '樟树市', '115.546152', '28.055853', 'district');
INSERT INTO `cyx_district` VALUES (1325, 1315, '0795', '360983', '高安市', '115.360619', '28.441152', 'district');
INSERT INTO `cyx_district` VALUES (1326, 1239, '0794', '361000', '抚州市', '116.358181', '27.949217', 'city');
INSERT INTO `cyx_district` VALUES (1327, 1326, '0794', '361002', '临川区', '116.312166', '27.934572', 'district');
INSERT INTO `cyx_district` VALUES (1328, 1326, '0794', '361021', '南城县', '116.63704', '27.569678', 'district');
INSERT INTO `cyx_district` VALUES (1329, 1326, '0794', '361022', '黎川县', '116.907681', '27.282333', 'district');
INSERT INTO `cyx_district` VALUES (1330, 1326, '0794', '361023', '南丰县', '116.525725', '27.218444', 'district');
INSERT INTO `cyx_district` VALUES (1331, 1326, '0794', '361024', '崇仁县', '116.07626', '27.754466', 'district');
INSERT INTO `cyx_district` VALUES (1332, 1326, '0794', '361025', '乐安县', '115.83048', '27.428765', 'district');
INSERT INTO `cyx_district` VALUES (1333, 1326, '0794', '361026', '宜黄县', '116.236201', '27.554886', 'district');
INSERT INTO `cyx_district` VALUES (1334, 1326, '0794', '361027', '金溪县', '116.755058', '27.918959', 'district');
INSERT INTO `cyx_district` VALUES (1335, 1326, '0794', '361028', '资溪县', '117.060263', '27.706101', 'district');
INSERT INTO `cyx_district` VALUES (1336, 1326, '0794', '361029', '东乡县', '116.603559', '28.247696', 'district');
INSERT INTO `cyx_district` VALUES (1337, 1326, '0794', '361030', '广昌县', '116.335686', '26.843684', 'district');
INSERT INTO `cyx_district` VALUES (1338, 1239, '0793', '361100', '上饶市', '117.943433', '28.454863', 'city');
INSERT INTO `cyx_district` VALUES (1339, 1338, '0793', '361102', '信州区', '117.966268', '28.431006', 'district');
INSERT INTO `cyx_district` VALUES (1340, 1338, '0793', '361103', '广丰区', '118.19124', '28.436285', 'district');
INSERT INTO `cyx_district` VALUES (1341, 1338, '0793', '361121', '上饶县', '117.907849', '28.448982', 'district');
INSERT INTO `cyx_district` VALUES (1342, 1338, '0793', '361123', '玉山县', '118.244769', '28.682309', 'district');
INSERT INTO `cyx_district` VALUES (1343, 1338, '0793', '361124', '铅山县', '117.709659', '28.315664', 'district');
INSERT INTO `cyx_district` VALUES (1344, 1338, '0793', '361125', '横峰县', '117.596452', '28.407117', 'district');
INSERT INTO `cyx_district` VALUES (1345, 1338, '0793', '361126', '弋阳县', '117.449588', '28.378044', 'district');
INSERT INTO `cyx_district` VALUES (1346, 1338, '0793', '361127', '余干县', '116.695646', '28.702302', 'district');
INSERT INTO `cyx_district` VALUES (1347, 1338, '0793', '361128', '鄱阳县', '116.70359', '29.004847', 'district');
INSERT INTO `cyx_district` VALUES (1348, 1338, '0793', '361129', '万年县', '117.058445', '28.694582', 'district');
INSERT INTO `cyx_district` VALUES (1349, 1338, '0793', '361130', '婺源县', '117.861797', '29.248085', 'district');
INSERT INTO `cyx_district` VALUES (1350, 1338, '0793', '361181', '德兴市', '117.578713', '28.946464', 'district');
INSERT INTO `cyx_district` VALUES (1351, 1, '0', '370000', '山东省', '117.019915', '36.671156', 'province');
INSERT INTO `cyx_district` VALUES (1352, 1351, '0531', '370100', '济南市', '117.120098', '36.6512', 'city');
INSERT INTO `cyx_district` VALUES (1353, 1352, '0531', '370102', '历下区', '117.076441', '36.666465', 'district');
INSERT INTO `cyx_district` VALUES (1354, 1352, '0531', '370103', '市中区', '116.997845', '36.651335', 'district');
INSERT INTO `cyx_district` VALUES (1355, 1352, '0531', '370104', '槐荫区', '116.901224', '36.651441', 'district');
INSERT INTO `cyx_district` VALUES (1356, 1352, '0531', '370105', '天桥区', '116.987153', '36.678589', 'district');
INSERT INTO `cyx_district` VALUES (1357, 1352, '0531', '370112', '历城区', '117.06523', '36.680259', 'district');
INSERT INTO `cyx_district` VALUES (1358, 1352, '0531', '370113', '长清区', '116.751843', '36.55371', 'district');
INSERT INTO `cyx_district` VALUES (1359, 1352, '0531', '370124', '平阴县', '116.456006', '36.289251', 'district');
INSERT INTO `cyx_district` VALUES (1360, 1352, '0531', '370125', '济阳县', '117.173524', '36.978537', 'district');
INSERT INTO `cyx_district` VALUES (1361, 1352, '0531', '370126', '商河县', '117.157232', '37.309041', 'district');
INSERT INTO `cyx_district` VALUES (1362, 1352, '0531', '370181', '章丘区', '117.526228', '36.681258', 'district');
INSERT INTO `cyx_district` VALUES (1363, 1351, '0532', '370200', '青岛市', '120.382621', '36.067131', 'city');
INSERT INTO `cyx_district` VALUES (1364, 1363, '0532', '370202', '市南区', '120.412392', '36.075651', 'district');
INSERT INTO `cyx_district` VALUES (1365, 1363, '0532', '370203', '市北区', '120.374701', '36.0876', 'district');
INSERT INTO `cyx_district` VALUES (1366, 1363, '0532', '370211', '黄岛区', '120.198055', '35.960933', 'district');
INSERT INTO `cyx_district` VALUES (1367, 1363, '0532', '370212', '崂山区', '120.468956', '36.107538', 'district');
INSERT INTO `cyx_district` VALUES (1368, 1363, '0532', '370213', '李沧区', '120.432922', '36.145519', 'district');
INSERT INTO `cyx_district` VALUES (1369, 1363, '0532', '370214', '城阳区', '120.396256', '36.307559', 'district');
INSERT INTO `cyx_district` VALUES (1370, 1363, '0532', '370281', '胶州市', '120.033382', '36.26468', 'district');
INSERT INTO `cyx_district` VALUES (1371, 1363, '0532', '370282', '即墨市', '120.447158', '36.389408', 'district');
INSERT INTO `cyx_district` VALUES (1372, 1363, '0532', '370283', '平度市', '119.98842', '36.776357', 'district');
INSERT INTO `cyx_district` VALUES (1373, 1363, '0532', '370285', '莱西市', '120.51769', '36.889084', 'district');
INSERT INTO `cyx_district` VALUES (1374, 1351, '0533', '370300', '淄博市', '118.055019', '36.813546', 'city');
INSERT INTO `cyx_district` VALUES (1375, 1374, '0533', '370302', '淄川区', '117.966723', '36.643452', 'district');
INSERT INTO `cyx_district` VALUES (1376, 1374, '0533', '370303', '张店区', '118.017938', '36.806669', 'district');
INSERT INTO `cyx_district` VALUES (1377, 1374, '0533', '370304', '博山区', '117.861851', '36.494701', 'district');
INSERT INTO `cyx_district` VALUES (1378, 1374, '0533', '370305', '临淄区', '118.309118', '36.826981', 'district');
INSERT INTO `cyx_district` VALUES (1379, 1374, '0533', '370306', '周村区', '117.869886', '36.803072', 'district');
INSERT INTO `cyx_district` VALUES (1380, 1374, '0533', '370321', '桓台县', '118.097922', '36.959804', 'district');
INSERT INTO `cyx_district` VALUES (1381, 1374, '0533', '370322', '高青县', '117.826924', '37.170979', 'district');
INSERT INTO `cyx_district` VALUES (1382, 1374, '0533', '370323', '沂源县', '118.170855', '36.185038', 'district');
INSERT INTO `cyx_district` VALUES (1383, 1351, '0632', '370400', '枣庄市', '117.323725', '34.810488', 'city');
INSERT INTO `cyx_district` VALUES (1384, 1383, '0632', '370402', '市中区', '117.556139', '34.863554', 'district');
INSERT INTO `cyx_district` VALUES (1385, 1383, '0632', '370403', '薛城区', '117.263164', '34.795062', 'district');
INSERT INTO `cyx_district` VALUES (1386, 1383, '0632', '370404', '峄城区', '117.590816', '34.773263', 'district');
INSERT INTO `cyx_district` VALUES (1387, 1383, '0632', '370405', '台儿庄区', '117.734414', '34.56244', 'district');
INSERT INTO `cyx_district` VALUES (1388, 1383, '0632', '370406', '山亭区', '117.461517', '35.099528', 'district');
INSERT INTO `cyx_district` VALUES (1389, 1383, '0632', '370481', '滕州市', '117.165824', '35.114155', 'district');
INSERT INTO `cyx_district` VALUES (1390, 1351, '0546', '370500', '东营市', '118.674614', '37.433963', 'city');
INSERT INTO `cyx_district` VALUES (1391, 1390, '0546', '370502', '东营区', '118.582184', '37.448964', 'district');
INSERT INTO `cyx_district` VALUES (1392, 1390, '0546', '370503', '河口区', '118.525543', '37.886162', 'district');
INSERT INTO `cyx_district` VALUES (1393, 1390, '0546', '370505', '垦利区', '118.575228', '37.573054', 'district');
INSERT INTO `cyx_district` VALUES (1394, 1390, '0546', '370522', '利津县', '118.255287', '37.490328', 'district');
INSERT INTO `cyx_district` VALUES (1395, 1390, '0546', '370523', '广饶县', '118.407107', '37.053555', 'district');
INSERT INTO `cyx_district` VALUES (1396, 1351, '0535', '370600', '烟台市', '121.447852', '37.464539', 'city');
INSERT INTO `cyx_district` VALUES (1397, 1396, '0535', '370602', '芝罘区', '121.400445', '37.541475', 'district');
INSERT INTO `cyx_district` VALUES (1398, 1396, '0535', '370611', '福山区', '121.267741', '37.498246', 'district');
INSERT INTO `cyx_district` VALUES (1399, 1396, '0535', '370612', '牟平区', '121.600455', '37.387061', 'district');
INSERT INTO `cyx_district` VALUES (1400, 1396, '0535', '370613', '莱山区', '121.445301', '37.511291', 'district');
INSERT INTO `cyx_district` VALUES (1401, 1396, '0535', '370634', '长岛县', '120.73658', '37.921368', 'district');
INSERT INTO `cyx_district` VALUES (1402, 1396, '0535', '370681', '龙口市', '120.477813', '37.646107', 'district');
INSERT INTO `cyx_district` VALUES (1403, 1396, '0535', '370682', '莱阳市', '120.711672', '36.978941', 'district');
INSERT INTO `cyx_district` VALUES (1404, 1396, '0535', '370683', '莱州市', '119.942274', '37.177129', 'district');
INSERT INTO `cyx_district` VALUES (1405, 1396, '0535', '370684', '蓬莱市', '120.758848', '37.810661', 'district');
INSERT INTO `cyx_district` VALUES (1406, 1396, '0535', '370685', '招远市', '120.434071', '37.355469', 'district');
INSERT INTO `cyx_district` VALUES (1407, 1396, '0535', '370686', '栖霞市', '120.849675', '37.335123', 'district');
INSERT INTO `cyx_district` VALUES (1408, 1396, '0535', '370687', '海阳市', '121.173793', '36.688', 'district');
INSERT INTO `cyx_district` VALUES (1409, 1351, '0536', '370700', '潍坊市', '119.161748', '36.706962', 'city');
INSERT INTO `cyx_district` VALUES (1410, 1409, '0536', '370702', '潍城区', '119.024835', '36.7281', 'district');
INSERT INTO `cyx_district` VALUES (1411, 1409, '0536', '370703', '寒亭区', '119.211157', '36.755623', 'district');
INSERT INTO `cyx_district` VALUES (1412, 1409, '0536', '370704', '坊子区', '119.166485', '36.654448', 'district');
INSERT INTO `cyx_district` VALUES (1413, 1409, '0536', '370705', '奎文区', '119.132482', '36.70759', 'district');
INSERT INTO `cyx_district` VALUES (1414, 1409, '0536', '370724', '临朐县', '118.542982', '36.512506', 'district');
INSERT INTO `cyx_district` VALUES (1415, 1409, '0536', '370725', '昌乐县', '118.829992', '36.706964', 'district');
INSERT INTO `cyx_district` VALUES (1416, 1409, '0536', '370781', '青州市', '118.479654', '36.684789', 'district');
INSERT INTO `cyx_district` VALUES (1417, 1409, '0536', '370782', '诸城市', '119.410103', '35.995654', 'district');
INSERT INTO `cyx_district` VALUES (1418, 1409, '0536', '370783', '寿光市', '118.790739', '36.85576', 'district');
INSERT INTO `cyx_district` VALUES (1419, 1409, '0536', '370784', '安丘市', '119.218978', '36.478493', 'district');
INSERT INTO `cyx_district` VALUES (1420, 1409, '0536', '370785', '高密市', '119.755597', '36.382594', 'district');
INSERT INTO `cyx_district` VALUES (1421, 1409, '0536', '370786', '昌邑市', '119.403069', '36.843319', 'district');
INSERT INTO `cyx_district` VALUES (1422, 1351, '0537', '370800', '济宁市', '116.587282', '35.414982', 'city');
INSERT INTO `cyx_district` VALUES (1423, 1422, '0537', '370811', '任城区', '116.606103', '35.444028', 'district');
INSERT INTO `cyx_district` VALUES (1424, 1422, '0537', '370812', '兖州区', '116.783833', '35.553144', 'district');
INSERT INTO `cyx_district` VALUES (1425, 1422, '0537', '370826', '微山县', '117.128827', '34.806554', 'district');
INSERT INTO `cyx_district` VALUES (1426, 1422, '0537', '370827', '鱼台县', '116.650608', '35.012749', 'district');
INSERT INTO `cyx_district` VALUES (1427, 1422, '0537', '370828', '金乡县', '116.311532', '35.066619', 'district');
INSERT INTO `cyx_district` VALUES (1428, 1422, '0537', '370829', '嘉祥县', '116.342449', '35.408824', 'district');
INSERT INTO `cyx_district` VALUES (1429, 1422, '0537', '370830', '汶上县', '116.49708', '35.712298', 'district');
INSERT INTO `cyx_district` VALUES (1430, 1422, '0537', '370831', '泗水县', '117.251195', '35.664323', 'district');
INSERT INTO `cyx_district` VALUES (1431, 1422, '0537', '370832', '梁山县', '116.096044', '35.802306', 'district');
INSERT INTO `cyx_district` VALUES (1432, 1422, '0537', '370881', '曲阜市', '116.986526', '35.581108', 'district');
INSERT INTO `cyx_district` VALUES (1433, 1422, '0537', '370883', '邹城市', '117.007453', '35.40268', 'district');
INSERT INTO `cyx_district` VALUES (1434, 1351, '0538', '370900', '泰安市', '117.087614', '36.200252', 'city');
INSERT INTO `cyx_district` VALUES (1435, 1434, '0538', '370902', '泰山区', '117.135354', '36.192083', 'district');
INSERT INTO `cyx_district` VALUES (1436, 1434, '0538', '370911', '岱岳区', '117.041581', '36.187989', 'district');
INSERT INTO `cyx_district` VALUES (1437, 1434, '0538', '370921', '宁阳县', '116.805796', '35.758786', 'district');
INSERT INTO `cyx_district` VALUES (1438, 1434, '0538', '370923', '东平县', '116.470304', '35.937102', 'district');
INSERT INTO `cyx_district` VALUES (1439, 1434, '0538', '370982', '新泰市', '117.767952', '35.909032', 'district');
INSERT INTO `cyx_district` VALUES (1440, 1434, '0538', '370983', '肥城市', '116.768358', '36.182571', 'district');
INSERT INTO `cyx_district` VALUES (1441, 1351, '0631', '371000', '威海市', '122.120282', '37.513412', 'city');
INSERT INTO `cyx_district` VALUES (1442, 1441, '0631', '371002', '环翠区', '122.123443', '37.50199', 'district');
INSERT INTO `cyx_district` VALUES (1443, 1441, '0631', '371003', '文登区', '122.05767', '37.193735', 'district');
INSERT INTO `cyx_district` VALUES (1444, 1441, '0631', '371082', '荣成市', '122.486657', '37.16516', 'district');
INSERT INTO `cyx_district` VALUES (1445, 1441, '0631', '371083', '乳山市', '121.539764', '36.919816', 'district');
INSERT INTO `cyx_district` VALUES (1446, 1351, '0633', '371100', '日照市', '119.526925', '35.416734', 'city');
INSERT INTO `cyx_district` VALUES (1447, 1446, '0633', '371102', '东港区', '119.462267', '35.42548', 'district');
INSERT INTO `cyx_district` VALUES (1448, 1446, '0633', '371103', '岚山区', '119.318928', '35.121884', 'district');
INSERT INTO `cyx_district` VALUES (1449, 1446, '0633', '371121', '五莲县', '119.213619', '35.760228', 'district');
INSERT INTO `cyx_district` VALUES (1450, 1446, '0633', '371122', '莒县', '118.837063', '35.579868', 'district');
INSERT INTO `cyx_district` VALUES (1451, 1351, '0634', '371200', '莱芜市', '117.676723', '36.213813', 'city');
INSERT INTO `cyx_district` VALUES (1452, 1451, '0634', '371202', '莱城区', '117.659884', '36.203179', 'district');
INSERT INTO `cyx_district` VALUES (1453, 1451, '0634', '371203', '钢城区', '117.811354', '36.058572', 'district');
INSERT INTO `cyx_district` VALUES (1454, 1351, '0539', '371300', '临沂市', '118.356414', '35.104673', 'city');
INSERT INTO `cyx_district` VALUES (1455, 1454, '0539', '371302', '兰山区', '118.347842', '35.051804', 'district');
INSERT INTO `cyx_district` VALUES (1456, 1454, '0539', '371311', '罗庄区', '118.284786', '34.996741', 'district');
INSERT INTO `cyx_district` VALUES (1457, 1454, '0539', '371312', '河东区', '118.402893', '35.089916', 'district');
INSERT INTO `cyx_district` VALUES (1458, 1454, '0539', '371321', '沂南县', '118.465221', '35.550217', 'district');
INSERT INTO `cyx_district` VALUES (1459, 1454, '0539', '371322', '郯城县', '118.367215', '34.613586', 'district');
INSERT INTO `cyx_district` VALUES (1460, 1454, '0539', '371323', '沂水县', '118.627917', '35.79045', 'district');
INSERT INTO `cyx_district` VALUES (1461, 1454, '0539', '371324', '兰陵县', '118.07065', '34.857149', 'district');
INSERT INTO `cyx_district` VALUES (1462, 1454, '0539', '371325', '费县', '117.977325', '35.26596', 'district');
INSERT INTO `cyx_district` VALUES (1463, 1454, '0539', '371326', '平邑县', '117.640352', '35.505943', 'district');
INSERT INTO `cyx_district` VALUES (1464, 1454, '0539', '371327', '莒南县', '118.835163', '35.174846', 'district');
INSERT INTO `cyx_district` VALUES (1465, 1454, '0539', '371328', '蒙阴县', '117.953621', '35.719396', 'district');
INSERT INTO `cyx_district` VALUES (1466, 1454, '0539', '371329', '临沭县', '118.650781', '34.919851', 'district');
INSERT INTO `cyx_district` VALUES (1467, 1351, '0534', '371400', '德州市', '116.359381', '37.436657', 'city');
INSERT INTO `cyx_district` VALUES (1468, 1467, '0534', '371402', '德城区', '116.29947', '37.450804', 'district');
INSERT INTO `cyx_district` VALUES (1469, 1467, '0534', '371403', '陵城区', '116.576092', '37.335794', 'district');
INSERT INTO `cyx_district` VALUES (1470, 1467, '0534', '371422', '宁津县', '116.800306', '37.652189', 'district');
INSERT INTO `cyx_district` VALUES (1471, 1467, '0534', '371423', '庆云县', '117.385256', '37.775349', 'district');
INSERT INTO `cyx_district` VALUES (1472, 1467, '0534', '371424', '临邑县', '116.866799', '37.189797', 'district');
INSERT INTO `cyx_district` VALUES (1473, 1467, '0534', '371425', '齐河县', '116.762893', '36.784158', 'district');
INSERT INTO `cyx_district` VALUES (1474, 1467, '0534', '371426', '平原县', '116.434032', '37.165323', 'district');
INSERT INTO `cyx_district` VALUES (1475, 1467, '0534', '371427', '夏津县', '116.001726', '36.948371', 'district');
INSERT INTO `cyx_district` VALUES (1476, 1467, '0534', '371428', '武城县', '116.069302', '37.213311', 'district');
INSERT INTO `cyx_district` VALUES (1477, 1467, '0534', '371481', '乐陵市', '117.231934', '37.729907', 'district');
INSERT INTO `cyx_district` VALUES (1478, 1467, '0534', '371482', '禹城市', '116.638327', '36.933812', 'district');
INSERT INTO `cyx_district` VALUES (1479, 1351, '0635', '371500', '聊城市', '115.985389', '36.456684', 'city');
INSERT INTO `cyx_district` VALUES (1480, 1479, '0635', '371502', '东昌府区', '115.988349', '36.434669', 'district');
INSERT INTO `cyx_district` VALUES (1481, 1479, '0635', '371521', '阳谷县', '115.79182', '36.114392', 'district');
INSERT INTO `cyx_district` VALUES (1482, 1479, '0635', '371522', '莘县', '115.671191', '36.233598', 'district');
INSERT INTO `cyx_district` VALUES (1483, 1479, '0635', '371523', '茌平县', '116.25527', '36.580688', 'district');
INSERT INTO `cyx_district` VALUES (1484, 1479, '0635', '371524', '东阿县', '116.247579', '36.334917', 'district');
INSERT INTO `cyx_district` VALUES (1485, 1479, '0635', '371525', '冠县', '115.442739', '36.484009', 'district');
INSERT INTO `cyx_district` VALUES (1486, 1479, '0635', '371526', '高唐县', '116.23016', '36.846762', 'district');
INSERT INTO `cyx_district` VALUES (1487, 1479, '0635', '371581', '临清市', '115.704881', '36.838277', 'district');
INSERT INTO `cyx_district` VALUES (1488, 1351, '0543', '371600', '滨州市', '117.970699', '37.38198', 'city');
INSERT INTO `cyx_district` VALUES (1489, 1488, '0543', '371602', '滨城区', '118.019326', '37.430724', 'district');
INSERT INTO `cyx_district` VALUES (1490, 1488, '0543', '371603', '沾化区', '118.098902', '37.69926', 'district');
INSERT INTO `cyx_district` VALUES (1491, 1488, '0543', '371621', '惠民县', '117.509921', '37.489877', 'district');
INSERT INTO `cyx_district` VALUES (1492, 1488, '0543', '371622', '阳信县', '117.603339', '37.632433', 'district');
INSERT INTO `cyx_district` VALUES (1493, 1488, '0543', '371623', '无棣县', '117.625696', '37.77026', 'district');
INSERT INTO `cyx_district` VALUES (1494, 1488, '0543', '371625', '博兴县', '118.110709', '37.15457', 'district');
INSERT INTO `cyx_district` VALUES (1495, 1488, '0543', '371626', '邹平县', '117.743109', '36.862989', 'district');
INSERT INTO `cyx_district` VALUES (1496, 1351, '0530', '371700', '菏泽市', '115.480656', '35.23375', 'city');
INSERT INTO `cyx_district` VALUES (1497, 1496, '0530', '371702', '牡丹区', '115.417826', '35.252512', 'district');
INSERT INTO `cyx_district` VALUES (1498, 1496, '0530', '371703', '定陶区', '115.57302', '35.070995', 'district');
INSERT INTO `cyx_district` VALUES (1499, 1496, '0530', '371721', '曹县', '115.542328', '34.825508', 'district');
INSERT INTO `cyx_district` VALUES (1500, 1496, '0530', '371722', '单县', '116.107428', '34.778808', 'district');
INSERT INTO `cyx_district` VALUES (1501, 1496, '0530', '371723', '成武县', '115.889764', '34.952459', 'district');
INSERT INTO `cyx_district` VALUES (1502, 1496, '0530', '371724', '巨野县', '116.062394', '35.388925', 'district');
INSERT INTO `cyx_district` VALUES (1503, 1496, '0530', '371725', '郓城县', '115.9389', '35.575135', 'district');
INSERT INTO `cyx_district` VALUES (1504, 1496, '0530', '371726', '鄄城县', '115.510192', '35.563408', 'district');
INSERT INTO `cyx_district` VALUES (1505, 1496, '0530', '371728', '东明县', '115.107404', '35.276162', 'district');
INSERT INTO `cyx_district` VALUES (1506, 1, '0', '410000', '河南省', '113.753394', '34.765869', 'province');
INSERT INTO `cyx_district` VALUES (1507, 1506, '0371', '410100', '郑州市', '113.625328', '34.746611', 'city');
INSERT INTO `cyx_district` VALUES (1508, 1507, '0371', '410102', '中原区', '113.613337', '34.748256', 'district');
INSERT INTO `cyx_district` VALUES (1509, 1507, '0371', '410103', '二七区', '113.640211', '34.724114', 'district');
INSERT INTO `cyx_district` VALUES (1510, 1507, '0371', '410104', '管城回族区', '113.6775', '34.75429', 'district');
INSERT INTO `cyx_district` VALUES (1511, 1507, '0371', '410105', '金水区', '113.660617', '34.800004', 'district');
INSERT INTO `cyx_district` VALUES (1512, 1507, '0371', '410106', '上街区', '113.30893', '34.802752', 'district');
INSERT INTO `cyx_district` VALUES (1513, 1507, '0371', '410108', '惠济区', '113.6169', '34.867457', 'district');
INSERT INTO `cyx_district` VALUES (1514, 1507, '0371', '410122', '中牟县', '113.976253', '34.718936', 'district');
INSERT INTO `cyx_district` VALUES (1515, 1507, '0371', '410181', '巩义市', '113.022406', '34.7481', 'district');
INSERT INTO `cyx_district` VALUES (1516, 1507, '0371', '410182', '荥阳市', '113.38324', '34.786948', 'district');
INSERT INTO `cyx_district` VALUES (1517, 1507, '0371', '410183', '新密市', '113.391087', '34.539376', 'district');
INSERT INTO `cyx_district` VALUES (1518, 1507, '0371', '410184', '新郑市', '113.740662', '34.395949', 'district');
INSERT INTO `cyx_district` VALUES (1519, 1507, '0371', '410185', '登封市', '113.050581', '34.454443', 'district');
INSERT INTO `cyx_district` VALUES (1520, 1506, '0378', '410200', '开封市', '114.307677', '34.797966', 'city');
INSERT INTO `cyx_district` VALUES (1521, 1520, '0378', '410202', '龙亭区', '114.356076', '34.815565', 'district');
INSERT INTO `cyx_district` VALUES (1522, 1520, '0378', '410203', '顺河回族区', '114.364875', '34.800458', 'district');
INSERT INTO `cyx_district` VALUES (1523, 1520, '0378', '410204', '鼓楼区', '114.348306', '34.78856', 'district');
INSERT INTO `cyx_district` VALUES (1524, 1520, '0378', '410205', '禹王台区', '114.34817', '34.777104', 'district');
INSERT INTO `cyx_district` VALUES (1525, 1520, '0378', '410212', '祥符区', '114.441285', '34.756916', 'district');
INSERT INTO `cyx_district` VALUES (1526, 1520, '0378', '410221', '杞县', '114.783139', '34.549174', 'district');
INSERT INTO `cyx_district` VALUES (1527, 1520, '0378', '410222', '通许县', '114.467467', '34.480433', 'district');
INSERT INTO `cyx_district` VALUES (1528, 1520, '0378', '410223', '尉氏县', '114.193081', '34.411494', 'district');
INSERT INTO `cyx_district` VALUES (1529, 1520, '0378', '410225', '兰考县', '114.821348', '34.822211', 'district');
INSERT INTO `cyx_district` VALUES (1530, 1506, '0379', '410300', '洛阳市', '112.453926', '34.620202', 'city');
INSERT INTO `cyx_district` VALUES (1531, 1530, '0379', '410302', '老城区', '112.469766', '34.6842', 'district');
INSERT INTO `cyx_district` VALUES (1532, 1530, '0379', '410303', '西工区', '112.427914', '34.660378', 'district');
INSERT INTO `cyx_district` VALUES (1533, 1530, '0379', '410304', '瀍河回族区', '112.500131', '34.679773', 'district');
INSERT INTO `cyx_district` VALUES (1534, 1530, '0379', '410305', '涧西区', '112.395756', '34.658033', 'district');
INSERT INTO `cyx_district` VALUES (1535, 1530, '0379', '410306', '吉利区', '112.589112', '34.900467', 'district');
INSERT INTO `cyx_district` VALUES (1536, 1530, '0379', '410311', '洛龙区', '112.463833', '34.619711', 'district');
INSERT INTO `cyx_district` VALUES (1537, 1530, '0379', '410322', '孟津县', '112.445354', '34.825638', 'district');
INSERT INTO `cyx_district` VALUES (1538, 1530, '0379', '410323', '新安县', '112.13244', '34.728284', 'district');
INSERT INTO `cyx_district` VALUES (1539, 1530, '0379', '410324', '栾川县', '111.615768', '33.785698', 'district');
INSERT INTO `cyx_district` VALUES (1540, 1530, '0379', '410325', '嵩县', '112.085634', '34.134516', 'district');
INSERT INTO `cyx_district` VALUES (1541, 1530, '0379', '410326', '汝阳县', '112.473139', '34.153939', 'district');
INSERT INTO `cyx_district` VALUES (1542, 1530, '0379', '410327', '宜阳县', '112.179238', '34.514644', 'district');
INSERT INTO `cyx_district` VALUES (1543, 1530, '0379', '410328', '洛宁县', '111.653111', '34.389197', 'district');
INSERT INTO `cyx_district` VALUES (1544, 1530, '0379', '410329', '伊川县', '112.425676', '34.421323', 'district');
INSERT INTO `cyx_district` VALUES (1545, 1530, '0379', '410381', '偃师市', '112.789534', '34.72722', 'district');
INSERT INTO `cyx_district` VALUES (1546, 1506, '0375', '410400', '平顶山市', '113.192661', '33.766169', 'city');
INSERT INTO `cyx_district` VALUES (1547, 1546, '0375', '410402', '新华区', '113.293977', '33.737251', 'district');
INSERT INTO `cyx_district` VALUES (1548, 1546, '0375', '410403', '卫东区', '113.335192', '33.734706', 'district');
INSERT INTO `cyx_district` VALUES (1549, 1546, '0375', '410404', '石龙区', '112.898818', '33.898713', 'district');
INSERT INTO `cyx_district` VALUES (1550, 1546, '0375', '410411', '湛河区', '113.320873', '33.725681', 'district');
INSERT INTO `cyx_district` VALUES (1551, 1546, '0375', '410421', '宝丰县', '113.054801', '33.868434', 'district');
INSERT INTO `cyx_district` VALUES (1552, 1546, '0375', '410422', '叶县', '113.357239', '33.626731', 'district');
INSERT INTO `cyx_district` VALUES (1553, 1546, '0375', '410423', '鲁山县', '112.908202', '33.738293', 'district');
INSERT INTO `cyx_district` VALUES (1554, 1546, '0375', '410425', '郏县', '113.212609', '33.971787', 'district');
INSERT INTO `cyx_district` VALUES (1555, 1546, '0375', '410481', '舞钢市', '113.516343', '33.314033', 'district');
INSERT INTO `cyx_district` VALUES (1556, 1546, '0375', '410482', '汝州市', '112.844517', '34.167029', 'district');
INSERT INTO `cyx_district` VALUES (1557, 1506, '0372', '410500', '安阳市', '114.392392', '36.097577', 'city');
INSERT INTO `cyx_district` VALUES (1558, 1557, '0372', '410502', '文峰区', '114.357082', '36.090468', 'district');
INSERT INTO `cyx_district` VALUES (1559, 1557, '0372', '410503', '北关区', '114.355742', '36.10766', 'district');
INSERT INTO `cyx_district` VALUES (1560, 1557, '0372', '410505', '殷都区', '114.303553', '36.10989', 'district');
INSERT INTO `cyx_district` VALUES (1561, 1557, '0372', '410506', '龙安区', '114.301331', '36.076225', 'district');
INSERT INTO `cyx_district` VALUES (1562, 1557, '0372', '410522', '安阳县', '114.130207', '36.130584', 'district');
INSERT INTO `cyx_district` VALUES (1563, 1557, '0372', '410523', '汤阴县', '114.357763', '35.924514', 'district');
INSERT INTO `cyx_district` VALUES (1564, 1557, '0372', '410526', '滑县', '114.519311', '35.575417', 'district');
INSERT INTO `cyx_district` VALUES (1565, 1557, '0372', '410527', '内黄县', '114.901452', '35.971704', 'district');
INSERT INTO `cyx_district` VALUES (1566, 1557, '0372', '410581', '林州市', '113.820129', '36.083046', 'district');
INSERT INTO `cyx_district` VALUES (1567, 1506, '0392', '410600', '鹤壁市', '114.297309', '35.748325', 'city');
INSERT INTO `cyx_district` VALUES (1568, 1567, '0392', '410602', '鹤山区', '114.163258', '35.954611', 'district');
INSERT INTO `cyx_district` VALUES (1569, 1567, '0392', '410603', '山城区', '114.184318', '35.898033', 'district');
INSERT INTO `cyx_district` VALUES (1570, 1567, '0392', '410611', '淇滨区', '114.298789', '35.741592', 'district');
INSERT INTO `cyx_district` VALUES (1571, 1567, '0392', '410621', '浚县', '114.55091', '35.67636', 'district');
INSERT INTO `cyx_district` VALUES (1572, 1567, '0392', '410622', '淇县', '114.208828', '35.622507', 'district');
INSERT INTO `cyx_district` VALUES (1573, 1506, '0373', '410700', '新乡市', '113.926763', '35.303704', 'city');
INSERT INTO `cyx_district` VALUES (1574, 1573, '0373', '410702', '红旗区', '113.875245', '35.30385', 'district');
INSERT INTO `cyx_district` VALUES (1575, 1573, '0373', '410703', '卫滨区', '113.865663', '35.301992', 'district');
INSERT INTO `cyx_district` VALUES (1576, 1573, '0373', '410704', '凤泉区', '113.915184', '35.383978', 'district');
INSERT INTO `cyx_district` VALUES (1577, 1573, '0373', '410711', '牧野区', '113.908772', '35.315039', 'district');
INSERT INTO `cyx_district` VALUES (1578, 1573, '0373', '410721', '新乡县', '113.805205', '35.190836', 'district');
INSERT INTO `cyx_district` VALUES (1579, 1573, '0373', '410724', '获嘉县', '113.657433', '35.259808', 'district');
INSERT INTO `cyx_district` VALUES (1580, 1573, '0373', '410725', '原阳县', '113.940046', '35.065587', 'district');
INSERT INTO `cyx_district` VALUES (1581, 1573, '0373', '410726', '延津县', '114.20509', '35.141889', 'district');
INSERT INTO `cyx_district` VALUES (1582, 1573, '0373', '410727', '封丘县', '114.418882', '35.041198', 'district');
INSERT INTO `cyx_district` VALUES (1583, 1573, '0373', '410728', '长垣县', '114.668936', '35.201548', 'district');
INSERT INTO `cyx_district` VALUES (1584, 1573, '0373', '410781', '卫辉市', '114.064907', '35.398494', 'district');
INSERT INTO `cyx_district` VALUES (1585, 1573, '0373', '410782', '辉县市', '113.805468', '35.462312', 'district');
INSERT INTO `cyx_district` VALUES (1586, 1506, '0391', '410800', '焦作市', '113.241823', '35.215893', 'city');
INSERT INTO `cyx_district` VALUES (1587, 1586, '0391', '410802', '解放区', '113.230816', '35.240282', 'district');
INSERT INTO `cyx_district` VALUES (1588, 1586, '0391', '410803', '中站区', '113.182946', '35.236819', 'district');
INSERT INTO `cyx_district` VALUES (1589, 1586, '0391', '410804', '马村区', '113.322332', '35.256108', 'district');
INSERT INTO `cyx_district` VALUES (1590, 1586, '0391', '410811', '山阳区', '113.254881', '35.214507', 'district');
INSERT INTO `cyx_district` VALUES (1591, 1586, '0391', '410821', '修武县', '113.447755', '35.223514', 'district');
INSERT INTO `cyx_district` VALUES (1592, 1586, '0391', '410822', '博爱县', '113.064379', '35.171045', 'district');
INSERT INTO `cyx_district` VALUES (1593, 1586, '0391', '410823', '武陟县', '113.401679', '35.099378', 'district');
INSERT INTO `cyx_district` VALUES (1594, 1586, '0391', '410825', '温县', '113.08053', '34.940189', 'district');
INSERT INTO `cyx_district` VALUES (1595, 1586, '0391', '410882', '沁阳市', '112.950716', '35.087539', 'district');
INSERT INTO `cyx_district` VALUES (1596, 1586, '0391', '410883', '孟州市', '112.791401', '34.907315', 'district');
INSERT INTO `cyx_district` VALUES (1597, 1506, '0393', '410900', '濮阳市', '115.029216', '35.761829', 'city');
INSERT INTO `cyx_district` VALUES (1598, 1597, '0393', '410902', '华龙区', '115.074151', '35.777346', 'district');
INSERT INTO `cyx_district` VALUES (1599, 1597, '0393', '410922', '清丰县', '115.104389', '35.88518', 'district');
INSERT INTO `cyx_district` VALUES (1600, 1597, '0393', '410923', '南乐县', '115.204675', '36.069476', 'district');
INSERT INTO `cyx_district` VALUES (1601, 1597, '0393', '410926', '范县', '115.504201', '35.851906', 'district');
INSERT INTO `cyx_district` VALUES (1602, 1597, '0393', '410927', '台前县', '115.871906', '35.96939', 'district');
INSERT INTO `cyx_district` VALUES (1603, 1597, '0393', '410928', '濮阳县', '115.029078', '35.712193', 'district');
INSERT INTO `cyx_district` VALUES (1604, 1506, '0374', '411000', '许昌市', '113.852454', '34.035771', 'city');
INSERT INTO `cyx_district` VALUES (1605, 1604, '0374', '411002', '魏都区', '113.822647', '34.025341', 'district');
INSERT INTO `cyx_district` VALUES (1606, 1604, '0374', '411023', '建安区', '113.822983', '34.12466', 'district');
INSERT INTO `cyx_district` VALUES (1607, 1604, '0374', '411024', '鄢陵县', '114.177399', '34.102332', 'district');
INSERT INTO `cyx_district` VALUES (1608, 1604, '0374', '411025', '襄城县', '113.505874', '33.851459', 'district');
INSERT INTO `cyx_district` VALUES (1609, 1604, '0374', '411081', '禹州市', '113.488478', '34.140701', 'district');
INSERT INTO `cyx_district` VALUES (1610, 1604, '0374', '411082', '长葛市', '113.813714', '34.19592', 'district');
INSERT INTO `cyx_district` VALUES (1611, 1506, '0395', '411100', '漯河市', '114.016536', '33.580873', 'city');
INSERT INTO `cyx_district` VALUES (1612, 1611, '0395', '411102', '源汇区', '114.017948', '33.565441', 'district');
INSERT INTO `cyx_district` VALUES (1613, 1611, '0395', '411103', '郾城区', '114.006943', '33.587409', 'district');
INSERT INTO `cyx_district` VALUES (1614, 1611, '0395', '411104', '召陵区', '114.093902', '33.586565', 'district');
INSERT INTO `cyx_district` VALUES (1615, 1611, '0395', '411121', '舞阳县', '113.609286', '33.437876', 'district');
INSERT INTO `cyx_district` VALUES (1616, 1611, '0395', '411122', '临颍县', '113.931261', '33.828042', 'district');
INSERT INTO `cyx_district` VALUES (1617, 1506, '0398', '411200', '三门峡市', '111.200367', '34.772792', 'city');
INSERT INTO `cyx_district` VALUES (1618, 1617, '0398', '411202', '湖滨区', '111.188397', '34.770886', 'district');
INSERT INTO `cyx_district` VALUES (1619, 1617, '0398', '411203', '陕州区', '111.103563', '34.720547', 'district');
INSERT INTO `cyx_district` VALUES (1620, 1617, '0398', '411221', '渑池县', '111.761797', '34.767951', 'district');
INSERT INTO `cyx_district` VALUES (1621, 1617, '0398', '411224', '卢氏县', '111.047858', '34.054324', 'district');
INSERT INTO `cyx_district` VALUES (1622, 1617, '0398', '411281', '义马市', '111.87448', '34.7474', 'district');
INSERT INTO `cyx_district` VALUES (1623, 1617, '0398', '411282', '灵宝市', '110.89422', '34.516828', 'district');
INSERT INTO `cyx_district` VALUES (1624, 1506, '0377', '411300', '南阳市', '112.528308', '32.990664', 'city');
INSERT INTO `cyx_district` VALUES (1625, 1624, '0377', '411302', '宛城区', '112.539558', '33.003784', 'district');
INSERT INTO `cyx_district` VALUES (1626, 1624, '0377', '411303', '卧龙区', '112.528789', '32.989877', 'district');
INSERT INTO `cyx_district` VALUES (1627, 1624, '0377', '411321', '南召县', '112.429133', '33.489877', 'district');
INSERT INTO `cyx_district` VALUES (1628, 1624, '0377', '411322', '方城县', '113.012494', '33.254391', 'district');
INSERT INTO `cyx_district` VALUES (1629, 1624, '0377', '411323', '西峡县', '111.47353', '33.307294', 'district');
INSERT INTO `cyx_district` VALUES (1630, 1624, '0377', '411324', '镇平县', '112.234697', '33.03411', 'district');
INSERT INTO `cyx_district` VALUES (1631, 1624, '0377', '411325', '内乡县', '111.849392', '33.044864', 'district');
INSERT INTO `cyx_district` VALUES (1632, 1624, '0377', '411326', '淅川县', '111.490964', '33.13782', 'district');
INSERT INTO `cyx_district` VALUES (1633, 1624, '0377', '411327', '社旗县', '112.948245', '33.056109', 'district');
INSERT INTO `cyx_district` VALUES (1634, 1624, '0377', '411328', '唐河县', '112.807636', '32.681335', 'district');
INSERT INTO `cyx_district` VALUES (1635, 1624, '0377', '411329', '新野县', '112.360026', '32.520805', 'district');
INSERT INTO `cyx_district` VALUES (1636, 1624, '0377', '411330', '桐柏县', '113.428287', '32.380073', 'district');
INSERT INTO `cyx_district` VALUES (1637, 1624, '0377', '411381', '邓州市', '112.087493', '32.68758', 'district');
INSERT INTO `cyx_district` VALUES (1638, 1506, '0370', '411400', '商丘市', '115.656339', '34.414961', 'city');
INSERT INTO `cyx_district` VALUES (1639, 1638, '0370', '411402', '梁园区', '115.613965', '34.443893', 'district');
INSERT INTO `cyx_district` VALUES (1640, 1638, '0370', '411403', '睢阳区', '115.653301', '34.388389', 'district');
INSERT INTO `cyx_district` VALUES (1641, 1638, '0370', '411421', '民权县', '115.173971', '34.648191', 'district');
INSERT INTO `cyx_district` VALUES (1642, 1638, '0370', '411422', '睢县', '115.071879', '34.445655', 'district');
INSERT INTO `cyx_district` VALUES (1643, 1638, '0370', '411423', '宁陵县', '115.313743', '34.460399', 'district');
INSERT INTO `cyx_district` VALUES (1644, 1638, '0370', '411424', '柘城县', '115.305708', '34.091082', 'district');
INSERT INTO `cyx_district` VALUES (1645, 1638, '0370', '411425', '虞城县', '115.828319', '34.400835', 'district');
INSERT INTO `cyx_district` VALUES (1646, 1638, '0370', '411426', '夏邑县', '116.131447', '34.237553', 'district');
INSERT INTO `cyx_district` VALUES (1647, 1638, '0370', '411481', '永城市', '116.4495', '33.929291', 'district');
INSERT INTO `cyx_district` VALUES (1648, 1506, '0376', '411500', '信阳市', '114.091193', '32.147679', 'city');
INSERT INTO `cyx_district` VALUES (1649, 1648, '0376', '411502', '浉河区', '114.058713', '32.116803', 'district');
INSERT INTO `cyx_district` VALUES (1650, 1648, '0376', '411503', '平桥区', '114.125656', '32.101031', 'district');
INSERT INTO `cyx_district` VALUES (1651, 1648, '0376', '411521', '罗山县', '114.512872', '32.203883', 'district');
INSERT INTO `cyx_district` VALUES (1652, 1648, '0376', '411522', '光山县', '114.919152', '32.010002', 'district');
INSERT INTO `cyx_district` VALUES (1653, 1648, '0376', '411523', '新县', '114.879239', '31.643918', 'district');
INSERT INTO `cyx_district` VALUES (1654, 1648, '0376', '411524', '商城县', '115.406862', '31.798377', 'district');
INSERT INTO `cyx_district` VALUES (1655, 1648, '0376', '411525', '固始县', '115.654481', '32.168137', 'district');
INSERT INTO `cyx_district` VALUES (1656, 1648, '0376', '411526', '潢川县', '115.051908', '32.131522', 'district');
INSERT INTO `cyx_district` VALUES (1657, 1648, '0376', '411527', '淮滨县', '115.419537', '32.473258', 'district');
INSERT INTO `cyx_district` VALUES (1658, 1648, '0376', '411528', '息县', '114.740456', '32.342792', 'district');
INSERT INTO `cyx_district` VALUES (1659, 1506, '0394', '411600', '周口市', '114.69695', '33.626149', 'city');
INSERT INTO `cyx_district` VALUES (1660, 1659, '0394', '411602', '川汇区', '114.650628', '33.647598', 'district');
INSERT INTO `cyx_district` VALUES (1661, 1659, '0394', '411621', '扶沟县', '114.394821', '34.059968', 'district');
INSERT INTO `cyx_district` VALUES (1662, 1659, '0394', '411622', '西华县', '114.529756', '33.767407', 'district');
INSERT INTO `cyx_district` VALUES (1663, 1659, '0394', '411623', '商水县', '114.611651', '33.542138', 'district');
INSERT INTO `cyx_district` VALUES (1664, 1659, '0394', '411624', '沈丘县', '115.098583', '33.409369', 'district');
INSERT INTO `cyx_district` VALUES (1665, 1659, '0394', '411625', '郸城县', '115.177188', '33.644743', 'district');
INSERT INTO `cyx_district` VALUES (1666, 1659, '0394', '411626', '淮阳县', '114.886153', '33.731561', 'district');
INSERT INTO `cyx_district` VALUES (1667, 1659, '0394', '411627', '太康县', '114.837888', '34.064463', 'district');
INSERT INTO `cyx_district` VALUES (1668, 1659, '0394', '411628', '鹿邑县', '115.484454', '33.86', 'district');
INSERT INTO `cyx_district` VALUES (1669, 1659, '0394', '411681', '项城市', '114.875333', '33.465838', 'district');
INSERT INTO `cyx_district` VALUES (1670, 1506, '0396', '411700', '驻马店市', '114.022247', '33.012885', 'city');
INSERT INTO `cyx_district` VALUES (1671, 1670, '0396', '411702', '驿城区', '113.993914', '32.973054', 'district');
INSERT INTO `cyx_district` VALUES (1672, 1670, '0396', '411721', '西平县', '114.021538', '33.387684', 'district');
INSERT INTO `cyx_district` VALUES (1673, 1670, '0396', '411722', '上蔡县', '114.264381', '33.262439', 'district');
INSERT INTO `cyx_district` VALUES (1674, 1670, '0396', '411723', '平舆县', '114.619159', '32.96271', 'district');
INSERT INTO `cyx_district` VALUES (1675, 1670, '0396', '411724', '正阳县', '114.392773', '32.605697', 'district');
INSERT INTO `cyx_district` VALUES (1676, 1670, '0396', '411725', '确山县', '114.026429', '32.802064', 'district');
INSERT INTO `cyx_district` VALUES (1677, 1670, '0396', '411726', '泌阳县', '113.327144', '32.723975', 'district');
INSERT INTO `cyx_district` VALUES (1678, 1670, '0396', '411727', '汝南县', '114.362379', '33.006729', 'district');
INSERT INTO `cyx_district` VALUES (1679, 1670, '0396', '411728', '遂平县', '114.013182', '33.145649', 'district');
INSERT INTO `cyx_district` VALUES (1680, 1670, '0396', '411729', '新蔡县', '114.96547', '32.744896', 'district');
INSERT INTO `cyx_district` VALUES (1681, 1506, '1391', '419001', '济源市', '112.602256', '35.067199', 'city');
INSERT INTO `cyx_district` VALUES (1682, 1681, '1391', '419001', '济源市', '112.602256', '35.067199', 'district');
INSERT INTO `cyx_district` VALUES (1683, 1, '0', '420000', '湖北省', '114.341745', '30.546557', 'province');
INSERT INTO `cyx_district` VALUES (1684, 1683, '027', '420100', '武汉市', '114.305469', '30.593175', 'city');
INSERT INTO `cyx_district` VALUES (1685, 1684, '027', '420102', '江岸区', '114.30911', '30.600052', 'district');
INSERT INTO `cyx_district` VALUES (1686, 1684, '027', '420103', '江汉区', '114.270867', '30.601475', 'district');
INSERT INTO `cyx_district` VALUES (1687, 1684, '027', '420104', '硚口区', '114.21492', '30.582202', 'district');
INSERT INTO `cyx_district` VALUES (1688, 1684, '027', '420105', '汉阳区', '114.21861', '30.553983', 'district');
INSERT INTO `cyx_district` VALUES (1689, 1684, '027', '420106', '武昌区', '114.31665', '30.554408', 'district');
INSERT INTO `cyx_district` VALUES (1690, 1684, '027', '420107', '青山区', '114.384968', '30.640191', 'district');
INSERT INTO `cyx_district` VALUES (1691, 1684, '027', '420111', '洪山区', '114.343796', '30.500247', 'district');
INSERT INTO `cyx_district` VALUES (1692, 1684, '027', '420112', '东西湖区', '114.137116', '30.619917', 'district');
INSERT INTO `cyx_district` VALUES (1693, 1684, '027', '420113', '汉南区', '114.084597', '30.308829', 'district');
INSERT INTO `cyx_district` VALUES (1694, 1684, '027', '420114', '蔡甸区', '114.087285', '30.536454', 'district');
INSERT INTO `cyx_district` VALUES (1695, 1684, '027', '420115', '江夏区', '114.319097', '30.376308', 'district');
INSERT INTO `cyx_district` VALUES (1696, 1684, '027', '420116', '黄陂区', '114.375725', '30.882174', 'district');
INSERT INTO `cyx_district` VALUES (1697, 1684, '027', '420117', '新洲区', '114.801096', '30.841425', 'district');
INSERT INTO `cyx_district` VALUES (1698, 1683, '0714', '420200', '黄石市', '115.038962', '30.201038', 'city');
INSERT INTO `cyx_district` VALUES (1699, 1698, '0714', '420202', '黄石港区', '115.065849', '30.222938', 'district');
INSERT INTO `cyx_district` VALUES (1700, 1698, '0714', '420203', '西塞山区', '115.109955', '30.204924', 'district');
INSERT INTO `cyx_district` VALUES (1701, 1698, '0714', '420204', '下陆区', '114.961327', '30.173912', 'district');
INSERT INTO `cyx_district` VALUES (1702, 1698, '0714', '420205', '铁山区', '114.891605', '30.203118', 'district');
INSERT INTO `cyx_district` VALUES (1703, 1698, '0714', '420222', '阳新县', '115.215227', '29.830257', 'district');
INSERT INTO `cyx_district` VALUES (1704, 1698, '0714', '420281', '大冶市', '114.980424', '30.096147', 'district');
INSERT INTO `cyx_district` VALUES (1705, 1683, '0719', '420300', '十堰市', '110.799291', '32.629462', 'city');
INSERT INTO `cyx_district` VALUES (1706, 1705, '0719', '420302', '茅箭区', '110.813719', '32.591904', 'district');
INSERT INTO `cyx_district` VALUES (1707, 1705, '0719', '420303', '张湾区', '110.769132', '32.652297', 'district');
INSERT INTO `cyx_district` VALUES (1708, 1705, '0719', '420304', '郧阳区', '110.81205', '32.834775', 'district');
INSERT INTO `cyx_district` VALUES (1709, 1705, '0719', '420322', '郧西县', '110.425983', '32.993182', 'district');
INSERT INTO `cyx_district` VALUES (1710, 1705, '0719', '420323', '竹山县', '110.228747', '32.224808', 'district');
INSERT INTO `cyx_district` VALUES (1711, 1705, '0719', '420324', '竹溪县', '109.715304', '32.318255', 'district');
INSERT INTO `cyx_district` VALUES (1712, 1705, '0719', '420325', '房县', '110.733181', '32.050378', 'district');
INSERT INTO `cyx_district` VALUES (1713, 1705, '0719', '420381', '丹江口市', '111.513127', '32.540157', 'district');
INSERT INTO `cyx_district` VALUES (1714, 1683, '0717', '420500', '宜昌市', '111.286445', '30.691865', 'city');
INSERT INTO `cyx_district` VALUES (1715, 1714, '0717', '420502', '西陵区', '111.285646', '30.710781', 'district');
INSERT INTO `cyx_district` VALUES (1716, 1714, '0717', '420503', '伍家岗区', '111.361037', '30.644334', 'district');
INSERT INTO `cyx_district` VALUES (1717, 1714, '0717', '420504', '点军区', '111.268119', '30.693247', 'district');
INSERT INTO `cyx_district` VALUES (1718, 1714, '0717', '420505', '猇亭区', '111.43462', '30.530903', 'district');
INSERT INTO `cyx_district` VALUES (1719, 1714, '0717', '420506', '夷陵区', '111.32638', '30.770006', 'district');
INSERT INTO `cyx_district` VALUES (1720, 1714, '0717', '420525', '远安县', '111.640508', '31.060869', 'district');
INSERT INTO `cyx_district` VALUES (1721, 1714, '0717', '420526', '兴山县', '110.746804', '31.348196', 'district');
INSERT INTO `cyx_district` VALUES (1722, 1714, '0717', '420527', '秭归县', '110.977711', '30.825897', 'district');
INSERT INTO `cyx_district` VALUES (1723, 1714, '0717', '420528', '长阳土家族自治县', '111.207242', '30.472763', 'district');
INSERT INTO `cyx_district` VALUES (1724, 1714, '0717', '420529', '五峰土家族自治县', '111.07374', '30.156741', 'district');
INSERT INTO `cyx_district` VALUES (1725, 1714, '0717', '420581', '宜都市', '111.450096', '30.378299', 'district');
INSERT INTO `cyx_district` VALUES (1726, 1714, '0717', '420582', '当阳市', '111.788312', '30.821266', 'district');
INSERT INTO `cyx_district` VALUES (1727, 1714, '0717', '420583', '枝江市', '111.76053', '30.42594', 'district');
INSERT INTO `cyx_district` VALUES (1728, 1683, '0710', '420600', '襄阳市', '112.122426', '32.009016', 'city');
INSERT INTO `cyx_district` VALUES (1729, 1728, '0710', '420602', '襄城区', '112.134052', '32.010366', 'district');
INSERT INTO `cyx_district` VALUES (1730, 1728, '0710', '420606', '樊城区', '112.135684', '32.044832', 'district');
INSERT INTO `cyx_district` VALUES (1731, 1728, '0710', '420607', '襄州区', '112.211982', '32.087127', 'district');
INSERT INTO `cyx_district` VALUES (1732, 1728, '0710', '420624', '南漳县', '111.838905', '31.774636', 'district');
INSERT INTO `cyx_district` VALUES (1733, 1728, '0710', '420625', '谷城县', '111.652982', '32.263849', 'district');
INSERT INTO `cyx_district` VALUES (1734, 1728, '0710', '420626', '保康县', '111.261308', '31.87831', 'district');
INSERT INTO `cyx_district` VALUES (1735, 1728, '0710', '420682', '老河口市', '111.683861', '32.359068', 'district');
INSERT INTO `cyx_district` VALUES (1736, 1728, '0710', '420683', '枣阳市', '112.771959', '32.128818', 'district');
INSERT INTO `cyx_district` VALUES (1737, 1728, '0710', '420684', '宜城市', '112.257788', '31.719806', 'district');
INSERT INTO `cyx_district` VALUES (1738, 1683, '0711', '420700', '鄂州市', '114.894935', '30.391141', 'city');
INSERT INTO `cyx_district` VALUES (1739, 1738, '0711', '420702', '梁子湖区', '114.684731', '30.100141', 'district');
INSERT INTO `cyx_district` VALUES (1740, 1738, '0711', '420703', '华容区', '114.729878', '30.534309', 'district');
INSERT INTO `cyx_district` VALUES (1741, 1738, '0711', '420704', '鄂城区', '114.891586', '30.400651', 'district');
INSERT INTO `cyx_district` VALUES (1742, 1683, '0724', '420800', '荆门市', '112.199427', '31.035395', 'city');
INSERT INTO `cyx_district` VALUES (1743, 1742, '0724', '420802', '东宝区', '112.201493', '31.051852', 'district');
INSERT INTO `cyx_district` VALUES (1744, 1742, '0724', '420804', '掇刀区', '112.207962', '30.973451', 'district');
INSERT INTO `cyx_district` VALUES (1745, 1742, '0724', '420821', '京山县', '113.119566', '31.018457', 'district');
INSERT INTO `cyx_district` VALUES (1746, 1742, '0724', '420822', '沙洋县', '112.588581', '30.709221', 'district');
INSERT INTO `cyx_district` VALUES (1747, 1742, '0724', '420881', '钟祥市', '112.58812', '31.167819', 'district');
INSERT INTO `cyx_district` VALUES (1748, 1683, '0712', '420900', '孝感市', '113.957037', '30.917766', 'city');
INSERT INTO `cyx_district` VALUES (1749, 1748, '0712', '420902', '孝南区', '113.910705', '30.916812', 'district');
INSERT INTO `cyx_district` VALUES (1750, 1748, '0712', '420921', '孝昌县', '113.998009', '31.258159', 'district');
INSERT INTO `cyx_district` VALUES (1751, 1748, '0712', '420922', '大悟县', '114.127022', '31.561164', 'district');
INSERT INTO `cyx_district` VALUES (1752, 1748, '0712', '420923', '云梦县', '113.753554', '31.020983', 'district');
INSERT INTO `cyx_district` VALUES (1753, 1748, '0712', '420981', '应城市', '113.572707', '30.92837', 'district');
INSERT INTO `cyx_district` VALUES (1754, 1748, '0712', '420982', '安陆市', '113.688941', '31.25561', 'district');
INSERT INTO `cyx_district` VALUES (1755, 1748, '0712', '420984', '汉川市', '113.839149', '30.661243', 'district');
INSERT INTO `cyx_district` VALUES (1756, 1683, '0716', '421000', '荆州市', '112.239746', '30.335184', 'city');
INSERT INTO `cyx_district` VALUES (1757, 1756, '0716', '421002', '沙市区', '112.25193', '30.326009', 'district');
INSERT INTO `cyx_district` VALUES (1758, 1756, '0716', '421003', '荆州区', '112.190185', '30.352853', 'district');
INSERT INTO `cyx_district` VALUES (1759, 1756, '0716', '421022', '公安县', '112.229648', '30.058336', 'district');
INSERT INTO `cyx_district` VALUES (1760, 1756, '0716', '421023', '监利县', '112.904788', '29.840179', 'district');
INSERT INTO `cyx_district` VALUES (1761, 1756, '0716', '421024', '江陵县', '112.424664', '30.041822', 'district');
INSERT INTO `cyx_district` VALUES (1762, 1756, '0716', '421081', '石首市', '112.425454', '29.720938', 'district');
INSERT INTO `cyx_district` VALUES (1763, 1756, '0716', '421083', '洪湖市', '113.475801', '29.826916', 'district');
INSERT INTO `cyx_district` VALUES (1764, 1756, '0716', '421087', '松滋市', '111.756781', '30.174529', 'district');
INSERT INTO `cyx_district` VALUES (1765, 1683, '0713', '421100', '黄冈市', '114.872199', '30.453667', 'city');
INSERT INTO `cyx_district` VALUES (1766, 1765, '0713', '421102', '黄州区', '114.880104', '30.434354', 'district');
INSERT INTO `cyx_district` VALUES (1767, 1765, '0713', '421121', '团风县', '114.872191', '30.643569', 'district');
INSERT INTO `cyx_district` VALUES (1768, 1765, '0713', '421122', '红安县', '114.618236', '31.288153', 'district');
INSERT INTO `cyx_district` VALUES (1769, 1765, '0713', '421123', '罗田县', '115.399222', '30.78429', 'district');
INSERT INTO `cyx_district` VALUES (1770, 1765, '0713', '421124', '英山县', '115.681359', '30.735157', 'district');
INSERT INTO `cyx_district` VALUES (1771, 1765, '0713', '421125', '浠水县', '115.265355', '30.452115', 'district');
INSERT INTO `cyx_district` VALUES (1772, 1765, '0713', '421126', '蕲春县', '115.437007', '30.225964', 'district');
INSERT INTO `cyx_district` VALUES (1773, 1765, '0713', '421127', '黄梅县', '115.944219', '30.070453', 'district');
INSERT INTO `cyx_district` VALUES (1774, 1765, '0713', '421181', '麻城市', '115.008163', '31.172739', 'district');
INSERT INTO `cyx_district` VALUES (1775, 1765, '0713', '421182', '武穴市', '115.561217', '29.844107', 'district');
INSERT INTO `cyx_district` VALUES (1776, 1683, '0715', '421200', '咸宁市', '114.322616', '29.841362', 'city');
INSERT INTO `cyx_district` VALUES (1777, 1776, '0715', '421202', '咸安区', '114.298711', '29.852891', 'district');
INSERT INTO `cyx_district` VALUES (1778, 1776, '0715', '421221', '嘉鱼县', '113.939271', '29.970676', 'district');
INSERT INTO `cyx_district` VALUES (1779, 1776, '0715', '421222', '通城县', '113.816966', '29.245269', 'district');
INSERT INTO `cyx_district` VALUES (1780, 1776, '0715', '421223', '崇阳县', '114.039523', '29.556688', 'district');
INSERT INTO `cyx_district` VALUES (1781, 1776, '0715', '421224', '通山县', '114.482622', '29.606372', 'district');
INSERT INTO `cyx_district` VALUES (1782, 1776, '0715', '421281', '赤壁市', '113.90038', '29.725184', 'district');
INSERT INTO `cyx_district` VALUES (1783, 1683, '0722', '421300', '随州市', '113.382515', '31.690191', 'city');
INSERT INTO `cyx_district` VALUES (1784, 1783, '0722', '421303', '曾都区', '113.37112', '31.71628', 'district');
INSERT INTO `cyx_district` VALUES (1785, 1783, '0722', '421321', '随县', '113.290634', '31.883739', 'district');
INSERT INTO `cyx_district` VALUES (1786, 1783, '0722', '421381', '广水市', '113.825889', '31.616853', 'district');
INSERT INTO `cyx_district` VALUES (1787, 1683, '0718', '422800', '恩施土家族苗族自治州', '109.488172', '30.272156', 'city');
INSERT INTO `cyx_district` VALUES (1788, 1787, '0718', '422801', '恩施市', '109.479664', '30.29468', 'district');
INSERT INTO `cyx_district` VALUES (1789, 1787, '0718', '422802', '利川市', '108.936452', '30.29098', 'district');
INSERT INTO `cyx_district` VALUES (1790, 1787, '0718', '422822', '建始县', '109.722109', '30.602129', 'district');
INSERT INTO `cyx_district` VALUES (1791, 1787, '0718', '422823', '巴东县', '110.340756', '31.042324', 'district');
INSERT INTO `cyx_district` VALUES (1792, 1787, '0718', '422825', '宣恩县', '109.489926', '29.98692', 'district');
INSERT INTO `cyx_district` VALUES (1793, 1787, '0718', '422826', '咸丰县', '109.139726', '29.665202', 'district');
INSERT INTO `cyx_district` VALUES (1794, 1787, '0718', '422827', '来凤县', '109.407828', '29.493484', 'district');
INSERT INTO `cyx_district` VALUES (1795, 1787, '0718', '422828', '鹤峰县', '110.033662', '29.890171', 'district');
INSERT INTO `cyx_district` VALUES (1796, 1683, '2728', '429005', '潜江市', '112.899762', '30.402167', 'city');
INSERT INTO `cyx_district` VALUES (1797, 1796, '2728', '429005', '潜江市', '112.899762', '30.402167', 'district');
INSERT INTO `cyx_district` VALUES (1798, 1683, '1719', '429021', '神农架林区', '110.675743', '31.744915', 'city');
INSERT INTO `cyx_district` VALUES (1799, 1798, '1719', '429021', '神农架林区', '110.675743', '31.744915', 'district');
INSERT INTO `cyx_district` VALUES (1800, 1683, '1728', '429006', '天门市', '113.166078', '30.663337', 'city');
INSERT INTO `cyx_district` VALUES (1801, 1800, '1728', '429006', '天门市', '113.166078', '30.663337', 'district');
INSERT INTO `cyx_district` VALUES (1802, 1683, '0728', '429004', '仙桃市', '113.423583', '30.361438', 'city');
INSERT INTO `cyx_district` VALUES (1803, 1802, '0728', '429004', '仙桃市', '113.423583', '30.361438', 'district');
INSERT INTO `cyx_district` VALUES (1804, 1, '0', '430000', '湖南省', '112.9836', '28.112743', 'province');
INSERT INTO `cyx_district` VALUES (1805, 1804, '0731', '430100', '长沙市', '112.938884', '28.22808', 'city');
INSERT INTO `cyx_district` VALUES (1806, 1805, '0731', '430102', '芙蓉区', '113.032539', '28.185389', 'district');
INSERT INTO `cyx_district` VALUES (1807, 1805, '0731', '430103', '天心区', '112.989897', '28.114526', 'district');
INSERT INTO `cyx_district` VALUES (1808, 1805, '0731', '430104', '岳麓区', '112.93132', '28.234538', 'district');
INSERT INTO `cyx_district` VALUES (1809, 1805, '0731', '430105', '开福区', '112.985884', '28.256298', 'district');
INSERT INTO `cyx_district` VALUES (1810, 1805, '0731', '430111', '雨花区', '113.03826', '28.135722', 'district');
INSERT INTO `cyx_district` VALUES (1811, 1805, '0731', '430112', '望城区', '112.831176', '28.353434', 'district');
INSERT INTO `cyx_district` VALUES (1812, 1805, '0731', '430121', '长沙县', '113.081097', '28.246918', 'district');
INSERT INTO `cyx_district` VALUES (1813, 1805, '0731', '430124', '宁乡县', '112.551885', '28.277483', 'district');
INSERT INTO `cyx_district` VALUES (1814, 1805, '0731', '430181', '浏阳市', '113.643076', '28.162833', 'district');
INSERT INTO `cyx_district` VALUES (1815, 1804, '0733', '430200', '株洲市', '113.133853', '27.827986', 'city');
INSERT INTO `cyx_district` VALUES (1816, 1815, '0733', '430202', '荷塘区', '113.173487', '27.855928', 'district');
INSERT INTO `cyx_district` VALUES (1817, 1815, '0733', '430203', '芦淞区', '113.152724', '27.78507', 'district');
INSERT INTO `cyx_district` VALUES (1818, 1815, '0733', '430204', '石峰区', '113.117731', '27.875445', 'district');
INSERT INTO `cyx_district` VALUES (1819, 1815, '0733', '430211', '天元区', '113.082216', '27.826866', 'district');
INSERT INTO `cyx_district` VALUES (1820, 1815, '0733', '430221', '株洲县', '113.144109', '27.699232', 'district');
INSERT INTO `cyx_district` VALUES (1821, 1815, '0733', '430223', '攸县', '113.396385', '27.014583', 'district');
INSERT INTO `cyx_district` VALUES (1822, 1815, '0733', '430224', '茶陵县', '113.539094', '26.777521', 'district');
INSERT INTO `cyx_district` VALUES (1823, 1815, '0733', '430225', '炎陵县', '113.772655', '26.489902', 'district');
INSERT INTO `cyx_district` VALUES (1824, 1815, '0733', '430281', '醴陵市', '113.496999', '27.646096', 'district');
INSERT INTO `cyx_district` VALUES (1825, 1804, '0732', '430300', '湘潭市', '112.944026', '27.829795', 'city');
INSERT INTO `cyx_district` VALUES (1826, 1825, '0732', '430302', '雨湖区', '112.907162', '27.856325', 'district');
INSERT INTO `cyx_district` VALUES (1827, 1825, '0732', '430304', '岳塘区', '112.969479', '27.872028', 'district');
INSERT INTO `cyx_district` VALUES (1828, 1825, '0732', '430321', '湘潭县', '112.950831', '27.778958', 'district');
INSERT INTO `cyx_district` VALUES (1829, 1825, '0732', '430381', '湘乡市', '112.550205', '27.718549', 'district');
INSERT INTO `cyx_district` VALUES (1830, 1825, '0732', '430382', '韶山市', '112.52667', '27.915008', 'district');
INSERT INTO `cyx_district` VALUES (1831, 1804, '0734', '430400', '衡阳市', '112.572018', '26.893368', 'city');
INSERT INTO `cyx_district` VALUES (1832, 1831, '0734', '430405', '珠晖区', '112.620209', '26.894765', 'district');
INSERT INTO `cyx_district` VALUES (1833, 1831, '0734', '430406', '雁峰区', '112.6154', '26.840602', 'district');
INSERT INTO `cyx_district` VALUES (1834, 1831, '0734', '430407', '石鼓区', '112.597992', '26.943755', 'district');
INSERT INTO `cyx_district` VALUES (1835, 1831, '0734', '430408', '蒸湘区', '112.567107', '26.911854', 'district');
INSERT INTO `cyx_district` VALUES (1836, 1831, '0734', '430412', '南岳区', '112.738604', '27.232443', 'district');
INSERT INTO `cyx_district` VALUES (1837, 1831, '0734', '430421', '衡阳县', '112.370546', '26.969577', 'district');
INSERT INTO `cyx_district` VALUES (1838, 1831, '0734', '430422', '衡南县', '112.677877', '26.738247', 'district');
INSERT INTO `cyx_district` VALUES (1839, 1831, '0734', '430423', '衡山县', '112.868268', '27.23029', 'district');
INSERT INTO `cyx_district` VALUES (1840, 1831, '0734', '430424', '衡东县', '112.953168', '27.08117', 'district');
INSERT INTO `cyx_district` VALUES (1841, 1831, '0734', '430426', '祁东县', '112.090356', '26.799896', 'district');
INSERT INTO `cyx_district` VALUES (1842, 1831, '0734', '430481', '耒阳市', '112.859759', '26.422277', 'district');
INSERT INTO `cyx_district` VALUES (1843, 1831, '0734', '430482', '常宁市', '112.399878', '26.421956', 'district');
INSERT INTO `cyx_district` VALUES (1844, 1804, '0739', '430500', '邵阳市', '111.467674', '27.23895', 'city');
INSERT INTO `cyx_district` VALUES (1845, 1844, '0739', '430502', '双清区', '111.496341', '27.232708', 'district');
INSERT INTO `cyx_district` VALUES (1846, 1844, '0739', '430503', '大祥区', '111.439091', '27.221452', 'district');
INSERT INTO `cyx_district` VALUES (1847, 1844, '0739', '430511', '北塔区', '111.452196', '27.246489', 'district');
INSERT INTO `cyx_district` VALUES (1848, 1844, '0739', '430521', '邵东县', '111.74427', '27.258987', 'district');
INSERT INTO `cyx_district` VALUES (1849, 1844, '0739', '430522', '新邵县', '111.458656', '27.320917', 'district');
INSERT INTO `cyx_district` VALUES (1850, 1844, '0739', '430523', '邵阳县', '111.273805', '26.990637', 'district');
INSERT INTO `cyx_district` VALUES (1851, 1844, '0739', '430524', '隆回县', '111.032437', '27.113978', 'district');
INSERT INTO `cyx_district` VALUES (1852, 1844, '0739', '430525', '洞口县', '110.575846', '27.06032', 'district');
INSERT INTO `cyx_district` VALUES (1853, 1844, '0739', '430527', '绥宁县', '110.155655', '26.581954', 'district');
INSERT INTO `cyx_district` VALUES (1854, 1844, '0739', '430528', '新宁县', '110.856988', '26.433367', 'district');
INSERT INTO `cyx_district` VALUES (1855, 1844, '0739', '430529', '城步苗族自治县', '110.322239', '26.390598', 'district');
INSERT INTO `cyx_district` VALUES (1856, 1844, '0739', '430581', '武冈市', '110.631884', '26.726599', 'district');
INSERT INTO `cyx_district` VALUES (1857, 1804, '0730', '430600', '岳阳市', '113.12873', '29.356803', 'city');
INSERT INTO `cyx_district` VALUES (1858, 1857, '0730', '430602', '岳阳楼区', '113.129684', '29.371814', 'district');
INSERT INTO `cyx_district` VALUES (1859, 1857, '0730', '430603', '云溪区', '113.272312', '29.472745', 'district');
INSERT INTO `cyx_district` VALUES (1860, 1857, '0730', '430611', '君山区', '113.006435', '29.461106', 'district');
INSERT INTO `cyx_district` VALUES (1861, 1857, '0730', '430621', '岳阳县', '113.116418', '29.144066', 'district');
INSERT INTO `cyx_district` VALUES (1862, 1857, '0730', '430623', '华容县', '112.540463', '29.531057', 'district');
INSERT INTO `cyx_district` VALUES (1863, 1857, '0730', '430624', '湘阴县', '112.909426', '28.689104', 'district');
INSERT INTO `cyx_district` VALUES (1864, 1857, '0730', '430626', '平江县', '113.581234', '28.701868', 'district');
INSERT INTO `cyx_district` VALUES (1865, 1857, '0730', '430681', '汨罗市', '113.067251', '28.806881', 'district');
INSERT INTO `cyx_district` VALUES (1866, 1857, '0730', '430682', '临湘市', '113.450423', '29.476849', 'district');
INSERT INTO `cyx_district` VALUES (1867, 1804, '0736', '430700', '常德市', '111.698784', '29.031654', 'city');
INSERT INTO `cyx_district` VALUES (1868, 1867, '0736', '430702', '武陵区', '111.683153', '29.055163', 'district');
INSERT INTO `cyx_district` VALUES (1869, 1867, '0736', '430703', '鼎城区', '111.680783', '29.018593', 'district');
INSERT INTO `cyx_district` VALUES (1870, 1867, '0736', '430721', '安乡县', '112.171131', '29.411309', 'district');
INSERT INTO `cyx_district` VALUES (1871, 1867, '0736', '430722', '汉寿县', '111.970514', '28.906106', 'district');
INSERT INTO `cyx_district` VALUES (1872, 1867, '0736', '430723', '澧县', '111.758702', '29.633236', 'district');
INSERT INTO `cyx_district` VALUES (1873, 1867, '0736', '430724', '临澧县', '111.647517', '29.440793', 'district');
INSERT INTO `cyx_district` VALUES (1874, 1867, '0736', '430725', '桃源县', '111.488925', '28.902503', 'district');
INSERT INTO `cyx_district` VALUES (1875, 1867, '0736', '430726', '石门县', '111.380014', '29.584292', 'district');
INSERT INTO `cyx_district` VALUES (1876, 1867, '0736', '430781', '津市市', '111.877499', '29.60548', 'district');
INSERT INTO `cyx_district` VALUES (1877, 1804, '0744', '430800', '张家界市', '110.479148', '29.117013', 'city');
INSERT INTO `cyx_district` VALUES (1878, 1877, '0744', '430802', '永定区', '110.537138', '29.119855', 'district');
INSERT INTO `cyx_district` VALUES (1879, 1877, '0744', '430811', '武陵源区', '110.550433', '29.34573', 'district');
INSERT INTO `cyx_district` VALUES (1880, 1877, '0744', '430821', '慈利县', '111.139775', '29.429999', 'district');
INSERT INTO `cyx_district` VALUES (1881, 1877, '0744', '430822', '桑植县', '110.204652', '29.414111', 'district');
INSERT INTO `cyx_district` VALUES (1882, 1804, '0737', '430900', '益阳市', '112.355129', '28.554349', 'city');
INSERT INTO `cyx_district` VALUES (1883, 1882, '0737', '430902', '资阳区', '112.324272', '28.59111', 'district');
INSERT INTO `cyx_district` VALUES (1884, 1882, '0737', '430903', '赫山区', '112.374145', '28.579494', 'district');
INSERT INTO `cyx_district` VALUES (1885, 1882, '0737', '430921', '南县', '112.396337', '29.362275', 'district');
INSERT INTO `cyx_district` VALUES (1886, 1882, '0737', '430922', '桃江县', '112.155822', '28.518084', 'district');
INSERT INTO `cyx_district` VALUES (1887, 1882, '0737', '430923', '安化县', '111.212846', '28.374107', 'district');
INSERT INTO `cyx_district` VALUES (1888, 1882, '0737', '430981', '沅江市', '112.355954', '28.847045', 'district');
INSERT INTO `cyx_district` VALUES (1889, 1804, '0735', '431000', '郴州市', '113.014984', '25.770532', 'city');
INSERT INTO `cyx_district` VALUES (1890, 1889, '0735', '431002', '北湖区', '113.011035', '25.784054', 'district');
INSERT INTO `cyx_district` VALUES (1891, 1889, '0735', '431003', '苏仙区', '113.112105', '25.797013', 'district');
INSERT INTO `cyx_district` VALUES (1892, 1889, '0735', '431021', '桂阳县', '112.734173', '25.754172', 'district');
INSERT INTO `cyx_district` VALUES (1893, 1889, '0735', '431022', '宜章县', '112.948712', '25.399938', 'district');
INSERT INTO `cyx_district` VALUES (1894, 1889, '0735', '431023', '永兴县', '113.116527', '26.12715', 'district');
INSERT INTO `cyx_district` VALUES (1895, 1889, '0735', '431024', '嘉禾县', '112.36902', '25.587519', 'district');
INSERT INTO `cyx_district` VALUES (1896, 1889, '0735', '431025', '临武县', '112.563456', '25.27556', 'district');
INSERT INTO `cyx_district` VALUES (1897, 1889, '0735', '431026', '汝城县', '113.684727', '25.532816', 'district');
INSERT INTO `cyx_district` VALUES (1898, 1889, '0735', '431027', '桂东县', '113.944614', '26.077616', 'district');
INSERT INTO `cyx_district` VALUES (1899, 1889, '0735', '431028', '安仁县', '113.26932', '26.709061', 'district');
INSERT INTO `cyx_district` VALUES (1900, 1889, '0735', '431081', '资兴市', '113.236146', '25.976243', 'district');
INSERT INTO `cyx_district` VALUES (1901, 1804, '0746', '431100', '永州市', '111.613418', '26.419641', 'city');
INSERT INTO `cyx_district` VALUES (1902, 1901, '0746', '431102', '零陵区', '111.631109', '26.221936', 'district');
INSERT INTO `cyx_district` VALUES (1903, 1901, '0746', '431103', '冷水滩区', '111.592343', '26.46128', 'district');
INSERT INTO `cyx_district` VALUES (1904, 1901, '0746', '431121', '祁阳县', '111.840657', '26.58012', 'district');
INSERT INTO `cyx_district` VALUES (1905, 1901, '0746', '431122', '东安县', '111.316464', '26.392183', 'district');
INSERT INTO `cyx_district` VALUES (1906, 1901, '0746', '431123', '双牌县', '111.659967', '25.961909', 'district');
INSERT INTO `cyx_district` VALUES (1907, 1901, '0746', '431124', '道县', '111.600795', '25.526437', 'district');
INSERT INTO `cyx_district` VALUES (1908, 1901, '0746', '431125', '江永县', '111.343911', '25.273539', 'district');
INSERT INTO `cyx_district` VALUES (1909, 1901, '0746', '431126', '宁远县', '111.945844', '25.570888', 'district');
INSERT INTO `cyx_district` VALUES (1910, 1901, '0746', '431127', '蓝山县', '112.196567', '25.369725', 'district');
INSERT INTO `cyx_district` VALUES (1911, 1901, '0746', '431128', '新田县', '112.203287', '25.904305', 'district');
INSERT INTO `cyx_district` VALUES (1912, 1901, '0746', '431129', '江华瑶族自治县', '111.579535', '25.185809', 'district');
INSERT INTO `cyx_district` VALUES (1913, 1804, '0745', '431200', '怀化市', '110.001923', '27.569517', 'city');
INSERT INTO `cyx_district` VALUES (1914, 1913, '0745', '431202', '鹤城区', '110.040315', '27.578926', 'district');
INSERT INTO `cyx_district` VALUES (1915, 1913, '0745', '431221', '中方县', '109.944711', '27.440138', 'district');
INSERT INTO `cyx_district` VALUES (1916, 1913, '0745', '431222', '沅陵县', '110.393844', '28.452686', 'district');
INSERT INTO `cyx_district` VALUES (1917, 1913, '0745', '431223', '辰溪县', '110.183917', '28.006336', 'district');
INSERT INTO `cyx_district` VALUES (1918, 1913, '0745', '431224', '溆浦县', '110.594879', '27.908267', 'district');
INSERT INTO `cyx_district` VALUES (1919, 1913, '0745', '431225', '会同县', '109.735661', '26.887238', 'district');
INSERT INTO `cyx_district` VALUES (1920, 1913, '0745', '431226', '麻阳苗族自治县', '109.81701', '27.857569', 'district');
INSERT INTO `cyx_district` VALUES (1921, 1913, '0745', '431227', '新晃侗族自治县', '109.174932', '27.352673', 'district');
INSERT INTO `cyx_district` VALUES (1922, 1913, '0745', '431228', '芷江侗族自治县', '109.684629', '27.443499', 'district');
INSERT INTO `cyx_district` VALUES (1923, 1913, '0745', '431229', '靖州苗族侗族自治县', '109.696273', '26.575107', 'district');
INSERT INTO `cyx_district` VALUES (1924, 1913, '0745', '431230', '通道侗族自治县', '109.784412', '26.158054', 'district');
INSERT INTO `cyx_district` VALUES (1925, 1913, '0745', '431281', '洪江市', '109.836669', '27.208609', 'district');
INSERT INTO `cyx_district` VALUES (1926, 1804, '0738', '431300', '娄底市', '111.994482', '27.70027', 'city');
INSERT INTO `cyx_district` VALUES (1927, 1926, '0738', '431302', '娄星区', '112.001914', '27.729863', 'district');
INSERT INTO `cyx_district` VALUES (1928, 1926, '0738', '431321', '双峰县', '112.175163', '27.457172', 'district');
INSERT INTO `cyx_district` VALUES (1929, 1926, '0738', '431322', '新化县', '111.327412', '27.726514', 'district');
INSERT INTO `cyx_district` VALUES (1930, 1926, '0738', '431381', '冷水江市', '111.434984', '27.686251', 'district');
INSERT INTO `cyx_district` VALUES (1931, 1926, '0738', '431382', '涟源市', '111.664329', '27.692577', 'district');
INSERT INTO `cyx_district` VALUES (1932, 1804, '0743', '433100', '湘西土家族苗族自治州', '109.738906', '28.31195', 'city');
INSERT INTO `cyx_district` VALUES (1933, 1932, '0743', '433101', '吉首市', '109.698015', '28.262376', 'district');
INSERT INTO `cyx_district` VALUES (1934, 1932, '0743', '433122', '泸溪县', '110.21961', '28.216641', 'district');
INSERT INTO `cyx_district` VALUES (1935, 1932, '0743', '433123', '凤凰县', '109.581083', '27.958081', 'district');
INSERT INTO `cyx_district` VALUES (1936, 1932, '0743', '433124', '花垣县', '109.482078', '28.572029', 'district');
INSERT INTO `cyx_district` VALUES (1937, 1932, '0743', '433125', '保靖县', '109.660559', '28.699878', 'district');
INSERT INTO `cyx_district` VALUES (1938, 1932, '0743', '433126', '古丈县', '109.950728', '28.616935', 'district');
INSERT INTO `cyx_district` VALUES (1939, 1932, '0743', '433127', '永顺县', '109.856933', '28.979955', 'district');
INSERT INTO `cyx_district` VALUES (1940, 1932, '0743', '433130', '龙山县', '109.443938', '29.457663', 'district');
INSERT INTO `cyx_district` VALUES (1941, 1, '0', '440000', '广东省', '113.26641', '23.132324', 'province');
INSERT INTO `cyx_district` VALUES (1942, 1941, '020', '440100', '广州市', '113.264385', '23.12911', 'city');
INSERT INTO `cyx_district` VALUES (1943, 1942, '020', '440103', '荔湾区', '113.244258', '23.125863', 'district');
INSERT INTO `cyx_district` VALUES (1944, 1942, '020', '440104', '越秀区', '113.266835', '23.128537', 'district');
INSERT INTO `cyx_district` VALUES (1945, 1942, '020', '440105', '海珠区', '113.317443', '23.083788', 'district');
INSERT INTO `cyx_district` VALUES (1946, 1942, '020', '440106', '天河区', '113.361575', '23.124807', 'district');
INSERT INTO `cyx_district` VALUES (1947, 1942, '020', '440111', '白云区', '113.273238', '23.157367', 'district');
INSERT INTO `cyx_district` VALUES (1948, 1942, '020', '440112', '黄埔区', '113.480541', '23.181706', 'district');
INSERT INTO `cyx_district` VALUES (1949, 1942, '020', '440113', '番禺区', '113.384152', '22.937556', 'district');
INSERT INTO `cyx_district` VALUES (1950, 1942, '020', '440114', '花都区', '113.220463', '23.403744', 'district');
INSERT INTO `cyx_district` VALUES (1951, 1942, '020', '440115', '南沙区', '113.525165', '22.801624', 'district');
INSERT INTO `cyx_district` VALUES (1952, 1942, '020', '440117', '从化区', '113.586679', '23.548748', 'district');
INSERT INTO `cyx_district` VALUES (1953, 1942, '020', '440118', '增城区', '113.810627', '23.261465', 'district');
INSERT INTO `cyx_district` VALUES (1954, 1941, '0751', '440200', '韶关市', '113.59762', '24.810879', 'city');
INSERT INTO `cyx_district` VALUES (1955, 1954, '0751', '440203', '武江区', '113.587756', '24.792926', 'district');
INSERT INTO `cyx_district` VALUES (1956, 1954, '0751', '440204', '浈江区', '113.611098', '24.804381', 'district');
INSERT INTO `cyx_district` VALUES (1957, 1954, '0751', '440205', '曲江区', '113.604535', '24.682501', 'district');
INSERT INTO `cyx_district` VALUES (1958, 1954, '0751', '440222', '始兴县', '114.061789', '24.952976', 'district');
INSERT INTO `cyx_district` VALUES (1959, 1954, '0751', '440224', '仁化县', '113.749027', '25.085621', 'district');
INSERT INTO `cyx_district` VALUES (1960, 1954, '0751', '440229', '翁源县', '114.130342', '24.350346', 'district');
INSERT INTO `cyx_district` VALUES (1961, 1954, '0751', '440232', '乳源瑶族自治县', '113.275883', '24.776078', 'district');
INSERT INTO `cyx_district` VALUES (1962, 1954, '0751', '440233', '新丰县', '114.206867', '24.05976', 'district');
INSERT INTO `cyx_district` VALUES (1963, 1954, '0751', '440281', '乐昌市', '113.347545', '25.130602', 'district');
INSERT INTO `cyx_district` VALUES (1964, 1954, '0751', '440282', '南雄市', '114.311982', '25.117753', 'district');
INSERT INTO `cyx_district` VALUES (1965, 1941, '0755', '440300', '深圳市', '114.057939', '22.543527', 'city');
INSERT INTO `cyx_district` VALUES (1966, 1965, '0755', '440303', '罗湖区', '114.131459', '22.548389', 'district');
INSERT INTO `cyx_district` VALUES (1967, 1965, '0755', '440304', '福田区', '114.055072', '22.521521', 'district');
INSERT INTO `cyx_district` VALUES (1968, 1965, '0755', '440305', '南山区', '113.930413', '22.533287', 'district');
INSERT INTO `cyx_district` VALUES (1969, 1965, '0755', '440306', '宝安区', '113.883802', '22.554996', 'district');
INSERT INTO `cyx_district` VALUES (1970, 1965, '0755', '440307', '龙岗区', '114.246899', '22.720974', 'district');
INSERT INTO `cyx_district` VALUES (1971, 1965, '0755', '440308', '盐田区', '114.236739', '22.557001', 'district');
INSERT INTO `cyx_district` VALUES (1972, 1965, '0755', '440309', '龙华区', '114.045422', '22.696667', 'district');
INSERT INTO `cyx_district` VALUES (1973, 1965, '0755', '440310', '坪山区', '114.350584', '22.708881', 'district');
INSERT INTO `cyx_district` VALUES (1974, 1941, '0756', '440400', '珠海市', '113.576677', '22.270978', 'city');
INSERT INTO `cyx_district` VALUES (1975, 1974, '0756', '440402', '香洲区', '113.543784', '22.265811', 'district');
INSERT INTO `cyx_district` VALUES (1976, 1974, '0756', '440403', '斗门区', '113.296467', '22.2092', 'district');
INSERT INTO `cyx_district` VALUES (1977, 1974, '0756', '440404', '金湾区', '113.362656', '22.147471', 'district');
INSERT INTO `cyx_district` VALUES (1978, 1941, '0754', '440500', '汕头市', '116.681972', '23.354091', 'city');
INSERT INTO `cyx_district` VALUES (1979, 1978, '0754', '440507', '龙湖区', '116.716446', '23.372254', 'district');
INSERT INTO `cyx_district` VALUES (1980, 1978, '0754', '440511', '金平区', '116.70345', '23.365556', 'district');
INSERT INTO `cyx_district` VALUES (1981, 1978, '0754', '440512', '濠江区', '116.726973', '23.286079', 'district');
INSERT INTO `cyx_district` VALUES (1982, 1978, '0754', '440513', '潮阳区', '116.601509', '23.265356', 'district');
INSERT INTO `cyx_district` VALUES (1983, 1978, '0754', '440514', '潮南区', '116.439178', '23.23865', 'district');
INSERT INTO `cyx_district` VALUES (1984, 1978, '0754', '440515', '澄海区', '116.755992', '23.466709', 'district');
INSERT INTO `cyx_district` VALUES (1985, 1978, '0754', '440523', '南澳县', '117.023374', '23.421724', 'district');
INSERT INTO `cyx_district` VALUES (1986, 1941, '0757', '440600', '佛山市', '113.121435', '23.021478', 'city');
INSERT INTO `cyx_district` VALUES (1987, 1986, '0757', '440604', '禅城区', '113.122421', '23.009551', 'district');
INSERT INTO `cyx_district` VALUES (1988, 1986, '0757', '440605', '南海区', '113.143441', '23.028956', 'district');
INSERT INTO `cyx_district` VALUES (1989, 1986, '0757', '440606', '顺德区', '113.293359', '22.80524', 'district');
INSERT INTO `cyx_district` VALUES (1990, 1986, '0757', '440607', '三水区', '112.896685', '23.155931', 'district');
INSERT INTO `cyx_district` VALUES (1991, 1986, '0757', '440608', '高明区', '112.892585', '22.900139', 'district');
INSERT INTO `cyx_district` VALUES (1992, 1941, '0750', '440700', '江门市', '113.081542', '22.57899', 'city');
INSERT INTO `cyx_district` VALUES (1993, 1992, '0750', '440703', '蓬江区', '113.078521', '22.595149', 'district');
INSERT INTO `cyx_district` VALUES (1994, 1992, '0750', '440704', '江海区', '113.111612', '22.560473', 'district');
INSERT INTO `cyx_district` VALUES (1995, 1992, '0750', '440705', '新会区', '113.034187', '22.4583', 'district');
INSERT INTO `cyx_district` VALUES (1996, 1992, '0750', '440781', '台山市', '112.794065', '22.251924', 'district');
INSERT INTO `cyx_district` VALUES (1997, 1992, '0750', '440783', '开平市', '112.698545', '22.376395', 'district');
INSERT INTO `cyx_district` VALUES (1998, 1992, '0750', '440784', '鹤山市', '112.964252', '22.76545', 'district');
INSERT INTO `cyx_district` VALUES (1999, 1992, '0750', '440785', '恩平市', '112.305145', '22.183206', 'district');
INSERT INTO `cyx_district` VALUES (2000, 1941, '0759', '440800', '湛江市', '110.356639', '21.270145', 'city');
INSERT INTO `cyx_district` VALUES (2001, 2000, '0759', '440802', '赤坎区', '110.365899', '21.266119', 'district');
INSERT INTO `cyx_district` VALUES (2002, 2000, '0759', '440803', '霞山区', '110.397656', '21.192457', 'district');
INSERT INTO `cyx_district` VALUES (2003, 2000, '0759', '440804', '坡头区', '110.455332', '21.244721', 'district');
INSERT INTO `cyx_district` VALUES (2004, 2000, '0759', '440811', '麻章区', '110.334387', '21.263442', 'district');
INSERT INTO `cyx_district` VALUES (2005, 2000, '0759', '440823', '遂溪县', '110.250123', '21.377246', 'district');
INSERT INTO `cyx_district` VALUES (2006, 2000, '0759', '440825', '徐闻县', '110.176749', '20.325489', 'district');
INSERT INTO `cyx_district` VALUES (2007, 2000, '0759', '440881', '廉江市', '110.286208', '21.6097', 'district');
INSERT INTO `cyx_district` VALUES (2008, 2000, '0759', '440882', '雷州市', '110.096586', '20.914178', 'district');
INSERT INTO `cyx_district` VALUES (2009, 2000, '0759', '440883', '吴川市', '110.778411', '21.441808', 'district');
INSERT INTO `cyx_district` VALUES (2010, 1941, '0668', '440900', '茂名市', '110.925439', '21.662991', 'city');
INSERT INTO `cyx_district` VALUES (2011, 2010, '0668', '440902', '茂南区', '110.918026', '21.641337', 'district');
INSERT INTO `cyx_district` VALUES (2012, 2010, '0668', '440904', '电白区', '111.013556', '21.514163', 'district');
INSERT INTO `cyx_district` VALUES (2013, 2010, '0668', '440981', '高州市', '110.853299', '21.918203', 'district');
INSERT INTO `cyx_district` VALUES (2014, 2010, '0668', '440982', '化州市', '110.639565', '21.66463', 'district');
INSERT INTO `cyx_district` VALUES (2015, 2010, '0668', '440983', '信宜市', '110.947043', '22.354385', 'district');
INSERT INTO `cyx_district` VALUES (2016, 1941, '0758', '441200', '肇庆市', '112.465091', '23.047191', 'city');
INSERT INTO `cyx_district` VALUES (2017, 2016, '0758', '441202', '端州区', '112.484848', '23.052101', 'district');
INSERT INTO `cyx_district` VALUES (2018, 2016, '0758', '441203', '鼎湖区', '112.567588', '23.158447', 'district');
INSERT INTO `cyx_district` VALUES (2019, 2016, '0758', '441204', '高要区', '112.457981', '23.025305', 'district');
INSERT INTO `cyx_district` VALUES (2020, 2016, '0758', '441223', '广宁县', '112.44069', '23.634675', 'district');
INSERT INTO `cyx_district` VALUES (2021, 2016, '0758', '441224', '怀集县', '112.167742', '23.92035', 'district');
INSERT INTO `cyx_district` VALUES (2022, 2016, '0758', '441225', '封开县', '111.512343', '23.424033', 'district');
INSERT INTO `cyx_district` VALUES (2023, 2016, '0758', '441226', '德庆县', '111.785937', '23.143722', 'district');
INSERT INTO `cyx_district` VALUES (2024, 2016, '0758', '441284', '四会市', '112.734103', '23.327001', 'district');
INSERT INTO `cyx_district` VALUES (2025, 1941, '0752', '441300', '惠州市', '114.415612', '23.112381', 'city');
INSERT INTO `cyx_district` VALUES (2026, 2025, '0752', '441302', '惠城区', '114.382474', '23.084137', 'district');
INSERT INTO `cyx_district` VALUES (2027, 2025, '0752', '441303', '惠阳区', '114.456176', '22.789788', 'district');
INSERT INTO `cyx_district` VALUES (2028, 2025, '0752', '441322', '博罗县', '114.289528', '23.172771', 'district');
INSERT INTO `cyx_district` VALUES (2029, 2025, '0752', '441323', '惠东县', '114.719988', '22.985014', 'district');
INSERT INTO `cyx_district` VALUES (2030, 2025, '0752', '441324', '龙门县', '114.254863', '23.727737', 'district');
INSERT INTO `cyx_district` VALUES (2031, 1941, '0753', '441400', '梅州市', '116.122523', '24.288578', 'city');
INSERT INTO `cyx_district` VALUES (2032, 2031, '0753', '441402', '梅江区', '116.116695', '24.31049', 'district');
INSERT INTO `cyx_district` VALUES (2033, 2031, '0753', '441403', '梅县区', '116.081656', '24.265926', 'district');
INSERT INTO `cyx_district` VALUES (2034, 2031, '0753', '441422', '大埔县', '116.695195', '24.347782', 'district');
INSERT INTO `cyx_district` VALUES (2035, 2031, '0753', '441423', '丰顺县', '116.181691', '23.739343', 'district');
INSERT INTO `cyx_district` VALUES (2036, 2031, '0753', '441424', '五华县', '115.775788', '23.932409', 'district');
INSERT INTO `cyx_district` VALUES (2037, 2031, '0753', '441426', '平远县', '115.891638', '24.567261', 'district');
INSERT INTO `cyx_district` VALUES (2038, 2031, '0753', '441427', '蕉岭县', '116.171355', '24.658699', 'district');
INSERT INTO `cyx_district` VALUES (2039, 2031, '0753', '441481', '兴宁市', '115.731167', '24.136708', 'district');
INSERT INTO `cyx_district` VALUES (2040, 1941, '0660', '441500', '汕尾市', '115.375431', '22.78705', 'city');
INSERT INTO `cyx_district` VALUES (2041, 2040, '0660', '441502', '城区', '115.365058', '22.779207', 'district');
INSERT INTO `cyx_district` VALUES (2042, 2040, '0660', '441521', '海丰县', '115.323436', '22.966585', 'district');
INSERT INTO `cyx_district` VALUES (2043, 2040, '0660', '441523', '陆河县', '115.660143', '23.301616', 'district');
INSERT INTO `cyx_district` VALUES (2044, 2040, '0660', '441581', '陆丰市', '115.652151', '22.919228', 'district');
INSERT INTO `cyx_district` VALUES (2045, 1941, '0762', '441600', '河源市', '114.700961', '23.743686', 'city');
INSERT INTO `cyx_district` VALUES (2046, 2045, '0762', '441602', '源城区', '114.702517', '23.733969', 'district');
INSERT INTO `cyx_district` VALUES (2047, 2045, '0762', '441621', '紫金县', '115.184107', '23.635745', 'district');
INSERT INTO `cyx_district` VALUES (2048, 2045, '0762', '441622', '龙川县', '115.259871', '24.100066', 'district');
INSERT INTO `cyx_district` VALUES (2049, 2045, '0762', '441623', '连平县', '114.488556', '24.369583', 'district');
INSERT INTO `cyx_district` VALUES (2050, 2045, '0762', '441624', '和平县', '114.938684', '24.44218', 'district');
INSERT INTO `cyx_district` VALUES (2051, 2045, '0762', '441625', '东源县', '114.746344', '23.788189', 'district');
INSERT INTO `cyx_district` VALUES (2052, 1941, '0662', '441700', '阳江市', '111.982589', '21.857887', 'city');
INSERT INTO `cyx_district` VALUES (2053, 2052, '0662', '441702', '江城区', '111.955058', '21.861786', 'district');
INSERT INTO `cyx_district` VALUES (2054, 2052, '0662', '441704', '阳东区', '112.006363', '21.868337', 'district');
INSERT INTO `cyx_district` VALUES (2055, 2052, '0662', '441721', '阳西县', '111.61766', '21.752771', 'district');
INSERT INTO `cyx_district` VALUES (2056, 2052, '0662', '441781', '阳春市', '111.791587', '22.17041', 'district');
INSERT INTO `cyx_district` VALUES (2057, 1941, '0763', '441800', '清远市', '113.056042', '23.681774', 'city');
INSERT INTO `cyx_district` VALUES (2058, 2057, '0763', '441802', '清城区', '113.062692', '23.697899', 'district');
INSERT INTO `cyx_district` VALUES (2059, 2057, '0763', '441803', '清新区', '113.017747', '23.734677', 'district');
INSERT INTO `cyx_district` VALUES (2060, 2057, '0763', '441821', '佛冈县', '113.531607', '23.879192', 'district');
INSERT INTO `cyx_district` VALUES (2061, 2057, '0763', '441823', '阳山县', '112.641363', '24.465359', 'district');
INSERT INTO `cyx_district` VALUES (2062, 2057, '0763', '441825', '连山壮族瑶族自治县', '112.093617', '24.570491', 'district');
INSERT INTO `cyx_district` VALUES (2063, 2057, '0763', '441826', '连南瑶族自治县', '112.287012', '24.726017', 'district');
INSERT INTO `cyx_district` VALUES (2064, 2057, '0763', '441881', '英德市', '113.401701', '24.206986', 'district');
INSERT INTO `cyx_district` VALUES (2065, 2057, '0763', '441882', '连州市', '112.377361', '24.780966', 'district');
INSERT INTO `cyx_district` VALUES (2066, 1941, '0769', '441900', '东莞市', '113.751799', '23.020673', 'city');
INSERT INTO `cyx_district` VALUES (2067, 2066, '0769', '441900', '东莞市', '113.751799', '23.020673', 'district');
INSERT INTO `cyx_district` VALUES (2068, 1941, '0760', '442000', '中山市', '113.39277', '22.517585', 'city');
INSERT INTO `cyx_district` VALUES (2069, 2068, '0760', '442000', '中山市', '113.39277', '22.517585', 'district');
INSERT INTO `cyx_district` VALUES (2070, 1941, '0768', '445100', '潮州市', '116.622444', '23.657262', 'city');
INSERT INTO `cyx_district` VALUES (2071, 2070, '0768', '445102', '湘桥区', '116.628627', '23.674387', 'district');
INSERT INTO `cyx_district` VALUES (2072, 2070, '0768', '445103', '潮安区', '116.678203', '23.462613', 'district');
INSERT INTO `cyx_district` VALUES (2073, 2070, '0768', '445122', '饶平县', '117.0039', '23.663824', 'district');
INSERT INTO `cyx_district` VALUES (2074, 1941, '0663', '445200', '揭阳市', '116.372708', '23.549701', 'city');
INSERT INTO `cyx_district` VALUES (2075, 2074, '0663', '445202', '榕城区', '116.367012', '23.525382', 'district');
INSERT INTO `cyx_district` VALUES (2076, 2074, '0663', '445203', '揭东区', '116.412015', '23.566126', 'district');
INSERT INTO `cyx_district` VALUES (2077, 2074, '0663', '445222', '揭西县', '115.841837', '23.431294', 'district');
INSERT INTO `cyx_district` VALUES (2078, 2074, '0663', '445224', '惠来县', '116.29515', '23.033266', 'district');
INSERT INTO `cyx_district` VALUES (2079, 2074, '0663', '445281', '普宁市', '116.165777', '23.297493', 'district');
INSERT INTO `cyx_district` VALUES (2080, 1941, '0766', '445300', '云浮市', '112.044491', '22.915094', 'city');
INSERT INTO `cyx_district` VALUES (2081, 2080, '0766', '445302', '云城区', '112.043945', '22.92815', 'district');
INSERT INTO `cyx_district` VALUES (2082, 2080, '0766', '445303', '云安区', '112.003208', '23.071019', 'district');
INSERT INTO `cyx_district` VALUES (2083, 2080, '0766', '445321', '新兴县', '112.225334', '22.69569', 'district');
INSERT INTO `cyx_district` VALUES (2084, 2080, '0766', '445322', '郁南县', '111.535285', '23.23456', 'district');
INSERT INTO `cyx_district` VALUES (2085, 2080, '0766', '445381', '罗定市', '111.569892', '22.768285', 'district');
INSERT INTO `cyx_district` VALUES (2086, 1941, '0', '442100', '东沙群岛', '116.887613', '20.617825', 'city');
INSERT INTO `cyx_district` VALUES (2087, 2086, '0', '442100', '东沙群岛', '116.887613', '20.617825', 'district');
INSERT INTO `cyx_district` VALUES (2088, 1, '0', '450000', '广西壮族自治区', '108.327546', '22.815478', 'province');
INSERT INTO `cyx_district` VALUES (2089, 2088, '0771', '450100', '南宁市', '108.366543', '22.817002', 'city');
INSERT INTO `cyx_district` VALUES (2090, 2089, '0771', '450102', '兴宁区', '108.368871', '22.854021', 'district');
INSERT INTO `cyx_district` VALUES (2091, 2089, '0771', '450103', '青秀区', '108.494024', '22.785879', 'district');
INSERT INTO `cyx_district` VALUES (2092, 2089, '0771', '450105', '江南区', '108.273133', '22.78136', 'district');
INSERT INTO `cyx_district` VALUES (2093, 2089, '0771', '450107', '西乡塘区', '108.313494', '22.833928', 'district');
INSERT INTO `cyx_district` VALUES (2094, 2089, '0771', '450108', '良庆区', '108.39301', '22.752997', 'district');
INSERT INTO `cyx_district` VALUES (2095, 2089, '0771', '450109', '邕宁区', '108.487368', '22.75839', 'district');
INSERT INTO `cyx_district` VALUES (2096, 2089, '0771', '450110', '武鸣区', '108.27467', '23.158595', 'district');
INSERT INTO `cyx_district` VALUES (2097, 2089, '0771', '450123', '隆安县', '107.696153', '23.166028', 'district');
INSERT INTO `cyx_district` VALUES (2098, 2089, '0771', '450124', '马山县', '108.177019', '23.708321', 'district');
INSERT INTO `cyx_district` VALUES (2099, 2089, '0771', '450125', '上林县', '108.602846', '23.431908', 'district');
INSERT INTO `cyx_district` VALUES (2100, 2089, '0771', '450126', '宾阳县', '108.810326', '23.217786', 'district');
INSERT INTO `cyx_district` VALUES (2101, 2089, '0771', '450127', '横县', '109.261384', '22.679931', 'district');
INSERT INTO `cyx_district` VALUES (2102, 2088, '0772', '450200', '柳州市', '109.428608', '24.326291', 'city');
INSERT INTO `cyx_district` VALUES (2103, 2102, '0772', '450202', '城中区', '109.4273', '24.366', 'district');
INSERT INTO `cyx_district` VALUES (2104, 2102, '0772', '450203', '鱼峰区', '109.452442', '24.318516', 'district');
INSERT INTO `cyx_district` VALUES (2105, 2102, '0772', '450204', '柳南区', '109.385518', '24.336229', 'district');
INSERT INTO `cyx_district` VALUES (2106, 2102, '0772', '450205', '柳北区', '109.402049', '24.362691', 'district');
INSERT INTO `cyx_district` VALUES (2107, 2102, '0772', '450221', '柳江区', '109.32638', '24.254891', 'district');
INSERT INTO `cyx_district` VALUES (2108, 2102, '0772', '450222', '柳城县', '109.24473', '24.651518', 'district');
INSERT INTO `cyx_district` VALUES (2109, 2102, '0772', '450223', '鹿寨县', '109.750638', '24.472897', 'district');
INSERT INTO `cyx_district` VALUES (2110, 2102, '0772', '450224', '融安县', '109.397538', '25.224549', 'district');
INSERT INTO `cyx_district` VALUES (2111, 2102, '0772', '450225', '融水苗族自治县', '109.256334', '25.065934', 'district');
INSERT INTO `cyx_district` VALUES (2112, 2102, '0772', '450226', '三江侗族自治县', '109.607675', '25.783198', 'district');
INSERT INTO `cyx_district` VALUES (2113, 2088, '0773', '450300', '桂林市', '110.179953', '25.234479', 'city');
INSERT INTO `cyx_district` VALUES (2114, 2113, '0773', '450302', '秀峰区', '110.264183', '25.273625', 'district');
INSERT INTO `cyx_district` VALUES (2115, 2113, '0773', '450303', '叠彩区', '110.301723', '25.314', 'district');
INSERT INTO `cyx_district` VALUES (2116, 2113, '0773', '450304', '象山区', '110.281082', '25.261686', 'district');
INSERT INTO `cyx_district` VALUES (2117, 2113, '0773', '450305', '七星区', '110.317826', '25.252701', 'district');
INSERT INTO `cyx_district` VALUES (2118, 2113, '0773', '450311', '雁山区', '110.28669', '25.101934', 'district');
INSERT INTO `cyx_district` VALUES (2119, 2113, '0773', '450312', '临桂区', '110.212463', '25.238628', 'district');
INSERT INTO `cyx_district` VALUES (2120, 2113, '0773', '450321', '阳朔县', '110.496593', '24.77848', 'district');
INSERT INTO `cyx_district` VALUES (2121, 2113, '0773', '450323', '灵川县', '110.319897', '25.394781', 'district');
INSERT INTO `cyx_district` VALUES (2122, 2113, '0773', '450324', '全州县', '111.072946', '25.928387', 'district');
INSERT INTO `cyx_district` VALUES (2123, 2113, '0773', '450325', '兴安县', '110.67167', '25.611704', 'district');
INSERT INTO `cyx_district` VALUES (2124, 2113, '0773', '450326', '永福县', '109.983076', '24.979855', 'district');
INSERT INTO `cyx_district` VALUES (2125, 2113, '0773', '450327', '灌阳县', '111.160851', '25.489383', 'district');
INSERT INTO `cyx_district` VALUES (2126, 2113, '0773', '450328', '龙胜各族自治县', '110.011238', '25.797931', 'district');
INSERT INTO `cyx_district` VALUES (2127, 2113, '0773', '450329', '资源县', '110.6527', '26.042443', 'district');
INSERT INTO `cyx_district` VALUES (2128, 2113, '0773', '450330', '平乐县', '110.643305', '24.633362', 'district');
INSERT INTO `cyx_district` VALUES (2129, 2113, '0773', '450331', '荔浦县', '110.395104', '24.488342', 'district');
INSERT INTO `cyx_district` VALUES (2130, 2113, '0773', '450332', '恭城瑶族自治县', '110.828409', '24.831682', 'district');
INSERT INTO `cyx_district` VALUES (2131, 2088, '0774', '450400', '梧州市', '111.279115', '23.476962', 'city');
INSERT INTO `cyx_district` VALUES (2132, 2131, '0774', '450403', '万秀区', '111.320518', '23.472991', 'district');
INSERT INTO `cyx_district` VALUES (2133, 2131, '0774', '450405', '长洲区', '111.274673', '23.485944', 'district');
INSERT INTO `cyx_district` VALUES (2134, 2131, '0774', '450406', '龙圩区', '111.246606', '23.404772', 'district');
INSERT INTO `cyx_district` VALUES (2135, 2131, '0774', '450421', '苍梧县', '111.544007', '23.845097', 'district');
INSERT INTO `cyx_district` VALUES (2136, 2131, '0774', '450422', '藤县', '110.914849', '23.374983', 'district');
INSERT INTO `cyx_district` VALUES (2137, 2131, '0774', '450423', '蒙山县', '110.525003', '24.19357', 'district');
INSERT INTO `cyx_district` VALUES (2138, 2131, '0774', '450481', '岑溪市', '110.994913', '22.91835', 'district');
INSERT INTO `cyx_district` VALUES (2139, 2088, '0779', '450500', '北海市', '109.120161', '21.481291', 'city');
INSERT INTO `cyx_district` VALUES (2140, 2139, '0779', '450502', '海城区', '109.117209', '21.475004', 'district');
INSERT INTO `cyx_district` VALUES (2141, 2139, '0779', '450503', '银海区', '109.139862', '21.449308', 'district');
INSERT INTO `cyx_district` VALUES (2142, 2139, '0779', '450512', '铁山港区', '109.42158', '21.529127', 'district');
INSERT INTO `cyx_district` VALUES (2143, 2139, '0779', '450521', '合浦县', '109.207335', '21.660935', 'district');
INSERT INTO `cyx_district` VALUES (2144, 2088, '0770', '450600', '防城港市', '108.353846', '21.68686', 'city');
INSERT INTO `cyx_district` VALUES (2145, 2144, '0770', '450602', '港口区', '108.380143', '21.643383', 'district');
INSERT INTO `cyx_district` VALUES (2146, 2144, '0770', '450603', '防城区', '108.353499', '21.769211', 'district');
INSERT INTO `cyx_district` VALUES (2147, 2144, '0770', '450621', '上思县', '107.983627', '22.153671', 'district');
INSERT INTO `cyx_district` VALUES (2148, 2144, '0770', '450681', '东兴市', '107.971828', '21.547821', 'district');
INSERT INTO `cyx_district` VALUES (2149, 2088, '0777', '450700', '钦州市', '108.654146', '21.979933', 'city');
INSERT INTO `cyx_district` VALUES (2150, 2149, '0777', '450702', '钦南区', '108.657209', '21.938859', 'district');
INSERT INTO `cyx_district` VALUES (2151, 2149, '0777', '450703', '钦北区', '108.44911', '22.132761', 'district');
INSERT INTO `cyx_district` VALUES (2152, 2149, '0777', '450721', '灵山县', '109.291006', '22.416536', 'district');
INSERT INTO `cyx_district` VALUES (2153, 2149, '0777', '450722', '浦北县', '109.556953', '22.271651', 'district');
INSERT INTO `cyx_district` VALUES (2154, 2088, '1755', '450800', '贵港市', '109.598926', '23.11153', 'city');
INSERT INTO `cyx_district` VALUES (2155, 2154, '1755', '450802', '港北区', '109.57224', '23.11153', 'district');
INSERT INTO `cyx_district` VALUES (2156, 2154, '1755', '450803', '港南区', '109.599556', '23.075573', 'district');
INSERT INTO `cyx_district` VALUES (2157, 2154, '1755', '450804', '覃塘区', '109.452662', '23.127149', 'district');
INSERT INTO `cyx_district` VALUES (2158, 2154, '1755', '450821', '平南县', '110.392311', '23.539264', 'district');
INSERT INTO `cyx_district` VALUES (2159, 2154, '1755', '450881', '桂平市', '110.079379', '23.394325', 'district');
INSERT INTO `cyx_district` VALUES (2160, 2088, '0775', '450900', '玉林市', '110.18122', '22.654032', 'city');
INSERT INTO `cyx_district` VALUES (2161, 2160, '0775', '450902', '玉州区', '110.151153', '22.628087', 'district');
INSERT INTO `cyx_district` VALUES (2162, 2160, '0775', '450903', '福绵区', '110.059439', '22.585556', 'district');
INSERT INTO `cyx_district` VALUES (2163, 2160, '0775', '450921', '容县', '110.558074', '22.857839', 'district');
INSERT INTO `cyx_district` VALUES (2164, 2160, '0775', '450922', '陆川县', '110.264052', '22.321048', 'district');
INSERT INTO `cyx_district` VALUES (2165, 2160, '0775', '450923', '博白县', '109.975985', '22.273048', 'district');
INSERT INTO `cyx_district` VALUES (2166, 2160, '0775', '450924', '兴业县', '109.875304', '22.736421', 'district');
INSERT INTO `cyx_district` VALUES (2167, 2160, '0775', '450981', '北流市', '110.354214', '22.70831', 'district');
INSERT INTO `cyx_district` VALUES (2168, 2088, '0776', '451000', '百色市', '106.618202', '23.90233', 'city');
INSERT INTO `cyx_district` VALUES (2169, 2168, '0776', '451002', '右江区', '106.618225', '23.90097', 'district');
INSERT INTO `cyx_district` VALUES (2170, 2168, '0776', '451021', '田阳县', '106.915496', '23.735692', 'district');
INSERT INTO `cyx_district` VALUES (2171, 2168, '0776', '451022', '田东县', '107.12608', '23.597194', 'district');
INSERT INTO `cyx_district` VALUES (2172, 2168, '0776', '451023', '平果县', '107.589809', '23.329376', 'district');
INSERT INTO `cyx_district` VALUES (2173, 2168, '0776', '451024', '德保县', '106.615373', '23.32345', 'district');
INSERT INTO `cyx_district` VALUES (2174, 2168, '0776', '451026', '那坡县', '105.83253', '23.387441', 'district');
INSERT INTO `cyx_district` VALUES (2175, 2168, '0776', '451027', '凌云县', '106.56131', '24.347557', 'district');
INSERT INTO `cyx_district` VALUES (2176, 2168, '0776', '451028', '乐业县', '106.556519', '24.776827', 'district');
INSERT INTO `cyx_district` VALUES (2177, 2168, '0776', '451029', '田林县', '106.228538', '24.294487', 'district');
INSERT INTO `cyx_district` VALUES (2178, 2168, '0776', '451030', '西林县', '105.093825', '24.489823', 'district');
INSERT INTO `cyx_district` VALUES (2179, 2168, '0776', '451031', '隆林各族自治县', '105.34404', '24.770896', 'district');
INSERT INTO `cyx_district` VALUES (2180, 2168, '0776', '451081', '靖西市', '106.417805', '23.134117', 'district');
INSERT INTO `cyx_district` VALUES (2181, 2088, '1774', '451100', '贺州市', '111.566871', '24.403528', 'city');
INSERT INTO `cyx_district` VALUES (2182, 2181, '1774', '451102', '八步区', '111.552095', '24.411805', 'district');
INSERT INTO `cyx_district` VALUES (2183, 2181, '1774', '451103', '平桂区', '111.479923', '24.453845', 'district');
INSERT INTO `cyx_district` VALUES (2184, 2181, '1774', '451121', '昭平县', '110.811325', '24.169385', 'district');
INSERT INTO `cyx_district` VALUES (2185, 2181, '1774', '451122', '钟山县', '111.303009', '24.525957', 'district');
INSERT INTO `cyx_district` VALUES (2186, 2181, '1774', '451123', '富川瑶族自治县', '111.27745', '24.814443', 'district');
INSERT INTO `cyx_district` VALUES (2187, 2088, '0778', '451200', '河池市', '108.085261', '24.692931', 'city');
INSERT INTO `cyx_district` VALUES (2188, 2187, '0778', '451202', '金城江区', '108.037276', '24.689703', 'district');
INSERT INTO `cyx_district` VALUES (2189, 2187, '0778', '451221', '南丹县', '107.541244', '24.975631', 'district');
INSERT INTO `cyx_district` VALUES (2190, 2187, '0778', '451222', '天峨县', '107.173802', '24.999108', 'district');
INSERT INTO `cyx_district` VALUES (2191, 2187, '0778', '451223', '凤山县', '107.04219', '24.546876', 'district');
INSERT INTO `cyx_district` VALUES (2192, 2187, '0778', '451224', '东兰县', '107.374293', '24.510842', 'district');
INSERT INTO `cyx_district` VALUES (2193, 2187, '0778', '451225', '罗城仫佬族自治县', '108.904706', '24.777411', 'district');
INSERT INTO `cyx_district` VALUES (2194, 2187, '0778', '451226', '环江毛南族自治县', '108.258028', '24.825664', 'district');
INSERT INTO `cyx_district` VALUES (2195, 2187, '0778', '451227', '巴马瑶族自治县', '107.258588', '24.142298', 'district');
INSERT INTO `cyx_district` VALUES (2196, 2187, '0778', '451228', '都安瑶族自治县', '108.105311', '23.932675', 'district');
INSERT INTO `cyx_district` VALUES (2197, 2187, '0778', '451229', '大化瑶族自治县', '107.998149', '23.736457', 'district');
INSERT INTO `cyx_district` VALUES (2198, 2187, '0778', '451281', '宜州市', '108.636414', '24.485214', 'district');
INSERT INTO `cyx_district` VALUES (2199, 2088, '1772', '451300', '来宾市', '109.221465', '23.750306', 'city');
INSERT INTO `cyx_district` VALUES (2200, 2199, '1772', '451302', '兴宾区', '109.183333', '23.72892', 'district');
INSERT INTO `cyx_district` VALUES (2201, 2199, '1772', '451321', '忻城县', '108.665666', '24.066234', 'district');
INSERT INTO `cyx_district` VALUES (2202, 2199, '1772', '451322', '象州县', '109.705065', '23.973793', 'district');
INSERT INTO `cyx_district` VALUES (2203, 2199, '1772', '451323', '武宣县', '109.663206', '23.59411', 'district');
INSERT INTO `cyx_district` VALUES (2204, 2199, '1772', '451324', '金秀瑶族自治县', '110.189462', '24.130374', 'district');
INSERT INTO `cyx_district` VALUES (2205, 2199, '1772', '451381', '合山市', '108.886082', '23.806535', 'district');
INSERT INTO `cyx_district` VALUES (2206, 2088, '1771', '451400', '崇左市', '107.365094', '22.377253', 'city');
INSERT INTO `cyx_district` VALUES (2207, 2206, '1771', '451402', '江州区', '107.353437', '22.405325', 'district');
INSERT INTO `cyx_district` VALUES (2208, 2206, '1771', '451421', '扶绥县', '107.904186', '22.635012', 'district');
INSERT INTO `cyx_district` VALUES (2209, 2206, '1771', '451422', '宁明县', '107.076456', '22.140192', 'district');
INSERT INTO `cyx_district` VALUES (2210, 2206, '1771', '451423', '龙州县', '106.854482', '22.342778', 'district');
INSERT INTO `cyx_district` VALUES (2211, 2206, '1771', '451424', '大新县', '107.200654', '22.829287', 'district');
INSERT INTO `cyx_district` VALUES (2212, 2206, '1771', '451425', '天等县', '107.143432', '23.081394', 'district');
INSERT INTO `cyx_district` VALUES (2213, 2206, '1771', '451481', '凭祥市', '106.766293', '22.094484', 'district');
INSERT INTO `cyx_district` VALUES (2214, 1, '0', '460000', '海南省', '110.349228', '20.017377', 'province');
INSERT INTO `cyx_district` VALUES (2215, 2214, '0802', '469025', '白沙黎族自治县', '109.451484', '19.224823', 'city');
INSERT INTO `cyx_district` VALUES (2216, 2215, '0802', '469025', '白沙黎族自治县', '109.451484', '19.224823', 'district');
INSERT INTO `cyx_district` VALUES (2217, 2214, '0801', '469029', '保亭黎族苗族自治县', '109.70259', '18.63913', 'city');
INSERT INTO `cyx_district` VALUES (2218, 2217, '0801', '469029', '保亭黎族苗族自治县', '109.70259', '18.63913', 'district');
INSERT INTO `cyx_district` VALUES (2219, 2214, '0803', '469026', '昌江黎族自治县', '109.055739', '19.298184', 'city');
INSERT INTO `cyx_district` VALUES (2220, 2219, '0803', '469026', '昌江黎族自治县', '109.055739', '19.298184', 'district');
INSERT INTO `cyx_district` VALUES (2221, 2214, '0804', '469023', '澄迈县', '110.006754', '19.738521', 'city');
INSERT INTO `cyx_district` VALUES (2222, 2221, '0804', '469023', '澄迈县', '110.006754', '19.738521', 'district');
INSERT INTO `cyx_district` VALUES (2223, 2214, '0898', '460100', '海口市', '110.198286', '20.044412', 'city');
INSERT INTO `cyx_district` VALUES (2224, 2223, '0898', '460105', '秀英区', '110.293603', '20.007494', 'district');
INSERT INTO `cyx_district` VALUES (2225, 2223, '0898', '460106', '龙华区', '110.328492', '20.031006', 'district');
INSERT INTO `cyx_district` VALUES (2226, 2223, '0898', '460107', '琼山区', '110.353972', '20.003169', 'district');
INSERT INTO `cyx_district` VALUES (2227, 2223, '0898', '460108', '美兰区', '110.366358', '20.029083', 'district');
INSERT INTO `cyx_district` VALUES (2228, 2214, '0899', '460200', '三亚市', '109.511772', '18.253135', 'city');
INSERT INTO `cyx_district` VALUES (2229, 2228, '0899', '460202', '海棠区', '109.752569', '18.400106', 'district');
INSERT INTO `cyx_district` VALUES (2230, 2228, '0899', '460203', '吉阳区', '109.578336', '18.281406', 'district');
INSERT INTO `cyx_district` VALUES (2231, 2228, '0899', '460204', '天涯区', '109.452378', '18.298156', 'district');
INSERT INTO `cyx_district` VALUES (2232, 2228, '0899', '460205', '崖州区', '109.171841', '18.357291', 'district');
INSERT INTO `cyx_district` VALUES (2233, 2214, '2898', '460300', '三沙市', '112.338695', '16.831839', 'city');
INSERT INTO `cyx_district` VALUES (2234, 2233, '1895', '460321', '西沙群岛', '111.792944', '16.204546', 'district');
INSERT INTO `cyx_district` VALUES (2235, 2233, '1891', '460322', '南沙群岛', '116.749997', '11.471888', 'district');
INSERT INTO `cyx_district` VALUES (2236, 2233, '2801', '460323', '中沙群岛的岛礁及其海域', '117.740071', '15.112855', 'district');
INSERT INTO `cyx_district` VALUES (2237, 2214, '0805', '460400', '儋州市', '109.580811', '19.521134', 'city');
INSERT INTO `cyx_district` VALUES (2238, 2237, '0805', '460400', '儋州市', '109.580811', '19.521134', 'district');
INSERT INTO `cyx_district` VALUES (2239, 2214, '0806', '469021', '定安县', '110.359339', '19.681404', 'city');
INSERT INTO `cyx_district` VALUES (2240, 2239, '0806', '469021', '定安县', '110.359339', '19.681404', 'district');
INSERT INTO `cyx_district` VALUES (2241, 2214, '0807', '469007', '东方市', '108.651815', '19.095351', 'city');
INSERT INTO `cyx_district` VALUES (2242, 2241, '0807', '469007', '东方市', '108.651815', '19.095351', 'district');
INSERT INTO `cyx_district` VALUES (2243, 2214, '2802', '469027', '乐东黎族自治县', '109.173054', '18.750259', 'city');
INSERT INTO `cyx_district` VALUES (2244, 2243, '2802', '469027', '乐东黎族自治县', '109.173054', '18.750259', 'district');
INSERT INTO `cyx_district` VALUES (2245, 2214, '1896', '469024', '临高县', '109.690508', '19.912025', 'city');
INSERT INTO `cyx_district` VALUES (2246, 2245, '1896', '469024', '临高县', '109.690508', '19.912025', 'district');
INSERT INTO `cyx_district` VALUES (2247, 2214, '0809', '469028', '陵水黎族自治县', '110.037503', '18.506048', 'city');
INSERT INTO `cyx_district` VALUES (2248, 2247, '0809', '469028', '陵水黎族自治县', '110.037503', '18.506048', 'district');
INSERT INTO `cyx_district` VALUES (2249, 2214, '1894', '469002', '琼海市', '110.474497', '19.259134', 'city');
INSERT INTO `cyx_district` VALUES (2250, 2249, '1894', '469002', '琼海市', '110.474497', '19.259134', 'district');
INSERT INTO `cyx_district` VALUES (2251, 2214, '1899', '469030', '琼中黎族苗族自治县', '109.838389', '19.033369', 'city');
INSERT INTO `cyx_district` VALUES (2252, 2251, '1899', '469030', '琼中黎族苗族自治县', '109.838389', '19.033369', 'district');
INSERT INTO `cyx_district` VALUES (2253, 2214, '1892', '469022', '屯昌县', '110.103415', '19.351765', 'city');
INSERT INTO `cyx_district` VALUES (2254, 2253, '1892', '469022', '屯昌县', '110.103415', '19.351765', 'district');
INSERT INTO `cyx_district` VALUES (2255, 2214, '1898', '469006', '万宁市', '110.391073', '18.795143', 'city');
INSERT INTO `cyx_district` VALUES (2256, 2255, '1898', '469006', '万宁市', '110.391073', '18.795143', 'district');
INSERT INTO `cyx_district` VALUES (2257, 2214, '1893', '469005', '文昌市', '110.797717', '19.543422', 'city');
INSERT INTO `cyx_district` VALUES (2258, 2257, '1893', '469005', '文昌市', '110.797717', '19.543422', 'district');
INSERT INTO `cyx_district` VALUES (2259, 2214, '1897', '469001', '五指山市', '109.516925', '18.775146', 'city');
INSERT INTO `cyx_district` VALUES (2260, 2259, '1897', '469001', '五指山市', '109.516925', '18.775146', 'district');
INSERT INTO `cyx_district` VALUES (2261, 1, '023', '500000', '重庆市', '106.551643', '29.562849', 'province');
INSERT INTO `cyx_district` VALUES (2262, 2261, '023', '500100', '重庆市', '106.551643', '29.562849', 'city');
INSERT INTO `cyx_district` VALUES (2263, 2262, '023', '500101', '万州区', '108.408661', '30.807667', 'district');
INSERT INTO `cyx_district` VALUES (2264, 2262, '023', '500102', '涪陵区', '107.38977', '29.703022', 'district');
INSERT INTO `cyx_district` VALUES (2265, 2262, '023', '500103', '渝中区', '106.568896', '29.552736', 'district');
INSERT INTO `cyx_district` VALUES (2266, 2262, '023', '500104', '大渡口区', '106.482346', '29.484527', 'district');
INSERT INTO `cyx_district` VALUES (2267, 2262, '023', '500105', '江北区', '106.574271', '29.606703', 'district');
INSERT INTO `cyx_district` VALUES (2268, 2262, '023', '500106', '沙坪坝区', '106.456878', '29.541144', 'district');
INSERT INTO `cyx_district` VALUES (2269, 2262, '023', '500107', '九龙坡区', '106.510676', '29.502272', 'district');
INSERT INTO `cyx_district` VALUES (2270, 2262, '023', '500108', '南岸区', '106.644447', '29.50126', 'district');
INSERT INTO `cyx_district` VALUES (2271, 2262, '023', '500109', '北碚区', '106.395612', '29.805107', 'district');
INSERT INTO `cyx_district` VALUES (2272, 2262, '023', '500110', '綦江区', '106.651361', '29.028066', 'district');
INSERT INTO `cyx_district` VALUES (2273, 2262, '023', '500111', '大足区', '105.721733', '29.707032', 'district');
INSERT INTO `cyx_district` VALUES (2274, 2262, '023', '500112', '渝北区', '106.631187', '29.718142', 'district');
INSERT INTO `cyx_district` VALUES (2275, 2262, '023', '500113', '巴南区', '106.540256', '29.402408', 'district');
INSERT INTO `cyx_district` VALUES (2276, 2262, '023', '500114', '黔江区', '108.770677', '29.533609', 'district');
INSERT INTO `cyx_district` VALUES (2277, 2262, '023', '500115', '长寿区', '107.080734', '29.857912', 'district');
INSERT INTO `cyx_district` VALUES (2278, 2262, '023', '500116', '江津区', '106.259281', '29.290069', 'district');
INSERT INTO `cyx_district` VALUES (2279, 2262, '023', '500117', '合川区', '106.27613', '29.972084', 'district');
INSERT INTO `cyx_district` VALUES (2280, 2262, '023', '500118', '永川区', '105.927001', '29.356311', 'district');
INSERT INTO `cyx_district` VALUES (2281, 2262, '023', '500119', '南川区', '107.099266', '29.15789', 'district');
INSERT INTO `cyx_district` VALUES (2282, 2262, '023', '500120', '璧山区', '106.227305', '29.592024', 'district');
INSERT INTO `cyx_district` VALUES (2283, 2262, '023', '500151', '铜梁区', '106.056404', '29.844811', 'district');
INSERT INTO `cyx_district` VALUES (2284, 2262, '023', '500152', '潼南区', '105.840431', '30.190992', 'district');
INSERT INTO `cyx_district` VALUES (2285, 2262, '023', '500153', '荣昌区', '105.594623', '29.405002', 'district');
INSERT INTO `cyx_district` VALUES (2286, 2262, '023', '500154', '开州区', '108.393135', '31.160711', 'district');
INSERT INTO `cyx_district` VALUES (2287, 2261, '023', '500200', '重庆郊县', '108.165537', '29.293902', 'city');
INSERT INTO `cyx_district` VALUES (2288, 2287, '023', '500228', '梁平区', '107.769568', '30.654233', 'district');
INSERT INTO `cyx_district` VALUES (2289, 2287, '023', '500229', '城口县', '108.664214', '31.947633', 'district');
INSERT INTO `cyx_district` VALUES (2290, 2287, '023', '500230', '丰都县', '107.730894', '29.8635', 'district');
INSERT INTO `cyx_district` VALUES (2291, 2287, '023', '500231', '垫江县', '107.33339', '30.327716', 'district');
INSERT INTO `cyx_district` VALUES (2292, 2287, '023', '500232', '武隆区', '107.760025', '29.325601', 'district');
INSERT INTO `cyx_district` VALUES (2293, 2287, '023', '500233', '忠县', '108.039002', '30.299559', 'district');
INSERT INTO `cyx_district` VALUES (2294, 2287, '023', '500235', '云阳县', '108.697324', '30.930612', 'district');
INSERT INTO `cyx_district` VALUES (2295, 2287, '023', '500236', '奉节县', '109.400403', '31.018363', 'district');
INSERT INTO `cyx_district` VALUES (2296, 2287, '023', '500237', '巫山县', '109.879153', '31.074834', 'district');
INSERT INTO `cyx_district` VALUES (2297, 2287, '023', '500238', '巫溪县', '109.570062', '31.398604', 'district');
INSERT INTO `cyx_district` VALUES (2298, 2287, '023', '500240', '石柱土家族自治县', '108.114069', '29.999285', 'district');
INSERT INTO `cyx_district` VALUES (2299, 2287, '023', '500241', '秀山土家族苗族自治县', '109.007094', '28.447997', 'district');
INSERT INTO `cyx_district` VALUES (2300, 2287, '023', '500242', '酉阳土家族苗族自治县', '108.767747', '28.841244', 'district');
INSERT INTO `cyx_district` VALUES (2301, 2287, '023', '500243', '彭水苗族土家族自治县', '108.165537', '29.293902', 'district');
INSERT INTO `cyx_district` VALUES (2302, 1, '0', '510000', '四川省', '104.075809', '30.651239', 'province');
INSERT INTO `cyx_district` VALUES (2303, 2302, '028', '510100', '成都市', '104.066794', '30.572893', 'city');
INSERT INTO `cyx_district` VALUES (2304, 2303, '028', '510104', '锦江区', '104.117022', '30.598158', 'district');
INSERT INTO `cyx_district` VALUES (2305, 2303, '028', '510105', '青羊区', '104.061442', '30.673914', 'district');
INSERT INTO `cyx_district` VALUES (2306, 2303, '028', '510106', '金牛区', '104.052236', '30.691359', 'district');
INSERT INTO `cyx_district` VALUES (2307, 2303, '028', '510107', '武侯区', '104.043235', '30.641907', 'district');
INSERT INTO `cyx_district` VALUES (2308, 2303, '028', '510108', '成华区', '104.101515', '30.659966', 'district');
INSERT INTO `cyx_district` VALUES (2309, 2303, '028', '510112', '龙泉驿区', '104.274632', '30.556506', 'district');
INSERT INTO `cyx_district` VALUES (2310, 2303, '028', '510113', '青白江区', '104.250945', '30.878629', 'district');
INSERT INTO `cyx_district` VALUES (2311, 2303, '028', '510114', '新都区', '104.158705', '30.823498', 'district');
INSERT INTO `cyx_district` VALUES (2312, 2303, '028', '510115', '温江区', '103.856646', '30.682203', 'district');
INSERT INTO `cyx_district` VALUES (2313, 2303, '028', '510116', '双流区', '103.923566', '30.574449', 'district');
INSERT INTO `cyx_district` VALUES (2314, 2303, '028', '510121', '金堂县', '104.411976', '30.861979', 'district');
INSERT INTO `cyx_district` VALUES (2315, 2303, '028', '510124', '郫都区', '103.901091', '30.795854', 'district');
INSERT INTO `cyx_district` VALUES (2316, 2303, '028', '510129', '大邑县', '103.511865', '30.572268', 'district');
INSERT INTO `cyx_district` VALUES (2317, 2303, '028', '510131', '蒲江县', '103.506498', '30.196788', 'district');
INSERT INTO `cyx_district` VALUES (2318, 2303, '028', '510132', '新津县', '103.811286', '30.410346', 'district');
INSERT INTO `cyx_district` VALUES (2319, 2303, '028', '510180', '简阳市', '104.54722', '30.411264', 'district');
INSERT INTO `cyx_district` VALUES (2320, 2303, '028', '510181', '都江堰市', '103.647153', '30.988767', 'district');
INSERT INTO `cyx_district` VALUES (2321, 2303, '028', '510182', '彭州市', '103.957983', '30.990212', 'district');
INSERT INTO `cyx_district` VALUES (2322, 2303, '028', '510183', '邛崃市', '103.464207', '30.410324', 'district');
INSERT INTO `cyx_district` VALUES (2323, 2303, '028', '510184', '崇州市', '103.673001', '30.630122', 'district');
INSERT INTO `cyx_district` VALUES (2324, 2302, '0813', '510300', '自贡市', '104.778442', '29.33903', 'city');
INSERT INTO `cyx_district` VALUES (2325, 2324, '0813', '510302', '自流井区', '104.777191', '29.337429', 'district');
INSERT INTO `cyx_district` VALUES (2326, 2324, '0813', '510303', '贡井区', '104.715288', '29.345313', 'district');
INSERT INTO `cyx_district` VALUES (2327, 2324, '0813', '510304', '大安区', '104.773994', '29.363702', 'district');
INSERT INTO `cyx_district` VALUES (2328, 2324, '0813', '510311', '沿滩区', '104.874079', '29.272586', 'district');
INSERT INTO `cyx_district` VALUES (2329, 2324, '0813', '510321', '荣县', '104.417493', '29.445479', 'district');
INSERT INTO `cyx_district` VALUES (2330, 2324, '0813', '510322', '富顺县', '104.975048', '29.181429', 'district');
INSERT INTO `cyx_district` VALUES (2331, 2302, '0812', '510400', '攀枝花市', '101.718637', '26.582347', 'city');
INSERT INTO `cyx_district` VALUES (2332, 2331, '0812', '510402', '东区', '101.704109', '26.546491', 'district');
INSERT INTO `cyx_district` VALUES (2333, 2331, '0812', '510403', '西区', '101.630619', '26.597781', 'district');
INSERT INTO `cyx_district` VALUES (2334, 2331, '0812', '510411', '仁和区', '101.738528', '26.497765', 'district');
INSERT INTO `cyx_district` VALUES (2335, 2331, '0812', '510421', '米易县', '102.112895', '26.897694', 'district');
INSERT INTO `cyx_district` VALUES (2336, 2331, '0812', '510422', '盐边县', '101.855071', '26.683213', 'district');
INSERT INTO `cyx_district` VALUES (2337, 2302, '0830', '510500', '泸州市', '105.442285', '28.871805', 'city');
INSERT INTO `cyx_district` VALUES (2338, 2337, '0830', '510502', '江阳区', '105.434982', '28.87881', 'district');
INSERT INTO `cyx_district` VALUES (2339, 2337, '0830', '510503', '纳溪区', '105.371505', '28.773134', 'district');
INSERT INTO `cyx_district` VALUES (2340, 2337, '0830', '510504', '龙马潭区', '105.437751', '28.913257', 'district');
INSERT INTO `cyx_district` VALUES (2341, 2337, '0830', '510521', '泸县', '105.381893', '29.151534', 'district');
INSERT INTO `cyx_district` VALUES (2342, 2337, '0830', '510522', '合江县', '105.830986', '28.811164', 'district');
INSERT INTO `cyx_district` VALUES (2343, 2337, '0830', '510524', '叙永县', '105.444765', '28.155801', 'district');
INSERT INTO `cyx_district` VALUES (2344, 2337, '0830', '510525', '古蔺县', '105.812601', '28.038801', 'district');
INSERT INTO `cyx_district` VALUES (2345, 2302, '0838', '510600', '德阳市', '104.397894', '31.126855', 'city');
INSERT INTO `cyx_district` VALUES (2346, 2345, '0838', '510603', '旌阳区', '104.416966', '31.142633', 'district');
INSERT INTO `cyx_district` VALUES (2347, 2345, '0838', '510623', '中江县', '104.678751', '31.03307', 'district');
INSERT INTO `cyx_district` VALUES (2348, 2345, '0838', '510626', '罗江县', '104.510249', '31.317045', 'district');
INSERT INTO `cyx_district` VALUES (2349, 2345, '0838', '510681', '广汉市', '104.282429', '30.977119', 'district');
INSERT INTO `cyx_district` VALUES (2350, 2345, '0838', '510682', '什邡市', '104.167501', '31.12678', 'district');
INSERT INTO `cyx_district` VALUES (2351, 2345, '0838', '510683', '绵竹市', '104.22075', '31.338077', 'district');
INSERT INTO `cyx_district` VALUES (2352, 2302, '0816', '510700', '绵阳市', '104.679004', '31.467459', 'city');
INSERT INTO `cyx_district` VALUES (2353, 2352, '0816', '510703', '涪城区', '104.756944', '31.455101', 'district');
INSERT INTO `cyx_district` VALUES (2354, 2352, '0816', '510704', '游仙区', '104.766392', '31.473779', 'district');
INSERT INTO `cyx_district` VALUES (2355, 2352, '0816', '510705', '安州区', '104.567187', '31.534886', 'district');
INSERT INTO `cyx_district` VALUES (2356, 2352, '0816', '510722', '三台县', '105.094586', '31.095979', 'district');
INSERT INTO `cyx_district` VALUES (2357, 2352, '0816', '510723', '盐亭县', '105.389453', '31.208362', 'district');
INSERT INTO `cyx_district` VALUES (2358, 2352, '0816', '510725', '梓潼县', '105.170845', '31.642718', 'district');
INSERT INTO `cyx_district` VALUES (2359, 2352, '0816', '510726', '北川羌族自治县', '104.46797', '31.617203', 'district');
INSERT INTO `cyx_district` VALUES (2360, 2352, '0816', '510727', '平武县', '104.555583', '32.409675', 'district');
INSERT INTO `cyx_district` VALUES (2361, 2352, '0816', '510781', '江油市', '104.745915', '31.778026', 'district');
INSERT INTO `cyx_district` VALUES (2362, 2302, '0839', '510800', '广元市', '105.843357', '32.435435', 'city');
INSERT INTO `cyx_district` VALUES (2363, 2362, '0839', '510802', '利州区', '105.845307', '32.433756', 'district');
INSERT INTO `cyx_district` VALUES (2364, 2362, '0839', '510811', '昭化区', '105.962819', '32.323256', 'district');
INSERT INTO `cyx_district` VALUES (2365, 2362, '0839', '510812', '朝天区', '105.882642', '32.651336', 'district');
INSERT INTO `cyx_district` VALUES (2366, 2362, '0839', '510821', '旺苍县', '106.289983', '32.229058', 'district');
INSERT INTO `cyx_district` VALUES (2367, 2362, '0839', '510822', '青川县', '105.238842', '32.575484', 'district');
INSERT INTO `cyx_district` VALUES (2368, 2362, '0839', '510823', '剑阁县', '105.524766', '32.287722', 'district');
INSERT INTO `cyx_district` VALUES (2369, 2362, '0839', '510824', '苍溪县', '105.934756', '31.731709', 'district');
INSERT INTO `cyx_district` VALUES (2370, 2302, '0825', '510900', '遂宁市', '105.592803', '30.53292', 'city');
INSERT INTO `cyx_district` VALUES (2371, 2370, '0825', '510903', '船山区', '105.568297', '30.525475', 'district');
INSERT INTO `cyx_district` VALUES (2372, 2370, '0825', '510904', '安居区', '105.456342', '30.355379', 'district');
INSERT INTO `cyx_district` VALUES (2373, 2370, '0825', '510921', '蓬溪县', '105.70757', '30.757575', 'district');
INSERT INTO `cyx_district` VALUES (2374, 2370, '0825', '510922', '射洪县', '105.388412', '30.871131', 'district');
INSERT INTO `cyx_district` VALUES (2375, 2370, '0825', '510923', '大英县', '105.236923', '30.594409', 'district');
INSERT INTO `cyx_district` VALUES (2376, 2302, '1832', '511000', '内江市', '105.058432', '29.580228', 'city');
INSERT INTO `cyx_district` VALUES (2377, 2376, '1832', '511002', '市中区', '105.067597', '29.587053', 'district');
INSERT INTO `cyx_district` VALUES (2378, 2376, '1832', '511011', '东兴区', '105.075489', '29.592756', 'district');
INSERT INTO `cyx_district` VALUES (2379, 2376, '1832', '511024', '威远县', '104.668879', '29.52744', 'district');
INSERT INTO `cyx_district` VALUES (2380, 2376, '1832', '511025', '资中县', '104.851944', '29.764059', 'district');
INSERT INTO `cyx_district` VALUES (2381, 2376, '1832', '511028', '隆昌县', '105.287612', '29.339476', 'district');
INSERT INTO `cyx_district` VALUES (2382, 2302, '0833', '511100', '乐山市', '103.765678', '29.552115', 'city');
INSERT INTO `cyx_district` VALUES (2383, 2382, '0833', '511102', '市中区', '103.761329', '29.555374', 'district');
INSERT INTO `cyx_district` VALUES (2384, 2382, '0833', '511111', '沙湾区', '103.549991', '29.413091', 'district');
INSERT INTO `cyx_district` VALUES (2385, 2382, '0833', '511112', '五通桥区', '103.818014', '29.406945', 'district');
INSERT INTO `cyx_district` VALUES (2386, 2382, '0833', '511113', '金口河区', '103.07862', '29.244345', 'district');
INSERT INTO `cyx_district` VALUES (2387, 2382, '0833', '511123', '犍为县', '103.949326', '29.20817', 'district');
INSERT INTO `cyx_district` VALUES (2388, 2382, '0833', '511124', '井研县', '104.069726', '29.651287', 'district');
INSERT INTO `cyx_district` VALUES (2389, 2382, '0833', '511126', '夹江县', '103.571656', '29.73763', 'district');
INSERT INTO `cyx_district` VALUES (2390, 2382, '0833', '511129', '沐川县', '103.902334', '28.956647', 'district');
INSERT INTO `cyx_district` VALUES (2391, 2382, '0833', '511132', '峨边彝族自治县', '103.262048', '29.230425', 'district');
INSERT INTO `cyx_district` VALUES (2392, 2382, '0833', '511133', '马边彝族自治县', '103.546347', '28.83552', 'district');
INSERT INTO `cyx_district` VALUES (2393, 2382, '0833', '511181', '峨眉山市', '103.484503', '29.601198', 'district');
INSERT INTO `cyx_district` VALUES (2394, 2302, '0817', '511300', '南充市', '106.110698', '30.837793', 'city');
INSERT INTO `cyx_district` VALUES (2395, 2394, '0817', '511302', '顺庆区', '106.09245', '30.796803', 'district');
INSERT INTO `cyx_district` VALUES (2396, 2394, '0817', '511303', '高坪区', '106.118808', '30.781623', 'district');
INSERT INTO `cyx_district` VALUES (2397, 2394, '0817', '511304', '嘉陵区', '106.071876', '30.758823', 'district');
INSERT INTO `cyx_district` VALUES (2398, 2394, '0817', '511321', '南部县', '106.036584', '31.347467', 'district');
INSERT INTO `cyx_district` VALUES (2399, 2394, '0817', '511322', '营山县', '106.565519', '31.076579', 'district');
INSERT INTO `cyx_district` VALUES (2400, 2394, '0817', '511323', '蓬安县', '106.412136', '31.029091', 'district');
INSERT INTO `cyx_district` VALUES (2401, 2394, '0817', '511324', '仪陇县', '106.303042', '31.271561', 'district');
INSERT INTO `cyx_district` VALUES (2402, 2394, '0817', '511325', '西充县', '105.90087', '30.995683', 'district');
INSERT INTO `cyx_district` VALUES (2403, 2394, '0817', '511381', '阆中市', '106.005046', '31.558356', 'district');
INSERT INTO `cyx_district` VALUES (2404, 2302, '1833', '511400', '眉山市', '103.848403', '30.076994', 'city');
INSERT INTO `cyx_district` VALUES (2405, 2404, '1833', '511402', '东坡区', '103.831863', '30.042308', 'district');
INSERT INTO `cyx_district` VALUES (2406, 2404, '1833', '511403', '彭山区', '103.872949', '30.193056', 'district');
INSERT INTO `cyx_district` VALUES (2407, 2404, '1833', '511421', '仁寿县', '104.133995', '29.995635', 'district');
INSERT INTO `cyx_district` VALUES (2408, 2404, '1833', '511423', '洪雅县', '103.372863', '29.90489', 'district');
INSERT INTO `cyx_district` VALUES (2409, 2404, '1833', '511424', '丹棱县', '103.512783', '30.01521', 'district');
INSERT INTO `cyx_district` VALUES (2410, 2404, '1833', '511425', '青神县', '103.846688', '29.831357', 'district');
INSERT INTO `cyx_district` VALUES (2411, 2302, '0831', '511500', '宜宾市', '104.642845', '28.752134', 'city');
INSERT INTO `cyx_district` VALUES (2412, 2411, '0831', '511502', '翠屏区', '104.620009', '28.765689', 'district');
INSERT INTO `cyx_district` VALUES (2413, 2411, '0831', '511503', '南溪区', '104.969152', '28.846382', 'district');
INSERT INTO `cyx_district` VALUES (2414, 2411, '0831', '511521', '宜宾县', '104.533212', '28.690045', 'district');
INSERT INTO `cyx_district` VALUES (2415, 2411, '0831', '511523', '江安县', '105.066879', '28.723855', 'district');
INSERT INTO `cyx_district` VALUES (2416, 2411, '0831', '511524', '长宁县', '104.921174', '28.582169', 'district');
INSERT INTO `cyx_district` VALUES (2417, 2411, '0831', '511525', '高县', '104.517748', '28.436166', 'district');
INSERT INTO `cyx_district` VALUES (2418, 2411, '0831', '511526', '珙县', '104.709202', '28.43863', 'district');
INSERT INTO `cyx_district` VALUES (2419, 2411, '0831', '511527', '筠连县', '104.512025', '28.167831', 'district');
INSERT INTO `cyx_district` VALUES (2420, 2411, '0831', '511528', '兴文县', '105.236325', '28.303614', 'district');
INSERT INTO `cyx_district` VALUES (2421, 2411, '0831', '511529', '屏山县', '104.345974', '28.828482', 'district');
INSERT INTO `cyx_district` VALUES (2422, 2302, '0826', '511600', '广安市', '106.633088', '30.456224', 'city');
INSERT INTO `cyx_district` VALUES (2423, 2422, '0826', '511602', '广安区', '106.641662', '30.473913', 'district');
INSERT INTO `cyx_district` VALUES (2424, 2422, '0826', '511603', '前锋区', '106.886143', '30.495804', 'district');
INSERT INTO `cyx_district` VALUES (2425, 2422, '0826', '511621', '岳池县', '106.440114', '30.537863', 'district');
INSERT INTO `cyx_district` VALUES (2426, 2422, '0826', '511622', '武胜县', '106.295764', '30.348772', 'district');
INSERT INTO `cyx_district` VALUES (2427, 2422, '0826', '511623', '邻水县', '106.93038', '30.334768', 'district');
INSERT INTO `cyx_district` VALUES (2428, 2422, '0826', '511681', '华蓥市', '106.7831', '30.390188', 'district');
INSERT INTO `cyx_district` VALUES (2429, 2302, '0818', '511700', '达州市', '107.467758', '31.209121', 'city');
INSERT INTO `cyx_district` VALUES (2430, 2429, '0818', '511702', '通川区', '107.504928', '31.214715', 'district');
INSERT INTO `cyx_district` VALUES (2431, 2429, '0818', '511703', '达川区', '107.511749', '31.196157', 'district');
INSERT INTO `cyx_district` VALUES (2432, 2429, '0818', '511722', '宣汉县', '107.72719', '31.353835', 'district');
INSERT INTO `cyx_district` VALUES (2433, 2429, '0818', '511723', '开江县', '107.868736', '31.082986', 'district');
INSERT INTO `cyx_district` VALUES (2434, 2429, '0818', '511724', '大竹县', '107.204795', '30.73641', 'district');
INSERT INTO `cyx_district` VALUES (2435, 2429, '0818', '511725', '渠县', '106.97303', '30.836618', 'district');
INSERT INTO `cyx_district` VALUES (2436, 2429, '0818', '511781', '万源市', '108.034657', '32.081631', 'district');
INSERT INTO `cyx_district` VALUES (2437, 2302, '0835', '511800', '雅安市', '103.042375', '30.010602', 'city');
INSERT INTO `cyx_district` VALUES (2438, 2437, '0835', '511802', '雨城区', '103.033026', '30.005461', 'district');
INSERT INTO `cyx_district` VALUES (2439, 2437, '0835', '511803', '名山区', '103.109184', '30.069954', 'district');
INSERT INTO `cyx_district` VALUES (2440, 2437, '0835', '511822', '荥经县', '102.846737', '29.792931', 'district');
INSERT INTO `cyx_district` VALUES (2441, 2437, '0835', '511823', '汉源县', '102.645467', '29.347192', 'district');
INSERT INTO `cyx_district` VALUES (2442, 2437, '0835', '511824', '石棉县', '102.359462', '29.227874', 'district');
INSERT INTO `cyx_district` VALUES (2443, 2437, '0835', '511825', '天全县', '102.758317', '30.066712', 'district');
INSERT INTO `cyx_district` VALUES (2444, 2437, '0835', '511826', '芦山县', '102.932385', '30.142307', 'district');
INSERT INTO `cyx_district` VALUES (2445, 2437, '0835', '511827', '宝兴县', '102.815403', '30.37641', 'district');
INSERT INTO `cyx_district` VALUES (2446, 2302, '0827', '511900', '巴中市', '106.747477', '31.867903', 'city');
INSERT INTO `cyx_district` VALUES (2447, 2446, '0827', '511902', '巴州区', '106.768878', '31.851478', 'district');
INSERT INTO `cyx_district` VALUES (2448, 2446, '0827', '511903', '恩阳区', '106.654386', '31.787186', 'district');
INSERT INTO `cyx_district` VALUES (2449, 2446, '0827', '511921', '通江县', '107.245033', '31.911705', 'district');
INSERT INTO `cyx_district` VALUES (2450, 2446, '0827', '511922', '南江县', '106.828697', '32.346589', 'district');
INSERT INTO `cyx_district` VALUES (2451, 2446, '0827', '511923', '平昌县', '107.104008', '31.560874', 'district');
INSERT INTO `cyx_district` VALUES (2452, 2302, '0832', '512000', '资阳市', '104.627636', '30.128901', 'city');
INSERT INTO `cyx_district` VALUES (2453, 2452, '0832', '512002', '雁江区', '104.677091', '30.108216', 'district');
INSERT INTO `cyx_district` VALUES (2454, 2452, '0832', '512021', '安岳县', '105.35534', '30.103107', 'district');
INSERT INTO `cyx_district` VALUES (2455, 2452, '0832', '512022', '乐至县', '105.02019', '30.276121', 'district');
INSERT INTO `cyx_district` VALUES (2456, 2302, '0837', '513200', '阿坝藏族羌族自治州', '102.224653', '31.899413', 'city');
INSERT INTO `cyx_district` VALUES (2457, 2456, '0837', '513201', '马尔康市', '102.20652', '31.905693', 'district');
INSERT INTO `cyx_district` VALUES (2458, 2456, '0837', '513221', '汶川县', '103.590179', '31.476854', 'district');
INSERT INTO `cyx_district` VALUES (2459, 2456, '0837', '513222', '理县', '103.164661', '31.435174', 'district');
INSERT INTO `cyx_district` VALUES (2460, 2456, '0837', '513223', '茂县', '103.853363', '31.681547', 'district');
INSERT INTO `cyx_district` VALUES (2461, 2456, '0837', '513224', '松潘县', '103.604698', '32.655325', 'district');
INSERT INTO `cyx_district` VALUES (2462, 2456, '0837', '513225', '九寨沟县', '104.243841', '33.252056', 'district');
INSERT INTO `cyx_district` VALUES (2463, 2456, '0837', '513226', '金川县', '102.063829', '31.476277', 'district');
INSERT INTO `cyx_district` VALUES (2464, 2456, '0837', '513227', '小金县', '102.362984', '30.995823', 'district');
INSERT INTO `cyx_district` VALUES (2465, 2456, '0837', '513228', '黑水县', '102.990108', '32.061895', 'district');
INSERT INTO `cyx_district` VALUES (2466, 2456, '0837', '513230', '壤塘县', '100.978526', '32.265796', 'district');
INSERT INTO `cyx_district` VALUES (2467, 2456, '0837', '513231', '阿坝县', '101.706655', '32.902459', 'district');
INSERT INTO `cyx_district` VALUES (2468, 2456, '0837', '513232', '若尔盖县', '102.967826', '33.578159', 'district');
INSERT INTO `cyx_district` VALUES (2469, 2456, '0837', '513233', '红原县', '102.544405', '32.790891', 'district');
INSERT INTO `cyx_district` VALUES (2470, 2302, '0836', '513300', '甘孜藏族自治州', '101.96231', '30.04952', 'city');
INSERT INTO `cyx_district` VALUES (2471, 2470, '0836', '513301', '康定市', '101.957146', '29.998435', 'district');
INSERT INTO `cyx_district` VALUES (2472, 2470, '0836', '513322', '泸定县', '102.234617', '29.91416', 'district');
INSERT INTO `cyx_district` VALUES (2473, 2470, '0836', '513323', '丹巴县', '101.890358', '30.878577', 'district');
INSERT INTO `cyx_district` VALUES (2474, 2470, '0836', '513324', '九龙县', '101.507294', '29.000347', 'district');
INSERT INTO `cyx_district` VALUES (2475, 2470, '0836', '513325', '雅江县', '101.014425', '30.031533', 'district');
INSERT INTO `cyx_district` VALUES (2476, 2470, '0836', '513326', '道孚县', '101.125237', '30.979545', 'district');
INSERT INTO `cyx_district` VALUES (2477, 2470, '0836', '513327', '炉霍县', '100.676372', '31.39179', 'district');
INSERT INTO `cyx_district` VALUES (2478, 2470, '0836', '513328', '甘孜县', '99.99267', '31.622933', 'district');
INSERT INTO `cyx_district` VALUES (2479, 2470, '0836', '513329', '新龙县', '100.311368', '30.939169', 'district');
INSERT INTO `cyx_district` VALUES (2480, 2470, '0836', '513330', '德格县', '98.580914', '31.806118', 'district');
INSERT INTO `cyx_district` VALUES (2481, 2470, '0836', '513331', '白玉县', '98.824182', '31.209913', 'district');
INSERT INTO `cyx_district` VALUES (2482, 2470, '0836', '513332', '石渠县', '98.102914', '32.97896', 'district');
INSERT INTO `cyx_district` VALUES (2483, 2470, '0836', '513333', '色达县', '100.332743', '32.268129', 'district');
INSERT INTO `cyx_district` VALUES (2484, 2470, '0836', '513334', '理塘县', '100.269817', '29.996049', 'district');
INSERT INTO `cyx_district` VALUES (2485, 2470, '0836', '513335', '巴塘县', '99.110712', '30.004677', 'district');
INSERT INTO `cyx_district` VALUES (2486, 2470, '0836', '513336', '乡城县', '99.798435', '28.931172', 'district');
INSERT INTO `cyx_district` VALUES (2487, 2470, '0836', '513337', '稻城县', '100.298403', '29.037007', 'district');
INSERT INTO `cyx_district` VALUES (2488, 2470, '0836', '513338', '得荣县', '99.286335', '28.713036', 'district');
INSERT INTO `cyx_district` VALUES (2489, 2302, '0834', '513400', '凉山彝族自治州', '102.267712', '27.88157', 'city');
INSERT INTO `cyx_district` VALUES (2490, 2489, '0834', '513401', '西昌市', '102.264449', '27.894504', 'district');
INSERT INTO `cyx_district` VALUES (2491, 2489, '0834', '513422', '木里藏族自治县', '101.280205', '27.928835', 'district');
INSERT INTO `cyx_district` VALUES (2492, 2489, '0834', '513423', '盐源县', '101.509188', '27.422645', 'district');
INSERT INTO `cyx_district` VALUES (2493, 2489, '0834', '513424', '德昌县', '102.17567', '27.402839', 'district');
INSERT INTO `cyx_district` VALUES (2494, 2489, '0834', '513425', '会理县', '102.244683', '26.655026', 'district');
INSERT INTO `cyx_district` VALUES (2495, 2489, '0834', '513426', '会东县', '102.57796', '26.634669', 'district');
INSERT INTO `cyx_district` VALUES (2496, 2489, '0834', '513427', '宁南县', '102.751745', '27.061189', 'district');
INSERT INTO `cyx_district` VALUES (2497, 2489, '0834', '513428', '普格县', '102.540901', '27.376413', 'district');
INSERT INTO `cyx_district` VALUES (2498, 2489, '0834', '513429', '布拖县', '102.812061', '27.706061', 'district');
INSERT INTO `cyx_district` VALUES (2499, 2489, '0834', '513430', '金阳县', '103.248772', '27.69686', 'district');
INSERT INTO `cyx_district` VALUES (2500, 2489, '0834', '513431', '昭觉县', '102.840264', '28.015333', 'district');
INSERT INTO `cyx_district` VALUES (2501, 2489, '0834', '513432', '喜德县', '102.412518', '28.306726', 'district');
INSERT INTO `cyx_district` VALUES (2502, 2489, '0834', '513433', '冕宁县', '102.17701', '28.549656', 'district');
INSERT INTO `cyx_district` VALUES (2503, 2489, '0834', '513434', '越西县', '102.50768', '28.639801', 'district');
INSERT INTO `cyx_district` VALUES (2504, 2489, '0834', '513435', '甘洛县', '102.771504', '28.959157', 'district');
INSERT INTO `cyx_district` VALUES (2505, 2489, '0834', '513436', '美姑县', '103.132179', '28.32864', 'district');
INSERT INTO `cyx_district` VALUES (2506, 2489, '0834', '513437', '雷波县', '103.571696', '28.262682', 'district');
INSERT INTO `cyx_district` VALUES (2507, 1, '0', '520000', '贵州省', '106.70546', '26.600055', 'province');
INSERT INTO `cyx_district` VALUES (2508, 2507, '0851', '520100', '贵阳市', '106.630153', '26.647661', 'city');
INSERT INTO `cyx_district` VALUES (2509, 2508, '0851', '520102', '南明区', '106.714374', '26.567944', 'district');
INSERT INTO `cyx_district` VALUES (2510, 2508, '0851', '520103', '云岩区', '106.724494', '26.604688', 'district');
INSERT INTO `cyx_district` VALUES (2511, 2508, '0851', '520111', '花溪区', '106.67026', '26.409817', 'district');
INSERT INTO `cyx_district` VALUES (2512, 2508, '0851', '520112', '乌当区', '106.750625', '26.630845', 'district');
INSERT INTO `cyx_district` VALUES (2513, 2508, '0851', '520113', '白云区', '106.623007', '26.678561', 'district');
INSERT INTO `cyx_district` VALUES (2514, 2508, '0851', '520115', '观山湖区', '106.622453', '26.60145', 'district');
INSERT INTO `cyx_district` VALUES (2515, 2508, '0851', '520121', '开阳县', '106.965089', '27.057764', 'district');
INSERT INTO `cyx_district` VALUES (2516, 2508, '0851', '520122', '息烽县', '106.740407', '27.090479', 'district');
INSERT INTO `cyx_district` VALUES (2517, 2508, '0851', '520123', '修文县', '106.592108', '26.838926', 'district');
INSERT INTO `cyx_district` VALUES (2518, 2508, '0851', '520181', '清镇市', '106.470714', '26.556079', 'district');
INSERT INTO `cyx_district` VALUES (2519, 2507, '0858', '520200', '六盘水市', '104.830458', '26.592707', 'city');
INSERT INTO `cyx_district` VALUES (2520, 2519, '0858', '520201', '钟山区', '104.843555', '26.574979', 'district');
INSERT INTO `cyx_district` VALUES (2521, 2519, '0858', '520203', '六枝特区', '105.476608', '26.213108', 'district');
INSERT INTO `cyx_district` VALUES (2522, 2519, '0858', '520221', '水城县', '104.95783', '26.547904', 'district');
INSERT INTO `cyx_district` VALUES (2523, 2519, '0858', '520222', '盘县', '104.471375', '25.709852', 'district');
INSERT INTO `cyx_district` VALUES (2524, 2507, '0852', '520300', '遵义市', '106.927389', '27.725654', 'city');
INSERT INTO `cyx_district` VALUES (2525, 2524, '0852', '520302', '红花岗区', '106.8937', '27.644754', 'district');
INSERT INTO `cyx_district` VALUES (2526, 2524, '0852', '520303', '汇川区', '106.93427', '27.750125', 'district');
INSERT INTO `cyx_district` VALUES (2527, 2524, '0852', '520304', '播州区', '106.829574', '27.536298', 'district');
INSERT INTO `cyx_district` VALUES (2528, 2524, '0852', '520322', '桐梓县', '106.825198', '28.133311', 'district');
INSERT INTO `cyx_district` VALUES (2529, 2524, '0852', '520323', '绥阳县', '107.191222', '27.946222', 'district');
INSERT INTO `cyx_district` VALUES (2530, 2524, '0852', '520324', '正安县', '107.453945', '28.553285', 'district');
INSERT INTO `cyx_district` VALUES (2531, 2524, '0852', '520325', '道真仡佬族苗族自治县', '107.613133', '28.862425', 'district');
INSERT INTO `cyx_district` VALUES (2532, 2524, '0852', '520326', '务川仡佬族苗族自治县', '107.898956', '28.563086', 'district');
INSERT INTO `cyx_district` VALUES (2533, 2524, '0852', '520327', '凤冈县', '107.716355', '27.954695', 'district');
INSERT INTO `cyx_district` VALUES (2534, 2524, '0852', '520328', '湄潭县', '107.465407', '27.749055', 'district');
INSERT INTO `cyx_district` VALUES (2535, 2524, '0852', '520329', '余庆县', '107.905197', '27.215491', 'district');
INSERT INTO `cyx_district` VALUES (2536, 2524, '0852', '520330', '习水县', '106.197137', '28.33127', 'district');
INSERT INTO `cyx_district` VALUES (2537, 2524, '0852', '520381', '赤水市', '105.697472', '28.590337', 'district');
INSERT INTO `cyx_district` VALUES (2538, 2524, '0852', '520382', '仁怀市', '106.40109', '27.792514', 'district');
INSERT INTO `cyx_district` VALUES (2539, 2507, '0853', '520400', '安顺市', '105.947594', '26.253088', 'city');
INSERT INTO `cyx_district` VALUES (2540, 2539, '0853', '520402', '西秀区', '105.965116', '26.245315', 'district');
INSERT INTO `cyx_district` VALUES (2541, 2539, '0853', '520403', '平坝区', '106.256412', '26.405715', 'district');
INSERT INTO `cyx_district` VALUES (2542, 2539, '0853', '520422', '普定县', '105.743277', '26.301565', 'district');
INSERT INTO `cyx_district` VALUES (2543, 2539, '0853', '520423', '镇宁布依族苗族自治县', '105.770283', '26.058086', 'district');
INSERT INTO `cyx_district` VALUES (2544, 2539, '0853', '520424', '关岭布依族苗族自治县', '105.61933', '25.94361', 'district');
INSERT INTO `cyx_district` VALUES (2545, 2539, '0853', '520425', '紫云苗族布依族自治县', '106.084441', '25.751047', 'district');
INSERT INTO `cyx_district` VALUES (2546, 2507, '0857', '520500', '毕节市', '105.291702', '27.283908', 'city');
INSERT INTO `cyx_district` VALUES (2547, 2546, '0857', '520502', '七星关区', '105.30474', '27.298458', 'district');
INSERT INTO `cyx_district` VALUES (2548, 2546, '0857', '520521', '大方县', '105.613037', '27.141735', 'district');
INSERT INTO `cyx_district` VALUES (2549, 2546, '0857', '520522', '黔西县', '106.033544', '27.007713', 'district');
INSERT INTO `cyx_district` VALUES (2550, 2546, '0857', '520523', '金沙县', '106.220227', '27.459214', 'district');
INSERT INTO `cyx_district` VALUES (2551, 2546, '0857', '520524', '织金县', '105.770542', '26.663449', 'district');
INSERT INTO `cyx_district` VALUES (2552, 2546, '0857', '520525', '纳雍县', '105.382714', '26.777645', 'district');
INSERT INTO `cyx_district` VALUES (2553, 2546, '0857', '520526', '威宁彝族回族苗族自治县', '104.253071', '26.873806', 'district');
INSERT INTO `cyx_district` VALUES (2554, 2546, '0857', '520527', '赫章县', '104.727418', '27.123078', 'district');
INSERT INTO `cyx_district` VALUES (2555, 2507, '0856', '520600', '铜仁市', '109.189598', '27.731514', 'city');
INSERT INTO `cyx_district` VALUES (2556, 2555, '0856', '520602', '碧江区', '109.263998', '27.815927', 'district');
INSERT INTO `cyx_district` VALUES (2557, 2555, '0856', '520603', '万山区', '109.213644', '27.517896', 'district');
INSERT INTO `cyx_district` VALUES (2558, 2555, '0856', '520621', '江口县', '108.839557', '27.69965', 'district');
INSERT INTO `cyx_district` VALUES (2559, 2555, '0856', '520622', '玉屏侗族自治县', '108.906411', '27.235813', 'district');
INSERT INTO `cyx_district` VALUES (2560, 2555, '0856', '520623', '石阡县', '108.223612', '27.513829', 'district');
INSERT INTO `cyx_district` VALUES (2561, 2555, '0856', '520624', '思南县', '108.253882', '27.93755', 'district');
INSERT INTO `cyx_district` VALUES (2562, 2555, '0856', '520625', '印江土家族苗族自治县', '108.409751', '27.994246', 'district');
INSERT INTO `cyx_district` VALUES (2563, 2555, '0856', '520626', '德江县', '108.119807', '28.263963', 'district');
INSERT INTO `cyx_district` VALUES (2564, 2555, '0856', '520627', '沿河土家族自治县', '108.50387', '28.563927', 'district');
INSERT INTO `cyx_district` VALUES (2565, 2555, '0856', '520628', '松桃苗族自治县', '109.202886', '28.154071', 'district');
INSERT INTO `cyx_district` VALUES (2566, 2507, '0859', '522300', '黔西南布依族苗族自治州', '104.906397', '25.087856', 'city');
INSERT INTO `cyx_district` VALUES (2567, 2566, '0859', '522301', '兴义市', '104.895467', '25.09204', 'district');
INSERT INTO `cyx_district` VALUES (2568, 2566, '0859', '522322', '兴仁县', '105.186237', '25.435183', 'district');
INSERT INTO `cyx_district` VALUES (2569, 2566, '0859', '522323', '普安县', '104.953062', '25.784135', 'district');
INSERT INTO `cyx_district` VALUES (2570, 2566, '0859', '522324', '晴隆县', '105.218991', '25.834783', 'district');
INSERT INTO `cyx_district` VALUES (2571, 2566, '0859', '522325', '贞丰县', '105.649864', '25.38576', 'district');
INSERT INTO `cyx_district` VALUES (2572, 2566, '0859', '522326', '望谟县', '106.099617', '25.178421', 'district');
INSERT INTO `cyx_district` VALUES (2573, 2566, '0859', '522327', '册亨县', '105.811592', '24.983663', 'district');
INSERT INTO `cyx_district` VALUES (2574, 2566, '0859', '522328', '安龙县', '105.442701', '25.099014', 'district');
INSERT INTO `cyx_district` VALUES (2575, 2507, '0855', '522600', '黔东南苗族侗族自治州', '107.982874', '26.583457', 'city');
INSERT INTO `cyx_district` VALUES (2576, 2575, '0855', '522601', '凯里市', '107.97754', '26.582963', 'district');
INSERT INTO `cyx_district` VALUES (2577, 2575, '0855', '522622', '黄平县', '107.916411', '26.905396', 'district');
INSERT INTO `cyx_district` VALUES (2578, 2575, '0855', '522623', '施秉县', '108.124379', '27.03292', 'district');
INSERT INTO `cyx_district` VALUES (2579, 2575, '0855', '522624', '三穗县', '108.675267', '26.952967', 'district');
INSERT INTO `cyx_district` VALUES (2580, 2575, '0855', '522625', '镇远县', '108.429534', '27.049497', 'district');
INSERT INTO `cyx_district` VALUES (2581, 2575, '0855', '522626', '岑巩县', '108.81606', '27.173887', 'district');
INSERT INTO `cyx_district` VALUES (2582, 2575, '0855', '522627', '天柱县', '109.207751', '26.909639', 'district');
INSERT INTO `cyx_district` VALUES (2583, 2575, '0855', '522628', '锦屏县', '109.200534', '26.676233', 'district');
INSERT INTO `cyx_district` VALUES (2584, 2575, '0855', '522629', '剑河县', '108.441501', '26.728274', 'district');
INSERT INTO `cyx_district` VALUES (2585, 2575, '0855', '522630', '台江县', '108.321245', '26.667525', 'district');
INSERT INTO `cyx_district` VALUES (2586, 2575, '0855', '522631', '黎平县', '109.136932', '26.230706', 'district');
INSERT INTO `cyx_district` VALUES (2587, 2575, '0855', '522632', '榕江县', '108.52188', '25.931893', 'district');
INSERT INTO `cyx_district` VALUES (2588, 2575, '0855', '522633', '从江县', '108.905329', '25.753009', 'district');
INSERT INTO `cyx_district` VALUES (2589, 2575, '0855', '522634', '雷山县', '108.07754', '26.378442', 'district');
INSERT INTO `cyx_district` VALUES (2590, 2575, '0855', '522635', '麻江县', '107.589359', '26.491105', 'district');
INSERT INTO `cyx_district` VALUES (2591, 2575, '0855', '522636', '丹寨县', '107.788727', '26.19832', 'district');
INSERT INTO `cyx_district` VALUES (2592, 2507, '0854', '522700', '黔南布依族苗族自治州', '107.522171', '26.253275', 'city');
INSERT INTO `cyx_district` VALUES (2593, 2592, '0854', '522701', '都匀市', '107.518847', '26.259427', 'district');
INSERT INTO `cyx_district` VALUES (2594, 2592, '0854', '522702', '福泉市', '107.520386', '26.686335', 'district');
INSERT INTO `cyx_district` VALUES (2595, 2592, '0854', '522722', '荔波县', '107.898882', '25.423895', 'district');
INSERT INTO `cyx_district` VALUES (2596, 2592, '0854', '522723', '贵定县', '107.232793', '26.557089', 'district');
INSERT INTO `cyx_district` VALUES (2597, 2592, '0854', '522725', '瓮安县', '107.470942', '27.078441', 'district');
INSERT INTO `cyx_district` VALUES (2598, 2592, '0854', '522726', '独山县', '107.545048', '25.822132', 'district');
INSERT INTO `cyx_district` VALUES (2599, 2592, '0854', '522727', '平塘县', '107.322323', '25.822349', 'district');
INSERT INTO `cyx_district` VALUES (2600, 2592, '0854', '522728', '罗甸县', '106.751589', '25.426173', 'district');
INSERT INTO `cyx_district` VALUES (2601, 2592, '0854', '522729', '长顺县', '106.441805', '26.025626', 'district');
INSERT INTO `cyx_district` VALUES (2602, 2592, '0854', '522730', '龙里县', '106.979524', '26.453154', 'district');
INSERT INTO `cyx_district` VALUES (2603, 2592, '0854', '522731', '惠水县', '106.656442', '26.13278', 'district');
INSERT INTO `cyx_district` VALUES (2604, 2592, '0854', '522732', '三都水族自治县', '107.869749', '25.983202', 'district');
INSERT INTO `cyx_district` VALUES (2605, 1, '0', '530000', '云南省', '102.710002', '25.045806', 'province');
INSERT INTO `cyx_district` VALUES (2606, 2605, '0871', '530100', '昆明市', '102.832891', '24.880095', 'city');
INSERT INTO `cyx_district` VALUES (2607, 2606, '0871', '530102', '五华区', '102.707262', '25.043635', 'district');
INSERT INTO `cyx_district` VALUES (2608, 2606, '0871', '530103', '盘龙区', '102.751941', '25.116465', 'district');
INSERT INTO `cyx_district` VALUES (2609, 2606, '0871', '530111', '官渡区', '102.749026', '24.950231', 'district');
INSERT INTO `cyx_district` VALUES (2610, 2606, '0871', '530112', '西山区', '102.664382', '25.038604', 'district');
INSERT INTO `cyx_district` VALUES (2611, 2606, '0871', '530113', '东川区', '103.187824', '26.082873', 'district');
INSERT INTO `cyx_district` VALUES (2612, 2606, '0871', '530114', '呈贡区', '102.821675', '24.885587', 'district');
INSERT INTO `cyx_district` VALUES (2613, 2606, '0871', '530122', '晋宁区', '102.595412', '24.66974', 'district');
INSERT INTO `cyx_district` VALUES (2614, 2606, '0871', '530124', '富民县', '102.4976', '25.221935', 'district');
INSERT INTO `cyx_district` VALUES (2615, 2606, '0871', '530125', '宜良县', '103.141603', '24.919839', 'district');
INSERT INTO `cyx_district` VALUES (2616, 2606, '0871', '530126', '石林彝族自治县', '103.290536', '24.771761', 'district');
INSERT INTO `cyx_district` VALUES (2617, 2606, '0871', '530127', '嵩明县', '103.036908', '25.338643', 'district');
INSERT INTO `cyx_district` VALUES (2618, 2606, '0871', '530128', '禄劝彝族苗族自治县', '102.471518', '25.551332', 'district');
INSERT INTO `cyx_district` VALUES (2619, 2606, '0871', '530129', '寻甸回族彝族自治县', '103.256615', '25.558201', 'district');
INSERT INTO `cyx_district` VALUES (2620, 2606, '0871', '530181', '安宁市', '102.478494', '24.919493', 'district');
INSERT INTO `cyx_district` VALUES (2621, 2605, '0874', '530300', '曲靖市', '103.796167', '25.489999', 'city');
INSERT INTO `cyx_district` VALUES (2622, 2621, '0874', '530302', '麒麟区', '103.80474', '25.495326', 'district');
INSERT INTO `cyx_district` VALUES (2623, 2621, '0874', '530303', '沾益区', '103.822324', '25.600507', 'district');
INSERT INTO `cyx_district` VALUES (2624, 2621, '0874', '530321', '马龙县', '103.578478', '25.42805', 'district');
INSERT INTO `cyx_district` VALUES (2625, 2621, '0874', '530322', '陆良县', '103.666663', '25.030051', 'district');
INSERT INTO `cyx_district` VALUES (2626, 2621, '0874', '530323', '师宗县', '103.985321', '24.822233', 'district');
INSERT INTO `cyx_district` VALUES (2627, 2621, '0874', '530324', '罗平县', '104.308675', '24.884626', 'district');
INSERT INTO `cyx_district` VALUES (2628, 2621, '0874', '530325', '富源县', '104.255014', '25.674238', 'district');
INSERT INTO `cyx_district` VALUES (2629, 2621, '0874', '530326', '会泽县', '103.297386', '26.417345', 'district');
INSERT INTO `cyx_district` VALUES (2630, 2621, '0874', '530381', '宣威市', '104.10455', '26.219735', 'district');
INSERT INTO `cyx_district` VALUES (2631, 2605, '0877', '530400', '玉溪市', '102.527197', '24.347324', 'city');
INSERT INTO `cyx_district` VALUES (2632, 2631, '0877', '530402', '红塔区', '102.540122', '24.341215', 'district');
INSERT INTO `cyx_district` VALUES (2633, 2631, '0877', '530403', '江川区', '102.75344', '24.287485', 'district');
INSERT INTO `cyx_district` VALUES (2634, 2631, '0877', '530422', '澄江县', '102.904629', '24.675689', 'district');
INSERT INTO `cyx_district` VALUES (2635, 2631, '0877', '530423', '通海县', '102.725452', '24.111048', 'district');
INSERT INTO `cyx_district` VALUES (2636, 2631, '0877', '530424', '华宁县', '102.928835', '24.19276', 'district');
INSERT INTO `cyx_district` VALUES (2637, 2631, '0877', '530425', '易门县', '102.162531', '24.671651', 'district');
INSERT INTO `cyx_district` VALUES (2638, 2631, '0877', '530426', '峨山彝族自治县', '102.405819', '24.168957', 'district');
INSERT INTO `cyx_district` VALUES (2639, 2631, '0877', '530427', '新平彝族傣族自治县', '101.990157', '24.07005', 'district');
INSERT INTO `cyx_district` VALUES (2640, 2631, '0877', '530428', '元江哈尼族彝族傣族自治县', '101.998103', '23.596503', 'district');
INSERT INTO `cyx_district` VALUES (2641, 2605, '0875', '530500', '保山市', '99.161761', '25.112046', 'city');
INSERT INTO `cyx_district` VALUES (2642, 2641, '0875', '530502', '隆阳区', '99.165607', '25.121154', 'district');
INSERT INTO `cyx_district` VALUES (2643, 2641, '0875', '530521', '施甸县', '99.189221', '24.723064', 'district');
INSERT INTO `cyx_district` VALUES (2644, 2641, '0875', '530523', '龙陵县', '98.689261', '24.586794', 'district');
INSERT INTO `cyx_district` VALUES (2645, 2641, '0875', '530524', '昌宁县', '99.605142', '24.827839', 'district');
INSERT INTO `cyx_district` VALUES (2646, 2641, '0875', '530581', '腾冲市', '98.490966', '25.020439', 'district');
INSERT INTO `cyx_district` VALUES (2647, 2605, '0870', '530600', '昭通市', '103.717465', '27.338257', 'city');
INSERT INTO `cyx_district` VALUES (2648, 2647, '0870', '530602', '昭阳区', '103.706539', '27.320075', 'district');
INSERT INTO `cyx_district` VALUES (2649, 2647, '0870', '530621', '鲁甸县', '103.558042', '27.186659', 'district');
INSERT INTO `cyx_district` VALUES (2650, 2647, '0870', '530622', '巧家县', '102.930164', '26.90846', 'district');
INSERT INTO `cyx_district` VALUES (2651, 2647, '0870', '530623', '盐津县', '104.234441', '28.10871', 'district');
INSERT INTO `cyx_district` VALUES (2652, 2647, '0870', '530624', '大关县', '103.891146', '27.747978', 'district');
INSERT INTO `cyx_district` VALUES (2653, 2647, '0870', '530625', '永善县', '103.638067', '28.229112', 'district');
INSERT INTO `cyx_district` VALUES (2654, 2647, '0870', '530626', '绥江县', '103.968978', '28.592099', 'district');
INSERT INTO `cyx_district` VALUES (2655, 2647, '0870', '530627', '镇雄县', '104.87376', '27.441622', 'district');
INSERT INTO `cyx_district` VALUES (2656, 2647, '0870', '530628', '彝良县', '104.048289', '27.625418', 'district');
INSERT INTO `cyx_district` VALUES (2657, 2647, '0870', '530629', '威信县', '105.049027', '27.8469', 'district');
INSERT INTO `cyx_district` VALUES (2658, 2647, '0870', '530630', '水富县', '104.41603', '28.62988', 'district');
INSERT INTO `cyx_district` VALUES (2659, 2605, '0888', '530700', '丽江市', '100.22775', '26.855047', 'city');
INSERT INTO `cyx_district` VALUES (2660, 2659, '0888', '530702', '古城区', '100.225784', '26.876927', 'district');
INSERT INTO `cyx_district` VALUES (2661, 2659, '0888', '530721', '玉龙纳西族自治县', '100.236954', '26.821459', 'district');
INSERT INTO `cyx_district` VALUES (2662, 2659, '0888', '530722', '永胜县', '100.750826', '26.684225', 'district');
INSERT INTO `cyx_district` VALUES (2663, 2659, '0888', '530723', '华坪县', '101.266195', '26.629211', 'district');
INSERT INTO `cyx_district` VALUES (2664, 2659, '0888', '530724', '宁蒗彝族自治县', '100.852001', '27.28207', 'district');
INSERT INTO `cyx_district` VALUES (2665, 2605, '0879', '530800', '普洱市', '100.966156', '22.825155', 'city');
INSERT INTO `cyx_district` VALUES (2666, 2665, '0879', '530802', '思茅区', '100.977256', '22.787115', 'district');
INSERT INTO `cyx_district` VALUES (2667, 2665, '0879', '530821', '宁洱哈尼族彝族自治县', '101.045837', '23.048401', 'district');
INSERT INTO `cyx_district` VALUES (2668, 2665, '0879', '530822', '墨江哈尼族自治县', '101.692461', '23.431894', 'district');
INSERT INTO `cyx_district` VALUES (2669, 2665, '0879', '530823', '景东彝族自治县', '100.833877', '24.446731', 'district');
INSERT INTO `cyx_district` VALUES (2670, 2665, '0879', '530824', '景谷傣族彝族自治县', '100.702871', '23.497028', 'district');
INSERT INTO `cyx_district` VALUES (2671, 2665, '0879', '530825', '镇沅彝族哈尼族拉祜族自治县', '101.108595', '24.004441', 'district');
INSERT INTO `cyx_district` VALUES (2672, 2665, '0879', '530826', '江城哈尼族彝族自治县', '101.86212', '22.585867', 'district');
INSERT INTO `cyx_district` VALUES (2673, 2665, '0879', '530827', '孟连傣族拉祜族佤族自治县', '99.584157', '22.329099', 'district');
INSERT INTO `cyx_district` VALUES (2674, 2665, '0879', '530828', '澜沧拉祜族自治县', '99.931975', '22.555904', 'district');
INSERT INTO `cyx_district` VALUES (2675, 2665, '0879', '530829', '西盟佤族自治县', '99.590123', '22.644508', 'district');
INSERT INTO `cyx_district` VALUES (2676, 2605, '0883', '530900', '临沧市', '100.08879', '23.883955', 'city');
INSERT INTO `cyx_district` VALUES (2677, 2676, '0883', '530902', '临翔区', '100.082523', '23.895137', 'district');
INSERT INTO `cyx_district` VALUES (2678, 2676, '0883', '530921', '凤庆县', '99.928459', '24.580424', 'district');
INSERT INTO `cyx_district` VALUES (2679, 2676, '0883', '530922', '云县', '100.129354', '24.44422', 'district');
INSERT INTO `cyx_district` VALUES (2680, 2676, '0883', '530923', '永德县', '99.259339', '24.018357', 'district');
INSERT INTO `cyx_district` VALUES (2681, 2676, '0883', '530924', '镇康县', '98.825284', '23.762584', 'district');
INSERT INTO `cyx_district` VALUES (2682, 2676, '0883', '530925', '双江拉祜族佤族布朗族傣族自治县', '99.827697', '23.473499', 'district');
INSERT INTO `cyx_district` VALUES (2683, 2676, '0883', '530926', '耿马傣族佤族自治县', '99.397126', '23.538092', 'district');
INSERT INTO `cyx_district` VALUES (2684, 2676, '0883', '530927', '沧源佤族自治县', '99.246196', '23.146712', 'district');
INSERT INTO `cyx_district` VALUES (2685, 2605, '0878', '532300', '楚雄彝族自治州', '101.527992', '25.045513', 'city');
INSERT INTO `cyx_district` VALUES (2686, 2685, '0878', '532301', '楚雄市', '101.545906', '25.032889', 'district');
INSERT INTO `cyx_district` VALUES (2687, 2685, '0878', '532322', '双柏县', '101.641937', '24.688875', 'district');
INSERT INTO `cyx_district` VALUES (2688, 2685, '0878', '532323', '牟定县', '101.546566', '25.313121', 'district');
INSERT INTO `cyx_district` VALUES (2689, 2685, '0878', '532324', '南华县', '101.273577', '25.192293', 'district');
INSERT INTO `cyx_district` VALUES (2690, 2685, '0878', '532325', '姚安县', '101.241728', '25.504173', 'district');
INSERT INTO `cyx_district` VALUES (2691, 2685, '0878', '532326', '大姚县', '101.336617', '25.729513', 'district');
INSERT INTO `cyx_district` VALUES (2692, 2685, '0878', '532327', '永仁县', '101.666132', '26.049464', 'district');
INSERT INTO `cyx_district` VALUES (2693, 2685, '0878', '532328', '元谋县', '101.87452', '25.704338', 'district');
INSERT INTO `cyx_district` VALUES (2694, 2685, '0878', '532329', '武定县', '102.404337', '25.530389', 'district');
INSERT INTO `cyx_district` VALUES (2695, 2685, '0878', '532331', '禄丰县', '102.079027', '25.150111', 'district');
INSERT INTO `cyx_district` VALUES (2696, 2605, '0873', '532500', '红河哈尼族彝族自治州', '103.374893', '23.363245', 'city');
INSERT INTO `cyx_district` VALUES (2697, 2696, '0873', '532501', '个旧市', '103.160034', '23.359121', 'district');
INSERT INTO `cyx_district` VALUES (2698, 2696, '0873', '532502', '开远市', '103.266624', '23.714523', 'district');
INSERT INTO `cyx_district` VALUES (2699, 2696, '0873', '532503', '蒙自市', '103.364905', '23.396201', 'district');
INSERT INTO `cyx_district` VALUES (2700, 2696, '0873', '532504', '弥勒市', '103.414874', '24.411912', 'district');
INSERT INTO `cyx_district` VALUES (2701, 2696, '0873', '532523', '屏边苗族自治县', '103.687612', '22.983559', 'district');
INSERT INTO `cyx_district` VALUES (2702, 2696, '0873', '532524', '建水县', '102.826557', '23.6347', 'district');
INSERT INTO `cyx_district` VALUES (2703, 2696, '0873', '532525', '石屏县', '102.494983', '23.705936', 'district');
INSERT INTO `cyx_district` VALUES (2704, 2696, '0873', '532527', '泸西县', '103.766196', '24.532025', 'district');
INSERT INTO `cyx_district` VALUES (2705, 2696, '0873', '532528', '元阳县', '102.835223', '23.219932', 'district');
INSERT INTO `cyx_district` VALUES (2706, 2696, '0873', '532529', '红河县', '102.4206', '23.369161', 'district');
INSERT INTO `cyx_district` VALUES (2707, 2696, '0873', '532530', '金平苗族瑶族傣族自治县', '103.226448', '22.779543', 'district');
INSERT INTO `cyx_district` VALUES (2708, 2696, '0873', '532531', '绿春县', '102.392463', '22.993717', 'district');
INSERT INTO `cyx_district` VALUES (2709, 2696, '0873', '532532', '河口瑶族自治县', '103.93952', '22.529645', 'district');
INSERT INTO `cyx_district` VALUES (2710, 2605, '0876', '532600', '文山壮族苗族自治州', '104.216248', '23.400733', 'city');
INSERT INTO `cyx_district` VALUES (2711, 2710, '0876', '532601', '文山市', '104.232665', '23.386527', 'district');
INSERT INTO `cyx_district` VALUES (2712, 2710, '0876', '532622', '砚山县', '104.337211', '23.605768', 'district');
INSERT INTO `cyx_district` VALUES (2713, 2710, '0876', '532623', '西畴县', '104.672597', '23.437782', 'district');
INSERT INTO `cyx_district` VALUES (2714, 2710, '0876', '532624', '麻栗坡县', '104.702799', '23.125714', 'district');
INSERT INTO `cyx_district` VALUES (2715, 2710, '0876', '532625', '马关县', '104.394157', '23.012915', 'district');
INSERT INTO `cyx_district` VALUES (2716, 2710, '0876', '532626', '丘北县', '104.166587', '24.051746', 'district');
INSERT INTO `cyx_district` VALUES (2717, 2710, '0876', '532627', '广南县', '105.055107', '24.046386', 'district');
INSERT INTO `cyx_district` VALUES (2718, 2710, '0876', '532628', '富宁县', '105.630999', '23.625283', 'district');
INSERT INTO `cyx_district` VALUES (2719, 2605, '0691', '532800', '西双版纳傣族自治州', '100.796984', '22.009113', 'city');
INSERT INTO `cyx_district` VALUES (2720, 2719, '0691', '532801', '景洪市', '100.799545', '22.011928', 'district');
INSERT INTO `cyx_district` VALUES (2721, 2719, '0691', '532822', '勐海县', '100.452547', '21.957353', 'district');
INSERT INTO `cyx_district` VALUES (2722, 2719, '0691', '532823', '勐腊县', '101.564635', '21.459233', 'district');
INSERT INTO `cyx_district` VALUES (2723, 2605, '0872', '532900', '大理白族自治州', '100.267638', '25.606486', 'city');
INSERT INTO `cyx_district` VALUES (2724, 2723, '0872', '532901', '大理市', '100.30127', '25.678068', 'district');
INSERT INTO `cyx_district` VALUES (2725, 2723, '0872', '532922', '漾濞彝族自治县', '99.958015', '25.670148', 'district');
INSERT INTO `cyx_district` VALUES (2726, 2723, '0872', '532923', '祥云县', '100.550945', '25.48385', 'district');
INSERT INTO `cyx_district` VALUES (2727, 2723, '0872', '532924', '宾川县', '100.590473', '25.829828', 'district');
INSERT INTO `cyx_district` VALUES (2728, 2723, '0872', '532925', '弥渡县', '100.49099', '25.343804', 'district');
INSERT INTO `cyx_district` VALUES (2729, 2723, '0872', '532926', '南涧彝族自治县', '100.509035', '25.04351', 'district');
INSERT INTO `cyx_district` VALUES (2730, 2723, '0872', '532927', '巍山彝族回族自治县', '100.307174', '25.227212', 'district');
INSERT INTO `cyx_district` VALUES (2731, 2723, '0872', '532928', '永平县', '99.541236', '25.464681', 'district');
INSERT INTO `cyx_district` VALUES (2732, 2723, '0872', '532929', '云龙县', '99.37112', '25.885595', 'district');
INSERT INTO `cyx_district` VALUES (2733, 2723, '0872', '532930', '洱源县', '99.951053', '26.11116', 'district');
INSERT INTO `cyx_district` VALUES (2734, 2723, '0872', '532931', '剑川县', '99.905559', '26.537033', 'district');
INSERT INTO `cyx_district` VALUES (2735, 2723, '0872', '532932', '鹤庆县', '100.176498', '26.560231', 'district');
INSERT INTO `cyx_district` VALUES (2736, 2605, '0692', '533100', '德宏傣族景颇族自治州', '98.584895', '24.433353', 'city');
INSERT INTO `cyx_district` VALUES (2737, 2736, '0692', '533102', '瑞丽市', '97.85559', '24.017958', 'district');
INSERT INTO `cyx_district` VALUES (2738, 2736, '0692', '533103', '芒市', '98.588086', '24.43369', 'district');
INSERT INTO `cyx_district` VALUES (2739, 2736, '0692', '533122', '梁河县', '98.296657', '24.804232', 'district');
INSERT INTO `cyx_district` VALUES (2740, 2736, '0692', '533123', '盈江县', '97.931936', '24.705164', 'district');
INSERT INTO `cyx_district` VALUES (2741, 2736, '0692', '533124', '陇川县', '97.792104', '24.182965', 'district');
INSERT INTO `cyx_district` VALUES (2742, 2605, '0886', '533300', '怒江傈僳族自治州', '98.8566', '25.817555', 'city');
INSERT INTO `cyx_district` VALUES (2743, 2742, '0886', '533301', '泸水市', '98.857977', '25.822879', 'district');
INSERT INTO `cyx_district` VALUES (2744, 2742, '0886', '533323', '福贡县', '98.869132', '26.901831', 'district');
INSERT INTO `cyx_district` VALUES (2745, 2742, '0886', '533324', '贡山独龙族怒族自治县', '98.665964', '27.740999', 'district');
INSERT INTO `cyx_district` VALUES (2746, 2742, '0886', '533325', '兰坪白族普米族自治县', '99.416677', '26.453571', 'district');
INSERT INTO `cyx_district` VALUES (2747, 2605, '0887', '533400', '迪庆藏族自治州', '99.702583', '27.818807', 'city');
INSERT INTO `cyx_district` VALUES (2748, 2747, '0887', '533401', '香格里拉市', '99.700904', '27.829578', 'district');
INSERT INTO `cyx_district` VALUES (2749, 2747, '0887', '533422', '德钦县', '98.911559', '28.486163', 'district');
INSERT INTO `cyx_district` VALUES (2750, 2747, '0887', '533423', '维西傈僳族自治县', '99.287173', '27.177161', 'district');
INSERT INTO `cyx_district` VALUES (2751, 1, '0', '540000', '西藏自治区', '91.117525', '29.647535', 'province');
INSERT INTO `cyx_district` VALUES (2752, 2751, '0891', '540100', '拉萨市', '91.172148', '29.652341', 'city');
INSERT INTO `cyx_district` VALUES (2753, 2752, '0891', '540102', '城关区', '91.140552', '29.654838', 'district');
INSERT INTO `cyx_district` VALUES (2754, 2752, '0891', '540103', '堆龙德庆区', '91.003339', '29.646063', 'district');
INSERT INTO `cyx_district` VALUES (2755, 2752, '0891', '540121', '林周县', '91.265287', '29.893545', 'district');
INSERT INTO `cyx_district` VALUES (2756, 2752, '0891', '540122', '当雄县', '91.101162', '30.473118', 'district');
INSERT INTO `cyx_district` VALUES (2757, 2752, '0891', '540123', '尼木县', '90.164524', '29.431831', 'district');
INSERT INTO `cyx_district` VALUES (2758, 2752, '0891', '540124', '曲水县', '90.743853', '29.353058', 'district');
INSERT INTO `cyx_district` VALUES (2759, 2752, '0891', '540126', '达孜县', '91.349867', '29.66941', 'district');
INSERT INTO `cyx_district` VALUES (2760, 2752, '0891', '540127', '墨竹工卡县', '91.730732', '29.834111', 'district');
INSERT INTO `cyx_district` VALUES (2761, 2751, '0892', '540200', '日喀则市', '88.880583', '29.266869', 'city');
INSERT INTO `cyx_district` VALUES (2762, 2761, '0892', '540202', '桑珠孜区', '88.898483', '29.24779', 'district');
INSERT INTO `cyx_district` VALUES (2763, 2761, '0892', '540221', '南木林县', '89.099242', '29.68233', 'district');
INSERT INTO `cyx_district` VALUES (2764, 2761, '0892', '540222', '江孜县', '89.605627', '28.911626', 'district');
INSERT INTO `cyx_district` VALUES (2765, 2761, '0892', '540223', '定日县', '87.12612', '28.658743', 'district');
INSERT INTO `cyx_district` VALUES (2766, 2761, '0892', '540224', '萨迦县', '88.021674', '28.899664', 'district');
INSERT INTO `cyx_district` VALUES (2767, 2761, '0892', '540225', '拉孜县', '87.63704', '29.081659', 'district');
INSERT INTO `cyx_district` VALUES (2768, 2761, '0892', '540226', '昂仁县', '87.236051', '29.294802', 'district');
INSERT INTO `cyx_district` VALUES (2769, 2761, '0892', '540227', '谢通门县', '88.261664', '29.432476', 'district');
INSERT INTO `cyx_district` VALUES (2770, 2761, '0892', '540228', '白朗县', '89.261977', '29.107688', 'district');
INSERT INTO `cyx_district` VALUES (2771, 2761, '0892', '540229', '仁布县', '89.841983', '29.230933', 'district');
INSERT INTO `cyx_district` VALUES (2772, 2761, '0892', '540230', '康马县', '89.681663', '28.555627', 'district');
INSERT INTO `cyx_district` VALUES (2773, 2761, '0892', '540231', '定结县', '87.765872', '28.364159', 'district');
INSERT INTO `cyx_district` VALUES (2774, 2761, '0892', '540232', '仲巴县', '84.03153', '29.770279', 'district');
INSERT INTO `cyx_district` VALUES (2775, 2761, '0892', '540233', '亚东县', '88.907093', '27.484806', 'district');
INSERT INTO `cyx_district` VALUES (2776, 2761, '0892', '540234', '吉隆县', '85.297534', '28.852393', 'district');
INSERT INTO `cyx_district` VALUES (2777, 2761, '0892', '540235', '聂拉木县', '85.982237', '28.155186', 'district');
INSERT INTO `cyx_district` VALUES (2778, 2761, '0892', '540236', '萨嘎县', '85.232941', '29.328818', 'district');
INSERT INTO `cyx_district` VALUES (2779, 2761, '0892', '540237', '岗巴县', '88.520031', '28.274601', 'district');
INSERT INTO `cyx_district` VALUES (2780, 2751, '0895', '540300', '昌都市', '97.17202', '31.140969', 'city');
INSERT INTO `cyx_district` VALUES (2781, 2780, '0895', '540302', '卡若区', '97.196021', '31.112087', 'district');
INSERT INTO `cyx_district` VALUES (2782, 2780, '0895', '540321', '江达县', '98.21843', '31.499202', 'district');
INSERT INTO `cyx_district` VALUES (2783, 2780, '0895', '540322', '贡觉县', '98.27097', '30.860099', 'district');
INSERT INTO `cyx_district` VALUES (2784, 2780, '0895', '540323', '类乌齐县', '96.600246', '31.211601', 'district');
INSERT INTO `cyx_district` VALUES (2785, 2780, '0895', '540324', '丁青县', '95.619868', '31.409024', 'district');
INSERT INTO `cyx_district` VALUES (2786, 2780, '0895', '540325', '察雅县', '97.568752', '30.653943', 'district');
INSERT INTO `cyx_district` VALUES (2787, 2780, '0895', '540326', '八宿县', '96.917836', '30.053209', 'district');
INSERT INTO `cyx_district` VALUES (2788, 2780, '0895', '540327', '左贡县', '97.841022', '29.671069', 'district');
INSERT INTO `cyx_district` VALUES (2789, 2780, '0895', '540328', '芒康县', '98.593113', '29.679907', 'district');
INSERT INTO `cyx_district` VALUES (2790, 2780, '0895', '540329', '洛隆县', '95.825197', '30.741845', 'district');
INSERT INTO `cyx_district` VALUES (2791, 2780, '0895', '540330', '边坝县', '94.7078', '30.933652', 'district');
INSERT INTO `cyx_district` VALUES (2792, 2751, '0894', '540400', '林芝市', '94.36149', '29.649128', 'city');
INSERT INTO `cyx_district` VALUES (2793, 2792, '0894', '540402', '巴宜区', '94.361094', '29.636576', 'district');
INSERT INTO `cyx_district` VALUES (2794, 2792, '0894', '540421', '工布江达县', '93.246077', '29.88528', 'district');
INSERT INTO `cyx_district` VALUES (2795, 2792, '0894', '540422', '米林县', '94.213679', '29.213811', 'district');
INSERT INTO `cyx_district` VALUES (2796, 2792, '0894', '540423', '墨脱县', '95.333197', '29.325298', 'district');
INSERT INTO `cyx_district` VALUES (2797, 2792, '0894', '540424', '波密县', '95.767913', '29.859028', 'district');
INSERT INTO `cyx_district` VALUES (2798, 2792, '0894', '540425', '察隅县', '97.466919', '28.66128', 'district');
INSERT INTO `cyx_district` VALUES (2799, 2792, '0894', '540426', '朗县', '93.074702', '29.046337', 'district');
INSERT INTO `cyx_district` VALUES (2800, 2751, '0893', '540500', '山南市', '91.773134', '29.237137', 'city');
INSERT INTO `cyx_district` VALUES (2801, 2800, '0893', '540502', '乃东区', '91.761538', '29.224904', 'district');
INSERT INTO `cyx_district` VALUES (2802, 2800, '0893', '540521', '扎囊县', '91.33725', '29.245113', 'district');
INSERT INTO `cyx_district` VALUES (2803, 2800, '0893', '540522', '贡嘎县', '90.98414', '29.289455', 'district');
INSERT INTO `cyx_district` VALUES (2804, 2800, '0893', '540523', '桑日县', '92.015818', '29.259189', 'district');
INSERT INTO `cyx_district` VALUES (2805, 2800, '0893', '540524', '琼结县', '91.683881', '29.024625', 'district');
INSERT INTO `cyx_district` VALUES (2806, 2800, '0893', '540525', '曲松县', '92.203738', '29.062826', 'district');
INSERT INTO `cyx_district` VALUES (2807, 2800, '0893', '540526', '措美县', '91.433509', '28.438202', 'district');
INSERT INTO `cyx_district` VALUES (2808, 2800, '0893', '540527', '洛扎县', '90.859992', '28.385713', 'district');
INSERT INTO `cyx_district` VALUES (2809, 2800, '0893', '540528', '加查县', '92.593993', '29.14029', 'district');
INSERT INTO `cyx_district` VALUES (2810, 2800, '0893', '540529', '隆子县', '92.463308', '28.408548', 'district');
INSERT INTO `cyx_district` VALUES (2811, 2800, '0893', '540530', '错那县', '91.960132', '27.991707', 'district');
INSERT INTO `cyx_district` VALUES (2812, 2800, '0893', '540531', '浪卡子县', '90.397977', '28.968031', 'district');
INSERT INTO `cyx_district` VALUES (2813, 2751, '0896', '542400', '那曲地区', '92.052064', '31.476479', 'city');
INSERT INTO `cyx_district` VALUES (2814, 2813, '0896', '542421', '那曲县', '92.0535', '31.469643', 'district');
INSERT INTO `cyx_district` VALUES (2815, 2813, '0896', '542422', '嘉黎县', '93.232528', '30.640814', 'district');
INSERT INTO `cyx_district` VALUES (2816, 2813, '0896', '542423', '比如县', '93.679639', '31.480249', 'district');
INSERT INTO `cyx_district` VALUES (2817, 2813, '0896', '542424', '聂荣县', '92.303377', '32.10775', 'district');
INSERT INTO `cyx_district` VALUES (2818, 2813, '0896', '542425', '安多县', '91.68233', '32.265176', 'district');
INSERT INTO `cyx_district` VALUES (2819, 2813, '0896', '542426', '申扎县', '88.709852', '30.930505', 'district');
INSERT INTO `cyx_district` VALUES (2820, 2813, '0896', '542427', '索县', '93.785516', '31.886671', 'district');
INSERT INTO `cyx_district` VALUES (2821, 2813, '0896', '542428', '班戈县', '90.009957', '31.392411', 'district');
INSERT INTO `cyx_district` VALUES (2822, 2813, '0896', '542429', '巴青县', '94.053438', '31.91847', 'district');
INSERT INTO `cyx_district` VALUES (2823, 2813, '0896', '542430', '尼玛县', '87.236772', '31.784701', 'district');
INSERT INTO `cyx_district` VALUES (2824, 2813, '0896', '542431', '双湖县', '88.837641', '33.188514', 'district');
INSERT INTO `cyx_district` VALUES (2825, 2751, '0897', '542500', '阿里地区', '80.105804', '32.501111', 'city');
INSERT INTO `cyx_district` VALUES (2826, 2825, '0897', '542521', '普兰县', '81.176237', '30.294402', 'district');
INSERT INTO `cyx_district` VALUES (2827, 2825, '0897', '542522', '札达县', '79.802706', '31.479216', 'district');
INSERT INTO `cyx_district` VALUES (2828, 2825, '0897', '542523', '噶尔县', '80.096419', '32.491488', 'district');
INSERT INTO `cyx_district` VALUES (2829, 2825, '0897', '542524', '日土县', '79.732427', '33.381359', 'district');
INSERT INTO `cyx_district` VALUES (2830, 2825, '0897', '542525', '革吉县', '81.145433', '32.387233', 'district');
INSERT INTO `cyx_district` VALUES (2831, 2825, '0897', '542526', '改则县', '84.06259', '32.302713', 'district');
INSERT INTO `cyx_district` VALUES (2832, 2825, '0897', '542527', '措勤县', '85.151455', '31.017312', 'district');
INSERT INTO `cyx_district` VALUES (2833, 1, '0', '610000', '陕西省', '108.954347', '34.265502', 'province');
INSERT INTO `cyx_district` VALUES (2834, 2833, '029', '610100', '西安市', '108.93977', '34.341574', 'city');
INSERT INTO `cyx_district` VALUES (2835, 2834, '029', '610102', '新城区', '108.960716', '34.266447', 'district');
INSERT INTO `cyx_district` VALUES (2836, 2834, '029', '610103', '碑林区', '108.94059', '34.256783', 'district');
INSERT INTO `cyx_district` VALUES (2837, 2834, '029', '610104', '莲湖区', '108.943895', '34.265239', 'district');
INSERT INTO `cyx_district` VALUES (2838, 2834, '029', '610111', '灞桥区', '109.064646', '34.272793', 'district');
INSERT INTO `cyx_district` VALUES (2839, 2834, '029', '610112', '未央区', '108.946825', '34.29292', 'district');
INSERT INTO `cyx_district` VALUES (2840, 2834, '029', '610113', '雁塔区', '108.944644', '34.214113', 'district');
INSERT INTO `cyx_district` VALUES (2841, 2834, '029', '610114', '阎良区', '109.226124', '34.662232', 'district');
INSERT INTO `cyx_district` VALUES (2842, 2834, '029', '610115', '临潼区', '109.214237', '34.367069', 'district');
INSERT INTO `cyx_district` VALUES (2843, 2834, '029', '610116', '长安区', '108.907173', '34.158926', 'district');
INSERT INTO `cyx_district` VALUES (2844, 2834, '029', '610117', '高陵区', '109.088297', '34.534829', 'district');
INSERT INTO `cyx_district` VALUES (2845, 2834, '029', '610122', '蓝田县', '109.32345', '34.151298', 'district');
INSERT INTO `cyx_district` VALUES (2846, 2834, '029', '610124', '周至县', '108.222162', '34.163669', 'district');
INSERT INTO `cyx_district` VALUES (2847, 2834, '029', '610125', '鄠邑区', '108.604894', '34.109244', 'district');
INSERT INTO `cyx_district` VALUES (2848, 2833, '0919', '610200', '铜川市', '108.945019', '34.897887', 'city');
INSERT INTO `cyx_district` VALUES (2849, 2848, '0919', '610202', '王益区', '109.075578', '35.068964', 'district');
INSERT INTO `cyx_district` VALUES (2850, 2848, '0919', '610203', '印台区', '109.099974', '35.114492', 'district');
INSERT INTO `cyx_district` VALUES (2851, 2848, '0919', '610204', '耀州区', '108.980102', '34.909793', 'district');
INSERT INTO `cyx_district` VALUES (2852, 2848, '0919', '610222', '宜君县', '109.116932', '35.398577', 'district');
INSERT INTO `cyx_district` VALUES (2853, 2833, '0917', '610300', '宝鸡市', '107.237743', '34.363184', 'city');
INSERT INTO `cyx_district` VALUES (2854, 2853, '0917', '610302', '渭滨区', '107.155344', '34.355068', 'district');
INSERT INTO `cyx_district` VALUES (2855, 2853, '0917', '610303', '金台区', '107.146806', '34.376069', 'district');
INSERT INTO `cyx_district` VALUES (2856, 2853, '0917', '610304', '陈仓区', '107.369987', '34.35147', 'district');
INSERT INTO `cyx_district` VALUES (2857, 2853, '0917', '610322', '凤翔县', '107.400737', '34.521217', 'district');
INSERT INTO `cyx_district` VALUES (2858, 2853, '0917', '610323', '岐山县', '107.621053', '34.443459', 'district');
INSERT INTO `cyx_district` VALUES (2859, 2853, '0917', '610324', '扶风县', '107.900219', '34.37541', 'district');
INSERT INTO `cyx_district` VALUES (2860, 2853, '0917', '610326', '眉县', '107.749766', '34.274246', 'district');
INSERT INTO `cyx_district` VALUES (2861, 2853, '0917', '610327', '陇县', '106.864397', '34.89305', 'district');
INSERT INTO `cyx_district` VALUES (2862, 2853, '0917', '610328', '千阳县', '107.132441', '34.642381', 'district');
INSERT INTO `cyx_district` VALUES (2863, 2853, '0917', '610329', '麟游县', '107.793524', '34.677902', 'district');
INSERT INTO `cyx_district` VALUES (2864, 2853, '0917', '610330', '凤县', '106.515803', '33.91091', 'district');
INSERT INTO `cyx_district` VALUES (2865, 2853, '0917', '610331', '太白县', '107.319116', '34.058401', 'district');
INSERT INTO `cyx_district` VALUES (2866, 2833, '0910', '610400', '咸阳市', '108.709136', '34.32987', 'city');
INSERT INTO `cyx_district` VALUES (2867, 2866, '0910', '610402', '秦都区', '108.706272', '34.329567', 'district');
INSERT INTO `cyx_district` VALUES (2868, 2866, '0910', '610403', '杨陵区', '108.084731', '34.272117', 'district');
INSERT INTO `cyx_district` VALUES (2869, 2866, '0910', '610404', '渭城区', '108.737204', '34.36195', 'district');
INSERT INTO `cyx_district` VALUES (2870, 2866, '0910', '610422', '三原县', '108.940509', '34.617381', 'district');
INSERT INTO `cyx_district` VALUES (2871, 2866, '0910', '610423', '泾阳县', '108.842622', '34.527114', 'district');
INSERT INTO `cyx_district` VALUES (2872, 2866, '0910', '610424', '乾县', '108.239473', '34.527551', 'district');
INSERT INTO `cyx_district` VALUES (2873, 2866, '0910', '610425', '礼泉县', '108.425018', '34.481764', 'district');
INSERT INTO `cyx_district` VALUES (2874, 2866, '0910', '610426', '永寿县', '108.142311', '34.691979', 'district');
INSERT INTO `cyx_district` VALUES (2875, 2866, '0910', '610427', '彬县', '108.077658', '35.043911', 'district');
INSERT INTO `cyx_district` VALUES (2876, 2866, '0910', '610428', '长武县', '107.798757', '35.205886', 'district');
INSERT INTO `cyx_district` VALUES (2877, 2866, '0910', '610429', '旬邑县', '108.333986', '35.111978', 'district');
INSERT INTO `cyx_district` VALUES (2878, 2866, '0910', '610430', '淳化县', '108.580681', '34.79925', 'district');
INSERT INTO `cyx_district` VALUES (2879, 2866, '0910', '610431', '武功县', '108.200398', '34.260203', 'district');
INSERT INTO `cyx_district` VALUES (2880, 2866, '0910', '610481', '兴平市', '108.490475', '34.29922', 'district');
INSERT INTO `cyx_district` VALUES (2881, 2833, '0913', '610500', '渭南市', '109.471094', '34.52044', 'city');
INSERT INTO `cyx_district` VALUES (2882, 2881, '0913', '610502', '临渭区', '109.510175', '34.499314', 'district');
INSERT INTO `cyx_district` VALUES (2883, 2881, '0913', '610503', '华州区', '109.775247', '34.495915', 'district');
INSERT INTO `cyx_district` VALUES (2884, 2881, '0913', '610522', '潼关县', '110.246349', '34.544296', 'district');
INSERT INTO `cyx_district` VALUES (2885, 2881, '0913', '610523', '大荔县', '109.941734', '34.797259', 'district');
INSERT INTO `cyx_district` VALUES (2886, 2881, '0913', '610524', '合阳县', '110.149453', '35.237988', 'district');
INSERT INTO `cyx_district` VALUES (2887, 2881, '0913', '610525', '澄城县', '109.93235', '35.190245', 'district');
INSERT INTO `cyx_district` VALUES (2888, 2881, '0913', '610526', '蒲城县', '109.586403', '34.955562', 'district');
INSERT INTO `cyx_district` VALUES (2889, 2881, '0913', '610527', '白水县', '109.590671', '35.177451', 'district');
INSERT INTO `cyx_district` VALUES (2890, 2881, '0913', '610528', '富平县', '109.18032', '34.751077', 'district');
INSERT INTO `cyx_district` VALUES (2891, 2881, '0913', '610581', '韩城市', '110.442846', '35.476788', 'district');
INSERT INTO `cyx_district` VALUES (2892, 2881, '0913', '610582', '华阴市', '110.092078', '34.566079', 'district');
INSERT INTO `cyx_district` VALUES (2893, 2833, '0911', '610600', '延安市', '109.494112', '36.651381', 'city');
INSERT INTO `cyx_district` VALUES (2894, 2893, '0911', '610602', '宝塔区', '109.48976', '36.585472', 'district');
INSERT INTO `cyx_district` VALUES (2895, 2893, '0911', '610621', '延长县', '110.012334', '36.579313', 'district');
INSERT INTO `cyx_district` VALUES (2896, 2893, '0911', '610622', '延川县', '110.193514', '36.878117', 'district');
INSERT INTO `cyx_district` VALUES (2897, 2893, '0911', '610623', '子长县', '109.675264', '37.142535', 'district');
INSERT INTO `cyx_district` VALUES (2898, 2893, '0911', '610624', '安塞区', '109.328842', '36.863853', 'district');
INSERT INTO `cyx_district` VALUES (2899, 2893, '0911', '610625', '志丹县', '108.768432', '36.822194', 'district');
INSERT INTO `cyx_district` VALUES (2900, 2893, '0911', '610626', '吴起县', '108.175933', '36.927215', 'district');
INSERT INTO `cyx_district` VALUES (2901, 2893, '0911', '610627', '甘泉县', '109.351019', '36.276526', 'district');
INSERT INTO `cyx_district` VALUES (2902, 2893, '0911', '610628', '富县', '109.379776', '35.987953', 'district');
INSERT INTO `cyx_district` VALUES (2903, 2893, '0911', '610629', '洛川县', '109.432369', '35.761974', 'district');
INSERT INTO `cyx_district` VALUES (2904, 2893, '0911', '610630', '宜川县', '110.168963', '36.050178', 'district');
INSERT INTO `cyx_district` VALUES (2905, 2893, '0911', '610631', '黄龙县', '109.840314', '35.584743', 'district');
INSERT INTO `cyx_district` VALUES (2906, 2893, '0911', '610632', '黄陵县', '109.262961', '35.579427', 'district');
INSERT INTO `cyx_district` VALUES (2907, 2833, '0916', '610700', '汉中市', '107.02305', '33.067225', 'city');
INSERT INTO `cyx_district` VALUES (2908, 2907, '0916', '610702', '汉台区', '107.031856', '33.067771', 'district');
INSERT INTO `cyx_district` VALUES (2909, 2907, '0916', '610721', '南郑县', '106.93623', '32.999333', 'district');
INSERT INTO `cyx_district` VALUES (2910, 2907, '0916', '610722', '城固县', '107.33393', '33.157131', 'district');
INSERT INTO `cyx_district` VALUES (2911, 2907, '0916', '610723', '洋县', '107.545836', '33.222738', 'district');
INSERT INTO `cyx_district` VALUES (2912, 2907, '0916', '610724', '西乡县', '107.766613', '32.983101', 'district');
INSERT INTO `cyx_district` VALUES (2913, 2907, '0916', '610725', '勉县', '106.673221', '33.153553', 'district');
INSERT INTO `cyx_district` VALUES (2914, 2907, '0916', '610726', '宁强县', '106.257171', '32.829694', 'district');
INSERT INTO `cyx_district` VALUES (2915, 2907, '0916', '610727', '略阳县', '106.156718', '33.327281', 'district');
INSERT INTO `cyx_district` VALUES (2916, 2907, '0916', '610728', '镇巴县', '107.895035', '32.536704', 'district');
INSERT INTO `cyx_district` VALUES (2917, 2907, '0916', '610729', '留坝县', '106.920808', '33.617571', 'district');
INSERT INTO `cyx_district` VALUES (2918, 2907, '0916', '610730', '佛坪县', '107.990538', '33.524359', 'district');
INSERT INTO `cyx_district` VALUES (2919, 2833, '0912', '610800', '榆林市', '109.734474', '38.285369', 'city');
INSERT INTO `cyx_district` VALUES (2920, 2919, '0912', '610802', '榆阳区', '109.721069', '38.277046', 'district');
INSERT INTO `cyx_district` VALUES (2921, 2919, '0912', '610803', '横山区', '109.294346', '37.962208', 'district');
INSERT INTO `cyx_district` VALUES (2922, 2919, '0912', '610821', '神木县', '110.498939', '38.842578', 'district');
INSERT INTO `cyx_district` VALUES (2923, 2919, '0912', '610822', '府谷县', '111.067276', '39.028116', 'district');
INSERT INTO `cyx_district` VALUES (2924, 2919, '0912', '610824', '靖边县', '108.793988', '37.599438', 'district');
INSERT INTO `cyx_district` VALUES (2925, 2919, '0912', '610825', '定边县', '107.601267', '37.594612', 'district');
INSERT INTO `cyx_district` VALUES (2926, 2919, '0912', '610826', '绥德县', '110.263362', '37.50294', 'district');
INSERT INTO `cyx_district` VALUES (2927, 2919, '0912', '610827', '米脂县', '110.183754', '37.755416', 'district');
INSERT INTO `cyx_district` VALUES (2928, 2919, '0912', '610828', '佳县', '110.491345', '38.01951', 'district');
INSERT INTO `cyx_district` VALUES (2929, 2919, '0912', '610829', '吴堡县', '110.739673', '37.452067', 'district');
INSERT INTO `cyx_district` VALUES (2930, 2919, '0912', '610830', '清涧县', '110.121209', '37.088878', 'district');
INSERT INTO `cyx_district` VALUES (2931, 2919, '0912', '610831', '子洲县', '110.03525', '37.610683', 'district');
INSERT INTO `cyx_district` VALUES (2932, 2833, '0915', '610900', '安康市', '109.029113', '32.68481', 'city');
INSERT INTO `cyx_district` VALUES (2933, 2932, '0915', '610902', '汉滨区', '109.026836', '32.695172', 'district');
INSERT INTO `cyx_district` VALUES (2934, 2932, '0915', '610921', '汉阴县', '108.508745', '32.893026', 'district');
INSERT INTO `cyx_district` VALUES (2935, 2932, '0915', '610922', '石泉县', '108.247886', '33.038408', 'district');
INSERT INTO `cyx_district` VALUES (2936, 2932, '0915', '610923', '宁陕县', '108.314283', '33.310527', 'district');
INSERT INTO `cyx_district` VALUES (2937, 2932, '0915', '610924', '紫阳县', '108.534228', '32.520246', 'district');
INSERT INTO `cyx_district` VALUES (2938, 2932, '0915', '610925', '岚皋县', '108.902049', '32.307001', 'district');
INSERT INTO `cyx_district` VALUES (2939, 2932, '0915', '610926', '平利县', '109.361864', '32.388854', 'district');
INSERT INTO `cyx_district` VALUES (2940, 2932, '0915', '610927', '镇坪县', '109.526873', '31.883672', 'district');
INSERT INTO `cyx_district` VALUES (2941, 2932, '0915', '610928', '旬阳县', '109.361024', '32.832012', 'district');
INSERT INTO `cyx_district` VALUES (2942, 2932, '0915', '610929', '白河县', '110.112629', '32.809026', 'district');
INSERT INTO `cyx_district` VALUES (2943, 2833, '0914', '611000', '商洛市', '109.91857', '33.872726', 'city');
INSERT INTO `cyx_district` VALUES (2944, 2943, '0914', '611002', '商州区', '109.941839', '33.862599', 'district');
INSERT INTO `cyx_district` VALUES (2945, 2943, '0914', '611021', '洛南县', '110.148508', '34.090837', 'district');
INSERT INTO `cyx_district` VALUES (2946, 2943, '0914', '611022', '丹凤县', '110.32733', '33.695783', 'district');
INSERT INTO `cyx_district` VALUES (2947, 2943, '0914', '611023', '商南县', '110.881807', '33.530995', 'district');
INSERT INTO `cyx_district` VALUES (2948, 2943, '0914', '611024', '山阳县', '109.882289', '33.532172', 'district');
INSERT INTO `cyx_district` VALUES (2949, 2943, '0914', '611025', '镇安县', '109.152892', '33.423357', 'district');
INSERT INTO `cyx_district` VALUES (2950, 2943, '0914', '611026', '柞水县', '109.114206', '33.68611', 'district');
INSERT INTO `cyx_district` VALUES (2951, 1, '0', '620000', '甘肃省', '103.826447', '36.05956', 'province');
INSERT INTO `cyx_district` VALUES (2952, 2951, '0931', '620100', '兰州市', '103.834303', '36.061089', 'city');
INSERT INTO `cyx_district` VALUES (2953, 2952, '0931', '620102', '城关区', '103.825307', '36.057464', 'district');
INSERT INTO `cyx_district` VALUES (2954, 2952, '0931', '620103', '七里河区', '103.785949', '36.066146', 'district');
INSERT INTO `cyx_district` VALUES (2955, 2952, '0931', '620104', '西固区', '103.627951', '36.088552', 'district');
INSERT INTO `cyx_district` VALUES (2956, 2952, '0931', '620105', '安宁区', '103.719054', '36.104579', 'district');
INSERT INTO `cyx_district` VALUES (2957, 2952, '0931', '620111', '红古区', '102.859323', '36.345669', 'district');
INSERT INTO `cyx_district` VALUES (2958, 2952, '0931', '620121', '永登县', '103.26038', '36.736513', 'district');
INSERT INTO `cyx_district` VALUES (2959, 2952, '0931', '620122', '皋兰县', '103.947377', '36.332663', 'district');
INSERT INTO `cyx_district` VALUES (2960, 2952, '0931', '620123', '榆中县', '104.112527', '35.843056', 'district');
INSERT INTO `cyx_district` VALUES (2961, 2951, '1937', '620200', '嘉峪关市', '98.289419', '39.772554', 'city');
INSERT INTO `cyx_district` VALUES (2962, 2961, '1937', '620200', '嘉峪关市', '98.289419', '39.772554', 'district');
INSERT INTO `cyx_district` VALUES (2963, 2951, '0935', '620300', '金昌市', '102.188117', '38.520717', 'city');
INSERT INTO `cyx_district` VALUES (2964, 2963, '0935', '620302', '金川区', '102.194015', '38.521087', 'district');
INSERT INTO `cyx_district` VALUES (2965, 2963, '0935', '620321', '永昌县', '101.984458', '38.243434', 'district');
INSERT INTO `cyx_district` VALUES (2966, 2951, '0943', '620400', '白银市', '104.138771', '36.545261', 'city');
INSERT INTO `cyx_district` VALUES (2967, 2966, '0943', '620402', '白银区', '104.148556', '36.535398', 'district');
INSERT INTO `cyx_district` VALUES (2968, 2966, '0943', '620403', '平川区', '104.825208', '36.728304', 'district');
INSERT INTO `cyx_district` VALUES (2969, 2966, '0943', '620421', '靖远县', '104.676774', '36.571365', 'district');
INSERT INTO `cyx_district` VALUES (2970, 2966, '0943', '620422', '会宁县', '105.053358', '35.692823', 'district');
INSERT INTO `cyx_district` VALUES (2971, 2966, '0943', '620423', '景泰县', '104.063091', '37.183804', 'district');
INSERT INTO `cyx_district` VALUES (2972, 2951, '0938', '620500', '天水市', '105.724979', '34.580885', 'city');
INSERT INTO `cyx_district` VALUES (2973, 2972, '0938', '620502', '秦州区', '105.724215', '34.580888', 'district');
INSERT INTO `cyx_district` VALUES (2974, 2972, '0938', '620503', '麦积区', '105.889556', '34.570384', 'district');
INSERT INTO `cyx_district` VALUES (2975, 2972, '0938', '620521', '清水县', '106.137293', '34.749864', 'district');
INSERT INTO `cyx_district` VALUES (2976, 2972, '0938', '620522', '秦安县', '105.674982', '34.858916', 'district');
INSERT INTO `cyx_district` VALUES (2977, 2972, '0938', '620523', '甘谷县', '105.340747', '34.745486', 'district');
INSERT INTO `cyx_district` VALUES (2978, 2972, '0938', '620524', '武山县', '104.890587', '34.72139', 'district');
INSERT INTO `cyx_district` VALUES (2979, 2972, '0938', '620525', '张家川回族自治县', '106.204517', '34.988037', 'district');
INSERT INTO `cyx_district` VALUES (2980, 2951, '1935', '620600', '武威市', '102.638201', '37.928267', 'city');
INSERT INTO `cyx_district` VALUES (2981, 2980, '1935', '620602', '凉州区', '102.642184', '37.928224', 'district');
INSERT INTO `cyx_district` VALUES (2982, 2980, '1935', '620621', '民勤县', '103.093791', '38.62435', 'district');
INSERT INTO `cyx_district` VALUES (2983, 2980, '1935', '620622', '古浪县', '102.897533', '37.47012', 'district');
INSERT INTO `cyx_district` VALUES (2984, 2980, '1935', '620623', '天祝藏族自治县', '103.141757', '36.97174', 'district');
INSERT INTO `cyx_district` VALUES (2985, 2951, '0936', '620700', '张掖市', '100.449913', '38.925548', 'city');
INSERT INTO `cyx_district` VALUES (2986, 2985, '0936', '620702', '甘州区', '100.415096', '38.944662', 'district');
INSERT INTO `cyx_district` VALUES (2987, 2985, '0936', '620721', '肃南裕固族自治县', '99.615601', '38.836931', 'district');
INSERT INTO `cyx_district` VALUES (2988, 2985, '0936', '620722', '民乐县', '100.812629', '38.430347', 'district');
INSERT INTO `cyx_district` VALUES (2989, 2985, '0936', '620723', '临泽县', '100.164283', '39.152462', 'district');
INSERT INTO `cyx_district` VALUES (2990, 2985, '0936', '620724', '高台县', '99.819519', '39.378311', 'district');
INSERT INTO `cyx_district` VALUES (2991, 2985, '0936', '620725', '山丹县', '101.088529', '38.784505', 'district');
INSERT INTO `cyx_district` VALUES (2992, 2951, '0933', '620800', '平凉市', '106.665061', '35.542606', 'city');
INSERT INTO `cyx_district` VALUES (2993, 2992, '0933', '620802', '崆峒区', '106.674767', '35.542491', 'district');
INSERT INTO `cyx_district` VALUES (2994, 2992, '0933', '620821', '泾川县', '107.36785', '35.332666', 'district');
INSERT INTO `cyx_district` VALUES (2995, 2992, '0933', '620822', '灵台县', '107.595874', '35.070027', 'district');
INSERT INTO `cyx_district` VALUES (2996, 2992, '0933', '620823', '崇信县', '107.025763', '35.305596', 'district');
INSERT INTO `cyx_district` VALUES (2997, 2992, '0933', '620824', '华亭县', '106.653158', '35.218292', 'district');
INSERT INTO `cyx_district` VALUES (2998, 2992, '0933', '620825', '庄浪县', '106.036686', '35.202385', 'district');
INSERT INTO `cyx_district` VALUES (2999, 2992, '0933', '620826', '静宁县', '105.732556', '35.521976', 'district');
INSERT INTO `cyx_district` VALUES (3000, 2951, '0937', '620900', '酒泉市', '98.493927', '39.732795', 'city');
INSERT INTO `cyx_district` VALUES (3001, 3000, '0937', '620902', '肃州区', '98.507843', '39.744953', 'district');
INSERT INTO `cyx_district` VALUES (3002, 3000, '0937', '620921', '金塔县', '98.901252', '39.983955', 'district');
INSERT INTO `cyx_district` VALUES (3003, 3000, '0937', '620922', '瓜州县', '95.782318', '40.520538', 'district');
INSERT INTO `cyx_district` VALUES (3004, 3000, '0937', '620923', '肃北蒙古族自治县', '94.876579', '39.51245', 'district');
INSERT INTO `cyx_district` VALUES (3005, 3000, '0937', '620924', '阿克塞哈萨克族自治县', '94.340204', '39.633943', 'district');
INSERT INTO `cyx_district` VALUES (3006, 3000, '0937', '620981', '玉门市', '97.045661', '40.292106', 'district');
INSERT INTO `cyx_district` VALUES (3007, 3000, '0937', '620982', '敦煌市', '94.661941', '40.142089', 'district');
INSERT INTO `cyx_district` VALUES (3008, 2951, '0934', '621000', '庆阳市', '107.643571', '35.70898', 'city');
INSERT INTO `cyx_district` VALUES (3009, 3008, '0934', '621002', '西峰区', '107.651077', '35.730652', 'district');
INSERT INTO `cyx_district` VALUES (3010, 3008, '0934', '621021', '庆城县', '107.881802', '36.016299', 'district');
INSERT INTO `cyx_district` VALUES (3011, 3008, '0934', '621022', '环县', '107.308501', '36.568434', 'district');
INSERT INTO `cyx_district` VALUES (3012, 3008, '0934', '621023', '华池县', '107.990062', '36.461306', 'district');
INSERT INTO `cyx_district` VALUES (3013, 3008, '0934', '621024', '合水县', '108.019554', '35.819194', 'district');
INSERT INTO `cyx_district` VALUES (3014, 3008, '0934', '621025', '正宁县', '108.359865', '35.49178', 'district');
INSERT INTO `cyx_district` VALUES (3015, 3008, '0934', '621026', '宁县', '107.928371', '35.502176', 'district');
INSERT INTO `cyx_district` VALUES (3016, 3008, '0934', '621027', '镇原县', '107.200832', '35.677462', 'district');
INSERT INTO `cyx_district` VALUES (3017, 2951, '0932', '621100', '定西市', '104.592225', '35.606978', 'city');
INSERT INTO `cyx_district` VALUES (3018, 3017, '0932', '621102', '安定区', '104.610668', '35.580629', 'district');
INSERT INTO `cyx_district` VALUES (3019, 3017, '0932', '621121', '通渭县', '105.24206', '35.210831', 'district');
INSERT INTO `cyx_district` VALUES (3020, 3017, '0932', '621122', '陇西县', '104.634983', '35.00394', 'district');
INSERT INTO `cyx_district` VALUES (3021, 3017, '0932', '621123', '渭源县', '104.215467', '35.136755', 'district');
INSERT INTO `cyx_district` VALUES (3022, 3017, '0932', '621124', '临洮县', '103.859565', '35.394988', 'district');
INSERT INTO `cyx_district` VALUES (3023, 3017, '0932', '621125', '漳县', '104.471572', '34.848444', 'district');
INSERT INTO `cyx_district` VALUES (3024, 3017, '0932', '621126', '岷县', '104.03688', '34.438075', 'district');
INSERT INTO `cyx_district` VALUES (3025, 2951, '2935', '621200', '陇南市', '104.960851', '33.37068', 'city');
INSERT INTO `cyx_district` VALUES (3026, 3025, '2935', '621202', '武都区', '104.926337', '33.392211', 'district');
INSERT INTO `cyx_district` VALUES (3027, 3025, '2935', '621221', '成县', '105.742424', '33.75061', 'district');
INSERT INTO `cyx_district` VALUES (3028, 3025, '2935', '621222', '文县', '104.683433', '32.943815', 'district');
INSERT INTO `cyx_district` VALUES (3029, 3025, '2935', '621223', '宕昌县', '104.393385', '34.047261', 'district');
INSERT INTO `cyx_district` VALUES (3030, 3025, '2935', '621224', '康县', '105.609169', '33.329136', 'district');
INSERT INTO `cyx_district` VALUES (3031, 3025, '2935', '621225', '西和县', '105.298756', '34.014215', 'district');
INSERT INTO `cyx_district` VALUES (3032, 3025, '2935', '621226', '礼县', '105.17864', '34.189345', 'district');
INSERT INTO `cyx_district` VALUES (3033, 3025, '2935', '621227', '徽县', '106.08778', '33.768826', 'district');
INSERT INTO `cyx_district` VALUES (3034, 3025, '2935', '621228', '两当县', '106.304966', '33.908917', 'district');
INSERT INTO `cyx_district` VALUES (3035, 2951, '0930', '622900', '临夏回族自治州', '103.210655', '35.601352', 'city');
INSERT INTO `cyx_district` VALUES (3036, 3035, '0930', '622901', '临夏市', '103.243021', '35.604376', 'district');
INSERT INTO `cyx_district` VALUES (3037, 3035, '0930', '622921', '临夏县', '103.039826', '35.478722', 'district');
INSERT INTO `cyx_district` VALUES (3038, 3035, '0930', '622922', '康乐县', '103.708354', '35.370505', 'district');
INSERT INTO `cyx_district` VALUES (3039, 3035, '0930', '622923', '永靖县', '103.285853', '35.958306', 'district');
INSERT INTO `cyx_district` VALUES (3040, 3035, '0930', '622924', '广河县', '103.575834', '35.488051', 'district');
INSERT INTO `cyx_district` VALUES (3041, 3035, '0930', '622925', '和政县', '103.350997', '35.424603', 'district');
INSERT INTO `cyx_district` VALUES (3042, 3035, '0930', '622926', '东乡族自治县', '103.389346', '35.663752', 'district');
INSERT INTO `cyx_district` VALUES (3043, 3035, '0930', '622927', '积石山保安族东乡族撒拉族自治县', '102.875843', '35.71766', 'district');
INSERT INTO `cyx_district` VALUES (3044, 2951, '0941', '623000', '甘南藏族自治州', '102.910995', '34.983409', 'city');
INSERT INTO `cyx_district` VALUES (3045, 3044, '0941', '623001', '合作市', '102.910484', '35.000286', 'district');
INSERT INTO `cyx_district` VALUES (3046, 3044, '0941', '623021', '临潭县', '103.353919', '34.692747', 'district');
INSERT INTO `cyx_district` VALUES (3047, 3044, '0941', '623022', '卓尼县', '103.507109', '34.589588', 'district');
INSERT INTO `cyx_district` VALUES (3048, 3044, '0941', '623023', '舟曲县', '104.251482', '33.793631', 'district');
INSERT INTO `cyx_district` VALUES (3049, 3044, '0941', '623024', '迭部县', '103.221869', '34.055938', 'district');
INSERT INTO `cyx_district` VALUES (3050, 3044, '0941', '623025', '玛曲县', '102.072698', '33.997712', 'district');
INSERT INTO `cyx_district` VALUES (3051, 3044, '0941', '623026', '碌曲县', '102.487327', '34.590944', 'district');
INSERT INTO `cyx_district` VALUES (3052, 3044, '0941', '623027', '夏河县', '102.521807', '35.202503', 'district');
INSERT INTO `cyx_district` VALUES (3053, 1, '0', '630000', '青海省', '101.780268', '36.620939', 'province');
INSERT INTO `cyx_district` VALUES (3054, 3053, '0971', '630100', '西宁市', '101.778223', '36.617134', 'city');
INSERT INTO `cyx_district` VALUES (3055, 3054, '0971', '630102', '城东区', '101.803717', '36.599744', 'district');
INSERT INTO `cyx_district` VALUES (3056, 3054, '0971', '630103', '城中区', '101.705298', '36.545652', 'district');
INSERT INTO `cyx_district` VALUES (3057, 3054, '0971', '630104', '城西区', '101.765843', '36.628304', 'district');
INSERT INTO `cyx_district` VALUES (3058, 3054, '0971', '630105', '城北区', '101.766228', '36.650038', 'district');
INSERT INTO `cyx_district` VALUES (3059, 3054, '0971', '630121', '大通回族土族自治县', '101.685643', '36.926954', 'district');
INSERT INTO `cyx_district` VALUES (3060, 3054, '0971', '630122', '湟中县', '101.571667', '36.500879', 'district');
INSERT INTO `cyx_district` VALUES (3061, 3054, '0971', '630123', '湟源县', '101.256464', '36.682426', 'district');
INSERT INTO `cyx_district` VALUES (3062, 3053, '0972', '630200', '海东市', '102.104287', '36.502039', 'city');
INSERT INTO `cyx_district` VALUES (3063, 3062, '0972', '630202', '乐都区', '102.401724', '36.482058', 'district');
INSERT INTO `cyx_district` VALUES (3064, 3062, '0972', '630203', '平安区', '102.108834', '36.500563', 'district');
INSERT INTO `cyx_district` VALUES (3065, 3062, '0972', '630222', '民和回族土族自治县', '102.830892', '36.320321', 'district');
INSERT INTO `cyx_district` VALUES (3066, 3062, '0972', '630223', '互助土族自治县', '101.959271', '36.844248', 'district');
INSERT INTO `cyx_district` VALUES (3067, 3062, '0972', '630224', '化隆回族自治县', '102.264143', '36.094908', 'district');
INSERT INTO `cyx_district` VALUES (3068, 3062, '0972', '630225', '循化撒拉族自治县', '102.489135', '35.851152', 'district');
INSERT INTO `cyx_district` VALUES (3069, 3053, '0970', '632200', '海北藏族自治州', '100.900997', '36.954413', 'city');
INSERT INTO `cyx_district` VALUES (3070, 3069, '0970', '632221', '门源回族自治县', '101.611539', '37.388746', 'district');
INSERT INTO `cyx_district` VALUES (3071, 3069, '0970', '632222', '祁连县', '100.253211', '38.177112', 'district');
INSERT INTO `cyx_district` VALUES (3072, 3069, '0970', '632223', '海晏县', '100.99426', '36.896359', 'district');
INSERT INTO `cyx_district` VALUES (3073, 3069, '0970', '632224', '刚察县', '100.145833', '37.32547', 'district');
INSERT INTO `cyx_district` VALUES (3074, 3053, '0973', '632300', '黄南藏族自治州', '102.015248', '35.519548', 'city');
INSERT INTO `cyx_district` VALUES (3075, 3074, '0973', '632321', '同仁县', '102.018323', '35.516063', 'district');
INSERT INTO `cyx_district` VALUES (3076, 3074, '0973', '632322', '尖扎县', '102.04014', '35.943156', 'district');
INSERT INTO `cyx_district` VALUES (3077, 3074, '0973', '632323', '泽库县', '101.466689', '35.035313', 'district');
INSERT INTO `cyx_district` VALUES (3078, 3074, '0973', '632324', '河南蒙古族自治县', '101.617503', '34.734568', 'district');
INSERT INTO `cyx_district` VALUES (3079, 3053, '0974', '632500', '海南藏族自治州', '100.622692', '36.296529', 'city');
INSERT INTO `cyx_district` VALUES (3080, 3079, '0974', '632521', '共和县', '100.620031', '36.284107', 'district');
INSERT INTO `cyx_district` VALUES (3081, 3079, '0974', '632522', '同德县', '100.578051', '35.25479', 'district');
INSERT INTO `cyx_district` VALUES (3082, 3079, '0974', '632523', '贵德县', '101.433391', '36.040166', 'district');
INSERT INTO `cyx_district` VALUES (3083, 3079, '0974', '632524', '兴海县', '99.987965', '35.588612', 'district');
INSERT INTO `cyx_district` VALUES (3084, 3079, '0974', '632525', '贵南县', '100.747503', '35.586714', 'district');
INSERT INTO `cyx_district` VALUES (3085, 3053, '0975', '632600', '果洛藏族自治州', '100.244808', '34.471431', 'city');
INSERT INTO `cyx_district` VALUES (3086, 3085, '0975', '632621', '玛沁县', '100.238888', '34.477433', 'district');
INSERT INTO `cyx_district` VALUES (3087, 3085, '0975', '632622', '班玛县', '100.737138', '32.932723', 'district');
INSERT INTO `cyx_district` VALUES (3088, 3085, '0975', '632623', '甘德县', '99.900923', '33.969216', 'district');
INSERT INTO `cyx_district` VALUES (3089, 3085, '0975', '632624', '达日县', '99.651392', '33.74892', 'district');
INSERT INTO `cyx_district` VALUES (3090, 3085, '0975', '632625', '久治县', '101.482831', '33.429471', 'district');
INSERT INTO `cyx_district` VALUES (3091, 3085, '0975', '632626', '玛多县', '98.209206', '34.915946', 'district');
INSERT INTO `cyx_district` VALUES (3092, 3053, '0976', '632700', '玉树藏族自治州', '97.091934', '33.011674', 'city');
INSERT INTO `cyx_district` VALUES (3093, 3092, '0976', '632701', '玉树市', '97.008784', '32.993106', 'district');
INSERT INTO `cyx_district` VALUES (3094, 3092, '0976', '632722', '杂多县', '95.300723', '32.893185', 'district');
INSERT INTO `cyx_district` VALUES (3095, 3092, '0976', '632723', '称多县', '97.110831', '33.369218', 'district');
INSERT INTO `cyx_district` VALUES (3096, 3092, '0976', '632724', '治多县', '95.61896', '33.844956', 'district');
INSERT INTO `cyx_district` VALUES (3097, 3092, '0976', '632725', '囊谦县', '96.48943', '32.203432', 'district');
INSERT INTO `cyx_district` VALUES (3098, 3092, '0976', '632726', '曲麻莱县', '95.797367', '34.126428', 'district');
INSERT INTO `cyx_district` VALUES (3099, 3053, '0977', '632800', '海西蒙古族藏族自治州', '97.369751', '37.377139', 'city');
INSERT INTO `cyx_district` VALUES (3100, 3099, '0977', '632801', '格尔木市', '94.928453', '36.406367', 'district');
INSERT INTO `cyx_district` VALUES (3101, 3099, '0977', '632802', '德令哈市', '97.360984', '37.369436', 'district');
INSERT INTO `cyx_district` VALUES (3102, 3099, '0977', '632821', '乌兰县', '98.480195', '36.929749', 'district');
INSERT INTO `cyx_district` VALUES (3103, 3099, '0977', '632822', '都兰县', '98.095844', '36.302496', 'district');
INSERT INTO `cyx_district` VALUES (3104, 3099, '0977', '632823', '天峻县', '99.022984', '37.300851', 'district');
INSERT INTO `cyx_district` VALUES (3105, 3099, '0977', '632825', '海西蒙古族藏族自治州直辖', '95.356546', '37.853328', 'district');
INSERT INTO `cyx_district` VALUES (3106, 1, '0', '640000', '宁夏回族自治区', '106.259126', '38.472641', 'province');
INSERT INTO `cyx_district` VALUES (3107, 3106, '0951', '640100', '银川市', '106.230909', '38.487193', 'city');
INSERT INTO `cyx_district` VALUES (3108, 3107, '0951', '640104', '兴庆区', '106.28865', '38.473609', 'district');
INSERT INTO `cyx_district` VALUES (3109, 3107, '0951', '640105', '西夏区', '106.161106', '38.502605', 'district');
INSERT INTO `cyx_district` VALUES (3110, 3107, '0951', '640106', '金凤区', '106.239679', '38.47436', 'district');
INSERT INTO `cyx_district` VALUES (3111, 3107, '0951', '640121', '永宁县', '106.253145', '38.277372', 'district');
INSERT INTO `cyx_district` VALUES (3112, 3107, '0951', '640122', '贺兰县', '106.349861', '38.554599', 'district');
INSERT INTO `cyx_district` VALUES (3113, 3107, '0951', '640181', '灵武市', '106.340053', '38.102655', 'district');
INSERT INTO `cyx_district` VALUES (3114, 3106, '0952', '640200', '石嘴山市', '106.383303', '38.983236', 'city');
INSERT INTO `cyx_district` VALUES (3115, 3114, '0952', '640202', '大武口区', '106.367958', '39.01918', 'district');
INSERT INTO `cyx_district` VALUES (3116, 3114, '0952', '640205', '惠农区', '106.781176', '39.239302', 'district');
INSERT INTO `cyx_district` VALUES (3117, 3114, '0952', '640221', '平罗县', '106.523474', '38.913544', 'district');
INSERT INTO `cyx_district` VALUES (3118, 3106, '0953', '640300', '吴忠市', '106.198913', '37.997428', 'city');
INSERT INTO `cyx_district` VALUES (3119, 3118, '0953', '640302', '利通区', '106.212613', '37.98349', 'district');
INSERT INTO `cyx_district` VALUES (3120, 3118, '0953', '640303', '红寺堡区', '106.062113', '37.425702', 'district');
INSERT INTO `cyx_district` VALUES (3121, 3118, '0953', '640323', '盐池县', '107.407358', '37.783205', 'district');
INSERT INTO `cyx_district` VALUES (3122, 3118, '0953', '640324', '同心县', '105.895309', '36.95449', 'district');
INSERT INTO `cyx_district` VALUES (3123, 3118, '0953', '640381', '青铜峡市', '106.078817', '38.021302', 'district');
INSERT INTO `cyx_district` VALUES (3124, 3106, '0954', '640400', '固原市', '106.24261', '36.015855', 'city');
INSERT INTO `cyx_district` VALUES (3125, 3124, '0954', '640402', '原州区', '106.287781', '36.003739', 'district');
INSERT INTO `cyx_district` VALUES (3126, 3124, '0954', '640422', '西吉县', '105.729085', '35.963912', 'district');
INSERT INTO `cyx_district` VALUES (3127, 3124, '0954', '640423', '隆德县', '106.111595', '35.625914', 'district');
INSERT INTO `cyx_district` VALUES (3128, 3124, '0954', '640424', '泾源县', '106.330646', '35.498159', 'district');
INSERT INTO `cyx_district` VALUES (3129, 3124, '0954', '640425', '彭阳县', '106.631809', '35.858815', 'district');
INSERT INTO `cyx_district` VALUES (3130, 3106, '1953', '640500', '中卫市', '105.196902', '37.499972', 'city');
INSERT INTO `cyx_district` VALUES (3131, 3130, '1953', '640502', '沙坡头区', '105.173721', '37.516883', 'district');
INSERT INTO `cyx_district` VALUES (3132, 3130, '1953', '640521', '中宁县', '105.685218', '37.491546', 'district');
INSERT INTO `cyx_district` VALUES (3133, 3130, '1953', '640522', '海原县', '105.643487', '36.565033', 'district');
INSERT INTO `cyx_district` VALUES (3134, 1, '0', '650000', '新疆维吾尔自治区', '87.627704', '43.793026', 'province');
INSERT INTO `cyx_district` VALUES (3135, 3134, '1997', '659002', '阿拉尔市', '81.280527', '40.547653', 'city');
INSERT INTO `cyx_district` VALUES (3136, 3135, '1997', '659002', '阿拉尔市', '81.280527', '40.547653', 'district');
INSERT INTO `cyx_district` VALUES (3137, 3134, '1906', '659005', '北屯市', '87.837075', '47.332643', 'city');
INSERT INTO `cyx_district` VALUES (3138, 3137, '1906', '659005', '北屯市', '87.837075', '47.332643', 'district');
INSERT INTO `cyx_district` VALUES (3139, 3134, '1999', '659008', '可克达拉市', '81.044542', '43.944798', 'city');
INSERT INTO `cyx_district` VALUES (3140, 3139, '1999', '659008', '可克达拉市', '81.044542', '43.944798', 'district');
INSERT INTO `cyx_district` VALUES (3141, 3134, '1903', '659009', '昆玉市', '79.291083', '37.209642', 'city');
INSERT INTO `cyx_district` VALUES (3142, 3141, '1903', '659009', '昆玉市', '79.291083', '37.209642', 'district');
INSERT INTO `cyx_district` VALUES (3143, 3134, '0993', '659001', '石河子市', '86.080602', '44.306097', 'city');
INSERT INTO `cyx_district` VALUES (3144, 3143, '0993', '659001', '石河子市', '86.080602', '44.306097', 'district');
INSERT INTO `cyx_district` VALUES (3145, 3134, '1909', '659007', '双河市', '82.353656', '44.840524', 'city');
INSERT INTO `cyx_district` VALUES (3146, 3145, '1909', '659007', '双河市', '82.353656', '44.840524', 'district');
INSERT INTO `cyx_district` VALUES (3147, 3134, '0991', '650100', '乌鲁木齐市', '87.616848', '43.825592', 'city');
INSERT INTO `cyx_district` VALUES (3148, 3147, '0991', '650102', '天山区', '87.631676', '43.794399', 'district');
INSERT INTO `cyx_district` VALUES (3149, 3147, '0991', '650103', '沙依巴克区', '87.598195', '43.800939', 'district');
INSERT INTO `cyx_district` VALUES (3150, 3147, '0991', '650104', '新市区', '87.569431', '43.855378', 'district');
INSERT INTO `cyx_district` VALUES (3151, 3147, '0991', '650105', '水磨沟区', '87.642481', '43.832459', 'district');
INSERT INTO `cyx_district` VALUES (3152, 3147, '0991', '650106', '头屯河区', '87.428141', '43.877664', 'district');
INSERT INTO `cyx_district` VALUES (3153, 3147, '0991', '650107', '达坂城区', '88.311099', '43.363668', 'district');
INSERT INTO `cyx_district` VALUES (3154, 3147, '0991', '650109', '米东区', '87.655935', '43.974784', 'district');
INSERT INTO `cyx_district` VALUES (3155, 3147, '0991', '650121', '乌鲁木齐县', '87.409417', '43.47136', 'district');
INSERT INTO `cyx_district` VALUES (3156, 3134, '0990', '650200', '克拉玛依市', '84.889207', '45.579888', 'city');
INSERT INTO `cyx_district` VALUES (3157, 3156, '0990', '650202', '独山子区', '84.886974', '44.328095', 'district');
INSERT INTO `cyx_district` VALUES (3158, 3156, '0990', '650203', '克拉玛依区', '84.867844', '45.602525', 'district');
INSERT INTO `cyx_district` VALUES (3159, 3156, '0990', '650204', '白碱滩区', '85.131696', '45.687854', 'district');
INSERT INTO `cyx_district` VALUES (3160, 3156, '0990', '650205', '乌尔禾区', '85.693742', '46.089148', 'district');
INSERT INTO `cyx_district` VALUES (3161, 3134, '0995', '650400', '吐鲁番市', '89.189752', '42.951303', 'city');
INSERT INTO `cyx_district` VALUES (3162, 3161, '0995', '650402', '高昌区', '89.185877', '42.942327', 'district');
INSERT INTO `cyx_district` VALUES (3163, 3161, '0995', '650421', '鄯善县', '90.21333', '42.868744', 'district');
INSERT INTO `cyx_district` VALUES (3164, 3161, '0995', '650422', '托克逊县', '88.653827', '42.792526', 'district');
INSERT INTO `cyx_district` VALUES (3165, 3134, '0902', '650500', '哈密市', '93.515224', '42.819541', 'city');
INSERT INTO `cyx_district` VALUES (3166, 3165, '0902', '650502', '伊州区', '93.514797', '42.827254', 'district');
INSERT INTO `cyx_district` VALUES (3167, 3165, '0902', '650521', '巴里坤哈萨克自治县', '93.010383', '43.599929', 'district');
INSERT INTO `cyx_district` VALUES (3168, 3165, '0902', '650522', '伊吾县', '94.697074', '43.254978', 'district');
INSERT INTO `cyx_district` VALUES (3169, 3134, '0994', '652300', '昌吉回族自治州', '87.308224', '44.011182', 'city');
INSERT INTO `cyx_district` VALUES (3170, 3169, '0994', '652301', '昌吉市', '87.267532', '44.014435', 'district');
INSERT INTO `cyx_district` VALUES (3171, 3169, '0994', '652302', '阜康市', '87.952991', '44.164402', 'district');
INSERT INTO `cyx_district` VALUES (3172, 3169, '0994', '652323', '呼图壁县', '86.871584', '44.179361', 'district');
INSERT INTO `cyx_district` VALUES (3173, 3169, '0994', '652324', '玛纳斯县', '86.20368', '44.284722', 'district');
INSERT INTO `cyx_district` VALUES (3174, 3169, '0994', '652325', '奇台县', '89.593967', '44.022066', 'district');
INSERT INTO `cyx_district` VALUES (3175, 3169, '0994', '652327', '吉木萨尔县', '89.180437', '44.000497', 'district');
INSERT INTO `cyx_district` VALUES (3176, 3169, '0994', '652328', '木垒哈萨克自治县', '90.286028', '43.834689', 'district');
INSERT INTO `cyx_district` VALUES (3177, 3134, '0909', '652700', '博尔塔拉蒙古自治州', '82.066363', '44.906039', 'city');
INSERT INTO `cyx_district` VALUES (3178, 3177, '0909', '652701', '博乐市', '82.051004', '44.853869', 'district');
INSERT INTO `cyx_district` VALUES (3179, 3177, '0909', '652702', '阿拉山口市', '82.559396', '45.172227', 'district');
INSERT INTO `cyx_district` VALUES (3180, 3177, '0909', '652722', '精河县', '82.890656', '44.599393', 'district');
INSERT INTO `cyx_district` VALUES (3181, 3177, '0909', '652723', '温泉县', '81.024816', '44.968856', 'district');
INSERT INTO `cyx_district` VALUES (3182, 3134, '0996', '652800', '巴音郭楞蒙古自治州', '86.145297', '41.764115', 'city');
INSERT INTO `cyx_district` VALUES (3183, 3182, '0996', '652801', '库尔勒市', '86.174633', '41.725891', 'district');
INSERT INTO `cyx_district` VALUES (3184, 3182, '0996', '652822', '轮台县', '84.252156', '41.777702', 'district');
INSERT INTO `cyx_district` VALUES (3185, 3182, '0996', '652823', '尉犁县', '86.261321', '41.343933', 'district');
INSERT INTO `cyx_district` VALUES (3186, 3182, '0996', '652824', '若羌县', '88.167152', '39.023241', 'district');
INSERT INTO `cyx_district` VALUES (3187, 3182, '0996', '652825', '且末县', '85.529702', '38.145485', 'district');
INSERT INTO `cyx_district` VALUES (3188, 3182, '0996', '652826', '焉耆回族自治县', '86.574067', '42.059759', 'district');
INSERT INTO `cyx_district` VALUES (3189, 3182, '0996', '652827', '和静县', '86.384065', '42.323625', 'district');
INSERT INTO `cyx_district` VALUES (3190, 3182, '0996', '652828', '和硕县', '86.876799', '42.284331', 'district');
INSERT INTO `cyx_district` VALUES (3191, 3182, '0996', '652829', '博湖县', '86.631997', '41.980152', 'district');
INSERT INTO `cyx_district` VALUES (3192, 3134, '0997', '652900', '阿克苏地区', '80.260605', '41.168779', 'city');
INSERT INTO `cyx_district` VALUES (3193, 3192, '0997', '652901', '阿克苏市', '80.263387', '41.167548', 'district');
INSERT INTO `cyx_district` VALUES (3194, 3192, '0997', '652922', '温宿县', '80.238959', '41.276688', 'district');
INSERT INTO `cyx_district` VALUES (3195, 3192, '0997', '652923', '库车县', '82.987312', '41.714696', 'district');
INSERT INTO `cyx_district` VALUES (3196, 3192, '0997', '652924', '沙雅县', '82.781818', '41.221666', 'district');
INSERT INTO `cyx_district` VALUES (3197, 3192, '0997', '652925', '新和县', '82.618736', '41.551206', 'district');
INSERT INTO `cyx_district` VALUES (3198, 3192, '0997', '652926', '拜城县', '81.85148', '41.795912', 'district');
INSERT INTO `cyx_district` VALUES (3199, 3192, '0997', '652927', '乌什县', '79.224616', '41.222319', 'district');
INSERT INTO `cyx_district` VALUES (3200, 3192, '0997', '652928', '阿瓦提县', '80.375053', '40.643647', 'district');
INSERT INTO `cyx_district` VALUES (3201, 3192, '0997', '652929', '柯坪县', '79.054497', '40.501936', 'district');
INSERT INTO `cyx_district` VALUES (3202, 3134, '0908', '653000', '克孜勒苏柯尔克孜自治州', '76.167819', '39.714526', 'city');
INSERT INTO `cyx_district` VALUES (3203, 3202, '0908', '653001', '阿图什市', '76.1684', '39.71616', 'district');
INSERT INTO `cyx_district` VALUES (3204, 3202, '0908', '653022', '阿克陶县', '75.947396', '39.147785', 'district');
INSERT INTO `cyx_district` VALUES (3205, 3202, '0908', '653023', '阿合奇县', '78.446253', '40.936936', 'district');
INSERT INTO `cyx_district` VALUES (3206, 3202, '0908', '653024', '乌恰县', '75.259227', '39.71931', 'district');
INSERT INTO `cyx_district` VALUES (3207, 3134, '0998', '653100', '喀什地区', '75.989741', '39.47046', 'city');
INSERT INTO `cyx_district` VALUES (3208, 3207, '0998', '653101', '喀什市', '75.99379', '39.467685', 'district');
INSERT INTO `cyx_district` VALUES (3209, 3207, '0998', '653121', '疏附县', '75.862813', '39.375043', 'district');
INSERT INTO `cyx_district` VALUES (3210, 3207, '0998', '653122', '疏勒县', '76.048139', '39.401384', 'district');
INSERT INTO `cyx_district` VALUES (3211, 3207, '0998', '653123', '英吉沙县', '76.175729', '38.930381', 'district');
INSERT INTO `cyx_district` VALUES (3212, 3207, '0998', '653124', '泽普县', '77.259675', '38.18529', 'district');
INSERT INTO `cyx_district` VALUES (3213, 3207, '0998', '653125', '莎车县', '77.245761', '38.41422', 'district');
INSERT INTO `cyx_district` VALUES (3214, 3207, '0998', '653126', '叶城县', '77.413836', '37.882989', 'district');
INSERT INTO `cyx_district` VALUES (3215, 3207, '0998', '653127', '麦盖提县', '77.610125', '38.898001', 'district');
INSERT INTO `cyx_district` VALUES (3216, 3207, '0998', '653128', '岳普湖县', '76.8212', '39.2198', 'district');
INSERT INTO `cyx_district` VALUES (3217, 3207, '0998', '653129', '伽师县', '76.723719', '39.488181', 'district');
INSERT INTO `cyx_district` VALUES (3218, 3207, '0998', '653130', '巴楚县', '78.549296', '39.785155', 'district');
INSERT INTO `cyx_district` VALUES (3219, 3207, '0998', '653131', '塔什库尔干塔吉克自治县', '75.229889', '37.772094', 'district');
INSERT INTO `cyx_district` VALUES (3220, 3134, '0903', '653200', '和田地区', '79.922211', '37.114157', 'city');
INSERT INTO `cyx_district` VALUES (3221, 3220, '0903', '653201', '和田市', '79.913534', '37.112148', 'district');
INSERT INTO `cyx_district` VALUES (3222, 3220, '0903', '653221', '和田县', '79.81907', '37.120031', 'district');
INSERT INTO `cyx_district` VALUES (3223, 3220, '0903', '653222', '墨玉县', '79.728683', '37.277143', 'district');
INSERT INTO `cyx_district` VALUES (3224, 3220, '0903', '653223', '皮山县', '78.283669', '37.62145', 'district');
INSERT INTO `cyx_district` VALUES (3225, 3220, '0903', '653224', '洛浦县', '80.188986', '37.073667', 'district');
INSERT INTO `cyx_district` VALUES (3226, 3220, '0903', '653225', '策勒县', '80.806159', '36.998335', 'district');
INSERT INTO `cyx_district` VALUES (3227, 3220, '0903', '653226', '于田县', '81.677418', '36.85708', 'district');
INSERT INTO `cyx_district` VALUES (3228, 3220, '0903', '653227', '民丰县', '82.695861', '37.06408', 'district');
INSERT INTO `cyx_district` VALUES (3229, 3134, '0999', '654000', '伊犁哈萨克自治州', '81.324136', '43.916823', 'city');
INSERT INTO `cyx_district` VALUES (3230, 3229, '0999', '654002', '伊宁市', '81.27795', '43.908558', 'district');
INSERT INTO `cyx_district` VALUES (3231, 3229, '0999', '654003', '奎屯市', '84.903267', '44.426529', 'district');
INSERT INTO `cyx_district` VALUES (3232, 3229, '0999', '654004', '霍尔果斯市', '80.411271', '44.213941', 'district');
INSERT INTO `cyx_district` VALUES (3233, 3229, '0999', '654021', '伊宁县', '81.52745', '43.977119', 'district');
INSERT INTO `cyx_district` VALUES (3234, 3229, '0999', '654022', '察布查尔锡伯自治县', '81.151337', '43.840726', 'district');
INSERT INTO `cyx_district` VALUES (3235, 3229, '0999', '654023', '霍城县', '80.87898', '44.055984', 'district');
INSERT INTO `cyx_district` VALUES (3236, 3229, '0999', '654024', '巩留县', '82.231718', '43.482628', 'district');
INSERT INTO `cyx_district` VALUES (3237, 3229, '0999', '654025', '新源县', '83.232848', '43.433896', 'district');
INSERT INTO `cyx_district` VALUES (3238, 3229, '0999', '654026', '昭苏县', '81.130974', '43.157293', 'district');
INSERT INTO `cyx_district` VALUES (3239, 3229, '0999', '654027', '特克斯县', '81.836206', '43.217183', 'district');
INSERT INTO `cyx_district` VALUES (3240, 3229, '0999', '654028', '尼勒克县', '82.511809', '43.800247', 'district');
INSERT INTO `cyx_district` VALUES (3241, 3134, '0901', '654200', '塔城地区', '82.980316', '46.745364', 'city');
INSERT INTO `cyx_district` VALUES (3242, 3241, '0901', '654201', '塔城市', '82.986978', '46.751428', 'district');
INSERT INTO `cyx_district` VALUES (3243, 3241, '0901', '654202', '乌苏市', '84.713396', '44.41881', 'district');
INSERT INTO `cyx_district` VALUES (3244, 3241, '0901', '654221', '额敏县', '83.628303', '46.524673', 'district');
INSERT INTO `cyx_district` VALUES (3245, 3241, '0901', '654223', '沙湾县', '85.619416', '44.326388', 'district');
INSERT INTO `cyx_district` VALUES (3246, 3241, '0901', '654224', '托里县', '83.60695', '45.947638', 'district');
INSERT INTO `cyx_district` VALUES (3247, 3241, '0901', '654225', '裕民县', '82.982667', '46.201104', 'district');
INSERT INTO `cyx_district` VALUES (3248, 3241, '0901', '654226', '和布克赛尔蒙古自治县', '85.728328', '46.793235', 'district');
INSERT INTO `cyx_district` VALUES (3249, 3134, '0906', '654300', '阿勒泰地区', '88.141253', '47.844924', 'city');
INSERT INTO `cyx_district` VALUES (3250, 3249, '0906', '654301', '阿勒泰市', '88.131842', '47.827308', 'district');
INSERT INTO `cyx_district` VALUES (3251, 3249, '0906', '654321', '布尔津县', '86.874923', '47.702163', 'district');
INSERT INTO `cyx_district` VALUES (3252, 3249, '0906', '654322', '富蕴县', '89.525504', '46.994115', 'district');
INSERT INTO `cyx_district` VALUES (3253, 3249, '0906', '654323', '福海县', '87.486703', '47.111918', 'district');
INSERT INTO `cyx_district` VALUES (3254, 3249, '0906', '654324', '哈巴河县', '86.418621', '48.060846', 'district');
INSERT INTO `cyx_district` VALUES (3255, 3249, '0906', '654325', '青河县', '90.37555', '46.679113', 'district');
INSERT INTO `cyx_district` VALUES (3256, 3249, '0906', '654326', '吉木乃县', '85.874096', '47.443101', 'district');
INSERT INTO `cyx_district` VALUES (3257, 3134, '1996', '659006', '铁门关市', '85.501217', '41.82725', 'city');
INSERT INTO `cyx_district` VALUES (3258, 3257, '1996', '659006', '铁门关市', '85.501217', '41.82725', 'district');
INSERT INTO `cyx_district` VALUES (3259, 3134, '1998', '659003', '图木舒克市', '79.073963', '39.868965', 'city');
INSERT INTO `cyx_district` VALUES (3260, 3259, '1998', '659003', '图木舒克市', '79.073963', '39.868965', 'district');
INSERT INTO `cyx_district` VALUES (3261, 3134, '1994', '659004', '五家渠市', '87.54324', '44.166756', 'city');
INSERT INTO `cyx_district` VALUES (3262, 3261, '1994', '659004', '五家渠市', '87.54324', '44.166756', 'district');
INSERT INTO `cyx_district` VALUES (3263, 850, '320589', '320589', '高新区', '120', '30', 'district');
INSERT INTO `cyx_district` VALUES (3264, 850, '320589', '320589', '高新区', '120', '30', 'district');
INSERT INTO `cyx_district` VALUES (3265, 850, '320589', '320589', '高新区', '120', '30', 'district');
INSERT INTO `cyx_district` VALUES (3271, 1409, '0536', '370787', '高新区', '119', '36', 'district');

-- ----------------------------
-- Table structure for cyx_enumeration
-- ----------------------------
DROP TABLE IF EXISTS `cyx_enumeration`;
CREATE TABLE `cyx_enumeration`  (
  `enumerationcategory` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `itemname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `itemvalue` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disorder` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`enumerationcategory`, `itemname`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cyx_enumeration
-- ----------------------------
INSERT INTO `cyx_enumeration` VALUES ('loginterminal', 'iphone', 'IPHONE手机', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('loginterminal', 'ipad', 'IPAD平板电脑', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('loginterminal', 'android', 'Android手机', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('loginterminal', 'androidpad', 'Android平板电脑', 4, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('loginterminal', 'web', 'Web', 5, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('loginterminal', 'weixin', '微信', 6, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'superadministrator', '超级管理员', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'platformadmin', '平台管理员', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'firstleveldistributor', '总经销', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'distributor', '分销商', 4, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'shop', '网点', 5, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'companyshop', '独立公司网点', 6, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'personalshop', '独立个人网点', 7, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'electrician', '水电工', 8, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'person', '普通用户', 9, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('userattribute', 'primary', '主帐户', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('userattribute', 'common', '普通帐户', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('sex', 'male', '男', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('sex', 'female', '女', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('companytype', 'firstleveldistributor', '总经销', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('companytype', 'distributor', '分销商', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('companytype', 'shop', '网点', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('companytype', 'personfromlulan', '公司内部人员', 4, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('taxtype', 'generaltaxpayer', '一般纳税人', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('taxtype', 'smallscaletaxpayer', '小规模纳税人', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('certificatetype', 'electriciancertifer', '水电工认证', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('whetheridentifiedstatus', 'failured', '认证失败', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('whetheridentifiedstatus', 'unwhetheridentified', '未认证', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('whetheridentifiedstatus', 'ongoing', '认证中', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('whetheridentifiedstatus', 'whetheridentified', '认证通过', 4, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('onlinetype', 'qq', 'qq', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('banktype', 'bank', '银行', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('banktype', 'alipay', '支付宝', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('banktype', 'weixinpay', '微信', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('material', 'copper', '铜', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('material', 'aluminum', '铝', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('material', 'lead', '铅', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('invoicetype', 'telegraphictransfer', '电汇', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('invoicetype', 'acceptancebill', '承兑', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'new', '新建', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'usersubmit', '提交', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'retreat', '退回', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'audited', '已审核', 4, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'cancelaudit', '已取消审核', 5, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'exporttox3', '已上传到X3系统', 6, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('orderstatus', 'close', '关闭', 7, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('documenttype', 'doc', 'word文档', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('documenttype', 'pdf', 'pdf文档', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('documenttype', 'excel', 'excel文档', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('dbbackupandresotretype', 'backup', '备份', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('dbbackupandresotretype', 'restore', '恢复', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('operationresult', 'failed', '失败', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('operationresult', 'success', '成功', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('paymentsstatus', 'new', '新建', 1, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('paymentsstatus', 'needconfirm', '等待确认', 2, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('paymentsstatus', 'failed', '确认未通过', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('paymentsstatus', 'confirmed', '确认', 4, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('taxtype', 'individual', '个体工商户', 3, '', 1, 1);
INSERT INTO `cyx_enumeration` VALUES ('usertype', 'company', '公司内部人员', NULL, '', 1, 1);

-- ----------------------------
-- Table structure for cyx_group
-- ----------------------------
DROP TABLE IF EXISTS `cyx_group`;
CREATE TABLE `cyx_group`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  `sort` smallint(3) NULL DEFAULT NULL,
  `show` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_group
-- ----------------------------
INSERT INTO `cyx_group` VALUES ('uldpjr1555490260mqzhla', 'app', 'admin', '管理后台', NULL, NULL, 1, 1, 0);
INSERT INTO `cyx_group` VALUES ('wcxgvq1555490364nsmcoe', 'uldpjr1555490260mqzhla', 'system', '系统管理', NULL, NULL, 1, 99, 0);

-- ----------------------------
-- Table structure for cyx_miniprogram_parameter
-- ----------------------------
DROP TABLE IF EXISTS `cyx_miniprogram_parameter`;
CREATE TABLE `cyx_miniprogram_parameter`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序appid',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序密钥',
  `mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `mch_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户操作密码',
  `mch_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户密匙',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cyx_miniprogram_parameter
-- ----------------------------
INSERT INTO `cyx_miniprogram_parameter` VALUES (1, 'wx57bd7abcfd38cbb6', '9d0b694c50012a7e20c5d0dc2a17ed6b', '1494694722', '609134', 'MW1SA6SgPqWc2RQSDol9h1tKpjS2NZe4', 0, NULL, 1, 1550817031, 1, 1551162890, 1, 1);

-- ----------------------------
-- Table structure for cyx_node
-- ----------------------------
DROP TABLE IF EXISTS `cyx_node`;
CREATE TABLE `cyx_node`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(2) NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` smallint(6) NULL DEFAULT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` smallint(2) NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_node
-- ----------------------------
INSERT INTO `cyx_node` VALUES ('dtxqgg1555490496tuxzlc', 'Role', '角色管理', 1, NULL, 3, 'uldpjr1555490260mqzhla', 2, NULL, 'wcxgvq1555490364nsmcoe');
INSERT INTO `cyx_node` VALUES ('nfgqof1555490477wgrxme', 'Node', '节点管理', 1, NULL, 2, 'uldpjr1555490260mqzhla', 2, NULL, 'wcxgvq1555490364nsmcoe');
INSERT INTO `cyx_node` VALUES ('pyzpea1555490464xvkxkb', 'User', '用户管理', 1, NULL, 1, 'uldpjr1555490260mqzhla', 2, NULL, 'wcxgvq1555490364nsmcoe');
INSERT INTO `cyx_node` VALUES ('uldpjr1555490260mqzhla', 'admin', '管理后台', 1, NULL, 1, 'app', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cyx_role
-- ----------------------------
DROP TABLE IF EXISTS `cyx_role`;
CREATE TABLE `cyx_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ename` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`pid`) USING BTREE,
  INDEX `ename`(`ename`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_role
-- ----------------------------
INSERT INTO `cyx_role` VALUES ('xgxblw1555550593ucsnjj', '测试角色1', NULL, 1, '测试用角色1', NULL, 1555550537, NULL, NULL);

-- ----------------------------
-- Table structure for cyx_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cyx_role_user`;
CREATE TABLE `cyx_role_user`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 1,
  INDEX `group_id`(`role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_role_user
-- ----------------------------
INSERT INTO `cyx_role_user` VALUES ('zfqndp1553410402udpngr', '20', 1);
INSERT INTO `cyx_role_user` VALUES ('wprjgv1553411626ppbmvy', '24', 1);

-- ----------------------------
-- Table structure for cyx_sysset
-- ----------------------------
DROP TABLE IF EXISTS `cyx_sysset`;
CREATE TABLE `cyx_sysset`  (
  `id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城名称',
  `abbreviation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城名称简称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_sysset
-- ----------------------------
INSERT INTO `cyx_sysset` VALUES (1, '1', '1');

-- ----------------------------
-- Table structure for cyx_user
-- ----------------------------
DROP TABLE IF EXISTS `cyx_user`;
CREATE TABLE `cyx_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` bigint(14) NULL DEFAULT 0,
  `mailaddr` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金',
  `integral` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '积分',
  `usertype_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userlevel_id` int(10) UNSIGNED NULL DEFAULT 1,
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '上级ID',
  `invitation_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `invitation_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请二维码',
  `province_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zone_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createuser_id` int(10) NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cyx_user
-- ----------------------------
INSERT INTO `cyx_user` VALUES (1, 'admin', '超级管理员', NULL, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, 0.00, 0.00, 0.00, 'superadministrator', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1554357525, NULL, NULL, 1);
INSERT INTO `cyx_user` VALUES (2, NULL, 'じ逆風飛荇', NULL, 'obC7r4h35bMX9qcpTubW6XBE6tzs', 'bc2189b13d95ed245b0fb702ec8deae0', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIRdRic7Jujz7SVpHQnBY1XicAntkMETRibtyVgnasYZU2zAyqGaJVnn5BfShWIibiaSUmTYFftnL77qzA/132', 0, NULL, 0.00, 0.00, 0.00, 'member', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1554967837, NULL, NULL, 1);

-- ----------------------------
-- Table structure for dd_access
-- ----------------------------
DROP TABLE IF EXISTS `dd_access`;
CREATE TABLE `dd_access`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `node_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `groupId`(`role_id`) USING BTREE,
  INDEX `nodeId`(`node_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_access
-- ----------------------------
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'vkqcwn1520320816oyqxml', '1', '0', 'modulename');
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'sjoxen1550469322qprvrc', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'fbepbd1550469413znyoco', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'unicwr1550650007yrqvjf', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'nhruda1550650063xhqunx', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'nkfdfx1550650103dpzbno', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'gekkmp1550650474lhprer', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('zfqndp1553410402udpngr', 'fprnbn1550469507vtmstw', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('wprjgv1553411626ppbmvy', 'vkqcwn1520320816oyqxml', '1', '0', 'modulename');
INSERT INTO `dd_access` VALUES ('wprjgv1553411626ppbmvy', 'ymnrow1550469585slffnv', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('wprjgv1553411626ppbmvy', 'npdbjp1550469741pgynsz', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('zkpvgd1555295630mrhgts', 'vkqcwn1520320816oyqxml', '1', '0', 'modulename');
INSERT INTO `dd_access` VALUES ('zkpvgd1555295630mrhgts', 'hnnide1554301050xjyzfm', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('zkpvgd1555295630mrhgts', 'gdtbsz1554301089qopxbp', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'vkqcwn1520320816oyqxml', '1', '0', 'modulename');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'itwdvp1550474599xwpwcw', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nmupca1550474630izdouh', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'drasis1555313811mkldfs', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ulqslg1555313886afkekv', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'gyukbs1555313908wuequw', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'evjqzg1555313932kjkuse', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'jpeyfd1555314005hzfald', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'yzmohy1550555738mbtrdl', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'wgivvz1555314059jmfdzs', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'atroqy1555314085pbzqhu', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'hnnide1554301050xjyzfm', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'gdtbsz1554301089qopxbp', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nndiqb1555314149wxjkag', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'hrqrjp1555314189wucuvu', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'sjoxen1550469322qprvrc', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'fbepbd1550469413znyoco', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'iweszd1555314401etanyw', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nfkplv1555314422dcyikh', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'tyjrjn1555314444lzlcxq', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'beiinz1555314466nqamza', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'qppyyt1555314568obeesh', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'rpbyis1555314592kclksv', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'unicwr1550650007yrqvjf', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'odyunq1555314631yotuee', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'vqejrc1555314660dbdudj', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'glflah1555314685zkfxeh', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'opfliw1555314884uvmzlx', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'jetdyx1555314911wdppmd', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'tdndxq1555314935vgcaxv', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nhruda1550650063xhqunx', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nneree1555315004vgjfoe', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'tcjyln1555315025jeeipt', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'cqvtgh1555315048elhuin', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'hvdswy1555315067kmrqof', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'goitas1555315092mqddlf', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ynshas1555315110idkroi', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nkfdfx1550650103dpzbno', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'qfzkxc1555315311ixrnfb', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'swzyjt1555315334cguhjq', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'yzommu1555315354iwvxay', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'cciiop1555315373fivyoc', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ubfrfk1555315389exkmsj', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'wqyaen1555315410dvhhxk', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'kjdeci1554023040uqmdgq', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'fwhawt1555315454juqwbv', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'siodif1555315506grervz', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'wpiluk1554023063nnerjy', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'aniftr1555315942kunfve', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'xclusv1555315971rhnjnb', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'mxgxas1555315989gupxak', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'smmkym1555316033qduwax', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'azgnsm1555316066gvwpzo', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'xaovsh1555316093fophdf', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'zhioiu1554300955yezmgz', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'gvvwcx1555316168xufrsh', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'mbtmer1555316187wbulnu', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'rjwlea1555316206gynkgz', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'dcyfzu1555316228vpstfm', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'gekkmp1550650474lhprer', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'fprnbn1550469507vtmstw', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'rkueez1555316385oflebg', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'jsddwv1555316511wzpsod', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'kdenxp1555316539hnzivx', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'orauxn1555316559byvbkz', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'dlcdbx1555316596ehppxk', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ymnrow1550469585slffnv', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'npdbjp1550469741pgynsz', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'jsfbhq1555316637gqjqtq', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'urngsl1555316682bpouqq', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'rrxyzg1555316705fxjgpz', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'vvkhqm1554085079duepdw', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'iloayw1555316758icmlnz', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'bjmtxt1555316814pgfdtd', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ibngrs1555316831niadnh', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'cgrsgg1551255314bavbrg', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'qneukq1551268606jjpbsc', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'qnaudt1551268632meebxv', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ldydaw1555316937hknbly', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'mjiakq1555316967vyloog', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'nlvzyn1555317146gkjrlp', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'smhhgk1555317169warbrl', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'utirua1555317190brbets', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'lamxow1551255392epfdcs', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'vaytuu1555317249ihnqgm', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'egkvri1555317266tuhsln', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'lffakp1555317281lowply', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'wygjex1555317300mnorar', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'skfhll1555317377uslvuj', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'gmfqww1555317428zbxgis', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'bcavbf1550469710zyrkmq', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'acsdrk1550545981txtnkj', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'pcjoky1550804535qqkwub', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'dfaqrg1550557260rwlwbs', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'edfkoe1520320929ycwrnj', '-1', NULL, 'group');
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'kraksr1520323227trzxbz', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ysther1521424407yvzlrc', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'xtvrzg1521424438ukxthp', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'owykuw1521424455qfiyqz', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'wzatbi1521424476dcbiii', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'xufvfp1521424502zdwypl', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'avpsgv1555318061awbxde', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'rjpetn1520320951zkrumt', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'zsbmdj1521424535cosfvy', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'udpvbj1521424559ptsbcs', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'jgyacf1521424586hsmntb', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'irfnia1521424606qmhyfq', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'opmtsd1521424664hgayfo', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'ynegba1520323809unbemg', '2', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'yjqwix1521424710qnfodx', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'lrklda1521424726fpxxlp', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'rrzdou1521424749xnmkev', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'uiehcu1521424769ryvitf', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'gytugf1521424813jzvahp', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'czzryi1521424841pihxnm', '3', NULL, NULL);
INSERT INTO `dd_access` VALUES ('lbyref1555318128snhvel', 'qzsptf1555318013cistpd', '3', NULL, NULL);

-- ----------------------------
-- Table structure for dd_address
-- ----------------------------
DROP TABLE IF EXISTS `dd_address`;
CREATE TABLE `dd_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '联系电话',
  `province_id` int(11) NOT NULL DEFAULT 2 COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT 3 COMMENT '市',
  `district_id` int(11) NOT NULL DEFAULT 4 COMMENT '区',
  `address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '详细地址',
  `is_default` smallint(6) NULL DEFAULT 0 COMMENT '是否为默认地址',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_address
-- ----------------------------
INSERT INTO `dd_address` VALUES (1, 2, '陈柯宇', '15023790150', 2261, 2262, 2275, '万达中心', 1, NULL, 0, NULL, 1550750013, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (6, 15, '吴', '13983382521', 2261, 2262, 2275, '渝南大道169号', 1, NULL, 0, NULL, 1553309323, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (7, 5, '2号测试员', '15023790510', 2261, 2262, 2275, '万达', 1, NULL, 0, NULL, 1553348340, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (9, 22, '刘德华', '15703012377', 2, 3, 4, '在于路', 0, NULL, 0, NULL, 1554271961, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (10, 32, '刘世勇', '18011473133', 2, 3, 4, '58号', 1, NULL, 0, NULL, 1554273965, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (11, 33, '就是用', '1801147313', 2, 3, 4, '59', 1, NULL, 0, NULL, 1554274682, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (12, 29, '吴', '13983382521', 2261, 2262, 2275, '渝南大道169号', 1, NULL, 0, NULL, 1554777769, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (13, 38, '测试', '13512345678', 2, 3, 4, '12', 1, NULL, 0, NULL, 1554778804, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (14, 31, '李大妹', '13251320805', 2, 3, 4, '20号', 1, NULL, 0, NULL, 1554782374, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (15, 48, '刘子桥', '15703012377', 2261, 2262, 2270, '亚太商谷6栋17-3', 1, NULL, 0, NULL, 1554860007, NULL, NULL, 1, 1);
INSERT INTO `dd_address` VALUES (16, 51, '刘总', '15185000989', 580, 581, 582, '63号', 1, NULL, 0, NULL, 1555019487, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_award
-- ----------------------------
DROP TABLE IF EXISTS `dd_award`;
CREATE TABLE `dd_award`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '奖品数量',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '奖品派发顺序',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '奖品状态：1=不在奖池，2=奖池中',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_award
-- ----------------------------
INSERT INTO `dd_award` VALUES (1, '小乌龟', 3, 1, '12', 0, NULL, 1, 1550561225, 1, 1553737576, 2, 1);
INSERT INTO `dd_award` VALUES (2, '小兔子', 4, 2, '123', 0, NULL, 1, 1550561695, NULL, NULL, 1, 1);
INSERT INTO `dd_award` VALUES (3, '小鸭子', 2, 3, '123456', 0, NULL, 1, 1550561776, 1, 1551420086, 2, 1);

-- ----------------------------
-- Table structure for dd_commission_record
-- ----------------------------
DROP TABLE IF EXISTS `dd_commission_record`;
CREATE TABLE `dd_commission_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '获得佣金',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'add',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '获得状态，1=获得，2=支付',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_commission_record
-- ----------------------------
INSERT INTO `dd_commission_record` VALUES (15, 22, 1200.00, 'add', 0, NULL, 1553567753, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (14, 5, 800.00, 'add', 0, NULL, 1553501061, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (13, 5, 800.00, 'add', 0, NULL, 1553500787, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (12, 5, 80.00, 'add', 0, NULL, 1553351724, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (11, 2, 11.00, 'add', 0, NULL, 1553351725, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (16, 2, 123.00, 'sub', 0, NULL, 1554123950, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (17, 22, 7.57, 'add', 0, NULL, 1554273112, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (18, 22, 120.00, 'add', 0, NULL, 1554274063, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (19, 32, 100.00, 'add', 0, NULL, 1554274899, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (20, 2, 1000.00, 'add', 0, NULL, 1554343691, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (21, 2, 1000.00, 'add', 0, NULL, 1554343826, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (22, 22, 800.00, 'add', 0, NULL, 1554507819, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (23, 22, 1200.00, 'add', 0, NULL, 1554507911, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (24, 22, 120.00, 'add', 0, NULL, 1554507977, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (25, 2, 101.00, 'sub', 0, NULL, 1554685198, NULL, NULL, 1, 1);
INSERT INTO `dd_commission_record` VALUES (26, 48, 120.00, 'add', 0, NULL, 1555019712, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_dboperationhistory
-- ----------------------------
DROP TABLE IF EXISTS `dd_dboperationhistory`;
CREATE TABLE `dd_dboperationhistory`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tablename` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `controllername` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tableversion` int(11) NULL DEFAULT NULL,
  `tableprimarykey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operationtype` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `operatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_dboperationhistory
-- ----------------------------
INSERT INTO `dd_dboperationhistory` VALUES ('aaqsvp1555068753xagoet', 'member_upgrade', '会员升级套餐', 1, '19', '新增会员升级套餐', '', 1555068753, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aarrji1551669052uetvuc', 'Node', '节点管理', 1, 'npdbjp1550469741pgynsz', '修改节点', '', 1551669052, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('abnwfv1555056127moksru', 'product', 'TOP热销', 1, '82', '新增商品', '', 1555056127, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('acigok1555219975jeccbc', 'member_upgrade', '会员升级套餐', 1, '27', '修改商品', '', 1555219975, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('adtiln1555064340ryouor', 'product', '精选商品', 1, '108', '新增商品', '', 1555064340, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aejinc1551246456tpzeye', 'product', '商品列表', 1, '3', '修改商品', '', 1551246456, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('afwfvi1555075901zwhlys', 'product', 'TOP热销', 1, '95', '修改商品', '', 1555075901, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('agleht1555079187cdjrtf', 'product', '精选商品', 1, '100', '修改商品', '', 1555079187, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('agmsua1551949748qzxsfa', 'member_upgrade', '会员升级套餐', 1, '3', '修改数据', '', 1551949748, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ahhmav1555314085ablvpc', 'Node', '节点管理', 1, 'atroqy1555314085pbzqhu', '添加节点', '', 1555314085, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ahnmes1555048103cefvot', 'product', '商品列表', 1, '52', '修改商品', '', 1555048103, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ahowev1554195849qbfvui', 'member_upgrade_cat', '会员升级套餐分类', 1, '2', '修改数据', '', 1554195849, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ahudzo1555075916cmpjjw', 'product', 'TOP热销', 1, '97', '修改商品', '', 1555075916, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aikyhp1552632723panrgr', 'product', '商品列表', 1, '1', '修改商品', '', 1552632723, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aiyudo1550649791xomrsg', 'Node', '节点管理', 1, 'fprnbn1550469507vtmstw', '修改节点', '', 1550649791, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ajqick1555055789euphcu', 'product', 'TOP热销', 1, '80', '新增商品', '', 1555055789, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('akwepz1554889772gbemit', 'member_upgrade', '会员升级套餐', 1, '9', '新增会员升级套餐', '', 1554889772, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('amsrbm1550643971xgugfq', 'product_cat', '商品分类', 1, '4', '修改数据', '', 1550643971, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aoknba1555059704lnylvd', 'product', 'TOP热销', 1, '94', '新增商品', '', 1555059704, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aotmwo1552981270nmjxbd', 'member_upgrade_cat', '会员升级套餐分类', 1, '3', '修改数据', '', 1552981270, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('apyxgt1551938562bigxzb', 'product', '新品上架', 1, '6', '修改商品', '', 1551938562, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aqbior1555060717xkvslg', 'product', 'TOP热销', 1, '98', '新增商品', '', 1555060717, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aqmstk1555041000ylccpy', 'product_cat', '商品分类', 1, '5', '修改数据', '', 1555041000, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('arahfa1555318406tmokjc', 'Node', '节点管理', 1, 'ubgome1555318406cbraoj', '添加节点', '', 1555318406, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('armzuz1555073945btkpox', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555073945, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('arqvhi1555318013kllhpn', 'Node', '节点管理', 1, 'qzsptf1555318013cistpd', '添加节点', '', 1555318013, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aruoyh1555054167jiumvo', 'product', 'TOP热销', 1, '72', '新增商品', '', 1555054167, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ashyfz1555316682merztu', 'Node', '节点管理', 1, 'urngsl1555316682bpouqq', '添加节点', '', 1555316682, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('asnxic1555075731rgmboh', 'product', 'TOP热销', 1, '86', '修改商品', '', 1555075731, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('asojld1550556226fjvgkz', 'userlevel', '会员等级', 1, 'czyndz1550556226qhwnyn', '添加新数据', '', 1550556226, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('assvom1553501682wufjwk', 'product', '精选商品', 1, '8', '修改商品', '', 1553501682, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('atfgww1555079925qeaxxx', 'product', '精选商品', 1, '101', '修改商品', '', 1555079925, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('atwdcn1554879090ucpvgt', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554879090, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('aulbpl1550556494zlnxcv', 'userlevel', '会员等级', 1, 'ahlwwt1550556494tewuub', '添加新数据', '', 1550556494, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ausgqg1555075887cxhame', 'product', 'TOP热销', 1, '94', '修改商品', '', 1555075887, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('avljbe1550646859fehpxm', 'product_cat', '商品分类', 1, 'djydpe1550646859bacggh', '添加新数据', '', 1550646859, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('avoqdl1555064456nfango', 'product', '精选商品', 1, '109', '新增商品', '', 1555064456, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('avroog1551082882nljvkg', 'user', '', 1, '2', '修改数据', '', 1551082882, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('azxdru1550472419hdcoms', 'product_type', '节点管理', 1, 'nttoag1550472419kwdrzx', '添加新数据', '', 1550472419, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bbjmfq1555074181sueemx', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555074181, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bcbcle1555220591blivie', 'member_upgrade', '会员升级套餐', 1, '16', '修改商品', '', 1555220591, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bcjwzp1552818590vcajhw', 'product', '商品列表', 1, '1', '修改商品', '', 1552818590, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bclclk1555064949hnezpj', 'product', '精选商品', 1, '113', '修改商品', '', 1555064949, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bdtgmj1555048660cbdqji', 'product', '商品列表', 1, '54', '修改商品', '', 1555048660, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bdwylu1555078757gdvfxo', 'product', 'TOP热销', 1, '86', '修改商品', '', 1555078757, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bewtvl1555315334vvrtgf', 'Node', '节点管理', 1, 'swzyjt1555315334cguhjq', '添加节点', '', 1555315334, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bfkrrh1555080365xamfpl', 'product', '精选商品', 1, '105', '修改商品', '', 1555080365, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bfwvkg1554986891zldvqr', 'member_upgrade', '会员升级套餐', 1, '16', '修改商品', '', 1554986891, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bhgifq1555313811mqrwyd', 'Node', '节点管理', 1, 'drasis1555313811mkldfs', '添加节点', '', 1555313811, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bjeroj1555220274nffvkx', 'member_upgrade', '会员升级套餐', 1, '30', '修改商品', '', 1555220274, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bjkphu1555220267mtcsqr', 'member_upgrade', '会员升级套餐', 1, '30', '新增会员升级套餐', '', 1555220267, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bkksom1555054036dxkfog', 'product', 'TOP热销', 1, '71', '新增商品', '', 1555054036, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('blolct1555080043ebuvqg', 'product', '精选商品', 1, '99', '修改商品', '', 1555080043, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bmwrld1553737576dzcvnm', 'award', '奖品列表', 1, '1', '修改数据', '', 1553737576, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('boqbzc1555068883nhrvat', 'member_upgrade', '会员升级套餐', 1, '20', '新增会员升级套餐', '', 1555068883, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('botorm1552979127lxpsls', 'Node', '节点管理', 1, 'hawmfm1551270283wadbsl', '修改节点', '', 1552979127, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bponvz1550629085mxetko', 'Node', '节点管理', 1, 'rriffb1550629084pkbosn', '添加节点', '', 1550629085, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bpqrif1555077828yqjyhf', 'product', '商品列表', 1, '53', '修改商品', '', 1555077828, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bpzjkf1555071557ccejmj', 'member_upgrade', '会员升级套餐', 1, '24', '新增会员升级套餐', '', 1555071557, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bqvous1554994759crhenz', 'product', '商品列表', 1, '40', '新增商品', '', 1554994759, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('brptgn1555075518wtsmnt', 'product', 'TOP热销', 1, '71', '修改商品', '', 1555075518, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bsjvbs1554992334joojvl', 'product', '新品上架', 1, '33', '新增商品', '', 1554992334, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bsxgip1555314401jnyqyo', 'Node', '节点管理', 1, 'iweszd1555314401etanyw', '添加节点', '', 1555314401, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bubxdu1555048087uwrrdk', 'product', '商品列表', 1, '49', '修改商品', '', 1555048087, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bvgiwz1550649395hwyvwl', 'product_cat', '商品分类', 1, '7', '修改数据', '', 1550649395, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bwxefs1550548200qwzbic', 'stock', '股票列表', 1, 'rrilit1550548200lduztd', '添加新数据', '', 1550548200, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('byroak1552374111rkstfk', 'product', '商品列表', 1, '1', '修改商品', '', 1552374111, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('bzxsap1550804042iuamgq', 'product', '商品列表', 1, '2', '修改商品', '', 1550804042, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cbnztb1550635103jojawo', 'product_cat', '商品分类', 1, '4', '修改数据', '', 1550635103, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cbuicz1555056132zzbllj', 'product', 'TOP热销', 1, '82', '修改商品', '', 1555056132, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ccyrve1552726594pvduos', 'product', '商品列表', 1, '24', '修改商品', '', 1552726594, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cddena1550717405tqfcyn', 'product', '精选商品', 1, '8', '修改商品', '', 1550717405, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cfagmn1555315048uextlw', 'Node', '节点管理', 1, 'cqvtgh1555315048elhuin', '添加节点', '', 1555315048, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('chsmbn1555048097derxxv', 'product', '商品列表', 1, '51', '修改商品', '', 1555048097, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cifnty1555071285ttykuy', 'member_upgrade', '会员升级套餐', 1, '22', '修改商品', '', 1555071285, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cktpjd1551074746klmswm', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1551074746, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ckycnc1555063869wsoplu', 'product', '精选商品', 1, '104', '新增商品', '', 1555063869, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('clfxea1555078720rcmknw', 'product', 'TOP热销', 1, '82', '修改商品', '', 1555078720, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cneskk1555075610nworfx', 'product', 'TOP热销', 1, '79', '修改商品', '', 1555075610, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cnqjvx1555071992ymsjqm', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555071992, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cnxuee1550650475bcvsmd', 'Node', '节点管理', 1, 'gekkmp1550650474lhprer', '添加节点', '', 1550650475, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cpshsw1555077813tjhuzf', 'product', '商品列表', 1, '67', '修改商品', '', 1555077813, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cqkeok1553044663pcmgmt', 'product', '精选商品', 1, '28', '修改商品', '', 1553044663, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cqlbfa1552725454kqrwhi', 'product', '商品列表', 1, '22', '修改商品', '', 1552725454, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cqpafp1555068774fvmbtw', 'member_upgrade', '会员升级套餐', 1, '19', '修改商品', '', 1555068774, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('crjcjo1555048522hrappl', 'product', '商品列表', 1, '54', '新增商品', '', 1555048522, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('crkicq1555064355afwtga', 'product', '精选商品', 1, '108', '修改商品', '', 1555064355, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cseqkn1550717012atgjwz', 'product', 'TOP热销', 1, '7', '修改商品', '', 1550717012, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('csxoym1555065130gvhaoe', 'product', '精选商品', 1, '114', '修改商品', '', 1555065130, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cteaxi1555058958lyoreh', 'product', 'TOP热销', 1, '90', '新增商品', '', 1555058958, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ctozfc1551335159kqldzm', 'product', '商品列表', 1, '9', '新增商品', '', 1551335159, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ctxoas1554863391cshbsn', 'member_upgrade', '会员升级套餐', 1, '5', '修改商品', '', 1554863391, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cuiwou1554966016qcpqhq', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1554966016, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cvdqec1555064155pzvcdd', 'product', '精选商品', 1, '106', '新增商品', '', 1555064155, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cvwmun1554883240zpbaus', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554883240, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cwonzy1555315989mlfqcj', 'Node', '节点管理', 1, 'mxgxas1555315989gupxak', '添加节点', '', 1555315989, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cxkaox1553502502rdcyhr', 'product', '精选商品', 1, '28', '修改商品', '', 1553502502, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('cysbwz1555048683dxcwuc', 'product', '商品列表', 1, '55', '修改商品', '', 1555048683, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dalrwz1550635086qpoitj', 'product_cat', '商品分类', 1, '5', '修改数据', '', 1550635086, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dfhcel1550543352itstif', 'product', '商品列表', 1, '1', '修改数据', '', 1550543352, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dfmwpm1555048308vpgsci', 'product', '商品列表', 1, '53', '修改商品', '', 1555048308, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dftibb1555074143bcptag', 'member_upgrade', '会员升级套餐', 1, '22', '修改商品', '', 1555074143, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dgqwyu1554994467wrvpfz', 'product', '商品列表', 1, '39', '新增商品', '', 1554994467, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('djfgyl1555075581rxeqwc', 'product', 'TOP热销', 1, '78', '修改商品', '', 1555075581, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dntjbt1555058801daobqr', 'product', 'TOP热销', 1, '89', '修改商品', '', 1555058801, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dpfigl1555077727qeunpq', 'product', '商品列表', 1, '63', '修改商品', '', 1555077727, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dphqkv1555078033lofqmo', 'product', 'TOP热销', 1, '68', '修改商品', '', 1555078033, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dqiqxk1552725609xcoplh', 'product', '商品列表', 1, '2', '修改商品', '', 1552725609, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dqlpkb1555078697hgmzxi', 'product', 'TOP热销', 1, '79', '修改商品', '', 1555078697, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dsatyc1555077813gagbwb', 'product', '商品列表', 1, '67', '修改商品', '', 1555077813, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dvisnl1555077780rrfrsw', 'product', '商品列表', 1, '65', '修改商品', '', 1555077780, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dwxock1552026345bcgahw', 'product', 'TOP热销', 1, '12', '新增商品', '', 1552026345, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('dyrtdk1553043958fkcsgl', 'member_upgrade', '会员升级套餐', 1, '2', '新增会员升级套餐', '', 1553043958, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('eamjip1553738248mljmll', 'userlevel', '会员等级', 1, '4', '修改数据', '', 1553738248, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ebgmwr1555077904ffktnv', 'product', '商品列表', 1, '50', '修改商品', '', 1555077904, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ecfoew1553738130hjwtao', 'member_upgrade_cat', '会员升级套餐分类', 1, '1', '修改数据', '', 1553738130, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ejlwwl1552633040cwlgqp', 'product', '商品列表', 1, '1', '修改商品', '', 1552633040, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ekxkxj1553043995fbfhdn', 'member_upgrade', '会员升级套餐', 1, '3', '新增会员升级套餐', '', 1553043995, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('emigno1550635116sypzsj', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1550635116, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('enmllx1555051895ovpxjs', 'product', '商品列表', 1, '66', '新增商品', '', 1555051895, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('enzmsx1552724274kljfbv', 'product', '商品列表', 1, '20', '新增商品', '', 1552724274, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('eoeivc1555050980ftyzpz', 'product', '商品列表', 1, '63', '新增商品', '', 1555050980, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('eoihpo1555048647sqdebf', 'product', '商品列表', 1, '55', '新增商品', '', 1555048647, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('episay1555048297orxlcg', 'product', '商品列表', 1, '53', '新增商品', '', 1555048297, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('epmuyx1555314568dlubki', 'Node', '节点管理', 1, 'qppyyt1555314568obeesh', '添加节点', '', 1555314568, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('epvtou1555059594vzkmri', 'product', 'TOP热销', 1, '93', '新增商品', '', 1555059594, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('eqdldf1555220376szeilz', 'member_upgrade', '会员升级套餐', 1, '14', '修改商品', '', 1555220376, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('eqmrid1555053323xsnbet', 'product', 'TOP热销', 1, '68', '修改商品', '', 1555053323, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('esgdbd1552636571redhyo', 'product', '商品列表', 1, '10', '修改商品', '', 1552636571, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('espbct1555077464alalpx', 'product', '商品列表', 1, '49', '修改商品', '', 1555077464, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('etgafa1550633198sirgga', 'product_cat', '商品分类', 1, '6', '修改数据', '', 1550633198, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ethyff1554033049swxtqz', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554033049, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('euivnn1552818968fltzsv', 'product', '商品列表', 1, '1', '修改商品', '', 1552818968, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('eurlre1555317190kfbgby', 'Node', '节点管理', 1, 'utirua1555317190brbets', '添加节点', '', 1555317190, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('evrpjr1550543374yeadkk', 'product', '商品列表', 1, '1', '修改数据', '', 1550543374, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('exnief1550802934tgqble', 'product', '商品列表', 1, '2', '修改商品', '', 1550802934, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('exrgeq1553502297ryocwp', 'product', '精选商品', 1, '28', '修改商品', '', 1553502297, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ezapdj1550557261vdfhha', 'Node', '节点管理', 1, 'dfaqrg1550557260rwlwbs', '添加节点', '', 1550557261, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('faacwp1554085079cnjebg', 'Node', '节点管理', 1, 'vvkhqm1554085079duepdw', '添加节点', '', 1554085079, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fazckt1555077780uszptm', 'product', '商品列表', 1, '65', '修改商品', '', 1555077780, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fbaowy1551255314lrrbew', 'Node', '节点管理', 1, 'cgrsgg1551255314bavbrg', '添加节点', '', 1551255314, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fbtisv1554790244ibaybi', 'product', '商品列表', 1, '3', '修改商品', '', 1554790244, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fczfzd1554886719sdszic', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554886719, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('felpcn1555056215gfdrjk', 'product', 'TOP热销', 1, '83', '新增商品', '', 1555056215, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('feybhj1554277683hwkvfy', 'member_upgrade', '会员升级套餐', 1, '3', '修改商品', '', 1554277683, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ffmhjy1552818455hkazxw', 'product', '商品列表', 1, '19', '修改商品', '', 1552818455, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fgngar1551434126hgywpr', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551434126, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fgrtlo1555064247wgvpjy', 'product', '精选商品', 1, '107', '新增商品', '', 1555064247, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fhlhux1555220351cjkhfp', 'member_upgrade', '会员升级套餐', 1, '15', '修改商品', '', 1555220351, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fhulyb1555052635mdkfjm', 'product_cat', '商品分类', 1, '6', '修改数据', '', 1555052635, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fiikmd1551433313gmzbdo', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551433313, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fistga1555048678eaolhs', 'product', '商品列表', 1, '54', '修改商品', '', 1555048678, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fjtroz1555220334fzjnxl', 'member_upgrade', '会员升级套餐', 1, '31', '修改商品', '', 1555220334, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('flgjpj1550472438ehkvdg', 'product_type', '节点管理', 1, 'ouowgc1550472438czvwpm', '添加新数据', '', 1550472438, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('flwhsv1555318061ofgcpe', 'Node', '节点管理', 1, 'avpsgv1555318061awbxde', '添加节点', '', 1555318061, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('foaizo1555220396xewsoj', 'member_upgrade', '会员升级套餐', 1, '12', '修改商品', '', 1555220396, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('foycnp1555071416fxbdes', 'member_upgrade', '会员升级套餐', 1, '23', '新增会员升级套餐', '', 1555071416, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fphvej1555062844updrnk', 'product', '精选商品', 1, '99', '新增商品', '', 1555062844, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fqlisz1550469710uyqreg', 'Node', '节点管理', 1, 'bcavbf1550469710zyrkmq', '添加节点', '', 1550469710, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fquasb1555315354cmissc', 'Node', '节点管理', 1, 'yzommu1555315354iwvxay', '添加节点', '', 1555315354, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('frfscf1555071295eenkoo', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555071295, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('frijje1553501856wrwddo', 'product', '精选商品', 1, '29', '修改商品', '', 1553501856, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('frliwz1552636200zgjxel', 'product', '商品列表', 1, '9', '修改商品', '', 1552636200, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fsdizn1555220184fzkqvl', 'member_upgrade', '会员升级套餐', 1, '29', '新增会员升级套餐', '', 1555220184, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fszsne1555071429nnlxgx', 'member_upgrade', '会员升级套餐', 1, '23', '修改商品', '', 1555071429, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ftwehn1555077917hwowld', 'product', '商品列表', 1, '62', '修改商品', '', 1555077917, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fucwni1555080329actbwf', 'product', '精选商品', 1, '111', '修改商品', '', 1555080329, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fumxlb1555075511xkpcem', 'product', 'TOP热销', 1, '70', '修改商品', '', 1555075511, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fvcvet1552636276hjkgse', 'product', '商品列表', 1, '9', '修改商品', '', 1552636276, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fvefef1553502279ddxwse', 'product', '精选商品', 1, '27', '修改商品', '', 1553502279, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fxtdma1550655472tgmfpg', 'product', 'TOP热销', 1, '7', '新增商品', '', 1550655472, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fyoocg1554301059rzwucb', 'Node', '节点管理', 1, 'sjoxen1550469322qprvrc', '修改节点', '', 1554301059, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fyqdlt1555314660pjvvlz', 'Node', '节点管理', 1, 'vqejrc1555314660dbdudj', '添加节点', '', 1555314660, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('fzsdbj1555317428xlvmud', 'Node', '节点管理', 1, 'gmfqww1555317428zbxgis', '添加节点', '', 1555317428, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gaeixb1555318441vbhjuk', 'Node', '节点管理', 1, 'cgothy1555318441ndcogi', '添加节点', '', 1555318441, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gamjlw1554344875ybpnhz', 'product_cat', '商品分类', 1, '5', '修改数据', '', 1554344875, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gconpq1555079952aoopaf', 'product', '精选商品', 1, '101', '修改商品', '', 1555079952, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gdfmjg1554966788xobfuo', 'member_upgrade', '会员升级套餐', 1, '13', '新增会员升级套餐', '', 1554966788, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gdyuwy1551433568xjfqzw', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551433568, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gehvip1555314884iwdysa', 'Node', '节点管理', 1, 'opfliw1555314884uvmzlx', '添加节点', '', 1555314884, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gfrlwx1555315373csozoj', 'Node', '节点管理', 1, 'cciiop1555315373fivyoc', '添加节点', '', 1555315373, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ggewrf1550817495rpapqo', 'miniprogram_parameter', '小程序参数设置', 1, '1', '修改数据', '', 1550817495, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ghdmpo1554995374ewizxj', 'product', '商品列表', 1, '44', '新增商品', '', 1554995374, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ghehqz1555075722mhzoxv', 'product', 'TOP热销', 1, '85', '修改商品', '', 1555075722, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ghqyrx1555072610gnchvg', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072610, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gittgm1551270891zrirxl', 'member_upgrade', '会员升级套餐', 1, 'hlggva1551270891xpzcxe', '添加新数据', '', 1551270891, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gjaakf1555071936gyuqwt', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555071936, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gkdkpn1555055576rrheyd', 'product', 'TOP热销', 1, '78', '新增商品', '', 1555055576, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gkjxcq1555315971qxhmja', 'Node', '节点管理', 1, 'xclusv1555315971rhnjnb', '添加节点', '', 1555315971, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('glirjn1554891894fcsjxh', 'product', 'TOP热销', 1, '32', '新增商品', '', 1554891894, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gmgdfo1555071820ylrcum', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555071820, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gmzdnd1555019301niljua', 'stock', '股票列表', 1, '3', '修改数据', '', 1555019301, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gnfald1555220326glnvwh', 'member_upgrade', '会员升级套餐', 1, '31', '新增会员升级套餐', '', 1555220326, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gossco1554300955gjsarh', 'Node', '节点管理', 1, 'zhioiu1554300955yezmgz', '添加节点', '', 1554300955, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gpljpd1555074618zellfe', 'product', 'TOP热销', 1, '68', '修改商品', '', 1555074618, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gqbmli1550472452iscawz', 'product_type', '节点管理', 1, 'sulnhc1550472452jxmhfs', '添加新数据', '', 1550472452, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('grdeae1555313932fcyiey', 'Node', '节点管理', 1, 'evjqzg1555313932kjkuse', '添加节点', '', 1555313932, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gshxiw1555077951egpegs', 'product', '商品列表', 1, '52', '修改商品', '', 1555077951, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gsiuws1555019225bnptok', 'member_upgrade', '会员升级套餐', 1, '11', '修改商品', '', 1555019225, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gswodg1555072696ndmabl', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072696, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gtcefv1552724761ttzuca', 'product', '商品列表', 1, '11', '修改商品', '', 1552724761, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('guqmwm1555064251hdoiyd', 'product', '精选商品', 1, '107', '修改商品', '', 1555064251, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gveqjb1555078783nytsra', 'product', 'TOP热销', 1, '87', '修改商品', '', 1555078783, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gvmvgg1555053314keozpw', 'product', 'TOP热销', 1, '68', '新增商品', '', 1555053314, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gvnjga1555041350ovjkop', 'product', '商品列表', 1, '45', '修改商品', '', 1555041350, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gwqsef1554023040eqkjyc', 'Node', '节点管理', 1, 'kjdeci1554023040uqmdgq', '添加节点', '', 1554023040, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gwxxmz1555316596ibkinp', 'Node', '节点管理', 1, 'dlcdbx1555316596ehppxk', '添加节点', '', 1555316596, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gxsgij1554995488vqftvb', 'product', '商品列表', 1, '44', '修改商品', '', 1554995488, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gxxaum1552635436ajjgjz', 'product', '商品列表', 1, '2', '修改商品', '', 1552635436, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gzadek1555064816fjmihy', 'product', '精选商品', 1, '112', '新增商品', '', 1555064816, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gzmeqx1555074087gpcowq', 'member_upgrade', '会员升级套餐', 1, '17', '修改商品', '', 1555074087, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('gzvsgw1555074200shbtzv', 'member_upgrade', '会员升级套餐', 1, '18', '修改商品', '', 1555074200, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hafqsy1555072051fkevip', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072051, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hatlbx1550472227ytuicm', 'product_type', '节点管理', 1, 'nebfgx1550472226oklqvl', '添加新数据', '', 1550472227, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('haxqpe1554861571wmhcpn', 'member_upgrade', '会员升级套餐', 1, '5', '修改商品', '', 1554861571, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hbcbkw1554966910ifnywp', 'member_upgrade', '会员升级套餐', 1, '12', '修改商品', '', 1554966910, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hbfqql1552817848psdgtd', 'product', '商品列表', 1, '19', '修改商品', '', 1552817848, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hcyuun1554023737atpgzj', 'Node', '节点管理', 1, 'npdbjp1550469741pgynsz', '修改节点', '', 1554023737, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hdpytj1552634368zgnmhg', 'product', '商品列表', 1, '1', '修改商品', '', 1552634368, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hebddr1552016058lakfgz', 'product', '商品列表', 1, '11', '修改商品', '', 1552016058, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hfynul1552724338iecoec', 'product', '商品列表', 1, '20', '修改商品', '', 1552724338, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hhvzsd1555220385ltoqpd', 'member_upgrade', '会员升级套餐', 1, '13', '修改商品', '', 1555220385, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hiesrj1555080344ytvlum', 'product', '精选商品', 1, '109', '修改商品', '', 1555080344, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hixyfl1555072216qmxwoo', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072216, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hjvqlq1555055377yhkgyf', 'product', 'TOP热销', 1, '76', '新增商品', '', 1555055377, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hlgjlr1555053826rxrnyr', 'product', 'TOP热销', 1, '69', '修改商品', '', 1555053826, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hlqfum1555071857odthhg', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555071857, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hmlwse1550545883vybzhf', 'product', '商品列表', 1, '2', '新增商品', '', 1550545883, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hpnqux1550804535lzplnf', 'Node', '节点管理', 1, 'pcjoky1550804535qqkwub', '添加节点', '', 1550804535, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hrenrf1550474630scthjg', 'Node', '节点管理', 1, 'nmupca1550474630izdouh', '添加节点', '', 1550474630, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hrxcib1555075554ukvvxa', 'product', 'TOP热销', 1, '74', '修改商品', '', 1555075554, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hsgxqy1553043999mnqehg', 'member_upgrade', '会员升级套餐', 1, '3', '修改商品', '', 1553043999, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hujvbr1550713210fydbni', 'product', '新品上架', 1, '5', '修改商品', '', 1550713210, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hxiqsq1550555738gufrxb', 'Node', '节点管理', 1, 'yzmohy1550555738mbtrdl', '添加节点', '', 1550555738, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hxjqgp1555072156uathri', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072156, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('hzenfr1555068752xnrhsj', 'member_upgrade', '会员升级套餐', 1, '18', '新增会员升级套餐', '', 1555068752, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ibjery1551335671mtsvcn', 'member_upgrade', '会员升级套餐', 1, 'hdmted1551335670vvngbt', '添加新数据', '', 1551335671, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ibstcu1552725797wxrphg', 'product', '商品列表', 1, '21', '修改商品', '', 1552725797, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('idyadi1555318417qngbvx', 'Node', '节点管理', 1, 'rltyyt1555318362lshzcy', '修改节点', '', 1555318417, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iegwuc1555053512kxjboc', 'product', 'TOP热销', 1, '69', '新增商品', '', 1555053512, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ienapg1555080276gpyvyf', 'product', '精选商品', 1, '113', '修改商品', '', 1555080276, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ifmddb1552820183uoqqef', 'member_upgrade', '会员升级套餐', 1, '2', '修改数据', '', 1552820183, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iftwkm1550547989ptzjav', 'stock', '股票列表', 1, 'hljzlu1550547989ltjasi', '添加新数据', '', 1550547989, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('igjhzh1555021429hqbiyo', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555021429, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('igparo1555055871xrejxa', 'product', 'TOP热销', 1, '81', '新增商品', '', 1555055871, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iibvfr1554301050liebop', 'Node', '节点管理', 1, 'hnnide1554301050xjyzfm', '添加节点', '', 1554301050, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iimhfs1552026178msdidk', 'product', '新品上架', 1, '6', '修改商品', '', 1552026178, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ijlesu1555063660newfyx', 'product', '精选商品', 1, '102', '新增商品', '', 1555063660, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ijqhpl1555050018yydhpt', 'product', '商品列表', 1, '60', '修改商品', '', 1555050018, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ikdvgh1552635424mdqdnd', 'product', '商品列表', 1, '16', '新增商品', '', 1552635424, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iknmdx1555072117xxnjju', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072117, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ilqrzq1555072128ikwlea', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072128, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ilusrr1555054781adkdnz', 'product', 'TOP热销', 1, '73', '新增商品', '', 1555054781, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ilxnrg1555068606waqumm', 'member_upgrade', '会员升级套餐', 1, '17', '修改商品', '', 1555068606, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('imlokc1554995484hcljzm', 'product', '商品列表', 1, '42', '修改商品', '', 1554995484, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('imonee1550650007mtchxb', 'Node', '节点管理', 1, 'unicwr1550650007yrqvjf', '添加节点', '', 1550650007, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('imyipl1555060302nmoiee', 'product', 'TOP热销', 1, '96', '修改商品', '', 1555060302, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('imzupt1555072527hqhkqe', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072527, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('inarpr1555316046spiszw', 'Node', '节点管理', 1, 'mxgxas1555315989gupxak', '修改节点', '', 1555316046, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('inghqn1555048092ctiiky', 'product', '商品列表', 1, '50', '修改商品', '', 1555048092, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('inoffy1552980877qevrvs', 'member_upgrade_cat', '会员升级套餐分类', 1, NULL, '添加新数据', '', 1552980877, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('inpefq1550557863tzkuds', 'Node', '节点管理', 1, 'dfaqrg1550557260rwlwbs', '修改节点', '', 1550557863, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iohuav1555079972epelys', 'product', '精选商品', 1, '102', '修改商品', '', 1555079972, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ioiqto1555049427znmxez', 'product', '商品列表', 1, '58', '修改商品', '', 1555049427, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iongwu1555075445gwtdah', 'product', 'TOP热销', 1, '68', '修改商品', '', 1555075445, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ipnaiq1555051904bjjjza', 'product', '商品列表', 1, '66', '修改商品', '', 1555051904, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iqrjtf1551335686orkerc', 'member_upgrade', '会员升级套餐', 1, '2', '修改数据', '', 1551335686, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iqyhzw1555052744lddolf', 'product', '商品列表', 1, '67', '修改商品', '', 1555052744, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iqyytd1555071245frlwvc', 'member_upgrade', '会员升级套餐', 1, '22', '新增会员升级套餐', '', 1555071245, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('irfkdx1555315025qpncoq', 'Node', '节点管理', 1, 'tcjyln1555315025jeeipt', '添加节点', '', 1555315025, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('irzmsf1555051437jtvext', 'product', '商品列表', 1, '65', '新增商品', '', 1555051437, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('isqonk1552727023andhaj', 'product', '商品列表', 1, '25', '新增商品', '', 1552727023, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ityjua1552724948hwqcur', 'product', '商品列表', 1, '2', '修改商品', '', 1552724948, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iulexc1552620537ghbyrc', 'product', '商品列表', 1, '1', '修改商品', '', 1552620537, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ivrzcd1555075542uigtth', 'product', 'TOP热销', 1, '73', '修改商品', '', 1555075542, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ivuqac1552635460ibxgpn', 'product', '商品列表', 1, '2', '修改商品', '', 1552635460, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('iwufjb1555314685wstgyb', 'Node', '节点管理', 1, 'glflah1555314685zkfxeh', '添加节点', '', 1555314685, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jautpp1553827534kaxyft', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1553827534, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jaymvi1555056538pmigfq', 'product', 'TOP热销', 1, '85', '修改商品', '', 1555056538, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jbfxgg1553388911gvqcbp', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1553388911, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jbtbcm1555294989euduvk', 'Node', '节点管理', 1, 'vkqcwn1520320816oyqxml', '修改节点', '', 1555294989, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jgrard1551255392tzgwnv', 'Node', '节点管理', 1, 'lamxow1551255392epfdcs', '添加节点', '', 1551255392, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jjghbe1555059600zswirf', 'product', 'TOP热销', 1, '93', '修改商品', '', 1555059600, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jknrvr1555050007srwmmy', 'product', '商品列表', 1, '60', '新增商品', '', 1555050007, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jmbumf1555314592znbvgt', 'Node', '节点管理', 1, 'rpbyis1555314592kclksv', '添加节点', '', 1555314592, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jmhcvg1555075653awuhdt', 'product', 'TOP热销', 1, '83', '修改商品', '', 1555075653, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jmitdt1553501848nlaogw', 'product', '精选商品', 1, '29', '新增商品', '', 1553501848, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jncpvx1555068887rcxjrn', 'member_upgrade', '会员升级套餐', 1, '20', '修改商品', '', 1555068887, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jnxdpk1555315158xanude', 'Node', '节点管理', 1, 'ynshas1555315110idkroi', '修改节点', '', 1555315158, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jrhhpz1555074135qtowow', 'member_upgrade', '会员升级套餐', 1, '21', '修改商品', '', 1555074135, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jsiimu1555318463cootan', 'Node', '节点管理', 1, 'npwoxk1555318463ppeczh', '添加节点', '', 1555318463, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jsqtgv1555060501crycck', 'product', 'TOP热销', 1, '97', '修改商品', '', 1555060501, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jtfwoc1552373037fikyaa', 'product', '商品列表', 1, '1', '修改商品', '', 1552373037, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jtlkzo1555315311wujkrr', 'Node', '节点管理', 1, 'qfzkxc1555315311ixrnfb', '添加节点', '', 1555315311, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jtmong1555315454kiecay', 'Node', '节点管理', 1, 'fwhawt1555315454juqwbv', '添加节点', '', 1555315454, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jvrivz1555075785qvazdl', 'product', 'TOP热销', 1, '88', '修改商品', '', 1555075785, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jwkhgz1555051150csblhy', 'product', '商品列表', 1, '64', '新增商品', '', 1555051150, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jzttyp1555317377ncufet', 'Node', '节点管理', 1, 'skfhll1555317377uslvuj', '添加节点', '', 1555317377, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jzvozv1550559356gmcfmq', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1550559356, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('jzvrqs1552635479ztbnrx', 'product', '商品列表', 1, '9', '修改商品', '', 1552635479, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kbjhfu1551162891uhwrof', 'miniprogram_parameter', '小程序参数设置', 1, '1', '修改数据', '', 1551162891, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kbzarn1554273433mopxay', 'stock', '股票列表', 1, '3', '修改数据', '', 1554273433, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kdrkjm1555063664tnoosu', 'product', '精选商品', 1, '102', '修改商品', '', 1555063664, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('khbfdj1553740533ltkowa', 'userlevel', '会员等级', 1, '1', '修改数据', '', 1553740533, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('khcdaf1552638152ajivru', 'product', '商品列表', 1, '17', '修改商品', '', 1552638152, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kicxjn1554687251ebafel', 'product', '商品列表', 1, '20', '修改商品', '', 1554687251, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kifoep1555077869faurxw', 'product', '商品列表', 1, '56', '修改商品', '', 1555077869, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kitjgq1555080268zyoaro', 'product', '精选商品', 1, '114', '修改商品', '', 1555080268, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kitnfg1554995477jhmjnk', 'product', '商品列表', 1, '43', '修改商品', '', 1554995477, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kjrmbb1552015432uqymxm', 'product', '商品列表', 1, '11', '修改商品', '', 1552015432, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kjvygt1554994076nklzqk', 'product', '商品列表', 1, '37', '修改商品', '', 1554994076, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kmgfuz1550541445kofosx', 'product', '商品列表', 1, '1', '新增商品', '', 1550541445, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('knbbwj1555077727waoryw', 'product', '商品列表', 1, '63', '修改商品', '', 1555077727, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kngbjb1550634993vnspbw', 'product_cat', '商品分类', 1, '6', '修改数据', '', 1550634993, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('knyivs1555075596fvelcy', 'product', 'TOP热销', 1, '77', '修改商品', '', 1555075596, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('konezc1555055388iguulw', 'product', 'TOP热销', 1, '76', '修改商品', '', 1555055388, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kovccy1551268633ukdtky', 'Node', '节点管理', 1, 'qnaudt1551268632meebxv', '添加节点', '', 1551268633, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kpfadl1555318525tjlsue', 'Node', '节点管理', 1, 'xouggv1555318525lyyspn', '添加节点', '', 1555318525, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kpgikg1552638422juzepn', 'product', '商品列表', 1, '18', '修改商品', '', 1552638422, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kqgweg1555078490laivtl', 'product', 'TOP热销', 1, '70', '修改商品', '', 1555078490, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kqjcge1555316228rrkvdx', 'Node', '节点管理', 1, 'dcyfzu1555316228vpstfm', '添加节点', '', 1555316228, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kqrkmd1551669100dvfjpb', 'Node', '节点管理', 1, 'ymnrow1550469585slffnv', '修改节点', '', 1551669100, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kqrpjz1550655497knhxge', 'product', '精选商品', 1, '8', '新增商品', '', 1550655497, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ksazub1554273708tluony', 'stock', '股票列表', 1, '3', '修改数据', '', 1554273708, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ktddkv1555315004smzgof', 'Node', '节点管理', 1, 'nneree1555315004vgjfoe', '添加节点', '', 1555315004, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kuehtg1554860551ifhtuy', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554860551, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kwwyrv1555055876cbkaiy', 'product', 'TOP热销', 1, '81', '修改商品', '', 1555055876, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kyirwp1555315092oxibjr', 'Node', '节点管理', 1, 'goitas1555315092mqddlf', '添加节点', '', 1555315092, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kzdprs1555316937rjrzqv', 'Node', '节点管理', 1, 'ldydaw1555316937hknbly', '添加节点', '', 1555316937, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kzxeiz1555220369vhrysp', 'member_upgrade', '会员升级套餐', 1, '15', '修改商品', '', 1555220369, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('kzzomt1550474600whejcs', 'Node', '节点管理', 1, 'itwdvp1550474599xwpwcw', '添加节点', '', 1550474600, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lakdzp1550651445oqvvwa', 'product', '商品列表', 1, '4', '新增商品', '', 1550651445, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lbxuge1550712592ujhsnd', 'product', '新品上架', 1, '4', '修改商品', '', 1550712592, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lcdqjo1555317169rywgxq', 'Node', '节点管理', 1, 'smhhgk1555317169warbrl', '添加节点', '', 1555317169, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lgahkx1552374015hkbntw', 'product', '商品列表', 1, '1', '修改商品', '', 1552374015, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lgnfll1555220199pimiic', 'member_upgrade', '会员升级套餐', 1, '29', '修改商品', '', 1555220199, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lizpug1550469508fskyrc', 'Node', '节点管理', 1, 'fprnbn1550469507vtmstw', '添加节点', '', 1550469508, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ljajxf1554859688cvdhjk', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554859688, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ljiyyh1554195040tibzmj', 'member_upgrade_cat', '会员升级套餐分类', 1, '1', '修改数据', '', 1554195040, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ljtipt1555063988bjemwf', 'product', '精选商品', 1, '105', '修改商品', '', 1555063988, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ljujbe1550652261ktycuw', 'product', '新品上架', 1, '5', '新增商品', '', 1550652261, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lkgggx1550548110qleyyw', 'stock', '股票列表', 1, 'vbsteu1550548110oysvkz', '添加新数据', '', 1550548110, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lkkjyg1554885801lsbprv', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554885801, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('llibcs1552015144gjdodw', 'product', '商品列表', 1, '11', '修改商品', '', 1552015144, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lnjraa1550649742mgwbwd', 'product', '商品列表', 1, '3', '新增商品', '', 1550649742, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lnxelc1555080229sqrxln', 'product', '精选商品', 1, '110', '修改商品', '', 1555080229, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lqkzyz1555315410amqsqn', 'Node', '节点管理', 1, 'wqyaen1555315410dvhhxk', '添加节点', '', 1555315410, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lragqb1555063952lgntkv', 'product', '精选商品', 1, '105', '新增商品', '', 1555063952, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lreunv1552726575dsywcy', 'product', '商品列表', 1, '24', '新增商品', '', 1552726575, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lrxzez1555077853bgqqxx', 'product', '商品列表', 1, '55', '修改商品', '', 1555077853, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lsjoyb1555041335imqfmb', 'product', '商品列表', 1, '45', '新增商品', '', 1555041335, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lskrby1555316511wysmaq', 'Node', '节点管理', 1, 'jsddwv1555316511wzpsod', '添加节点', '', 1555316511, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ltasqm1555060293puurdn', 'product', 'TOP热销', 1, '96', '新增商品', '', 1555060293, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lvtral1555059837udihtn', 'product', 'TOP热销', 1, '95', '新增商品', '', 1555059837, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lxbxpq1555316559rhnhvp', 'Node', '节点管理', 1, 'orauxn1555316559byvbkz', '添加节点', '', 1555316559, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lxyhcz1552984290rmqeaz', 'member_upgrade', '会员升级套餐', 1, '27', '新增会员升级套餐', '', 1552984290, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lyfuwd1550652858bkrhkw', 'product', '新品上架', 1, '5', '修改商品', '', 1550652858, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('lzzqtz1550557761cwijjp', 'Node', '节点管理', 1, 'dfaqrg1550557260rwlwbs', '修改节点', '', 1550557761, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('majmtc1554966491sstzsq', 'member_upgrade', '会员升级套餐', 1, '12', '新增会员升级套餐', '', 1554966491, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('maxyss1555301760ysdydb', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1555301760, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mbqnit1551669127gkkslc', 'Node', '节点管理', 1, 'npdbjp1550469741pgynsz', '修改节点', '', 1551669127, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mbslov1555077671tiovfm', 'product', '商品列表', 1, '61', '修改商品', '', 1555077671, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mcwslb1555052240ntkgdr', 'product', '商品列表', 1, '67', '新增商品', '', 1555052240, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mdbykz1555077834vlqjku', 'product', '商品列表', 1, '46', '修改商品', '', 1555077834, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mesmpo1550559527yuuewn', 'Node', '节点管理', 1, 'dzbaxl1550559527flzgna', '添加节点', '', 1550559527, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mfmmte1555077383wmmiar', 'product', '商品列表', 1, '48', '修改商品', '', 1555077383, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mhiufn1554882263urqnot', 'member_upgrade', '会员升级套餐', 1, '8', '新增会员升级套餐', '', 1554882263, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mhpcga1555069572pcverh', 'member_upgrade', '会员升级套餐', 1, '21', '新增会员升级套餐', '', 1555069572, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mhpwwi1552725117gzwhzk', 'product', '商品列表', 1, '3', '修改商品', '', 1552725117, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mhwsar1553042581bwzagg', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1553042581, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('minucn1554966895jlsthy', 'member_upgrade', '会员升级套餐', 1, '14', '新增会员升级套餐', '', 1554966895, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mipoqx1555059848owhfxw', 'product', 'TOP热销', 1, '95', '修改商品', '', 1555059848, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('miwxwh1555058779hhjpng', 'product', 'TOP热销', 1, '89', '新增商品', '', 1555058779, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mixfis1554994046rxpnda', 'product', '商品列表', 1, '37', '新增商品', '', 1554994046, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mjbfcc1550717420gqoccg', 'product', '精选商品', 1, '8', '修改商品', '', 1550717420, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mjejth1555318538wkqhgh', 'Node', '节点管理', 1, 'zuezvu1555318538imkpfe', '添加节点', '', 1555318538, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mkczrp1554301089ktipso', 'Node', '节点管理', 1, 'gdtbsz1554301089qopxbp', '添加节点', '', 1554301089, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mnzfvh1555316187jsqqmz', 'Node', '节点管理', 1, 'mbtmer1555316187wbulnu', '添加节点', '', 1555316187, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mobtit1555021449bclqsh', 'member_upgrade', '会员升级套餐', 1, '11', '修改商品', '', 1555021449, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mopmpv1555064663rmkdgn', 'product', '精选商品', 1, '111', '新增商品', '', 1555064663, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('movyey1554888483cmjqgl', 'product', '商品列表', 1, '31', '新增商品', '', 1554888483, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mowspm1555219740tgjvjv', 'member_upgrade', '会员升级套餐', 1, '25', '新增会员升级套餐', '', 1555219740, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mplfqy1554195188atghkr', 'member_upgrade_cat', '会员升级套餐分类', 1, '2', '修改数据', '', 1554195188, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mqzblw1555075646ptabpd', 'product', 'TOP热销', 1, '82', '修改商品', '', 1555075646, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mqzvfr1554888498idjiaa', 'product', '商品列表', 1, '31', '修改商品', '', 1554888498, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('msccvx1555080374tkxagb', 'product', '精选商品', 1, '104', '修改商品', '', 1555080374, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('muavpi1555075619hastlr', 'product', 'TOP热销', 1, '80', '修改商品', '', 1555075619, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mulbvv1555055119wrfztc', 'product', 'TOP热销', 1, '74', '新增商品', '', 1555055119, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mxlsbv1555058508drzjgd', 'product', 'TOP热销', 1, '88', '新增商品', '', 1555058508, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('myuorx1553043962szylxt', 'member_upgrade', '会员升级套餐', 1, '2', '修改商品', '', 1553043962, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('myzvbz1552981087ookjyn', 'member_upgrade_cat', '会员升级套餐分类', 1, '1', '修改数据', '', 1552981087, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('mzolzx1552719126hoettn', 'product', '商品列表', 1, '19', '新增商品', '', 1552719126, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nayvtr1555074119cdxcob', 'member_upgrade', '会员升级套餐', 1, '19', '修改商品', '', 1555074119, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nbfhjs1555055225xbabng', 'product', 'TOP热销', 1, '75', '新增商品', '', 1555055225, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nbjsqh1555048074sphcke', 'product', '商品列表', 1, '46', '修改商品', '', 1555048074, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ncfjjy1554995449faxypd', 'product', '商品列表', 1, '39', '修改商品', '', 1554995449, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nehugn1552818552qfmjfo', 'product', '商品列表', 1, '19', '修改商品', '', 1552818552, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nerkyx1555055143zyuaxd', 'product', 'TOP热销', 1, '73', '修改商品', '', 1555055143, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nfjevj1555077959lewjaj', 'product', '商品列表', 1, '64', '修改商品', '', 1555077959, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ngbatp1554966313baxcpt', 'member_upgrade', '会员升级套餐', 1, '11', '新增会员升级套餐', '', 1554966313, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nggsgu1554860309bbbirp', 'member_upgrade', '会员升级套餐', 1, '5', '新增会员升级套餐', '', 1554860309, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ngzuaz1552638812kzvejc', 'product', '商品列表', 1, '10', '修改商品', '', 1552638812, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nhblpy1553740589djlgnb', 'userlevel', '会员等级', 1, '4', '修改数据', '', 1553740589, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('njaffd1555050988tazaxh', 'product', '商品列表', 1, '62', '修改商品', '', 1555050988, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('njdvas1555046921ttxper', 'product', '商品列表', 1, '47', '新增商品', '', 1555046921, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('njuymm1554966324reuayl', 'member_upgrade', '会员升级套餐', 1, '11', '修改商品', '', 1554966324, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('njvhim1555057506hvwkfb', 'product', 'TOP热销', 1, '87', '修改商品', '', 1555057506, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nknohv1554966918edzafw', 'member_upgrade', '会员升级套餐', 1, '14', '修改商品', '', 1554966918, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nkntsr1550469742ullyxu', 'Node', '节点管理', 1, 'npdbjp1550469741pgynsz', '添加节点', '', 1550469742, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nlopdn1555064944zvwdns', 'product', '精选商品', 1, '113', '新增商品', '', 1555064944, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nmbunh1555063530jjxuci', 'product', '精选商品', 1, '101', '修改商品', '', 1555063530, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nmeeab1555047639ljldfp', 'product', '商品列表', 1, '51', '新增商品', '', 1555047639, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nmmmau1555316705flpxwg', 'Node', '节点管理', 1, 'rrxyzg1555316705fxjgpz', '添加节点', '', 1555316705, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nnsryg1552026167qbpnkf', 'product', '新品上架', 1, '6', '修改商品', '', 1552026167, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nohikw1554991843hqagwe', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1554991843, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('novjbu1554994624kyeipg', 'product', '商品列表', 1, '39', '修改商品', '', 1554994624, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('npgmgi1550561226zdswfn', 'award', '奖品列表', 1, 'opfuhs1550561225khsrls', '添加新数据', '', 1550561226, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nqsdgc1550469413vzgbqq', 'Node', '节点管理', 1, 'fbepbd1550469413znyoco', '添加节点', '', 1550469413, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nraebt1555050495xnpckl', 'product', '商品列表', 1, '61', '新增商品', '', 1555050495, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nsrqif1555047406vsiecu', 'product', '商品列表', 1, '50', '新增商品', '', 1555047406, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nszzrr1555080089eqgupi', 'product', '精选商品', 1, '103', '修改商品', '', 1555080089, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ntbhmz1552726190fdvmsz', 'product', '商品列表', 1, '23', '修改商品', '', 1552726190, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ntitvz1555318098kmuvlw', 'Node', '节点管理', 1, 'xufvfp1521424502zdwypl', '修改节点', '', 1555318098, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ntjhnm1554685400qhevvp', 'stock', '股票列表', 1, '1', '修改数据', '', 1554685400, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ntjkzr1555075574terfep', 'product', 'TOP热销', 1, '76', '修改商品', '', 1555075574, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nuepeg1555072144zifqhv', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072144, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nuwlwh1555071896wqvuav', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555071896, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nwdqek1555314911qhquuc', 'Node', '节点管理', 1, 'jetdyx1555314911wdppmd', '添加节点', '', 1555314911, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nxlawe1555077537ryzhih', 'product', '商品列表', 1, '60', '修改商品', '', 1555077537, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nxqhhi1554995412tskdyy', 'product', '商品列表', 1, '38', '修改商品', '', 1554995412, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nxvcsz1550650064wuqcyu', 'Node', '节点管理', 1, 'nhruda1550650063xhqunx', '添加节点', '', 1550650064, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nypfat1555316093xyrnsm', 'Node', '节点管理', 1, 'xaovsh1555316093fophdf', '添加节点', '', 1555316093, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nyusph1555065113vjtbql', 'product', '精选商品', 1, '114', '新增商品', '', 1555065113, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nzsymh1550716010upqlkb', 'product', '新品上架', 1, '5', '修改商品', '', 1550716010, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('nzxlza1555075800oolyed', 'product', 'TOP热销', 1, '89', '修改商品', '', 1555075800, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oarpyl1555318500zknaxr', 'Node', '节点管理', 1, 'hytizz1555318500kuxrud', '添加节点', '', 1555318500, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('obaquh1550559484ytlcgd', 'Node', '节点管理', 1, 'dfaqrg1550557260rwlwbs', '修改节点', '', 1550559484, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ochmad1555072599jhjeel', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072599, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('odsket1555075925yfdjri', 'product', 'TOP热销', 1, '98', '修改商品', '', 1555075925, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ofauag1554302692nfjepi', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1554302692, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oftqrt1552636566tlzgnd', 'product', '商品列表', 1, '10', '修改商品', '', 1552636566, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ohacqn1550469586zrxgfy', 'Node', '节点管理', 1, 'ymnrow1550469585slffnv', '添加节点', '', 1550469586, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oihnym1552820404hqrplu', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1552820404, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oivobx1555296389mwimtq', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1555296389, '20', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ojaaov1550712629jlgrti', 'product', '新品上架', 1, '5', '修改商品', '', 1550712629, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ojajxu1550626615kejzgc', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1550626615, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ojudfh1555069580qvtzng', 'member_upgrade', '会员升级套餐', 1, '21', '修改商品', '', 1555069580, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('omxyfh1552636218vbceoj', 'product', '商品列表', 1, '9', '修改商品', '', 1552636218, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ongoec1553501582zwmsqt', 'product', '精选商品', 1, '8', '修改商品', '', 1553501582, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oobgny1552634234khatnw', 'product', '商品列表', 1, '1', '修改商品', '', 1552634234, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('opfhnj1554879449nkycef', 'stock', '股票列表', 1, '2', '修改数据', '', 1554879449, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oshtkr1555019278kqnkqy', 'stock', '股票列表', 1, '2', '修改数据', '', 1555019278, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oswtyj1555047529hgvmap', 'product', '商品列表', 1, '50', '修改商品', '', 1555047529, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('otakzo1554863160zufgdv', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554863160, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ouqxfa1552026426qyfvmw', 'product', 'TOP热销', 1, '12', '修改商品', '', 1552026426, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ovwnce1553502482ecyxri', 'product', '精选商品', 1, '27', '修改商品', '', 1553502482, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oyjonc1555316206moslos', 'Node', '节点管理', 1, 'rjwlea1555316206gynkgz', '添加节点', '', 1555316206, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oyoxab1555078557xuwinc', 'product', 'TOP热销', 1, '73', '修改商品', '', 1555078557, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ozkcyv1555072585tzmdau', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072585, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ozpnug1555075526yozvlh', 'product', 'TOP热销', 1, '72', '修改商品', '', 1555075526, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('oztyee1551409585vsulpl', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1551409585, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pdltff1555317300frtrst', 'Node', '节点管理', 1, 'wygjex1555317300mnorar', '添加节点', '', 1555317300, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pdphvx1552724782sdinzx', 'product', '商品列表', 1, '11', '修改商品', '', 1552724782, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('peiowp1553410128kwxtsn', 'product', '新品上架', 1, '6', '修改商品', '', 1553410128, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pgeohx1552719139wqvnme', 'product', '商品列表', 1, '19', '修改商品', '', 1552719139, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pgurzu1555072557tbmknj', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072557, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('phdmzb1555078849cekcuw', 'product', 'TOP热销', 1, '94', '修改商品', '', 1555078849, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('phdrux1550651063lcuhsi', 'product_attr', '商品属性', 1, 'bleplx1550651063znqmuh', '添加新数据', '', 1550651063, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('phpiwh1552820128eulxyg', 'member_upgrade', '会员升级套餐', 1, '2', '修改数据', '', 1552820128, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('phviib1555050505gsgzpy', 'product', '商品列表', 1, '61', '修改商品', '', 1555050505, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('piaoki1554994856ajlkmp', 'product', '商品列表', 1, '41', '新增商品', '', 1554994856, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pjisrd1553051286wzwlcq', 'product', '精选商品', 1, '8', '修改商品', '', 1553051286, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pjlsdg1552638123kganoc', 'product', '商品列表', 1, '9', '修改商品', '', 1552638123, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pkpjci1554965939fdbtwk', 'member_upgrade', '会员升级套餐', 1, '10', '新增会员升级套餐', '', 1554965939, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('plsekq1555080037eacmap', 'product', '精选商品', 1, '107', '修改商品', '', 1555080037, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ppafcn1554685432ipthxr', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554685432, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ppqfno1553502310nsoufw', 'product', '精选商品', 1, '29', '修改商品', '', 1553502310, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ppscfs1555077672hblrcj', 'product', '商品列表', 1, '61', '修改商品', '', 1555077672, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('prpezy1555077984yolbwo', 'product', '商品列表', 1, '66', '修改商品', '', 1555077984, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ptiled1552637988mgjrni', 'product', '商品列表', 1, '9', '修改商品', '', 1552637988, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ptpddt1552015277sgbyvs', 'product', '商品列表', 1, '11', '修改商品', '', 1552015277, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ptsopc1552638411vqevap', 'product', '商品列表', 1, '18', '新增商品', '', 1552638411, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pujzkd1554687218ykdbpw', 'product', '商品列表', 1, '11', '修改商品', '', 1554687218, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pvbeqf1555055229cuuqph', 'product', 'TOP热销', 1, '75', '修改商品', '', 1555055229, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pvloey1555053675pyjkeo', 'product', 'TOP热销', 1, '70', '修改商品', '', 1555053675, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pvniay1555316831btkcpb', 'Node', '节点管理', 1, 'ibngrs1555316831niadnh', '添加节点', '', 1555316831, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pvvqhx1555079973pkfkdc', 'product', '精选商品', 1, '102', '修改商品', '', 1555079973, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pwmkaq1555316758ulxbqj', 'Node', '节点管理', 1, 'iloayw1555316758icmlnz', '添加节点', '', 1555316758, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pwppyg1553046871rqrfka', 'member_upgrade_cat', '会员升级套餐分类', 1, '3', '修改数据', '', 1553046871, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pxkawo1555077943wjoguk', 'product', '商品列表', 1, '58', '修改商品', '', 1555077943, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pxosao1554687333ynsvpi', 'product', '商品列表', 1, '19', '修改商品', '', 1554687333, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pxtpdx1554986684ieihoi', 'member_upgrade', '会员升级套餐', 1, '15', '修改商品', '', 1554986684, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pywejj1555055126xzltnx', 'product', 'TOP热销', 1, '74', '修改商品', '', 1555055126, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pzbqsc1555219871sfwhzm', 'member_upgrade', '会员升级套餐', 1, '26', '新增会员升级套餐', '', 1555219871, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('pzdtjj1551271010hogpow', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551271010, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qasjej1555220359yshkmh', 'member_upgrade', '会员升级套餐', 1, '14', '修改商品', '', 1555220359, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qbuwhj1555055702hvfkjs', 'product', 'TOP热销', 1, '79', '修改商品', '', 1555055702, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qcfrop1552635589sbhqhr', 'product', '商品列表', 1, '16', '修改商品', '', 1552635589, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qdhyyp1555078865xxfkmg', 'product', 'TOP热销', 1, '96', '修改商品', '', 1555078865, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qdlifx1550545432dzchjw', 'product', '商品列表', 1, '1', '修改商品', '', 1550545432, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qfjiuo1555049002prmpaa', 'product', '商品列表', 1, '57', '新增商品', '', 1555049002, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qgjaqi1555219761qtcpoy', 'member_upgrade', '会员升级套餐', 1, '25', '修改商品', '', 1555219761, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qhkqzo1555077463sffupt', 'product', '商品列表', 1, '49', '修改商品', '', 1555077463, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qiuhlq1554986881xfxkjh', 'member_upgrade', '会员升级套餐', 1, '16', '新增会员升级套餐', '', 1554986881, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qjaruv1555075878xjhhhj', 'product', 'TOP热销', 1, '93', '修改商品', '', 1555075878, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qkamqn1553044255uclybc', 'product', '精选商品', 1, '27', '修改商品', '', 1553044255, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qkryrj1555048083aeetuo', 'product', '商品列表', 1, '48', '修改商品', '', 1555048083, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qksqpj1555316385whxogs', 'Node', '节点管理', 1, 'rkueez1555316385oflebg', '添加节点', '', 1555316385, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qmqdmp1552015353xhaplo', 'product', '商品列表', 1, '11', '修改商品', '', 1552015353, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qndtij1552818507mbqlbs', 'product', '商品列表', 1, '19', '修改商品', '', 1552818507, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qobdsw1550643994booiym', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1550643994, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qokqwz1550633128fbaiif', 'product_cat', '商品分类', 1, '6', '修改数据', '', 1550633128, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qppvsb1555219970ybnzwn', 'member_upgrade', '会员升级套餐', 1, '27', '新增会员升级套餐', '', 1555219970, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qrtqhc1551420086kaleil', 'award', '奖品列表', 1, '3', '修改数据', '', 1551420086, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qsaneh1554195176vrgdpt', 'member_upgrade_cat', '会员升级套餐分类', 1, '3', '修改数据', '', 1554195176, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qsgsxm1552726172lokvbz', 'product', '商品列表', 1, '23', '新增商品', '', 1552726172, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qsiocy1550469322nijfsp', 'Node', '节点管理', 1, 'sjoxen1550469322qprvrc', '添加节点', '', 1550469322, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qtxekk1551255336gvfsdc', 'Node', '节点管理', 1, 'bcavbf1550469710zyrkmq', '修改节点', '', 1551255336, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qufcni1555072638aqqjzm', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072638, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qydgmm1555220407isgdrd', 'member_upgrade', '会员升级套餐', 1, '11', '修改商品', '', 1555220407, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qymjob1555062853kacxcy', 'product', '精选商品', 1, '99', '修改商品', '', 1555062853, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qypzfh1555019244uxsbwx', 'member_upgrade', '会员升级套餐', 1, '16', '修改商品', '', 1555019244, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qzeouc1555049432ksfesi', 'product', '商品列表', 1, '59', '新增商品', '', 1555049432, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('qzinnt1555315067hovnud', 'Node', '节点管理', 1, 'hvdswy1555315067kmrqof', '添加节点', '', 1555315067, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rakdir1553389583vffjth', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1553389583, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rcbojo1555317146goazxe', 'Node', '节点管理', 1, 'nlvzyn1555317146gkjrlp', '添加节点', '', 1555317146, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rceabe1555078605ipvuvk', 'product', 'TOP热销', 1, '98', '修改商品', '', 1555078605, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rdfyri1553044251ulrttw', 'product', '精选商品', 1, '27', '新增商品', '', 1553044251, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rfeuzj1552984317ycobwg', 'member_upgrade', '会员升级套餐', 1, '1', '新增会员升级套餐', '', 1552984317, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rfgpup1552980266mgnddq', 'member_upgrade_cat', '会员升级套餐分类', 1, NULL, '添加新数据', '', 1552980266, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rfrznl1555074126rfsqap', 'member_upgrade', '会员升级套餐', 1, '20', '修改商品', '', 1555074126, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rfzqcr1552013261drojsr', 'product', '商品列表', 1, '10', '新增商品', '', 1552013261, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rgfqpu1555063538kcyaab', 'product', '精选商品', 1, '100', '修改商品', '', 1555063538, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rglzwf1555051164ykscqz', 'product', '商品列表', 1, '64', '修改商品', '', 1555051164, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rhryku1554882639urnnii', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554882639, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rjjrla1554995142tbaehn', 'product', '商品列表', 1, '43', '新增商品', '', 1554995142, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rjntdd1554995471osevxo', 'product', '商品列表', 1, '41', '修改商品', '', 1554995471, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rjozww1553502530cdgwod', 'product', '精选商品', 1, '29', '修改商品', '', 1553502530, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rkqdev1550561667ktfcth', 'award', '奖品列表', 1, '1', '修改数据', '', 1550561667, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rkssnl1555064828bjcpnu', 'product', '精选商品', 1, '109', '修改商品', '', 1555064828, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rlktki1555314267uwxkos', 'Node', '节点管理', 1, 'hrqrjp1555314189wucuvu', '修改节点', '', 1555314267, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rltoir1555077861jufair', 'product', '商品列表', 1, '47', '修改商品', '', 1555077861, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rofjbx1555075764ayhgwf', 'product', 'TOP热销', 1, '87', '修改商品', '', 1555075764, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rohnsb1555316637qrlhsd', 'Node', '节点管理', 1, 'jsfbhq1555316637gqjqtq', '添加节点', '', 1555316637, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rosqyt1553761363ppzhsg', 'stock', '股票列表', 1, '4', '修改数据', '', 1553761363, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rpcddo1554273022iouyci', 'userlevel', '会员等级', 1, '4', '修改数据', '', 1554273022, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rpyygu1552620038gvsboi', 'product', '商品列表', 1, '1', '修改商品', '', 1552620038, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rqmqxn1555077933xgsgyw', 'product', '商品列表', 1, '51', '修改商品', '', 1555077933, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rqqmiw1552725148zxceii', 'product', '商品列表', 1, '3', '修改商品', '', 1552725148, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rsgvau1552727044faqlgn', 'product', '商品列表', 1, '25', '修改商品', '', 1552727044, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rsinpy1550647170qkxupb', 'product_cat', '商品分类', 1, '7', '修改数据', '', 1550647170, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ruknbf1555074150zfievq', 'member_upgrade', '会员升级套餐', 1, '23', '修改商品', '', 1555074150, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rxnqya1555071765nigxnx', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555071765, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ryrszy1554861123avsngq', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554861123, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rzizmx1555053670knkioi', 'product', 'TOP热销', 1, '70', '新增商品', '', 1555053670, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('rzsjze1555315942aowtgl', 'Node', '节点管理', 1, 'aniftr1555315942kunfve', '添加节点', '', 1555315942, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sajzdf1555072663dxdpbn', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072663, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sbcuch1554350255pnqmzx', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1554350255, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('seeoxl1555071852hmhfkz', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555071852, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sesvyl1550712634jkuyvo', 'product', '新品上架', 1, '6', '修改商品', '', 1550712634, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sfklui1555075625dfxvgk', 'product', 'TOP热销', 1, '81', '修改商品', '', 1555075625, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sfqvyu1555077882hurdim', 'product', '商品列表', 1, '57', '修改商品', '', 1555077882, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sgikzs1552817759ackjlu', 'product', '商品列表', 1, '19', '修改商品', '', 1552817759, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sgpdwf1553502248mealri', 'product', '精选商品', 1, '8', '修改商品', '', 1553502248, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sitpqd1550712651qtnxxf', 'product', '商品列表', 1, '2', '修改商品', '', 1550712651, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sjhifs1551268606wmzxnr', 'Node', '节点管理', 1, 'qneukq1551268606jjpbsc', '添加节点', '', 1551268606, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('slhyyi1552629690bjtqsi', 'product', '商品列表', 1, '1', '修改商品', '', 1552629690, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('smnnjt1552724967shoquj', 'product', '商品列表', 1, '2', '修改商品', '', 1552724967, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('smxpuy1555064833tgxekp', 'product', '精选商品', 1, '112', '修改商品', '', 1555064833, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('snxodx1555068765nchpki', 'member_upgrade', '会员升级套餐', 1, '18', '修改商品', '', 1555068765, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sovepr1551433082closus', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551433082, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('spbwlj1555050994fryfux', 'product', '商品列表', 1, '63', '修改商品', '', 1555050994, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('spphxl1552374080ykublr', 'product', '商品列表', 1, '1', '修改商品', '', 1552374080, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sqkkyq1550713216wpknwy', 'product', '新品上架', 1, '6', '修改商品', '', 1550713216, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('sqykjg1551074753hajupn', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1551074753, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('srgohr1552373771ezoflg', 'product', '商品列表', 1, '1', '修改商品', '', 1552373771, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('srqtuw1555317249gwzbhh', 'Node', '节点管理', 1, 'vaytuu1555317249ihnqgm', '添加节点', '', 1555317249, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('stijda1550545981dslghc', 'Node', '节点管理', 1, 'acsdrk1550545981txtnkj', '添加节点', '', 1550545981, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('stwucr1555059424ezoqam', 'product', 'TOP热销', 1, '92', '修改商品', '', 1555059424, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('swleot1555052279qpluzz', 'product_cat', '商品分类', 1, '6', '修改数据', '', 1555052279, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('syuotq1554882961rcxchn', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554882961, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tbwqzl1550715434gkzycu', 'product', '新品上架', 1, '4', '修改商品', '', 1550715434, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tcilpt1552312270vokqmx', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1552312270, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tddfzt1550561695yvgpyw', 'award', '奖品列表', 1, 'tgypkh1550561695vgoygq', '添加新数据', '', 1550561695, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('teakbo1555063390ikuvtd', 'product', '精选商品', 1, '100', '新增商品', '', 1555063390, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tfltlm1555063525sowlmy', 'product', '精选商品', 1, '101', '新增商品', '', 1555063525, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tgdqki1555072086ungddc', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072086, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tgflmv1555078737srqxvi', 'product', 'TOP热销', 1, '83', '修改商品', '', 1555078737, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tgtoid1555047253heyyul', 'product', '商品列表', 1, '49', '新增商品', '', 1555047253, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tgzgiz1554881957yahouc', 'product', '商品列表', 1, '30', '新增商品', '', 1554881957, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('thikls1555314935omfpke', 'Node', '节点管理', 1, 'tdndxq1555314935vgcaxv', '添加节点', '', 1555314935, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tiikco1554994261xvstbo', 'product', '商品列表', 1, '37', '修改商品', '', 1554994261, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tkaddr1555063774idiflr', 'product', '精选商品', 1, '103', '修改商品', '', 1555063774, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tkfleo1552635917uphgbk', 'product', '商品列表', 1, '16', '修改商品', '', 1552635917, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tkgyll1550556402ufrcmm', 'userlevel', '会员等级', 1, 'vnhnrh1550556402ifieat', '添加新数据', '', 1550556402, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tktrxq1551940127drjyaz', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1551940127, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tnueur1550561776mrkrnu', 'award', '奖品列表', 1, 'ldqtxi1550561776rxighy', '添加新数据', '', 1550561776, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tplepz1555315506lnwepf', 'Node', '节点管理', 1, 'siodif1555315506grervz', '添加节点', '', 1555315506, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tqjabt1555063410jxlifi', 'product', '精选商品', 1, '100', '修改商品', '', 1555063410, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('trnxod1555080207qxlmlc', 'product', '精选商品', 1, '112', '修改商品', '', 1555080207, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('trpoyr1553502469cfvwkb', 'product', '精选商品', 1, '8', '修改商品', '', 1553502469, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tujvwf1554966914vyzfhc', 'member_upgrade', '会员升级套餐', 1, '13', '修改商品', '', 1554966914, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tuyzam1555316066vfjrxj', 'Node', '节点管理', 1, 'azgnsm1555316066gvwpzo', '添加节点', '', 1555316066, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tvvzry1554992360qzuiap', 'product', '新品上架', 1, '33', '修改商品', '', 1554992360, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('twgxsh1550651101lihmew', 'product_attr', '商品属性', 1, 'oeppjj1550651101aarnaq', '添加新数据', '', 1550651101, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('twhqss1552724547tzxkcr', 'product', '商品列表', 1, '21', '新增商品', '', 1552724547, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('txlfih1555317266awourk', 'Node', '节点管理', 1, 'egkvri1555317266tuhsln', '添加节点', '', 1555317266, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('txvhps1555056323dmfynu', 'product', 'TOP热销', 1, '84', '新增商品', '', 1555056323, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tyeuvg1555047131stmpgh', 'product', '商品列表', 1, '48', '新增商品', '', 1555047131, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('tyrici1555077822rwiyof', 'product', '商品列表', 1, '45', '修改商品', '', 1555077822, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uakpdi1550712643zxtldr', 'product', '新品上架', 1, '6', '修改商品', '', 1550712643, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uamszu1552725436cghstz', 'product', '商品列表', 1, '22', '新增商品', '', 1552725436, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ubpdfw1555059257ydhapu', 'product', 'TOP热销', 1, '91', '新增商品', '', 1555059257, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ucpaok1554277665grhrfs', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554277665, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('udflzb1555068575tivsdl', 'member_upgrade', '会员升级套餐', 1, '17', '新增会员升级套餐', '', 1555068575, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('udngks1552015160mdchrq', 'product', '商品列表', 1, '11', '修改商品', '', 1552015160, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('udqkvv1553738155aogxho', 'member_upgrade_cat', '会员升级套餐分类', 1, '1', '修改数据', '', 1553738155, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('udwyvs1552979853lxvflm', 'member_upgrade_cat', '会员升级套餐分类', 1, '1', '修改数据', '', 1552979853, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uemtsz1553502246stpotz', 'product', '精选商品', 1, '8', '修改商品', '', 1553502246, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ufgtce1555314149nmerpn', 'Node', '节点管理', 1, 'nndiqb1555314149wxjkag', '添加节点', '', 1555314149, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uhiwno1553043907gfipkf', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1553043907, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ujhvaf1555019205oixomr', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555019205, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ujtuxo1550650993mesphq', 'product_attr', '商品属性', 1, 'sfootv1550650993ltenuy', '添加新数据', '', 1550650993, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ulbffk1553042663fkpzia', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1553042663, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ulwish1554273685dpmewp', 'stock', '股票列表', 1, '2', '修改数据', '', 1554273685, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('umpadv1553501718wjozjh', 'product', '精选商品', 1, '8', '修改商品', '', 1553501718, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('undbsr1555078033putavm', 'product', 'TOP热销', 1, '68', '修改商品', '', 1555078033, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('unmady1555040978bglmje', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1555040978, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('unpdho1555059265linrsk', 'product', 'TOP热销', 1, '91', '修改商品', '', 1555059265, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uomcnd1554995455txjlbd', 'product', '商品列表', 1, '40', '修改商品', '', 1554995455, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uotsub1555075638ywzzxy', 'product', 'TOP热销', 1, '81', '修改商品', '', 1555075638, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uovskr1552016042oqpkzd', 'product', '商品列表', 1, '11', '修改商品', '', 1552016042, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('upkscm1555060728elfnvk', 'product', 'TOP热销', 1, '98', '修改商品', '', 1555060728, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uqvnnh1553761371xfxnju', 'stock', '股票列表', 1, '4', '修改数据', '', 1553761371, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uqvtrz1552890437yfsqvy', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1552890437, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uqwfep1555057484bxuvue', 'product', 'TOP热销', 1, '87', '新增商品', '', 1555057484, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('usduyk1555056221lwxaod', 'product', 'TOP热销', 1, '83', '修改商品', '', 1555056221, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uubpgx1555317281hlljdr', 'Node', '节点管理', 1, 'lffakp1555317281lowply', '添加节点', '', 1555317281, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uuelib1555058971afemth', 'product', 'TOP热销', 1, '90', '修改商品', '', 1555058971, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uvlgvw1555064577ochyvo', 'product', '精选商品', 1, '110', '修改商品', '', 1555064577, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uwdahi1554986673lgdano', 'member_upgrade', '会员升级套餐', 1, '15', '新增会员升级套餐', '', 1554986673, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uwyhtk1554687224hwksxs', 'product', '商品列表', 1, '1', '修改商品', '', 1554687224, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uxxwtf1554023063famies', 'Node', '节点管理', 1, 'wpiluk1554023063nnerjy', '添加节点', '', 1554023063, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uyeeqc1555051502klwjoh', 'product', '商品列表', 1, '65', '修改商品', '', 1555051502, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uyjbjj1552014872vujeqg', 'product', '商品列表', 1, '11', '新增商品', '', 1552014872, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uyjpkl1552636669sxyajl', 'product', '商品列表', 1, '17', '新增商品', '', 1552636669, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('uzwzne1553040219oznkfj', 'Node', '节点管理', 1, 'acsdrk1550545981txtnkj', '修改节点', '', 1553040219, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vabzet1555055690cpymrt', 'product', 'TOP热销', 1, '79', '新增商品', '', 1555055690, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vamipr1552640760doqccc', 'product', '商品列表', 1, '10', '修改商品', '', 1552640760, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vbjpzr1550655432ddcmka', 'product', '新品上架', 1, '6', '修改商品', '', 1550655432, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vczxod1555078825hlemmw', 'product', 'TOP热销', 1, '93', '修改商品', '', 1555078825, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vdjqoi1554687233fgmdud', 'product', '商品列表', 1, '21', '修改商品', '', 1554687233, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('veiley1554993027ceifmc', 'product', '新品上架', 1, '34', '新增商品', '', 1554993027, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('venmbj1552373601paokid', 'product', '商品列表', 1, '1', '修改商品', '', 1552373601, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vfjhyt1555059393izpkee', 'product', 'TOP热销', 1, '92', '新增商品', '', 1555059393, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vhrsdq1550556522aelyae', 'userlevel', '会员等级', 1, 'zumzlq1550556522vnlyhf', '添加新数据', '', 1550556522, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vjopkr1555047942vuycck', 'product', '商品列表', 1, '52', '新增商品', '', 1555047942, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vlajbq1550716896ywijdt', 'product', 'TOP热销', 1, '7', '修改商品', '', 1550716896, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vlkwup1555055467syzoei', 'product', 'TOP热销', 1, '77', '修改商品', '', 1555055467, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vlplzc1555075491mtqvbf', 'product', 'TOP热销', 1, '69', '修改商品', '', 1555075491, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vmbvpi1555064160yzxusd', 'product', '精选商品', 1, '106', '修改商品', '', 1555064160, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vmyvjn1555316540thvkhs', 'Node', '节点管理', 1, 'kdenxp1555316539hnzivx', '添加节点', '', 1555316540, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vncxsj1555220062zvqpsf', 'member_upgrade', '会员升级套餐', 1, '28', '修改商品', '', 1555220062, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vnnezv1552984330ocfznc', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1552984330, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vnoiqp1552818441fqjvgq', 'product', '商品列表', 1, '19', '修改商品', '', 1552818441, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vopqja1550650103tcejwi', 'Node', '节点管理', 1, 'nkfdfx1550650103dpzbno', '添加节点', '', 1550650103, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vssbcr1555063768delewg', 'product', '精选商品', 1, '103', '新增商品', '', 1555063768, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vszrsr1555075562vjrxso', 'product', 'TOP热销', 1, '75', '修改商品', '', 1555075562, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vuzaqt1555048840sudezm', 'product', '商品列表', 1, '56', '新增商品', '', 1555048840, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vvgpgj1555075867kqlvmu', 'product', 'TOP热销', 1, '92', '修改商品', '', 1555075867, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vvzhzu1555040991gqqumz', 'product_cat', '商品分类', 1, '4', '修改数据', '', 1555040991, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vwzjas1555314189uwfdzw', 'Node', '节点管理', 1, 'hrqrjp1555314189wucuvu', '添加节点', '', 1555314189, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vybzyy1555048846awkezg', 'product', '商品列表', 1, '56', '修改商品', '', 1555048846, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vynova1554859604asdgvf', 'member_upgrade', '会员升级套餐', 1, '1', '修改商品', '', 1554859604, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vyyfdp1553046861eoexsu', 'member_upgrade_cat', '会员升级套餐分类', 1, '2', '修改数据', '', 1553046861, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('vzungm1554277673mbxrlf', 'member_upgrade', '会员升级套餐', 1, '2', '修改商品', '', 1554277673, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wabjiy1552635982atbswk', 'product', '商品列表', 1, '16', '修改商品', '', 1552635982, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('waypvf1555075590migddn', 'product', 'TOP热销', 1, '78', '修改商品', '', 1555075590, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wbrcxg1551270283uqulyj', 'Node', '节点管理', 1, 'hawmfm1551270283wadbsl', '添加节点', '', 1551270283, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wcfvgy1551432914fhxntr', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551432914, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wdzqvk1555049416zrfjzm', 'product', '商品列表', 1, '58', '新增商品', '', 1555049416, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('weiuxu1555054174ltjdsr', 'product', 'TOP热销', 1, '72', '修改商品', '', 1555054174, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wenlmb1554882038vbetna', 'member_upgrade', '会员升级套餐', 1, '7', '新增会员升级套餐', '', 1554882038, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wfdzla1555313908heryjp', 'Node', '节点管理', 1, 'gyukbs1555313908wuequw', '添加节点', '', 1555313908, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wfxqdz1555074047ybodns', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555074047, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wgbxbv1555075713iauyzq', 'product', 'TOP热销', 1, '84', '修改商品', '', 1555075713, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wgqpmi1555053857bvvung', 'product', 'TOP热销', 1, '68', '修改商品', '', 1555053857, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('whlqnh1555316967ftfxds', 'Node', '节点管理', 1, 'mjiakq1555316967vyloog', '添加节点', '', 1555316967, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wicoad1554273696xgrkst', 'stock', '股票列表', 1, '1', '修改数据', '', 1554273696, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wiklnf1555080019pclvwb', 'product', '精选商品', 1, '106', '修改商品', '', 1555080019, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wjmoag1555055463ftyjdh', 'product', 'TOP热销', 1, '77', '新增商品', '', 1555055463, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wlkciv1550643986lvyuek', 'product_cat', '商品分类', 1, '5', '修改数据', '', 1550643986, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wlqotb1555314005zhxuka', 'Node', '节点管理', 1, 'jpeyfd1555314005hzfald', '添加节点', '', 1555314005, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wnorwt1553501821eomcri', 'product', '精选商品', 1, '27', '修改商品', '', 1553501821, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wqhvvs1555071966ewhewt', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555071966, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wqjska1552818935wisgnj', 'product', '商品列表', 1, '1', '修改商品', '', 1552818935, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wrxqnl1555055794qthild', 'product', 'TOP热销', 1, '80', '修改商品', '', 1555055794, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wwxbbn1555075909uccigy', 'product', 'TOP热销', 1, '96', '修改商品', '', 1555075909, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wxcrba1554690212uyfyta', 'member_upgrade', '会员升级套餐', 1, '4', '新增会员升级套餐', '', 1554690212, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wxcvff1550652283bksmlm', 'product', '新品上架', 1, '6', '新增商品', '', 1550652283, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wxfzhf1552725765yrflnd', 'product', '商品列表', 1, '11', '修改商品', '', 1552725765, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wylqaw1552725854qicggs', 'product', '商品列表', 1, '2', '修改商品', '', 1552725854, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('wzwxie1552630052bfhyhd', 'product', '商品列表', 1, '1', '修改商品', '', 1552630052, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xbdurl1555046748bhfxwj', 'product', '商品列表', 1, '46', '新增商品', '', 1555046748, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xbfycf1553044659ujdcwy', 'product', '精选商品', 1, '28', '新增商品', '', 1553044659, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xblkry1555056542vuytmv', 'product', 'TOP热销', 1, '84', '修改商品', '', 1555056542, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xdereu1555220058ehmbrj', 'member_upgrade', '会员升级套餐', 1, '28', '新增会员升级套餐', '', 1555220058, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xdkrad1552635471asuvtd', 'product', '商品列表', 1, '9', '修改商品', '', 1552635471, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xdtdgx1550625377ofhimd', 'Node', '节点管理', 1, 'dfaqrg1550557260rwlwbs', '修改节点', '', 1550625377, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xhvzal1553390183jruolc', 'pictures', '轮播图管理', 1, '7', '修改数据', '', 1553390183, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xhwwfm1555316814tkpsxh', 'Node', '节点管理', 1, 'bjmtxt1555316814pgfdtd', '添加节点', '', 1555316814, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xibdlg1555219877eghhmh', 'member_upgrade', '会员升级套餐', 1, '26', '修改商品', '', 1555219877, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xigsre1552294085menyar', 'Node', '节点管理', 1, 'uhkpqo1552294085pgxuks', '添加节点', '', 1552294085, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xiniwp1555075841ctjoih', 'product', 'TOP热销', 1, '91', '修改商品', '', 1555075841, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xixade1555059400ejmkfw', 'product', 'TOP热销', 1, '92', '修改商品', '', 1555059400, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xjpxsf1555064345aubjcy', 'product', '精选商品', 1, '108', '修改商品', '', 1555064345, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xknhnq1552635466rtgjpd', 'product', '商品列表', 1, '3', '修改商品', '', 1552635466, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xkwmnt1553740540pjhcuo', 'userlevel', '会员等级', 1, '1', '修改数据', '', 1553740540, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xlcysa1555048003xclouw', 'product', '商品列表', 1, '37', '修改商品', '', 1555048003, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xldxoo1555063879aiompk', 'product', '精选商品', 1, '104', '修改商品', '', 1555063879, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xnliqt1555316033tyjlaf', 'Node', '节点管理', 1, 'smmkym1555316033qduwax', '添加节点', '', 1555316033, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xougwe1555313886xmrwrz', 'Node', '节点管理', 1, 'ulqslg1555313886afkekv', '添加节点', '', 1555313886, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xoxuod1550712397inkfgn', 'product', '新品上架', 1, '6', '修改商品', '', 1550712397, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xpazdt1552818989crkouz', 'product', '商品列表', 1, '1', '修改商品', '', 1552818989, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xpoiva1555064557xlplju', 'product', '精选商品', 1, '110', '新增商品', '', 1555064557, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xporrf1554879438nfskmo', 'stock', '股票列表', 1, '1', '修改数据', '', 1554879438, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xpoufd1554994346uevovz', 'product', '商品列表', 1, '38', '新增商品', '', 1554994346, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xqrbxp1554995023jjycjh', 'product', '商品列表', 1, '42', '新增商品', '', 1554995023, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xregdz1552014892giespw', 'product', '商品列表', 1, '11', '修改商品', '', 1552014892, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xsmrzc1554993731xkftkf', 'product', '新品上架', 1, '35', '新增商品', '', 1554993731, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xsqyzq1555050765iiioks', 'product', '商品列表', 1, '62', '新增商品', '', 1555050765, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xthvrn1555055581qirdsj', 'product', 'TOP热销', 1, '78', '修改商品', '', 1555055581, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xufbbj1555072069hretha', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072069, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xufrtf1554886756noaenf', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554886756, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xvmxdn1554874151josewi', 'member_upgrade', '会员升级套餐', 1, '6', '新增会员升级套餐', '', 1554874151, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xvtuge1555052364eybrjv', 'product_cat', '商品分类', 1, '4', '修改数据', '', 1555052364, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xwcykv1550649945uyaxgo', 'product', '商品列表', 1, '1', '修改商品', '', 1550649945, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xyeyga1554993838afgpsj', 'product', '新品上架', 1, '36', '新增商品', '', 1554993838, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xyhxdw1555071253kaacmh', 'member_upgrade', '会员升级套餐', 1, '22', '修改商品', '', 1555071253, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xzvgkl1550643953ktkdme', 'product_cat', '商品分类', 1, '6', '修改数据', '', 1550643953, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('xzyttn1554879457altyzc', 'stock', '股票列表', 1, '3', '修改数据', '', 1554879457, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yareew1555314059kmgskc', 'Node', '节点管理', 1, 'wgivvz1555314059jmfdzs', '添加节点', '', 1555314059, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yaufhu1555314466gsdbcm', 'Node', '节点管理', 1, 'beiinz1555314466nqamza', '添加节点', '', 1555314466, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ybgiit1550651075dssjgu', 'product_attr', '商品属性', 1, 'yyopgi1550651075ygrlow', '添加新数据', '', 1550651075, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yccgge1552014687gxhsla', 'product', '商品列表', 1, '3', '修改商品', '', 1552014687, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ycvrug1555318362svhrxt', 'Node', '节点管理', 1, 'rltyyt1555318362lshzcy', '添加节点', '', 1555318362, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yejxnn1555059711wzvczd', 'product', 'TOP热销', 1, '94', '修改商品', '', 1555059711, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yfikhs1550543545wnlmak', 'product', '商品列表', 1, '1', '修改数据', '', 1550543545, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yfnfwd1555314422ipcdoi', 'Node', '节点管理', 1, 'nfkplv1555314422dcyikh', '添加节点', '', 1555314422, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yfpyhu1552979151mimohr', 'Node', '节点管理', 1, 'koultm1552979151rufbrd', '添加节点', '', 1552979151, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yfuukq1552820459jxnpzt', 'member_upgrade', '会员升级套餐', 1, '3', '修改数据', '', 1552820459, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ygkmem1551926230iivdvb', 'product', '商品列表', 1, '9', '修改商品', '', 1551926230, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ygmksr1552728024suikel', 'product', '商品列表', 1, '26', '修改商品', '', 1552728024, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yhoryv1555049129mgapen', 'product', '商品列表', 1, '57', '修改商品', '', 1555049129, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yikghk1552981187ywlvtk', 'member_upgrade_cat', '会员升级套餐分类', 1, '2', '修改数据', '', 1552981187, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yimstw1555314631bxdalq', 'Node', '节点管理', 1, 'odyunq1555314631yotuee', '添加节点', '', 1555314631, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yjmfec1555071740sytays', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555071740, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ylnpep1555078512ouaizk', 'product', 'TOP热销', 1, '71', '修改商品', '', 1555078512, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ylqklk1552635453fospoz', 'product', '商品列表', 1, '2', '修改商品', '', 1552635453, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ylxnqe1555058515hubfnn', 'product', 'TOP热销', 1, '88', '修改商品', '', 1555058515, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ymkmva1555078541wupwiq', 'product', 'TOP热销', 1, '72', '修改商品', '', 1555078541, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ynxqbd1555052555xdpudj', 'product_cat', '商品分类', 1, '3', '修改数据', '', 1555052555, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yoqzlo1555064676nrjkqo', 'product', '精选商品', 1, '111', '修改商品', '', 1555064676, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yorqgy1555315110gxtipi', 'Node', '节点管理', 1, 'ynshas1555315110idkroi', '添加节点', '', 1555315110, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yorzcu1555054177ahuqyo', 'product', 'TOP热销', 1, '71', '修改商品', '', 1555054177, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ypsyil1554886404csnbay', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554886404, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yptebj1555048079pbphwv', 'product', '商品列表', 1, '47', '修改商品', '', 1555048079, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yqgwkz1555077346qljetx', 'product', '商品列表', 1, '46', '修改商品', '', 1555077346, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yqrgve1555080353vmjyfr', 'product', '精选商品', 1, '108', '修改商品', '', 1555080353, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ytbtwk1553736983hneujg', 'user', '', 1, '23', '修改数据', '', 1553736983, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yuqfrx1555314444tqtgnl', 'Node', '节点管理', 1, 'tyjrjn1555314444lzlcxq', '添加节点', '', 1555314444, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yuzsxq1555080316qozjhb', 'product', '精选商品', 1, '111', '修改商品', '', 1555080316, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yvftbf1555072677wiiedy', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072677, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yvuckd1555021480uolnrj', 'member_upgrade', '会员升级套餐', 1, '16', '修改商品', '', 1555021480, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('ywptyo1551433390fxmpbz', 'product_cat', '商品分类', 1, 'fgdvxg1551433389swdqfb', '添加新数据', '', 1551433390, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yxdcni1554995404ucytvt', 'product', '商品列表', 1, '37', '修改商品', '', 1554995404, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yxjvjh1550712656xoekmr', 'product', '商品列表', 1, '3', '修改商品', '', 1550712656, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yxwnzr1552724556lkjkml', 'product', '商品列表', 1, '21', '修改商品', '', 1552724556, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yyzecg1551433269nicasw', 'member_upgrade', '会员升级套餐', 1, '1', '修改数据', '', 1551433269, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yzomye1553501835zvtzmt', 'product', '精选商品', 1, '28', '修改商品', '', 1553501835, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('yzxkaa1552014993girnjm', 'product', '商品列表', 1, '11', '修改商品', '', 1552014993, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zafiux1551268874vuahqw', 'Node', '节点管理', 1, 'lamxow1551255392epfdcs', '修改节点', '', 1551268874, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zawyfa1551335590zhmjtu', 'member_upgrade', '会员升级套餐', 1, 'koqacv1551335590dnixdp', '添加新数据', '', 1551335590, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zbgwmq1555072716rzsool', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555072716, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zbkrpp1550548065kvtlzf', 'stock', '股票列表', 1, 'rhflnj1550548065opcfmy', '添加新数据', '', 1550548065, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zbucxd1554886533lswdlj', 'member_upgrade', '会员升级套餐', 1, '8', '修改商品', '', 1554886533, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zcmxii1555318486mefnko', 'Node', '节点管理', 1, 'rdqikh1555318486vcubqz', '添加节点', '', 1555318486, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zdepcx1555077200rwtwlc', 'product', '商品列表', 1, '54', '修改商品', '', 1555077200, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zdihod1555315389kzthkr', 'Node', '节点管理', 1, 'ubfrfk1555315389exkmsj', '添加节点', '', 1555315389, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zemfmz1555064563lskodc', 'product', '精选商品', 1, '110', '修改商品', '', 1555064563, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zfecel1553051099zhiyrj', 'product', '新品上架', 1, '4', '修改商品', '', 1553051099, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zfmqkz1552636680lklhnv', 'product', '商品列表', 1, '17', '修改商品', '', 1552636680, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zhddnk1555056670ppiqon', 'product', 'TOP热销', 1, '86', '新增商品', '', 1555056670, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zhjafm1554966903kvtyez', 'member_upgrade', '会员升级套餐', 1, '11', '修改商品', '', 1554966903, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zhlxab1555052422wxkszk', 'product_cat', '商品分类', 1, '5', '修改数据', '', 1555052422, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zhoior1555053516vkuslw', 'product', 'TOP热销', 1, '69', '修改商品', '', 1555053516, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zhrmrh1555075850aeshkl', 'product', 'TOP热销', 1, '90', '修改商品', '', 1555075850, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zilebl1555056532zydbgj', 'product', 'TOP热销', 1, '85', '新增商品', '', 1555056532, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zkrrom1552725819ljlaqx', 'product', '商品列表', 1, '3', '修改商品', '', 1552725819, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zlbskn1555073993jlvjva', 'member_upgrade', '会员升级套餐', 1, '24', '修改商品', '', 1555073993, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zptycm1553389604otrehr', 'other_parameter', '其他参数设置', 1, '1', '修改数据', '', 1553389604, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zrqnaj1555058286ylxgal', 'product', 'TOP热销', 1, '86', '修改商品', '', 1555058286, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zrwxfg1555072026evcuil', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072026, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zsblre1554273408usobwd', 'stock', '股票列表', 1, '2', '修改数据', '', 1554273408, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zssigb1552728009fwabzo', 'product', '商品列表', 1, '26', '新增商品', '', 1552728009, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zvyygj1550647753yvouvg', 'product_cat', '商品分类', 1, 'wfkwhg1550647752fzprac', '添加新数据', '', 1550647753, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zxuuvo1555065137rftowm', 'product', '精选商品', 1, '114', '修改商品', '', 1555065137, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zyhmvb1555060495dmawff', 'product', 'TOP热销', 1, '97', '新增商品', '', 1555060495, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zynxpr1555072106lrgzco', 'member_upgrade', '会员升级套餐', 1, '10', '修改商品', '', 1555072106, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zyuhxm1550556470kugzdp', 'userlevel', '会员等级', 1, '1', '修改数据', '', 1550556470, '1', NULL);
INSERT INTO `dd_dboperationhistory` VALUES ('zyynhn1555316168cuwqtn', 'Node', '节点管理', 1, 'gvvwcx1555316168xufrsh', '添加节点', '', 1555316168, '1', NULL);

-- ----------------------------
-- Table structure for dd_district
-- ----------------------------
DROP TABLE IF EXISTS `dd_district`;
CREATE TABLE `dd_district`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `citycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纬度',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3272 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '高德行政区域数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_district
-- ----------------------------
INSERT INTO `dd_district` VALUES (1, 0, '0', '100000', '中华人民共和国', '116.3683244', '39.915085', 'country');
INSERT INTO `dd_district` VALUES (2, 1, '010', '110000', '北京市', '116.407394', '39.904211', 'province');
INSERT INTO `dd_district` VALUES (3, 2, '010', '110100', '北京市', '116.407394', '39.904211', 'city');
INSERT INTO `dd_district` VALUES (4, 3, '010', '110101', '东城区', '116.41649', '39.928341', 'district');
INSERT INTO `dd_district` VALUES (5, 3, '010', '110102', '西城区', '116.365873', '39.912235', 'district');
INSERT INTO `dd_district` VALUES (6, 3, '010', '110105', '朝阳区', '116.443205', '39.921506', 'district');
INSERT INTO `dd_district` VALUES (7, 3, '010', '110106', '丰台区', '116.287039', '39.858421', 'district');
INSERT INTO `dd_district` VALUES (8, 3, '010', '110107', '石景山区', '116.222933', '39.906611', 'district');
INSERT INTO `dd_district` VALUES (9, 3, '010', '110108', '海淀区', '116.298262', '39.95993', 'district');
INSERT INTO `dd_district` VALUES (10, 3, '010', '110109', '门头沟区', '116.101719', '39.940338', 'district');
INSERT INTO `dd_district` VALUES (11, 3, '010', '110111', '房山区', '116.143486', '39.748823', 'district');
INSERT INTO `dd_district` VALUES (12, 3, '010', '110112', '通州区', '116.656434', '39.909946', 'district');
INSERT INTO `dd_district` VALUES (13, 3, '010', '110113', '顺义区', '116.654642', '40.130211', 'district');
INSERT INTO `dd_district` VALUES (14, 3, '010', '110114', '昌平区', '116.231254', '40.220804', 'district');
INSERT INTO `dd_district` VALUES (15, 3, '010', '110115', '大兴区', '116.341483', '39.726917', 'district');
INSERT INTO `dd_district` VALUES (16, 3, '010', '110116', '怀柔区', '116.631931', '40.316053', 'district');
INSERT INTO `dd_district` VALUES (17, 3, '010', '110117', '平谷区', '117.121351', '40.140595', 'district');
INSERT INTO `dd_district` VALUES (18, 3, '010', '110118', '密云区', '116.843047', '40.376894', 'district');
INSERT INTO `dd_district` VALUES (19, 3, '010', '110119', '延庆区', '115.974981', '40.456591', 'district');
INSERT INTO `dd_district` VALUES (20, 1, '022', '120000', '天津市', '117.200983', '39.084158', 'province');
INSERT INTO `dd_district` VALUES (21, 20, '022', '120100', '天津市', '117.200983', '39.084158', 'city');
INSERT INTO `dd_district` VALUES (22, 21, '022', '120101', '和平区', '117.214699', '39.117196', 'district');
INSERT INTO `dd_district` VALUES (23, 21, '022', '120102', '河东区', '117.251584', '39.128294', 'district');
INSERT INTO `dd_district` VALUES (24, 21, '022', '120103', '河西区', '117.223371', '39.109563', 'district');
INSERT INTO `dd_district` VALUES (25, 21, '022', '120104', '南开区', '117.150738', '39.138205', 'district');
INSERT INTO `dd_district` VALUES (26, 21, '022', '120105', '河北区', '117.196648', '39.147869', 'district');
INSERT INTO `dd_district` VALUES (27, 21, '022', '120106', '红桥区', '117.151533', '39.167345', 'district');
INSERT INTO `dd_district` VALUES (28, 21, '022', '120110', '东丽区', '117.31362', '39.086802', 'district');
INSERT INTO `dd_district` VALUES (29, 21, '022', '120111', '西青区', '117.008826', '39.141152', 'district');
INSERT INTO `dd_district` VALUES (30, 21, '022', '120112', '津南区', '117.35726', '38.937928', 'district');
INSERT INTO `dd_district` VALUES (31, 21, '022', '120113', '北辰区', '117.135488', '39.224791', 'district');
INSERT INTO `dd_district` VALUES (32, 21, '022', '120114', '武清区', '117.044387', '39.384119', 'district');
INSERT INTO `dd_district` VALUES (33, 21, '022', '120115', '宝坻区', '117.309874', '39.717564', 'district');
INSERT INTO `dd_district` VALUES (34, 21, '022', '120116', '滨海新区', '117.698407', '39.01727', 'district');
INSERT INTO `dd_district` VALUES (35, 21, '022', '120117', '宁河区', '117.826724', '39.330087', 'district');
INSERT INTO `dd_district` VALUES (36, 21, '022', '120118', '静海区', '116.974232', '38.94745', 'district');
INSERT INTO `dd_district` VALUES (37, 21, '022', '120119', '蓟州区', '117.408296', '40.045851', 'district');
INSERT INTO `dd_district` VALUES (38, 1, '0', '130000', '河北省', '114.530235', '38.037433', 'province');
INSERT INTO `dd_district` VALUES (39, 38, '0311', '130100', '石家庄市', '114.514793', '38.042228', 'city');
INSERT INTO `dd_district` VALUES (40, 39, '0311', '130102', '长安区', '114.539395', '38.036347', 'district');
INSERT INTO `dd_district` VALUES (41, 39, '0311', '130104', '桥西区', '114.461088', '38.004193', 'district');
INSERT INTO `dd_district` VALUES (42, 39, '0311', '130105', '新华区', '114.463377', '38.05095', 'district');
INSERT INTO `dd_district` VALUES (43, 39, '0311', '130107', '井陉矿区', '114.062062', '38.065151', 'district');
INSERT INTO `dd_district` VALUES (44, 39, '0311', '130108', '裕华区', '114.531202', '38.00643', 'district');
INSERT INTO `dd_district` VALUES (45, 39, '0311', '130109', '藁城区', '114.847023', '38.021453', 'district');
INSERT INTO `dd_district` VALUES (46, 39, '0311', '130110', '鹿泉区', '114.313654', '38.085953', 'district');
INSERT INTO `dd_district` VALUES (47, 39, '0311', '130111', '栾城区', '114.648318', '37.900199', 'district');
INSERT INTO `dd_district` VALUES (48, 39, '0311', '130121', '井陉县', '114.145242', '38.032118', 'district');
INSERT INTO `dd_district` VALUES (49, 39, '0311', '130123', '正定县', '114.570941', '38.146444', 'district');
INSERT INTO `dd_district` VALUES (50, 39, '0311', '130125', '行唐县', '114.552714', '38.438377', 'district');
INSERT INTO `dd_district` VALUES (51, 39, '0311', '130126', '灵寿县', '114.382614', '38.308665', 'district');
INSERT INTO `dd_district` VALUES (52, 39, '0311', '130127', '高邑县', '114.611121', '37.615534', 'district');
INSERT INTO `dd_district` VALUES (53, 39, '0311', '130128', '深泽县', '115.20092', '38.184033', 'district');
INSERT INTO `dd_district` VALUES (54, 39, '0311', '130129', '赞皇县', '114.386111', '37.665663', 'district');
INSERT INTO `dd_district` VALUES (55, 39, '0311', '130130', '无极县', '114.97634', '38.179192', 'district');
INSERT INTO `dd_district` VALUES (56, 39, '0311', '130131', '平山县', '114.195918', '38.247888', 'district');
INSERT INTO `dd_district` VALUES (57, 39, '0311', '130132', '元氏县', '114.525409', '37.766513', 'district');
INSERT INTO `dd_district` VALUES (58, 39, '0311', '130133', '赵县', '114.776297', '37.756578', 'district');
INSERT INTO `dd_district` VALUES (59, 39, '0311', '130181', '辛集市', '115.217658', '37.943121', 'district');
INSERT INTO `dd_district` VALUES (60, 39, '0311', '130183', '晋州市', '115.044213', '38.033671', 'district');
INSERT INTO `dd_district` VALUES (61, 39, '0311', '130184', '新乐市', '114.683776', '38.343319', 'district');
INSERT INTO `dd_district` VALUES (62, 38, '0315', '130200', '唐山市', '118.180193', '39.630867', 'city');
INSERT INTO `dd_district` VALUES (63, 62, '0315', '130202', '路南区', '118.154354', '39.625058', 'district');
INSERT INTO `dd_district` VALUES (64, 62, '0315', '130203', '路北区', '118.200692', '39.624437', 'district');
INSERT INTO `dd_district` VALUES (65, 62, '0315', '130204', '古冶区', '118.447635', '39.733578', 'district');
INSERT INTO `dd_district` VALUES (66, 62, '0315', '130205', '开平区', '118.261841', '39.671001', 'district');
INSERT INTO `dd_district` VALUES (67, 62, '0315', '130207', '丰南区', '118.085169', '39.576031', 'district');
INSERT INTO `dd_district` VALUES (68, 62, '0315', '130208', '丰润区', '118.162215', '39.832582', 'district');
INSERT INTO `dd_district` VALUES (69, 62, '0315', '130209', '曹妃甸区', '118.460379', '39.27307', 'district');
INSERT INTO `dd_district` VALUES (70, 62, '0315', '130223', '滦县', '118.703598', '39.740593', 'district');
INSERT INTO `dd_district` VALUES (71, 62, '0315', '130224', '滦南县', '118.682379', '39.518996', 'district');
INSERT INTO `dd_district` VALUES (72, 62, '0315', '130225', '乐亭县', '118.912571', '39.425608', 'district');
INSERT INTO `dd_district` VALUES (73, 62, '0315', '130227', '迁西县', '118.314715', '40.1415', 'district');
INSERT INTO `dd_district` VALUES (74, 62, '0315', '130229', '玉田县', '117.738658', '39.900401', 'district');
INSERT INTO `dd_district` VALUES (75, 62, '0315', '130281', '遵化市', '117.965892', '40.189201', 'district');
INSERT INTO `dd_district` VALUES (76, 62, '0315', '130283', '迁安市', '118.701144', '39.999174', 'district');
INSERT INTO `dd_district` VALUES (77, 38, '0335', '130300', '秦皇岛市', '119.518197', '39.888701', 'city');
INSERT INTO `dd_district` VALUES (78, 77, '0335', '130302', '海港区', '119.564962', '39.94756', 'district');
INSERT INTO `dd_district` VALUES (79, 77, '0335', '130303', '山海关区', '119.775799', '39.978848', 'district');
INSERT INTO `dd_district` VALUES (80, 77, '0335', '130304', '北戴河区', '119.484522', '39.834596', 'district');
INSERT INTO `dd_district` VALUES (81, 77, '0335', '130306', '抚宁区', '119.244847', '39.876253', 'district');
INSERT INTO `dd_district` VALUES (82, 77, '0335', '130321', '青龙满族自治县', '118.949684', '40.407578', 'district');
INSERT INTO `dd_district` VALUES (83, 77, '0335', '130322', '昌黎县', '119.199551', '39.700911', 'district');
INSERT INTO `dd_district` VALUES (84, 77, '0335', '130324', '卢龙县', '118.892986', '39.891946', 'district');
INSERT INTO `dd_district` VALUES (85, 38, '0310', '130400', '邯郸市', '114.538959', '36.625594', 'city');
INSERT INTO `dd_district` VALUES (86, 85, '0310', '130402', '邯山区', '114.531002', '36.594313', 'district');
INSERT INTO `dd_district` VALUES (87, 85, '0310', '130403', '丛台区', '114.492896', '36.636409', 'district');
INSERT INTO `dd_district` VALUES (88, 85, '0310', '130404', '复兴区', '114.462061', '36.639033', 'district');
INSERT INTO `dd_district` VALUES (89, 85, '0310', '130406', '峰峰矿区', '114.212802', '36.419739', 'district');
INSERT INTO `dd_district` VALUES (90, 85, '0310', '130423', '临漳县', '114.619536', '36.335025', 'district');
INSERT INTO `dd_district` VALUES (91, 85, '0310', '130424', '成安县', '114.670032', '36.444317', 'district');
INSERT INTO `dd_district` VALUES (92, 85, '0310', '130425', '大名县', '115.147814', '36.285616', 'district');
INSERT INTO `dd_district` VALUES (93, 85, '0310', '130426', '涉县', '113.6914', '36.584994', 'district');
INSERT INTO `dd_district` VALUES (94, 85, '0310', '130427', '磁县', '114.373946', '36.374011', 'district');
INSERT INTO `dd_district` VALUES (95, 85, '0310', '130428', '肥乡区', '114.800166', '36.548131', 'district');
INSERT INTO `dd_district` VALUES (96, 85, '0310', '130429', '永年区', '114.543832', '36.743966', 'district');
INSERT INTO `dd_district` VALUES (97, 85, '0310', '130430', '邱县', '115.200589', '36.811148', 'district');
INSERT INTO `dd_district` VALUES (98, 85, '0310', '130431', '鸡泽县', '114.889376', '36.91034', 'district');
INSERT INTO `dd_district` VALUES (99, 85, '0310', '130432', '广平县', '114.948606', '36.483484', 'district');
INSERT INTO `dd_district` VALUES (100, 85, '0310', '130433', '馆陶县', '115.282467', '36.547556', 'district');
INSERT INTO `dd_district` VALUES (101, 85, '0310', '130434', '魏县', '114.93892', '36.359868', 'district');
INSERT INTO `dd_district` VALUES (102, 85, '0310', '130435', '曲周县', '114.957504', '36.76607', 'district');
INSERT INTO `dd_district` VALUES (103, 85, '0310', '130481', '武安市', '114.203697', '36.696506', 'district');
INSERT INTO `dd_district` VALUES (104, 38, '0319', '130500', '邢台市', '114.504677', '37.070834', 'city');
INSERT INTO `dd_district` VALUES (105, 104, '0319', '130502', '桥东区', '114.507058', '37.071287', 'district');
INSERT INTO `dd_district` VALUES (106, 104, '0319', '130503', '桥西区', '114.468601', '37.059827', 'district');
INSERT INTO `dd_district` VALUES (107, 104, '0319', '130521', '邢台县', '114.561132', '37.05073', 'district');
INSERT INTO `dd_district` VALUES (108, 104, '0319', '130522', '临城县', '114.498761', '37.444498', 'district');
INSERT INTO `dd_district` VALUES (109, 104, '0319', '130523', '内丘县', '114.512128', '37.286669', 'district');
INSERT INTO `dd_district` VALUES (110, 104, '0319', '130524', '柏乡县', '114.693425', '37.482422', 'district');
INSERT INTO `dd_district` VALUES (111, 104, '0319', '130525', '隆尧县', '114.770419', '37.350172', 'district');
INSERT INTO `dd_district` VALUES (112, 104, '0319', '130526', '任县', '114.671936', '37.120982', 'district');
INSERT INTO `dd_district` VALUES (113, 104, '0319', '130527', '南和县', '114.683863', '37.005017', 'district');
INSERT INTO `dd_district` VALUES (114, 104, '0319', '130528', '宁晋县', '114.93992', '37.624564', 'district');
INSERT INTO `dd_district` VALUES (115, 104, '0319', '130529', '巨鹿县', '115.037477', '37.221112', 'district');
INSERT INTO `dd_district` VALUES (116, 104, '0319', '130530', '新河县', '115.250907', '37.520862', 'district');
INSERT INTO `dd_district` VALUES (117, 104, '0319', '130531', '广宗县', '115.142626', '37.074661', 'district');
INSERT INTO `dd_district` VALUES (118, 104, '0319', '130532', '平乡县', '115.030075', '37.063148', 'district');
INSERT INTO `dd_district` VALUES (119, 104, '0319', '130533', '威县', '115.266703', '36.975478', 'district');
INSERT INTO `dd_district` VALUES (120, 104, '0319', '130534', '清河县', '115.667208', '37.039991', 'district');
INSERT INTO `dd_district` VALUES (121, 104, '0319', '130535', '临西县', '115.501048', '36.870811', 'district');
INSERT INTO `dd_district` VALUES (122, 104, '0319', '130581', '南宫市', '115.408747', '37.359264', 'district');
INSERT INTO `dd_district` VALUES (123, 104, '0319', '130582', '沙河市', '114.503339', '36.854929', 'district');
INSERT INTO `dd_district` VALUES (124, 38, '0312', '130600', '保定市', '115.464589', '38.874434', 'city');
INSERT INTO `dd_district` VALUES (125, 124, '0312', '130602', '竞秀区', '115.45877', '38.877449', 'district');
INSERT INTO `dd_district` VALUES (126, 124, '0312', '130606', '莲池区', '115.497097', '38.883582', 'district');
INSERT INTO `dd_district` VALUES (127, 124, '0312', '130607', '满城区', '115.322334', '38.949119', 'district');
INSERT INTO `dd_district` VALUES (128, 124, '0312', '130608', '清苑区', '115.489959', '38.765148', 'district');
INSERT INTO `dd_district` VALUES (129, 124, '0312', '130609', '徐水区', '115.655774', '39.018736', 'district');
INSERT INTO `dd_district` VALUES (130, 124, '0312', '130623', '涞水县', '115.713904', '39.394316', 'district');
INSERT INTO `dd_district` VALUES (131, 124, '0312', '130624', '阜平县', '114.195104', '38.849152', 'district');
INSERT INTO `dd_district` VALUES (132, 124, '0312', '130626', '定兴县', '115.808296', '39.263145', 'district');
INSERT INTO `dd_district` VALUES (133, 124, '0312', '130627', '唐县', '114.982972', '38.748203', 'district');
INSERT INTO `dd_district` VALUES (134, 124, '0312', '130628', '高阳县', '115.778965', '38.700088', 'district');
INSERT INTO `dd_district` VALUES (135, 124, '0312', '130629', '容城县', '115.861657', '39.042784', 'district');
INSERT INTO `dd_district` VALUES (136, 124, '0312', '130630', '涞源县', '114.694283', '39.360247', 'district');
INSERT INTO `dd_district` VALUES (137, 124, '0312', '130631', '望都县', '115.155128', '38.695842', 'district');
INSERT INTO `dd_district` VALUES (138, 124, '0312', '130632', '安新县', '115.935603', '38.935369', 'district');
INSERT INTO `dd_district` VALUES (139, 124, '0312', '130633', '易县', '115.497457', '39.349393', 'district');
INSERT INTO `dd_district` VALUES (140, 124, '0312', '130634', '曲阳县', '114.745008', '38.622248', 'district');
INSERT INTO `dd_district` VALUES (141, 124, '0312', '130635', '蠡县', '115.583854', '38.488055', 'district');
INSERT INTO `dd_district` VALUES (142, 124, '0312', '130636', '顺平县', '115.13547', '38.837487', 'district');
INSERT INTO `dd_district` VALUES (143, 124, '0312', '130637', '博野县', '115.46438', '38.457364', 'district');
INSERT INTO `dd_district` VALUES (144, 124, '0312', '130638', '雄县', '116.10865', '38.99455', 'district');
INSERT INTO `dd_district` VALUES (145, 124, '0312', '130681', '涿州市', '115.974422', '39.485282', 'district');
INSERT INTO `dd_district` VALUES (146, 124, '0312', '130682', '定州市', '114.990392', '38.516461', 'district');
INSERT INTO `dd_district` VALUES (147, 124, '0312', '130683', '安国市', '115.326646', '38.418439', 'district');
INSERT INTO `dd_district` VALUES (148, 124, '0312', '130684', '高碑店市', '115.873886', '39.326839', 'district');
INSERT INTO `dd_district` VALUES (149, 38, '0313', '130700', '张家口市', '114.886252', '40.768493', 'city');
INSERT INTO `dd_district` VALUES (150, 149, '0313', '130702', '桥东区', '114.894189', '40.788434', 'district');
INSERT INTO `dd_district` VALUES (151, 149, '0313', '130703', '桥西区', '114.869657', '40.819581', 'district');
INSERT INTO `dd_district` VALUES (152, 149, '0313', '130705', '宣化区', '115.099494', '40.608793', 'district');
INSERT INTO `dd_district` VALUES (153, 149, '0313', '130706', '下花园区', '115.287352', '40.502652', 'district');
INSERT INTO `dd_district` VALUES (154, 149, '0313', '130708', '万全区', '114.740557', '40.766965', 'district');
INSERT INTO `dd_district` VALUES (155, 149, '0313', '130709', '崇礼区', '115.282668', '40.974675', 'district');
INSERT INTO `dd_district` VALUES (156, 149, '0313', '130722', '张北县', '114.720077', '41.158596', 'district');
INSERT INTO `dd_district` VALUES (157, 149, '0313', '130723', '康保县', '114.600404', '41.852368', 'district');
INSERT INTO `dd_district` VALUES (158, 149, '0313', '130724', '沽源县', '115.688692', '41.669668', 'district');
INSERT INTO `dd_district` VALUES (159, 149, '0313', '130725', '尚义县', '113.969618', '41.076226', 'district');
INSERT INTO `dd_district` VALUES (160, 149, '0313', '130726', '蔚县', '114.588903', '39.840842', 'district');
INSERT INTO `dd_district` VALUES (161, 149, '0313', '130727', '阳原县', '114.150348', '40.104663', 'district');
INSERT INTO `dd_district` VALUES (162, 149, '0313', '130728', '怀安县', '114.385791', '40.674193', 'district');
INSERT INTO `dd_district` VALUES (163, 149, '0313', '130730', '怀来县', '115.517861', '40.415343', 'district');
INSERT INTO `dd_district` VALUES (164, 149, '0313', '130731', '涿鹿县', '115.205345', '40.379562', 'district');
INSERT INTO `dd_district` VALUES (165, 149, '0313', '130732', '赤城县', '115.831498', '40.912921', 'district');
INSERT INTO `dd_district` VALUES (166, 38, '0314', '130800', '承德市', '117.962749', '40.952942', 'city');
INSERT INTO `dd_district` VALUES (167, 166, '0314', '130802', '双桥区', '117.943466', '40.974643', 'district');
INSERT INTO `dd_district` VALUES (168, 166, '0314', '130803', '双滦区', '117.799888', '40.959236', 'district');
INSERT INTO `dd_district` VALUES (169, 166, '0314', '130804', '鹰手营子矿区', '117.659499', '40.546361', 'district');
INSERT INTO `dd_district` VALUES (170, 166, '0314', '130821', '承德县', '118.173824', '40.768238', 'district');
INSERT INTO `dd_district` VALUES (171, 166, '0314', '130822', '兴隆县', '117.500558', '40.417358', 'district');
INSERT INTO `dd_district` VALUES (172, 166, '0314', '130823', '平泉县', '118.701951', '41.018405', 'district');
INSERT INTO `dd_district` VALUES (173, 166, '0314', '130824', '滦平县', '117.332801', '40.941482', 'district');
INSERT INTO `dd_district` VALUES (174, 166, '0314', '130825', '隆化县', '117.738937', '41.313791', 'district');
INSERT INTO `dd_district` VALUES (175, 166, '0314', '130826', '丰宁满族自治县', '116.646051', '41.209069', 'district');
INSERT INTO `dd_district` VALUES (176, 166, '0314', '130827', '宽城满族自治县', '118.485313', '40.611391', 'district');
INSERT INTO `dd_district` VALUES (177, 166, '0314', '130828', '围场满族蒙古族自治县', '117.760159', '41.938529', 'district');
INSERT INTO `dd_district` VALUES (178, 38, '0317', '130900', '沧州市', '116.838834', '38.304477', 'city');
INSERT INTO `dd_district` VALUES (179, 178, '0317', '130902', '新华区', '116.866284', '38.314416', 'district');
INSERT INTO `dd_district` VALUES (180, 178, '0317', '130903', '运河区', '116.843673', '38.283749', 'district');
INSERT INTO `dd_district` VALUES (181, 178, '0317', '130921', '沧县', '117.007478', '38.219856', 'district');
INSERT INTO `dd_district` VALUES (182, 178, '0317', '130922', '青县', '116.804305', '38.583021', 'district');
INSERT INTO `dd_district` VALUES (183, 178, '0317', '130923', '东光县', '116.537067', '37.888248', 'district');
INSERT INTO `dd_district` VALUES (184, 178, '0317', '130924', '海兴县', '117.497651', '38.143169', 'district');
INSERT INTO `dd_district` VALUES (185, 178, '0317', '130925', '盐山县', '117.230602', '38.058087', 'district');
INSERT INTO `dd_district` VALUES (186, 178, '0317', '130926', '肃宁县', '115.829758', '38.422801', 'district');
INSERT INTO `dd_district` VALUES (187, 178, '0317', '130927', '南皮县', '116.708347', '38.038421', 'district');
INSERT INTO `dd_district` VALUES (188, 178, '0317', '130928', '吴桥县', '116.391508', '37.627661', 'district');
INSERT INTO `dd_district` VALUES (189, 178, '0317', '130929', '献县', '116.122725', '38.190185', 'district');
INSERT INTO `dd_district` VALUES (190, 178, '0317', '130930', '孟村回族自治县', '117.104298', '38.053409', 'district');
INSERT INTO `dd_district` VALUES (191, 178, '0317', '130981', '泊头市', '116.578367', '38.083437', 'district');
INSERT INTO `dd_district` VALUES (192, 178, '0317', '130982', '任丘市', '116.082917', '38.683591', 'district');
INSERT INTO `dd_district` VALUES (193, 178, '0317', '130983', '黄骅市', '117.329949', '38.371402', 'district');
INSERT INTO `dd_district` VALUES (194, 178, '0317', '130984', '河间市', '116.099517', '38.446624', 'district');
INSERT INTO `dd_district` VALUES (195, 38, '0316', '131000', '廊坊市', '116.683752', '39.538047', 'city');
INSERT INTO `dd_district` VALUES (196, 195, '0316', '131002', '安次区', '116.694544', '39.502569', 'district');
INSERT INTO `dd_district` VALUES (197, 195, '0316', '131003', '广阳区', '116.71069', '39.522786', 'district');
INSERT INTO `dd_district` VALUES (198, 195, '0316', '131022', '固安县', '116.298657', '39.438214', 'district');
INSERT INTO `dd_district` VALUES (199, 195, '0316', '131023', '永清县', '116.50568', '39.330689', 'district');
INSERT INTO `dd_district` VALUES (200, 195, '0316', '131024', '香河县', '117.006093', '39.761424', 'district');
INSERT INTO `dd_district` VALUES (201, 195, '0316', '131025', '大城县', '116.653793', '38.705449', 'district');
INSERT INTO `dd_district` VALUES (202, 195, '0316', '131026', '文安县', '116.457898', '38.87292', 'district');
INSERT INTO `dd_district` VALUES (203, 195, '0316', '131028', '大厂回族自治县', '116.989574', '39.886547', 'district');
INSERT INTO `dd_district` VALUES (204, 195, '0316', '131081', '霸州市', '116.391484', '39.125744', 'district');
INSERT INTO `dd_district` VALUES (205, 195, '0316', '131082', '三河市', '117.078294', '39.982718', 'district');
INSERT INTO `dd_district` VALUES (206, 38, '0318', '131100', '衡水市', '115.670177', '37.73892', 'city');
INSERT INTO `dd_district` VALUES (207, 206, '0318', '131102', '桃城区', '115.67545', '37.735465', 'district');
INSERT INTO `dd_district` VALUES (208, 206, '0318', '131103', '冀州区', '115.579308', '37.550856', 'district');
INSERT INTO `dd_district` VALUES (209, 206, '0318', '131121', '枣强县', '115.724259', '37.513417', 'district');
INSERT INTO `dd_district` VALUES (210, 206, '0318', '131122', '武邑县', '115.887531', '37.801665', 'district');
INSERT INTO `dd_district` VALUES (211, 206, '0318', '131123', '武强县', '115.982461', '38.041368', 'district');
INSERT INTO `dd_district` VALUES (212, 206, '0318', '131124', '饶阳县', '115.725833', '38.235892', 'district');
INSERT INTO `dd_district` VALUES (213, 206, '0318', '131125', '安平县', '115.519278', '38.234501', 'district');
INSERT INTO `dd_district` VALUES (214, 206, '0318', '131126', '故城县', '115.965874', '37.347409', 'district');
INSERT INTO `dd_district` VALUES (215, 206, '0318', '131127', '景县', '116.270648', '37.69229', 'district');
INSERT INTO `dd_district` VALUES (216, 206, '0318', '131128', '阜城县', '116.175262', '37.862505', 'district');
INSERT INTO `dd_district` VALUES (217, 206, '0318', '131182', '深州市', '115.559574', '38.001535', 'district');
INSERT INTO `dd_district` VALUES (218, 1, '0', '140000', '山西省', '112.562678', '37.873499', 'province');
INSERT INTO `dd_district` VALUES (219, 218, '0351', '140100', '太原市', '112.548879', '37.87059', 'city');
INSERT INTO `dd_district` VALUES (220, 219, '0351', '140105', '小店区', '112.565659', '37.736525', 'district');
INSERT INTO `dd_district` VALUES (221, 219, '0351', '140106', '迎泽区', '112.5634', '37.863451', 'district');
INSERT INTO `dd_district` VALUES (222, 219, '0351', '140107', '杏花岭区', '112.570604', '37.893955', 'district');
INSERT INTO `dd_district` VALUES (223, 219, '0351', '140108', '尖草坪区', '112.486691', '37.940387', 'district');
INSERT INTO `dd_district` VALUES (224, 219, '0351', '140109', '万柏林区', '112.515937', '37.85958', 'district');
INSERT INTO `dd_district` VALUES (225, 219, '0351', '140110', '晋源区', '112.47794', '37.715193', 'district');
INSERT INTO `dd_district` VALUES (226, 219, '0351', '140121', '清徐县', '112.358667', '37.607443', 'district');
INSERT INTO `dd_district` VALUES (227, 219, '0351', '140122', '阳曲县', '112.672952', '38.058488', 'district');
INSERT INTO `dd_district` VALUES (228, 219, '0351', '140123', '娄烦县', '111.797083', '38.067932', 'district');
INSERT INTO `dd_district` VALUES (229, 219, '0351', '140181', '古交市', '112.175853', '37.907129', 'district');
INSERT INTO `dd_district` VALUES (230, 218, '0352', '140200', '大同市', '113.300129', '40.076763', 'city');
INSERT INTO `dd_district` VALUES (231, 230, '0352', '140202', '城区', '113.298026', '40.075666', 'district');
INSERT INTO `dd_district` VALUES (232, 230, '0352', '140203', '矿区', '113.177206', '40.036858', 'district');
INSERT INTO `dd_district` VALUES (233, 230, '0352', '140211', '南郊区', '113.149693', '40.005404', 'district');
INSERT INTO `dd_district` VALUES (234, 230, '0352', '140212', '新荣区', '113.140004', '40.255866', 'district');
INSERT INTO `dd_district` VALUES (235, 230, '0352', '140221', '阳高县', '113.748944', '40.361059', 'district');
INSERT INTO `dd_district` VALUES (236, 230, '0352', '140222', '天镇县', '114.090867', '40.420237', 'district');
INSERT INTO `dd_district` VALUES (237, 230, '0352', '140223', '广灵县', '114.282758', '39.760281', 'district');
INSERT INTO `dd_district` VALUES (238, 230, '0352', '140224', '灵丘县', '114.23435', '39.442406', 'district');
INSERT INTO `dd_district` VALUES (239, 230, '0352', '140225', '浑源县', '113.699475', '39.693406', 'district');
INSERT INTO `dd_district` VALUES (240, 230, '0352', '140226', '左云县', '112.703008', '40.013442', 'district');
INSERT INTO `dd_district` VALUES (241, 230, '0352', '140227', '大同县', '113.61244', '40.040294', 'district');
INSERT INTO `dd_district` VALUES (242, 218, '0353', '140300', '阳泉市', '113.580519', '37.856971', 'city');
INSERT INTO `dd_district` VALUES (243, 242, '0353', '140302', '城区', '113.600669', '37.847436', 'district');
INSERT INTO `dd_district` VALUES (244, 242, '0353', '140303', '矿区', '113.555279', '37.868494', 'district');
INSERT INTO `dd_district` VALUES (245, 242, '0353', '140311', '郊区', '113.594163', '37.944679', 'district');
INSERT INTO `dd_district` VALUES (246, 242, '0353', '140321', '平定县', '113.630107', '37.804988', 'district');
INSERT INTO `dd_district` VALUES (247, 242, '0353', '140322', '盂县', '113.41233', '38.085619', 'district');
INSERT INTO `dd_district` VALUES (248, 218, '0355', '140400', '长治市', '113.116404', '36.195409', 'city');
INSERT INTO `dd_district` VALUES (249, 248, '0355', '140402', '城区', '113.123088', '36.20353', 'district');
INSERT INTO `dd_district` VALUES (250, 248, '0355', '140411', '郊区', '113.101211', '36.218388', 'district');
INSERT INTO `dd_district` VALUES (251, 248, '0355', '140421', '长治县', '113.051407', '36.052858', 'district');
INSERT INTO `dd_district` VALUES (252, 248, '0355', '140423', '襄垣县', '113.051491', '36.535817', 'district');
INSERT INTO `dd_district` VALUES (253, 248, '0355', '140424', '屯留县', '112.891998', '36.315663', 'district');
INSERT INTO `dd_district` VALUES (254, 248, '0355', '140425', '平顺县', '113.435961', '36.200179', 'district');
INSERT INTO `dd_district` VALUES (255, 248, '0355', '140426', '黎城县', '113.387155', '36.502328', 'district');
INSERT INTO `dd_district` VALUES (256, 248, '0355', '140427', '壶关县', '113.207049', '36.115448', 'district');
INSERT INTO `dd_district` VALUES (257, 248, '0355', '140428', '长子县', '112.8779', '36.122334', 'district');
INSERT INTO `dd_district` VALUES (258, 248, '0355', '140429', '武乡县', '112.864561', '36.837625', 'district');
INSERT INTO `dd_district` VALUES (259, 248, '0355', '140430', '沁县', '112.699226', '36.756063', 'district');
INSERT INTO `dd_district` VALUES (260, 248, '0355', '140431', '沁源县', '112.337446', '36.5002', 'district');
INSERT INTO `dd_district` VALUES (261, 248, '0355', '140481', '潞城市', '113.228852', '36.334104', 'district');
INSERT INTO `dd_district` VALUES (262, 218, '0356', '140500', '晋城市', '112.851486', '35.490684', 'city');
INSERT INTO `dd_district` VALUES (263, 262, '0356', '140502', '城区', '112.853555', '35.501571', 'district');
INSERT INTO `dd_district` VALUES (264, 262, '0356', '140521', '沁水县', '112.186738', '35.690141', 'district');
INSERT INTO `dd_district` VALUES (265, 262, '0356', '140522', '阳城县', '112.414738', '35.486029', 'district');
INSERT INTO `dd_district` VALUES (266, 262, '0356', '140524', '陵川县', '113.280688', '35.775685', 'district');
INSERT INTO `dd_district` VALUES (267, 262, '0356', '140525', '泽州县', '112.899137', '35.617221', 'district');
INSERT INTO `dd_district` VALUES (268, 262, '0356', '140581', '高平市', '112.92392', '35.797997', 'district');
INSERT INTO `dd_district` VALUES (269, 218, '0349', '140600', '朔州市', '112.432991', '39.331855', 'city');
INSERT INTO `dd_district` VALUES (270, 269, '0349', '140602', '朔城区', '112.432312', '39.319519', 'district');
INSERT INTO `dd_district` VALUES (271, 269, '0349', '140603', '平鲁区', '112.28833', '39.512155', 'district');
INSERT INTO `dd_district` VALUES (272, 269, '0349', '140621', '山阴县', '112.816413', '39.527893', 'district');
INSERT INTO `dd_district` VALUES (273, 269, '0349', '140622', '应县', '113.191098', '39.554247', 'district');
INSERT INTO `dd_district` VALUES (274, 269, '0349', '140623', '右玉县', '112.466989', '39.989063', 'district');
INSERT INTO `dd_district` VALUES (275, 269, '0349', '140624', '怀仁县', '113.131717', '39.821627', 'district');
INSERT INTO `dd_district` VALUES (276, 218, '0354', '140700', '晋中市', '112.752652', '37.687357', 'city');
INSERT INTO `dd_district` VALUES (277, 276, '0354', '140702', '榆次区', '112.708224', '37.697794', 'district');
INSERT INTO `dd_district` VALUES (278, 276, '0354', '140721', '榆社县', '112.975209', '37.070916', 'district');
INSERT INTO `dd_district` VALUES (279, 276, '0354', '140722', '左权县', '113.379403', '37.082943', 'district');
INSERT INTO `dd_district` VALUES (280, 276, '0354', '140723', '和顺县', '113.570415', '37.32957', 'district');
INSERT INTO `dd_district` VALUES (281, 276, '0354', '140724', '昔阳县', '113.706977', '37.61253', 'district');
INSERT INTO `dd_district` VALUES (282, 276, '0354', '140725', '寿阳县', '113.176373', '37.895191', 'district');
INSERT INTO `dd_district` VALUES (283, 276, '0354', '140726', '太谷县', '112.551305', '37.421307', 'district');
INSERT INTO `dd_district` VALUES (284, 276, '0354', '140727', '祁县', '112.335542', '37.357869', 'district');
INSERT INTO `dd_district` VALUES (285, 276, '0354', '140728', '平遥县', '112.176136', '37.189421', 'district');
INSERT INTO `dd_district` VALUES (286, 276, '0354', '140729', '灵石县', '111.77864', '36.847927', 'district');
INSERT INTO `dd_district` VALUES (287, 276, '0354', '140781', '介休市', '111.916711', '37.026944', 'district');
INSERT INTO `dd_district` VALUES (288, 218, '0359', '140800', '运城市', '111.00746', '35.026516', 'city');
INSERT INTO `dd_district` VALUES (289, 288, '0359', '140802', '盐湖区', '110.998272', '35.015101', 'district');
INSERT INTO `dd_district` VALUES (290, 288, '0359', '140821', '临猗县', '110.774547', '35.144277', 'district');
INSERT INTO `dd_district` VALUES (291, 288, '0359', '140822', '万荣县', '110.838024', '35.415253', 'district');
INSERT INTO `dd_district` VALUES (292, 288, '0359', '140823', '闻喜县', '111.22472', '35.356644', 'district');
INSERT INTO `dd_district` VALUES (293, 288, '0359', '140824', '稷山县', '110.983333', '35.604025', 'district');
INSERT INTO `dd_district` VALUES (294, 288, '0359', '140825', '新绛县', '111.224734', '35.616251', 'district');
INSERT INTO `dd_district` VALUES (295, 288, '0359', '140826', '绛县', '111.568236', '35.49119', 'district');
INSERT INTO `dd_district` VALUES (296, 288, '0359', '140827', '垣曲县', '111.670108', '35.297369', 'district');
INSERT INTO `dd_district` VALUES (297, 288, '0359', '140828', '夏县', '111.220456', '35.141363', 'district');
INSERT INTO `dd_district` VALUES (298, 288, '0359', '140829', '平陆县', '111.194133', '34.82926', 'district');
INSERT INTO `dd_district` VALUES (299, 288, '0359', '140830', '芮城县', '110.694369', '34.693579', 'district');
INSERT INTO `dd_district` VALUES (300, 288, '0359', '140881', '永济市', '110.447543', '34.8671', 'district');
INSERT INTO `dd_district` VALUES (301, 288, '0359', '140882', '河津市', '110.712063', '35.596383', 'district');
INSERT INTO `dd_district` VALUES (302, 218, '0350', '140900', '忻州市', '112.734174', '38.416663', 'city');
INSERT INTO `dd_district` VALUES (303, 302, '0350', '140902', '忻府区', '112.746046', '38.404242', 'district');
INSERT INTO `dd_district` VALUES (304, 302, '0350', '140921', '定襄县', '112.957237', '38.473506', 'district');
INSERT INTO `dd_district` VALUES (305, 302, '0350', '140922', '五台县', '113.255309', '38.728315', 'district');
INSERT INTO `dd_district` VALUES (306, 302, '0350', '140923', '代县', '112.960282', '39.066917', 'district');
INSERT INTO `dd_district` VALUES (307, 302, '0350', '140924', '繁峙县', '113.265563', '39.188811', 'district');
INSERT INTO `dd_district` VALUES (308, 302, '0350', '140925', '宁武县', '112.304722', '39.001524', 'district');
INSERT INTO `dd_district` VALUES (309, 302, '0350', '140926', '静乐县', '111.939498', '38.359306', 'district');
INSERT INTO `dd_district` VALUES (310, 302, '0350', '140927', '神池县', '112.211296', '39.090552', 'district');
INSERT INTO `dd_district` VALUES (311, 302, '0350', '140928', '五寨县', '111.846904', '38.910726', 'district');
INSERT INTO `dd_district` VALUES (312, 302, '0350', '140929', '岢岚县', '111.57285', '38.70418', 'district');
INSERT INTO `dd_district` VALUES (313, 302, '0350', '140930', '河曲县', '111.138472', '39.384482', 'district');
INSERT INTO `dd_district` VALUES (314, 302, '0350', '140931', '保德县', '111.086564', '39.022487', 'district');
INSERT INTO `dd_district` VALUES (315, 302, '0350', '140932', '偏关县', '111.508831', '39.436306', 'district');
INSERT INTO `dd_district` VALUES (316, 302, '0350', '140981', '原平市', '112.711058', '38.731402', 'district');
INSERT INTO `dd_district` VALUES (317, 218, '0357', '141000', '临汾市', '111.518975', '36.088005', 'city');
INSERT INTO `dd_district` VALUES (318, 317, '0357', '141002', '尧都区', '111.579554', '36.07884', 'district');
INSERT INTO `dd_district` VALUES (319, 317, '0357', '141021', '曲沃县', '111.47586', '35.641086', 'district');
INSERT INTO `dd_district` VALUES (320, 317, '0357', '141022', '翼城县', '111.718951', '35.738576', 'district');
INSERT INTO `dd_district` VALUES (321, 317, '0357', '141023', '襄汾县', '111.441725', '35.876293', 'district');
INSERT INTO `dd_district` VALUES (322, 317, '0357', '141024', '洪洞县', '111.674965', '36.253747', 'district');
INSERT INTO `dd_district` VALUES (323, 317, '0357', '141025', '古县', '111.920465', '36.266914', 'district');
INSERT INTO `dd_district` VALUES (324, 317, '0357', '141026', '安泽县', '112.250144', '36.147787', 'district');
INSERT INTO `dd_district` VALUES (325, 317, '0357', '141027', '浮山县', '111.848883', '35.968124', 'district');
INSERT INTO `dd_district` VALUES (326, 317, '0357', '141028', '吉县', '110.681763', '36.098188', 'district');
INSERT INTO `dd_district` VALUES (327, 317, '0357', '141029', '乡宁县', '110.847021', '35.970389', 'district');
INSERT INTO `dd_district` VALUES (328, 317, '0357', '141030', '大宁县', '110.75291', '36.465102', 'district');
INSERT INTO `dd_district` VALUES (329, 317, '0357', '141031', '隰县', '110.940637', '36.69333', 'district');
INSERT INTO `dd_district` VALUES (330, 317, '0357', '141032', '永和县', '110.632006', '36.759507', 'district');
INSERT INTO `dd_district` VALUES (331, 317, '0357', '141033', '蒲县', '111.096439', '36.411826', 'district');
INSERT INTO `dd_district` VALUES (332, 317, '0357', '141034', '汾西县', '111.56395', '36.652854', 'district');
INSERT INTO `dd_district` VALUES (333, 317, '0357', '141081', '侯马市', '111.372002', '35.619105', 'district');
INSERT INTO `dd_district` VALUES (334, 317, '0357', '141082', '霍州市', '111.755398', '36.56893', 'district');
INSERT INTO `dd_district` VALUES (335, 218, '0358', '141100', '吕梁市', '111.144699', '37.519126', 'city');
INSERT INTO `dd_district` VALUES (336, 335, '0358', '141102', '离石区', '111.150695', '37.51786', 'district');
INSERT INTO `dd_district` VALUES (337, 335, '0358', '141121', '文水县', '112.028866', '37.438101', 'district');
INSERT INTO `dd_district` VALUES (338, 335, '0358', '141122', '交城县', '112.156064', '37.551963', 'district');
INSERT INTO `dd_district` VALUES (339, 335, '0358', '141123', '兴县', '111.127667', '38.462389', 'district');
INSERT INTO `dd_district` VALUES (340, 335, '0358', '141124', '临县', '110.992093', '37.950758', 'district');
INSERT INTO `dd_district` VALUES (341, 335, '0358', '141125', '柳林县', '110.889007', '37.429772', 'district');
INSERT INTO `dd_district` VALUES (342, 335, '0358', '141126', '石楼县', '110.834634', '36.99857', 'district');
INSERT INTO `dd_district` VALUES (343, 335, '0358', '141127', '岚县', '111.671917', '38.279299', 'district');
INSERT INTO `dd_district` VALUES (344, 335, '0358', '141128', '方山县', '111.244098', '37.894631', 'district');
INSERT INTO `dd_district` VALUES (345, 335, '0358', '141129', '中阳县', '111.179657', '37.357058', 'district');
INSERT INTO `dd_district` VALUES (346, 335, '0358', '141130', '交口县', '111.181151', '36.982186', 'district');
INSERT INTO `dd_district` VALUES (347, 335, '0358', '141181', '孝义市', '111.778818', '37.146294', 'district');
INSERT INTO `dd_district` VALUES (348, 335, '0358', '141182', '汾阳市', '111.770477', '37.261756', 'district');
INSERT INTO `dd_district` VALUES (349, 1, '0', '150000', '内蒙古自治区', '111.76629', '40.81739', 'province');
INSERT INTO `dd_district` VALUES (350, 349, '0471', '150100', '呼和浩特市', '111.749995', '40.842356', 'city');
INSERT INTO `dd_district` VALUES (351, 350, '0471', '150102', '新城区', '111.665544', '40.858289', 'district');
INSERT INTO `dd_district` VALUES (352, 350, '0471', '150103', '回民区', '111.623692', '40.808608', 'district');
INSERT INTO `dd_district` VALUES (353, 350, '0471', '150104', '玉泉区', '111.673881', '40.753655', 'district');
INSERT INTO `dd_district` VALUES (354, 350, '0471', '150105', '赛罕区', '111.701355', '40.792667', 'district');
INSERT INTO `dd_district` VALUES (355, 350, '0471', '150121', '土默特左旗', '111.163902', '40.729572', 'district');
INSERT INTO `dd_district` VALUES (356, 350, '0471', '150122', '托克托县', '111.194312', '40.277431', 'district');
INSERT INTO `dd_district` VALUES (357, 350, '0471', '150123', '和林格尔县', '111.821843', '40.378787', 'district');
INSERT INTO `dd_district` VALUES (358, 350, '0471', '150124', '清水河县', '111.647609', '39.921095', 'district');
INSERT INTO `dd_district` VALUES (359, 350, '0471', '150125', '武川县', '111.451303', '41.096471', 'district');
INSERT INTO `dd_district` VALUES (360, 349, '0472', '150200', '包头市', '109.953504', '40.621157', 'city');
INSERT INTO `dd_district` VALUES (361, 360, '0472', '150202', '东河区', '110.044106', '40.576319', 'district');
INSERT INTO `dd_district` VALUES (362, 360, '0472', '150203', '昆都仑区', '109.837707', '40.642578', 'district');
INSERT INTO `dd_district` VALUES (363, 360, '0472', '150204', '青山区', '109.901572', '40.643246', 'district');
INSERT INTO `dd_district` VALUES (364, 360, '0472', '150205', '石拐区', '110.060254', '40.681748', 'district');
INSERT INTO `dd_district` VALUES (365, 360, '0472', '150206', '白云鄂博矿区', '109.973803', '41.769511', 'district');
INSERT INTO `dd_district` VALUES (366, 360, '0472', '150207', '九原区', '109.967449', '40.610561', 'district');
INSERT INTO `dd_district` VALUES (367, 360, '0472', '150221', '土默特右旗', '110.524262', '40.569426', 'district');
INSERT INTO `dd_district` VALUES (368, 360, '0472', '150222', '固阳县', '110.060514', '41.034105', 'district');
INSERT INTO `dd_district` VALUES (369, 360, '0472', '150223', '达尔罕茂明安联合旗', '110.432626', '41.698992', 'district');
INSERT INTO `dd_district` VALUES (370, 349, '0473', '150300', '乌海市', '106.794216', '39.655248', 'city');
INSERT INTO `dd_district` VALUES (371, 370, '0473', '150302', '海勃湾区', '106.822778', '39.691156', 'district');
INSERT INTO `dd_district` VALUES (372, 370, '0473', '150303', '海南区', '106.891424', '39.441364', 'district');
INSERT INTO `dd_district` VALUES (373, 370, '0473', '150304', '乌达区', '106.726099', '39.505925', 'district');
INSERT INTO `dd_district` VALUES (374, 349, '0476', '150400', '赤峰市', '118.88694', '42.257843', 'city');
INSERT INTO `dd_district` VALUES (375, 374, '0476', '150402', '红山区', '118.953854', '42.296588', 'district');
INSERT INTO `dd_district` VALUES (376, 374, '0476', '150403', '元宝山区', '119.288611', '42.038902', 'district');
INSERT INTO `dd_district` VALUES (377, 374, '0476', '150404', '松山区', '118.916208', '42.299798', 'district');
INSERT INTO `dd_district` VALUES (378, 374, '0476', '150421', '阿鲁科尔沁旗', '120.0657', '43.872298', 'district');
INSERT INTO `dd_district` VALUES (379, 374, '0476', '150422', '巴林左旗', '119.362931', '43.960889', 'district');
INSERT INTO `dd_district` VALUES (380, 374, '0476', '150423', '巴林右旗', '118.66518', '43.534414', 'district');
INSERT INTO `dd_district` VALUES (381, 374, '0476', '150424', '林西县', '118.05545', '43.61812', 'district');
INSERT INTO `dd_district` VALUES (382, 374, '0476', '150425', '克什克腾旗', '117.545797', '43.264988', 'district');
INSERT INTO `dd_district` VALUES (383, 374, '0476', '150426', '翁牛特旗', '119.00658', '42.936188', 'district');
INSERT INTO `dd_district` VALUES (384, 374, '0476', '150428', '喀喇沁旗', '118.701937', '41.927363', 'district');
INSERT INTO `dd_district` VALUES (385, 374, '0476', '150429', '宁城县', '119.318876', '41.601375', 'district');
INSERT INTO `dd_district` VALUES (386, 374, '0476', '150430', '敖汉旗', '119.921603', '42.290781', 'district');
INSERT INTO `dd_district` VALUES (387, 349, '0475', '150500', '通辽市', '122.243444', '43.652889', 'city');
INSERT INTO `dd_district` VALUES (388, 387, '0475', '150502', '科尔沁区', '122.255671', '43.623078', 'district');
INSERT INTO `dd_district` VALUES (389, 387, '0475', '150521', '科尔沁左翼中旗', '123.312264', '44.126625', 'district');
INSERT INTO `dd_district` VALUES (390, 387, '0475', '150522', '科尔沁左翼后旗', '122.35677', '42.935105', 'district');
INSERT INTO `dd_district` VALUES (391, 387, '0475', '150523', '开鲁县', '121.319308', '43.601244', 'district');
INSERT INTO `dd_district` VALUES (392, 387, '0475', '150524', '库伦旗', '121.8107', '42.735656', 'district');
INSERT INTO `dd_district` VALUES (393, 387, '0475', '150525', '奈曼旗', '120.658282', '42.867226', 'district');
INSERT INTO `dd_district` VALUES (394, 387, '0475', '150526', '扎鲁特旗', '120.911676', '44.556389', 'district');
INSERT INTO `dd_district` VALUES (395, 387, '0475', '150581', '霍林郭勒市', '119.68187', '45.533962', 'district');
INSERT INTO `dd_district` VALUES (396, 349, '0477', '150600', '鄂尔多斯市', '109.781327', '39.608266', 'city');
INSERT INTO `dd_district` VALUES (397, 396, '0477', '150602', '东胜区', '109.963333', '39.822593', 'district');
INSERT INTO `dd_district` VALUES (398, 396, '0477', '150603', '康巴什区', '109.790076', '39.607472', 'district');
INSERT INTO `dd_district` VALUES (399, 396, '0477', '150621', '达拉特旗', '110.033833', '40.412438', 'district');
INSERT INTO `dd_district` VALUES (400, 396, '0477', '150622', '准格尔旗', '111.240171', '39.864361', 'district');
INSERT INTO `dd_district` VALUES (401, 396, '0477', '150623', '鄂托克前旗', '107.477514', '38.182362', 'district');
INSERT INTO `dd_district` VALUES (402, 396, '0477', '150624', '鄂托克旗', '107.97616', '39.08965', 'district');
INSERT INTO `dd_district` VALUES (403, 396, '0477', '150625', '杭锦旗', '108.736208', '39.833309', 'district');
INSERT INTO `dd_district` VALUES (404, 396, '0477', '150626', '乌审旗', '108.817607', '38.604136', 'district');
INSERT INTO `dd_district` VALUES (405, 396, '0477', '150627', '伊金霍洛旗', '109.74774', '39.564659', 'district');
INSERT INTO `dd_district` VALUES (406, 349, '0470', '150700', '呼伦贝尔市', '119.765558', '49.211576', 'city');
INSERT INTO `dd_district` VALUES (407, 406, '0470', '150702', '海拉尔区', '119.736176', '49.212188', 'district');
INSERT INTO `dd_district` VALUES (408, 406, '0470', '150703', '扎赉诺尔区', '117.670248', '49.510375', 'district');
INSERT INTO `dd_district` VALUES (409, 406, '0470', '150721', '阿荣旗', '123.459049', '48.126584', 'district');
INSERT INTO `dd_district` VALUES (410, 406, '0470', '150722', '莫力达瓦达斡尔族自治旗', '124.519023', '48.477728', 'district');
INSERT INTO `dd_district` VALUES (411, 406, '0470', '150723', '鄂伦春自治旗', '123.726201', '50.591842', 'district');
INSERT INTO `dd_district` VALUES (412, 406, '0470', '150724', '鄂温克族自治旗', '119.755239', '49.146592', 'district');
INSERT INTO `dd_district` VALUES (413, 406, '0470', '150725', '陈巴尔虎旗', '119.424026', '49.328916', 'district');
INSERT INTO `dd_district` VALUES (414, 406, '0470', '150726', '新巴尔虎左旗', '118.269819', '48.218241', 'district');
INSERT INTO `dd_district` VALUES (415, 406, '0470', '150727', '新巴尔虎右旗', '116.82369', '48.672101', 'district');
INSERT INTO `dd_district` VALUES (416, 406, '0470', '150781', '满洲里市', '117.378529', '49.597841', 'district');
INSERT INTO `dd_district` VALUES (417, 406, '0470', '150782', '牙克石市', '120.711775', '49.285629', 'district');
INSERT INTO `dd_district` VALUES (418, 406, '0470', '150783', '扎兰屯市', '122.737467', '48.013733', 'district');
INSERT INTO `dd_district` VALUES (419, 406, '0470', '150784', '额尔古纳市', '120.180506', '50.243102', 'district');
INSERT INTO `dd_district` VALUES (420, 406, '0470', '150785', '根河市', '121.520388', '50.780344', 'district');
INSERT INTO `dd_district` VALUES (421, 349, '0478', '150800', '巴彦淖尔市', '107.387657', '40.743213', 'city');
INSERT INTO `dd_district` VALUES (422, 421, '0478', '150802', '临河区', '107.363918', '40.751187', 'district');
INSERT INTO `dd_district` VALUES (423, 421, '0478', '150821', '五原县', '108.267561', '41.088421', 'district');
INSERT INTO `dd_district` VALUES (424, 421, '0478', '150822', '磴口县', '107.008248', '40.330523', 'district');
INSERT INTO `dd_district` VALUES (425, 421, '0478', '150823', '乌拉特前旗', '108.652114', '40.737018', 'district');
INSERT INTO `dd_district` VALUES (426, 421, '0478', '150824', '乌拉特中旗', '108.513645', '41.587732', 'district');
INSERT INTO `dd_district` VALUES (427, 421, '0478', '150825', '乌拉特后旗', '107.074621', '41.084282', 'district');
INSERT INTO `dd_district` VALUES (428, 421, '0478', '150826', '杭锦后旗', '107.151245', '40.88602', 'district');
INSERT INTO `dd_district` VALUES (429, 349, '0474', '150900', '乌兰察布市', '113.132584', '40.994785', 'city');
INSERT INTO `dd_district` VALUES (430, 429, '0474', '150902', '集宁区', '113.116453', '41.034134', 'district');
INSERT INTO `dd_district` VALUES (431, 429, '0474', '150921', '卓资县', '112.577528', '40.894691', 'district');
INSERT INTO `dd_district` VALUES (432, 429, '0474', '150922', '化德县', '114.010437', '41.90456', 'district');
INSERT INTO `dd_district` VALUES (433, 429, '0474', '150923', '商都县', '113.577816', '41.562113', 'district');
INSERT INTO `dd_district` VALUES (434, 429, '0474', '150924', '兴和县', '113.834173', '40.872301', 'district');
INSERT INTO `dd_district` VALUES (435, 429, '0474', '150925', '凉城县', '112.503971', '40.531555', 'district');
INSERT INTO `dd_district` VALUES (436, 429, '0474', '150926', '察哈尔右翼前旗', '113.214733', '40.785631', 'district');
INSERT INTO `dd_district` VALUES (437, 429, '0474', '150927', '察哈尔右翼中旗', '112.635577', '41.277462', 'district');
INSERT INTO `dd_district` VALUES (438, 429, '0474', '150928', '察哈尔右翼后旗', '113.191035', '41.436069', 'district');
INSERT INTO `dd_district` VALUES (439, 429, '0474', '150929', '四子王旗', '111.706617', '41.533462', 'district');
INSERT INTO `dd_district` VALUES (440, 429, '0474', '150981', '丰镇市', '113.109892', '40.436983', 'district');
INSERT INTO `dd_district` VALUES (441, 349, '0482', '152200', '兴安盟', '122.037657', '46.082462', 'city');
INSERT INTO `dd_district` VALUES (442, 441, '0482', '152201', '乌兰浩特市', '122.093123', '46.072731', 'district');
INSERT INTO `dd_district` VALUES (443, 441, '0482', '152202', '阿尔山市', '119.943575', '47.17744', 'district');
INSERT INTO `dd_district` VALUES (444, 441, '0482', '152221', '科尔沁右翼前旗', '121.952621', '46.079833', 'district');
INSERT INTO `dd_district` VALUES (445, 441, '0482', '152222', '科尔沁右翼中旗', '121.47653', '45.060837', 'district');
INSERT INTO `dd_district` VALUES (446, 441, '0482', '152223', '扎赉特旗', '122.899656', '46.723237', 'district');
INSERT INTO `dd_district` VALUES (447, 441, '0482', '152224', '突泉县', '121.593799', '45.38193', 'district');
INSERT INTO `dd_district` VALUES (448, 349, '0479', '152500', '锡林郭勒盟', '116.048222', '43.933454', 'city');
INSERT INTO `dd_district` VALUES (449, 448, '0479', '152501', '二连浩特市', '111.951002', '43.6437', 'district');
INSERT INTO `dd_district` VALUES (450, 448, '0479', '152502', '锡林浩特市', '116.086029', '43.933403', 'district');
INSERT INTO `dd_district` VALUES (451, 448, '0479', '152522', '阿巴嘎旗', '114.950248', '44.022995', 'district');
INSERT INTO `dd_district` VALUES (452, 448, '0479', '152523', '苏尼特左旗', '113.667248', '43.85988', 'district');
INSERT INTO `dd_district` VALUES (453, 448, '0479', '152524', '苏尼特右旗', '112.641783', '42.742892', 'district');
INSERT INTO `dd_district` VALUES (454, 448, '0479', '152525', '东乌珠穆沁旗', '116.974494', '45.498221', 'district');
INSERT INTO `dd_district` VALUES (455, 448, '0479', '152526', '西乌珠穆沁旗', '117.608911', '44.587882', 'district');
INSERT INTO `dd_district` VALUES (456, 448, '0479', '152527', '太仆寺旗', '115.282986', '41.877135', 'district');
INSERT INTO `dd_district` VALUES (457, 448, '0479', '152528', '镶黄旗', '113.847287', '42.232371', 'district');
INSERT INTO `dd_district` VALUES (458, 448, '0479', '152529', '正镶白旗', '115.029848', '42.28747', 'district');
INSERT INTO `dd_district` VALUES (459, 448, '0479', '152530', '正蓝旗', '115.99247', '42.241638', 'district');
INSERT INTO `dd_district` VALUES (460, 448, '0479', '152531', '多伦县', '116.485555', '42.203591', 'district');
INSERT INTO `dd_district` VALUES (461, 349, '0483', '152900', '阿拉善盟', '105.728957', '38.851921', 'city');
INSERT INTO `dd_district` VALUES (462, 461, '0483', '152921', '阿拉善左旗', '105.666275', '38.833389', 'district');
INSERT INTO `dd_district` VALUES (463, 461, '0483', '152922', '阿拉善右旗', '101.666917', '39.216185', 'district');
INSERT INTO `dd_district` VALUES (464, 461, '0483', '152923', '额济纳旗', '101.055731', '41.95455', 'district');
INSERT INTO `dd_district` VALUES (465, 1, '0', '210000', '辽宁省', '123.431382', '41.836175', 'province');
INSERT INTO `dd_district` VALUES (466, 465, '024', '210100', '沈阳市', '123.465035', '41.677284', 'city');
INSERT INTO `dd_district` VALUES (467, 466, '024', '210102', '和平区', '123.420368', '41.789833', 'district');
INSERT INTO `dd_district` VALUES (468, 466, '024', '210103', '沈河区', '123.458691', '41.796177', 'district');
INSERT INTO `dd_district` VALUES (469, 466, '024', '210104', '大东区', '123.469948', '41.805137', 'district');
INSERT INTO `dd_district` VALUES (470, 466, '024', '210105', '皇姑区', '123.442378', '41.824516', 'district');
INSERT INTO `dd_district` VALUES (471, 466, '024', '210106', '铁西区', '123.333968', '41.820807', 'district');
INSERT INTO `dd_district` VALUES (472, 466, '024', '210111', '苏家屯区', '123.344062', '41.664757', 'district');
INSERT INTO `dd_district` VALUES (473, 466, '024', '210112', '浑南区', '123.449714', '41.714914', 'district');
INSERT INTO `dd_district` VALUES (474, 466, '024', '210113', '沈北新区', '123.583196', '41.912487', 'district');
INSERT INTO `dd_district` VALUES (475, 466, '024', '210114', '于洪区', '123.308119', '41.793721', 'district');
INSERT INTO `dd_district` VALUES (476, 466, '024', '210115', '辽中区', '122.765409', '41.516826', 'district');
INSERT INTO `dd_district` VALUES (477, 466, '024', '210123', '康平县', '123.343699', '42.72793', 'district');
INSERT INTO `dd_district` VALUES (478, 466, '024', '210124', '法库县', '123.440294', '42.50108', 'district');
INSERT INTO `dd_district` VALUES (479, 466, '024', '210181', '新民市', '122.836723', '41.985186', 'district');
INSERT INTO `dd_district` VALUES (480, 465, '0411', '210200', '大连市', '121.614848', '38.914086', 'city');
INSERT INTO `dd_district` VALUES (481, 480, '0411', '210202', '中山区', '121.644926', '38.918574', 'district');
INSERT INTO `dd_district` VALUES (482, 480, '0411', '210203', '西岗区', '121.612324', '38.914687', 'district');
INSERT INTO `dd_district` VALUES (483, 480, '0411', '210204', '沙河口区', '121.594297', '38.904788', 'district');
INSERT INTO `dd_district` VALUES (484, 480, '0411', '210211', '甘井子区', '121.525466', '38.953343', 'district');
INSERT INTO `dd_district` VALUES (485, 480, '0411', '210212', '旅顺口区', '121.261953', '38.851705', 'district');
INSERT INTO `dd_district` VALUES (486, 480, '0411', '210213', '金州区', '121.782655', '39.050001', 'district');
INSERT INTO `dd_district` VALUES (487, 480, '0411', '210214', '普兰店区', '121.938269', '39.392095', 'district');
INSERT INTO `dd_district` VALUES (488, 480, '0411', '210224', '长海县', '122.588494', '39.272728', 'district');
INSERT INTO `dd_district` VALUES (489, 480, '0411', '210281', '瓦房店市', '121.979543', '39.626897', 'district');
INSERT INTO `dd_district` VALUES (490, 480, '0411', '210283', '庄河市', '122.967424', '39.680843', 'district');
INSERT INTO `dd_district` VALUES (491, 465, '0412', '210300', '鞍山市', '122.994329', '41.108647', 'city');
INSERT INTO `dd_district` VALUES (492, 491, '0412', '210302', '铁东区', '122.991052', '41.089933', 'district');
INSERT INTO `dd_district` VALUES (493, 491, '0412', '210303', '铁西区', '122.969629', '41.119884', 'district');
INSERT INTO `dd_district` VALUES (494, 491, '0412', '210304', '立山区', '123.029091', '41.150401', 'district');
INSERT INTO `dd_district` VALUES (495, 491, '0412', '210311', '千山区', '122.944751', '41.068901', 'district');
INSERT INTO `dd_district` VALUES (496, 491, '0412', '210321', '台安县', '122.436196', '41.412767', 'district');
INSERT INTO `dd_district` VALUES (497, 491, '0412', '210323', '岫岩满族自治县', '123.280935', '40.29088', 'district');
INSERT INTO `dd_district` VALUES (498, 491, '0412', '210381', '海城市', '122.685217', '40.882377', 'district');
INSERT INTO `dd_district` VALUES (499, 465, '0413', '210400', '抚顺市', '123.957208', '41.880872', 'city');
INSERT INTO `dd_district` VALUES (500, 499, '0413', '210402', '新抚区', '123.912872', '41.862026', 'district');
INSERT INTO `dd_district` VALUES (501, 499, '0413', '210403', '东洲区', '124.038685', '41.853191', 'district');
INSERT INTO `dd_district` VALUES (502, 499, '0413', '210404', '望花区', '123.784225', '41.853641', 'district');
INSERT INTO `dd_district` VALUES (503, 499, '0413', '210411', '顺城区', '123.945075', '41.883235', 'district');
INSERT INTO `dd_district` VALUES (504, 499, '0413', '210421', '抚顺县', '124.097978', '41.922644', 'district');
INSERT INTO `dd_district` VALUES (505, 499, '0413', '210422', '新宾满族自治县', '125.039978', '41.734256', 'district');
INSERT INTO `dd_district` VALUES (506, 499, '0413', '210423', '清原满族自治县', '124.924083', '42.100538', 'district');
INSERT INTO `dd_district` VALUES (507, 465, '0414', '210500', '本溪市', '123.685142', '41.486981', 'city');
INSERT INTO `dd_district` VALUES (508, 507, '0414', '210502', '平山区', '123.769088', '41.299587', 'district');
INSERT INTO `dd_district` VALUES (509, 507, '0414', '210503', '溪湖区', '123.767646', '41.329219', 'district');
INSERT INTO `dd_district` VALUES (510, 507, '0414', '210504', '明山区', '123.817214', '41.308719', 'district');
INSERT INTO `dd_district` VALUES (511, 507, '0414', '210505', '南芬区', '123.744802', '41.100445', 'district');
INSERT INTO `dd_district` VALUES (512, 507, '0414', '210521', '本溪满族自治县', '124.120635', '41.302009', 'district');
INSERT INTO `dd_district` VALUES (513, 507, '0414', '210522', '桓仁满族自治县', '125.361007', '41.267127', 'district');
INSERT INTO `dd_district` VALUES (514, 465, '0415', '210600', '丹东市', '124.35445', '40.000787', 'city');
INSERT INTO `dd_district` VALUES (515, 514, '0415', '210602', '元宝区', '124.395661', '40.136434', 'district');
INSERT INTO `dd_district` VALUES (516, 514, '0415', '210603', '振兴区', '124.383237', '40.129944', 'district');
INSERT INTO `dd_district` VALUES (517, 514, '0415', '210604', '振安区', '124.470034', '40.201553', 'district');
INSERT INTO `dd_district` VALUES (518, 514, '0415', '210624', '宽甸满族自治县', '124.783659', '40.731316', 'district');
INSERT INTO `dd_district` VALUES (519, 514, '0415', '210681', '东港市', '124.152705', '39.863008', 'district');
INSERT INTO `dd_district` VALUES (520, 514, '0415', '210682', '凤城市', '124.066919', '40.452297', 'district');
INSERT INTO `dd_district` VALUES (521, 465, '0416', '210700', '锦州市', '121.126846', '41.095685', 'city');
INSERT INTO `dd_district` VALUES (522, 521, '0416', '210702', '古塔区', '121.128279', '41.117245', 'district');
INSERT INTO `dd_district` VALUES (523, 521, '0416', '210703', '凌河区', '121.150877', '41.114989', 'district');
INSERT INTO `dd_district` VALUES (524, 521, '0416', '210711', '太和区', '121.103892', '41.109147', 'district');
INSERT INTO `dd_district` VALUES (525, 521, '0416', '210726', '黑山县', '122.126292', '41.653593', 'district');
INSERT INTO `dd_district` VALUES (526, 521, '0416', '210727', '义县', '121.23908', '41.533086', 'district');
INSERT INTO `dd_district` VALUES (527, 521, '0416', '210781', '凌海市', '121.35549', '41.160567', 'district');
INSERT INTO `dd_district` VALUES (528, 521, '0416', '210782', '北镇市', '121.777395', '41.58844', 'district');
INSERT INTO `dd_district` VALUES (529, 465, '0417', '210800', '营口市', '122.219458', '40.625364', 'city');
INSERT INTO `dd_district` VALUES (530, 529, '0417', '210802', '站前区', '122.259033', '40.672563', 'district');
INSERT INTO `dd_district` VALUES (531, 529, '0417', '210803', '西市区', '122.206419', '40.666213', 'district');
INSERT INTO `dd_district` VALUES (532, 529, '0417', '210804', '鲅鱼圈区', '122.121521', '40.226661', 'district');
INSERT INTO `dd_district` VALUES (533, 529, '0417', '210811', '老边区', '122.380087', '40.680191', 'district');
INSERT INTO `dd_district` VALUES (534, 529, '0417', '210881', '盖州市', '122.349012', '40.40074', 'district');
INSERT INTO `dd_district` VALUES (535, 529, '0417', '210882', '大石桥市', '122.509006', '40.644482', 'district');
INSERT INTO `dd_district` VALUES (536, 465, '0418', '210900', '阜新市', '121.670273', '42.021602', 'city');
INSERT INTO `dd_district` VALUES (537, 536, '0418', '210902', '海州区', '121.657638', '42.011162', 'district');
INSERT INTO `dd_district` VALUES (538, 536, '0418', '210903', '新邱区', '121.792535', '42.087632', 'district');
INSERT INTO `dd_district` VALUES (539, 536, '0418', '210904', '太平区', '121.678604', '42.010669', 'district');
INSERT INTO `dd_district` VALUES (540, 536, '0418', '210905', '清河门区', '121.416105', '41.7831', 'district');
INSERT INTO `dd_district` VALUES (541, 536, '0418', '210911', '细河区', '121.68054', '42.025494', 'district');
INSERT INTO `dd_district` VALUES (542, 536, '0418', '210921', '阜新蒙古族自治县', '121.757901', '42.065175', 'district');
INSERT INTO `dd_district` VALUES (543, 536, '0418', '210922', '彰武县', '122.538793', '42.386543', 'district');
INSERT INTO `dd_district` VALUES (544, 465, '0419', '211000', '辽阳市', '123.236974', '41.267794', 'city');
INSERT INTO `dd_district` VALUES (545, 544, '0419', '211002', '白塔区', '123.174325', '41.270347', 'district');
INSERT INTO `dd_district` VALUES (546, 544, '0419', '211003', '文圣区', '123.231408', '41.283754', 'district');
INSERT INTO `dd_district` VALUES (547, 544, '0419', '211004', '宏伟区', '123.196672', '41.217649', 'district');
INSERT INTO `dd_district` VALUES (548, 544, '0419', '211005', '弓长岭区', '123.419803', '41.151847', 'district');
INSERT INTO `dd_district` VALUES (549, 544, '0419', '211011', '太子河区', '123.18144', '41.295023', 'district');
INSERT INTO `dd_district` VALUES (550, 544, '0419', '211021', '辽阳县', '123.105694', '41.205329', 'district');
INSERT INTO `dd_district` VALUES (551, 544, '0419', '211081', '灯塔市', '123.339312', '41.426372', 'district');
INSERT INTO `dd_district` VALUES (552, 465, '0427', '211100', '盘锦市', '122.170584', '40.719847', 'city');
INSERT INTO `dd_district` VALUES (553, 552, '0427', '211102', '双台子区', '122.039787', '41.19965', 'district');
INSERT INTO `dd_district` VALUES (554, 552, '0427', '211103', '兴隆台区', '122.070769', '41.119898', 'district');
INSERT INTO `dd_district` VALUES (555, 552, '0427', '211104', '大洼区', '122.082574', '41.002279', 'district');
INSERT INTO `dd_district` VALUES (556, 552, '0427', '211122', '盘山县', '121.996411', '41.242639', 'district');
INSERT INTO `dd_district` VALUES (557, 465, '0410', '211200', '铁岭市', '123.726035', '42.223828', 'city');
INSERT INTO `dd_district` VALUES (558, 557, '0410', '211202', '银州区', '123.842305', '42.286129', 'district');
INSERT INTO `dd_district` VALUES (559, 557, '0410', '211204', '清河区', '124.159191', '42.546565', 'district');
INSERT INTO `dd_district` VALUES (560, 557, '0410', '211221', '铁岭县', '123.728933', '42.223395', 'district');
INSERT INTO `dd_district` VALUES (561, 557, '0410', '211223', '西丰县', '124.727392', '42.73803', 'district');
INSERT INTO `dd_district` VALUES (562, 557, '0410', '211224', '昌图县', '124.111099', '42.785791', 'district');
INSERT INTO `dd_district` VALUES (563, 557, '0410', '211281', '调兵山市', '123.567117', '42.467521', 'district');
INSERT INTO `dd_district` VALUES (564, 557, '0410', '211282', '开原市', '124.038268', '42.546307', 'district');
INSERT INTO `dd_district` VALUES (565, 465, '0421', '211300', '朝阳市', '120.450879', '41.573762', 'city');
INSERT INTO `dd_district` VALUES (566, 565, '0421', '211302', '双塔区', '120.453744', '41.565627', 'district');
INSERT INTO `dd_district` VALUES (567, 565, '0421', '211303', '龙城区', '120.413376', '41.576749', 'district');
INSERT INTO `dd_district` VALUES (568, 565, '0421', '211321', '朝阳县', '120.389754', '41.497825', 'district');
INSERT INTO `dd_district` VALUES (569, 565, '0421', '211322', '建平县', '119.64328', '41.403128', 'district');
INSERT INTO `dd_district` VALUES (570, 565, '0421', '211324', '喀喇沁左翼蒙古族自治县', '119.741223', '41.12815', 'district');
INSERT INTO `dd_district` VALUES (571, 565, '0421', '211381', '北票市', '120.77073', '41.800683', 'district');
INSERT INTO `dd_district` VALUES (572, 565, '0421', '211382', '凌源市', '119.401574', '41.245445', 'district');
INSERT INTO `dd_district` VALUES (573, 465, '0429', '211400', '葫芦岛市', '120.836939', '40.71104', 'city');
INSERT INTO `dd_district` VALUES (574, 573, '0429', '211402', '连山区', '120.869231', '40.774461', 'district');
INSERT INTO `dd_district` VALUES (575, 573, '0429', '211403', '龙港区', '120.893786', '40.735519', 'district');
INSERT INTO `dd_district` VALUES (576, 573, '0429', '211404', '南票区', '120.749727', '41.107107', 'district');
INSERT INTO `dd_district` VALUES (577, 573, '0429', '211421', '绥中县', '120.344311', '40.32558', 'district');
INSERT INTO `dd_district` VALUES (578, 573, '0429', '211422', '建昌县', '119.837124', '40.824367', 'district');
INSERT INTO `dd_district` VALUES (579, 573, '0429', '211481', '兴城市', '120.756479', '40.609731', 'district');
INSERT INTO `dd_district` VALUES (580, 1, '0', '220000', '吉林省', '125.32568', '43.897016', 'province');
INSERT INTO `dd_district` VALUES (581, 580, '0431', '220100', '长春市', '125.323513', '43.817251', 'city');
INSERT INTO `dd_district` VALUES (582, 581, '0431', '220102', '南关区', '125.350173', '43.863989', 'district');
INSERT INTO `dd_district` VALUES (583, 581, '0431', '220103', '宽城区', '125.326581', '43.943612', 'district');
INSERT INTO `dd_district` VALUES (584, 581, '0431', '220104', '朝阳区', '125.288254', '43.833762', 'district');
INSERT INTO `dd_district` VALUES (585, 581, '0431', '220105', '二道区', '125.374327', '43.865577', 'district');
INSERT INTO `dd_district` VALUES (586, 581, '0431', '220106', '绿园区', '125.256135', '43.880975', 'district');
INSERT INTO `dd_district` VALUES (587, 581, '0431', '220112', '双阳区', '125.664662', '43.525311', 'district');
INSERT INTO `dd_district` VALUES (588, 581, '0431', '220113', '九台区', '125.839573', '44.151742', 'district');
INSERT INTO `dd_district` VALUES (589, 581, '0431', '220122', '农安县', '125.184887', '44.432763', 'district');
INSERT INTO `dd_district` VALUES (590, 581, '0431', '220182', '榆树市', '126.533187', '44.840318', 'district');
INSERT INTO `dd_district` VALUES (591, 581, '0431', '220183', '德惠市', '125.728755', '44.522056', 'district');
INSERT INTO `dd_district` VALUES (592, 580, '0432', '220200', '吉林市', '126.549572', '43.837883', 'city');
INSERT INTO `dd_district` VALUES (593, 592, '0432', '220202', '昌邑区', '126.574709', '43.881818', 'district');
INSERT INTO `dd_district` VALUES (594, 592, '0432', '220203', '龙潭区', '126.562197', '43.910802', 'district');
INSERT INTO `dd_district` VALUES (595, 592, '0432', '220204', '船营区', '126.540966', '43.833445', 'district');
INSERT INTO `dd_district` VALUES (596, 592, '0432', '220211', '丰满区', '126.562274', '43.821601', 'district');
INSERT INTO `dd_district` VALUES (597, 592, '0432', '220221', '永吉县', '126.497741', '43.672582', 'district');
INSERT INTO `dd_district` VALUES (598, 592, '0432', '220281', '蛟河市', '127.344229', '43.724007', 'district');
INSERT INTO `dd_district` VALUES (599, 592, '0432', '220282', '桦甸市', '126.746309', '42.972096', 'district');
INSERT INTO `dd_district` VALUES (600, 592, '0432', '220283', '舒兰市', '126.965607', '44.406105', 'district');
INSERT INTO `dd_district` VALUES (601, 592, '0432', '220284', '磐石市', '126.060427', '42.946285', 'district');
INSERT INTO `dd_district` VALUES (602, 580, '0434', '220300', '四平市', '124.350398', '43.166419', 'city');
INSERT INTO `dd_district` VALUES (603, 602, '0434', '220302', '铁西区', '124.345722', '43.146155', 'district');
INSERT INTO `dd_district` VALUES (604, 602, '0434', '220303', '铁东区', '124.409591', '43.162105', 'district');
INSERT INTO `dd_district` VALUES (605, 602, '0434', '220322', '梨树县', '124.33539', '43.30706', 'district');
INSERT INTO `dd_district` VALUES (606, 602, '0434', '220323', '伊通满族自治县', '125.305393', '43.345754', 'district');
INSERT INTO `dd_district` VALUES (607, 602, '0434', '220381', '公主岭市', '124.822929', '43.504676', 'district');
INSERT INTO `dd_district` VALUES (608, 602, '0434', '220382', '双辽市', '123.502723', '43.518302', 'district');
INSERT INTO `dd_district` VALUES (609, 580, '0437', '220400', '辽源市', '125.14366', '42.887766', 'city');
INSERT INTO `dd_district` VALUES (610, 609, '0437', '220402', '龙山区', '125.136627', '42.90158', 'district');
INSERT INTO `dd_district` VALUES (611, 609, '0437', '220403', '西安区', '125.149281', '42.927324', 'district');
INSERT INTO `dd_district` VALUES (612, 609, '0437', '220421', '东丰县', '125.531021', '42.677371', 'district');
INSERT INTO `dd_district` VALUES (613, 609, '0437', '220422', '东辽县', '124.991424', '42.92625', 'district');
INSERT INTO `dd_district` VALUES (614, 580, '0435', '220500', '通化市', '125.939697', '41.728401', 'city');
INSERT INTO `dd_district` VALUES (615, 614, '0435', '220502', '东昌区', '125.927101', '41.702859', 'district');
INSERT INTO `dd_district` VALUES (616, 614, '0435', '220503', '二道江区', '126.042678', '41.774044', 'district');
INSERT INTO `dd_district` VALUES (617, 614, '0435', '220521', '通化县', '125.759259', '41.679808', 'district');
INSERT INTO `dd_district` VALUES (618, 614, '0435', '220523', '辉南县', '126.046783', '42.684921', 'district');
INSERT INTO `dd_district` VALUES (619, 614, '0435', '220524', '柳河县', '125.744735', '42.284605', 'district');
INSERT INTO `dd_district` VALUES (620, 614, '0435', '220581', '梅河口市', '125.710859', '42.539253', 'district');
INSERT INTO `dd_district` VALUES (621, 614, '0435', '220582', '集安市', '126.19403', '41.125307', 'district');
INSERT INTO `dd_district` VALUES (622, 580, '0439', '220600', '白山市', '126.41473', '41.943972', 'city');
INSERT INTO `dd_district` VALUES (623, 622, '0439', '220602', '浑江区', '126.416093', '41.945409', 'district');
INSERT INTO `dd_district` VALUES (624, 622, '0439', '220605', '江源区', '126.591178', '42.056747', 'district');
INSERT INTO `dd_district` VALUES (625, 622, '0439', '220621', '抚松县', '127.449763', '42.221207', 'district');
INSERT INTO `dd_district` VALUES (626, 622, '0439', '220622', '靖宇县', '126.813583', '42.388896', 'district');
INSERT INTO `dd_district` VALUES (627, 622, '0439', '220623', '长白朝鲜族自治县', '128.200789', '41.420018', 'district');
INSERT INTO `dd_district` VALUES (628, 622, '0439', '220681', '临江市', '126.918087', '41.811979', 'district');
INSERT INTO `dd_district` VALUES (629, 580, '0438', '220700', '松原市', '124.825042', '45.141548', 'city');
INSERT INTO `dd_district` VALUES (630, 629, '0438', '220702', '宁江区', '124.86562', '45.209915', 'district');
INSERT INTO `dd_district` VALUES (631, 629, '0438', '220721', '前郭尔罗斯蒙古族自治县', '124.823417', '45.118061', 'district');
INSERT INTO `dd_district` VALUES (632, 629, '0438', '220722', '长岭县', '123.967483', '44.275895', 'district');
INSERT INTO `dd_district` VALUES (633, 629, '0438', '220723', '乾安县', '124.041139', '45.003773', 'district');
INSERT INTO `dd_district` VALUES (634, 629, '0438', '220781', '扶余市', '126.049803', '44.9892', 'district');
INSERT INTO `dd_district` VALUES (635, 580, '0436', '220800', '白城市', '122.838714', '45.619884', 'city');
INSERT INTO `dd_district` VALUES (636, 635, '0436', '220802', '洮北区', '122.851029', '45.621716', 'district');
INSERT INTO `dd_district` VALUES (637, 635, '0436', '220821', '镇赉县', '123.199607', '45.84835', 'district');
INSERT INTO `dd_district` VALUES (638, 635, '0436', '220822', '通榆县', '123.088238', '44.81291', 'district');
INSERT INTO `dd_district` VALUES (639, 635, '0436', '220881', '洮南市', '122.798579', '45.356807', 'district');
INSERT INTO `dd_district` VALUES (640, 635, '0436', '220882', '大安市', '124.292626', '45.506996', 'district');
INSERT INTO `dd_district` VALUES (641, 580, '1433', '222400', '延边朝鲜族自治州', '129.471868', '42.909408', 'city');
INSERT INTO `dd_district` VALUES (642, 641, '1433', '222401', '延吉市', '129.508804', '42.89125', 'district');
INSERT INTO `dd_district` VALUES (643, 641, '1433', '222402', '图们市', '129.84371', '42.968044', 'district');
INSERT INTO `dd_district` VALUES (644, 641, '1433', '222403', '敦化市', '128.232131', '43.372642', 'district');
INSERT INTO `dd_district` VALUES (645, 641, '1433', '222404', '珲春市', '130.366036', '42.862821', 'district');
INSERT INTO `dd_district` VALUES (646, 641, '1433', '222405', '龙井市', '129.427066', '42.76631', 'district');
INSERT INTO `dd_district` VALUES (647, 641, '1433', '222406', '和龙市', '129.010106', '42.546675', 'district');
INSERT INTO `dd_district` VALUES (648, 641, '1433', '222424', '汪清县', '129.771607', '43.312522', 'district');
INSERT INTO `dd_district` VALUES (649, 641, '1433', '222426', '安图县', '128.899772', '43.11195', 'district');
INSERT INTO `dd_district` VALUES (650, 1, '0', '230000', '黑龙江省', '126.661665', '45.742366', 'province');
INSERT INTO `dd_district` VALUES (651, 650, '0451', '230100', '哈尔滨市', '126.534967', '45.803775', 'city');
INSERT INTO `dd_district` VALUES (652, 651, '0451', '230102', '道里区', '126.616973', '45.75577', 'district');
INSERT INTO `dd_district` VALUES (653, 651, '0451', '230103', '南岗区', '126.668784', '45.760174', 'district');
INSERT INTO `dd_district` VALUES (654, 651, '0451', '230104', '道外区', '126.64939', '45.792057', 'district');
INSERT INTO `dd_district` VALUES (655, 651, '0451', '230108', '平房区', '126.637611', '45.597911', 'district');
INSERT INTO `dd_district` VALUES (656, 651, '0451', '230109', '松北区', '126.516914', '45.794504', 'district');
INSERT INTO `dd_district` VALUES (657, 651, '0451', '230110', '香坊区', '126.662593', '45.707716', 'district');
INSERT INTO `dd_district` VALUES (658, 651, '0451', '230111', '呼兰区', '126.587905', '45.889457', 'district');
INSERT INTO `dd_district` VALUES (659, 651, '0451', '230112', '阿城区', '126.958098', '45.548669', 'district');
INSERT INTO `dd_district` VALUES (660, 651, '0451', '230113', '双城区', '126.312624', '45.383218', 'district');
INSERT INTO `dd_district` VALUES (661, 651, '0451', '230123', '依兰县', '129.567877', '46.325419', 'district');
INSERT INTO `dd_district` VALUES (662, 651, '0451', '230124', '方正县', '128.829536', '45.851694', 'district');
INSERT INTO `dd_district` VALUES (663, 651, '0451', '230125', '宾县', '127.466634', '45.745917', 'district');
INSERT INTO `dd_district` VALUES (664, 651, '0451', '230126', '巴彦县', '127.403781', '46.086549', 'district');
INSERT INTO `dd_district` VALUES (665, 651, '0451', '230127', '木兰县', '128.043466', '45.950582', 'district');
INSERT INTO `dd_district` VALUES (666, 651, '0451', '230128', '通河县', '128.746124', '45.990205', 'district');
INSERT INTO `dd_district` VALUES (667, 651, '0451', '230129', '延寿县', '128.331643', '45.451897', 'district');
INSERT INTO `dd_district` VALUES (668, 651, '0451', '230183', '尚志市', '128.009894', '45.209586', 'district');
INSERT INTO `dd_district` VALUES (669, 651, '0451', '230184', '五常市', '127.167618', '44.931991', 'district');
INSERT INTO `dd_district` VALUES (670, 650, '0452', '230200', '齐齐哈尔市', '123.918186', '47.354348', 'city');
INSERT INTO `dd_district` VALUES (671, 670, '0452', '230202', '龙沙区', '123.957531', '47.317308', 'district');
INSERT INTO `dd_district` VALUES (672, 670, '0452', '230203', '建华区', '123.955464', '47.354364', 'district');
INSERT INTO `dd_district` VALUES (673, 670, '0452', '230204', '铁锋区', '123.978293', '47.340517', 'district');
INSERT INTO `dd_district` VALUES (674, 670, '0452', '230205', '昂昂溪区', '123.8224', '47.15516', 'district');
INSERT INTO `dd_district` VALUES (675, 670, '0452', '230206', '富拉尔基区', '123.629189', '47.208843', 'district');
INSERT INTO `dd_district` VALUES (676, 670, '0452', '230207', '碾子山区', '122.887775', '47.516872', 'district');
INSERT INTO `dd_district` VALUES (677, 670, '0452', '230208', '梅里斯达斡尔族区', '123.75291', '47.309537', 'district');
INSERT INTO `dd_district` VALUES (678, 670, '0452', '230221', '龙江县', '123.205323', '47.338665', 'district');
INSERT INTO `dd_district` VALUES (679, 670, '0452', '230223', '依安县', '125.306278', '47.893548', 'district');
INSERT INTO `dd_district` VALUES (680, 670, '0452', '230224', '泰来县', '123.416631', '46.393694', 'district');
INSERT INTO `dd_district` VALUES (681, 670, '0452', '230225', '甘南县', '123.507429', '47.922405', 'district');
INSERT INTO `dd_district` VALUES (682, 670, '0452', '230227', '富裕县', '124.473793', '47.774347', 'district');
INSERT INTO `dd_district` VALUES (683, 670, '0452', '230229', '克山县', '125.875705', '48.037031', 'district');
INSERT INTO `dd_district` VALUES (684, 670, '0452', '230230', '克东县', '126.24872', '48.04206', 'district');
INSERT INTO `dd_district` VALUES (685, 670, '0452', '230231', '拜泉县', '126.100213', '47.595851', 'district');
INSERT INTO `dd_district` VALUES (686, 670, '0452', '230281', '讷河市', '124.88287', '48.466592', 'district');
INSERT INTO `dd_district` VALUES (687, 650, '0467', '230300', '鸡西市', '130.969333', '45.295075', 'city');
INSERT INTO `dd_district` VALUES (688, 687, '0467', '230302', '鸡冠区', '130.981185', '45.304355', 'district');
INSERT INTO `dd_district` VALUES (689, 687, '0467', '230303', '恒山区', '130.904963', '45.210668', 'district');
INSERT INTO `dd_district` VALUES (690, 687, '0467', '230304', '滴道区', '130.843613', '45.348763', 'district');
INSERT INTO `dd_district` VALUES (691, 687, '0467', '230305', '梨树区', '130.69699', '45.092046', 'district');
INSERT INTO `dd_district` VALUES (692, 687, '0467', '230306', '城子河区', '131.011304', '45.33697', 'district');
INSERT INTO `dd_district` VALUES (693, 687, '0467', '230307', '麻山区', '130.478187', '45.212088', 'district');
INSERT INTO `dd_district` VALUES (694, 687, '0467', '230321', '鸡东县', '131.124079', '45.260412', 'district');
INSERT INTO `dd_district` VALUES (695, 687, '0467', '230381', '虎林市', '132.93721', '45.762685', 'district');
INSERT INTO `dd_district` VALUES (696, 687, '0467', '230382', '密山市', '131.846635', '45.529774', 'district');
INSERT INTO `dd_district` VALUES (697, 650, '0468', '230400', '鹤岗市', '130.297943', '47.350189', 'city');
INSERT INTO `dd_district` VALUES (698, 697, '0468', '230402', '向阳区', '130.294235', '47.342468', 'district');
INSERT INTO `dd_district` VALUES (699, 697, '0468', '230403', '工农区', '130.274684', '47.31878', 'district');
INSERT INTO `dd_district` VALUES (700, 697, '0468', '230404', '南山区', '130.286788', '47.315174', 'district');
INSERT INTO `dd_district` VALUES (701, 697, '0468', '230405', '兴安区', '130.239245', '47.252849', 'district');
INSERT INTO `dd_district` VALUES (702, 697, '0468', '230406', '东山区', '130.317002', '47.338537', 'district');
INSERT INTO `dd_district` VALUES (703, 697, '0468', '230407', '兴山区', '130.303481', '47.357702', 'district');
INSERT INTO `dd_district` VALUES (704, 697, '0468', '230421', '萝北县', '130.85155', '47.576444', 'district');
INSERT INTO `dd_district` VALUES (705, 697, '0468', '230422', '绥滨县', '131.852759', '47.289115', 'district');
INSERT INTO `dd_district` VALUES (706, 650, '0469', '230500', '双鸭山市', '131.141195', '46.676418', 'city');
INSERT INTO `dd_district` VALUES (707, 706, '0469', '230502', '尖山区', '131.158415', '46.64635', 'district');
INSERT INTO `dd_district` VALUES (708, 706, '0469', '230503', '岭东区', '131.164723', '46.592721', 'district');
INSERT INTO `dd_district` VALUES (709, 706, '0469', '230505', '四方台区', '131.337592', '46.597264', 'district');
INSERT INTO `dd_district` VALUES (710, 706, '0469', '230506', '宝山区', '131.401589', '46.577167', 'district');
INSERT INTO `dd_district` VALUES (711, 706, '0469', '230521', '集贤县', '131.141311', '46.728412', 'district');
INSERT INTO `dd_district` VALUES (712, 706, '0469', '230522', '友谊县', '131.808063', '46.767299', 'district');
INSERT INTO `dd_district` VALUES (713, 706, '0469', '230523', '宝清县', '132.196853', '46.327457', 'district');
INSERT INTO `dd_district` VALUES (714, 706, '0469', '230524', '饶河县', '134.013872', '46.798163', 'district');
INSERT INTO `dd_district` VALUES (715, 650, '0459', '230600', '大庆市', '125.103784', '46.589309', 'city');
INSERT INTO `dd_district` VALUES (716, 715, '0459', '230602', '萨尔图区', '125.135591', '46.629092', 'district');
INSERT INTO `dd_district` VALUES (717, 715, '0459', '230603', '龙凤区', '125.135326', '46.562247', 'district');
INSERT INTO `dd_district` VALUES (718, 715, '0459', '230604', '让胡路区', '124.870596', '46.652357', 'district');
INSERT INTO `dd_district` VALUES (719, 715, '0459', '230605', '红岗区', '124.891039', '46.398418', 'district');
INSERT INTO `dd_district` VALUES (720, 715, '0459', '230606', '大同区', '124.812364', '46.039827', 'district');
INSERT INTO `dd_district` VALUES (721, 715, '0459', '230621', '肇州县', '125.268643', '45.699066', 'district');
INSERT INTO `dd_district` VALUES (722, 715, '0459', '230622', '肇源县', '125.078223', '45.51932', 'district');
INSERT INTO `dd_district` VALUES (723, 715, '0459', '230623', '林甸县', '124.863603', '47.171717', 'district');
INSERT INTO `dd_district` VALUES (724, 715, '0459', '230624', '杜尔伯特蒙古族自治县', '124.442572', '46.862817', 'district');
INSERT INTO `dd_district` VALUES (725, 650, '0458', '230700', '伊春市', '128.841125', '47.727535', 'city');
INSERT INTO `dd_district` VALUES (726, 725, '0458', '230702', '伊春区', '128.907257', '47.728237', 'district');
INSERT INTO `dd_district` VALUES (727, 725, '0458', '230703', '南岔区', '129.283467', '47.138034', 'district');
INSERT INTO `dd_district` VALUES (728, 725, '0458', '230704', '友好区', '128.836291', '47.841032', 'district');
INSERT INTO `dd_district` VALUES (729, 725, '0458', '230705', '西林区', '129.312851', '47.480735', 'district');
INSERT INTO `dd_district` VALUES (730, 725, '0458', '230706', '翠峦区', '128.669754', '47.726394', 'district');
INSERT INTO `dd_district` VALUES (731, 725, '0458', '230707', '新青区', '129.533599', '48.290455', 'district');
INSERT INTO `dd_district` VALUES (732, 725, '0458', '230708', '美溪区', '129.129314', '47.63509', 'district');
INSERT INTO `dd_district` VALUES (733, 725, '0458', '230709', '金山屯区', '129.429117', '47.413074', 'district');
INSERT INTO `dd_district` VALUES (734, 725, '0458', '230710', '五营区', '129.245343', '48.10791', 'district');
INSERT INTO `dd_district` VALUES (735, 725, '0458', '230711', '乌马河区', '128.799477', '47.727687', 'district');
INSERT INTO `dd_district` VALUES (736, 725, '0458', '230712', '汤旺河区', '129.571108', '48.454651', 'district');
INSERT INTO `dd_district` VALUES (737, 725, '0458', '230713', '带岭区', '129.020888', '47.028379', 'district');
INSERT INTO `dd_district` VALUES (738, 725, '0458', '230714', '乌伊岭区', '129.43792', '48.590322', 'district');
INSERT INTO `dd_district` VALUES (739, 725, '0458', '230715', '红星区', '129.390983', '48.239431', 'district');
INSERT INTO `dd_district` VALUES (740, 725, '0458', '230716', '上甘岭区', '129.02426', '47.974707', 'district');
INSERT INTO `dd_district` VALUES (741, 725, '0458', '230722', '嘉荫县', '130.403134', '48.888972', 'district');
INSERT INTO `dd_district` VALUES (742, 725, '0458', '230781', '铁力市', '128.032424', '46.986633', 'district');
INSERT INTO `dd_district` VALUES (743, 650, '0454', '230800', '佳木斯市', '130.318878', '46.799777', 'city');
INSERT INTO `dd_district` VALUES (744, 743, '0454', '230803', '向阳区', '130.365346', '46.80779', 'district');
INSERT INTO `dd_district` VALUES (745, 743, '0454', '230804', '前进区', '130.375062', '46.814102', 'district');
INSERT INTO `dd_district` VALUES (746, 743, '0454', '230805', '东风区', '130.403664', '46.822571', 'district');
INSERT INTO `dd_district` VALUES (747, 743, '0454', '230811', '郊区', '130.327194', '46.810085', 'district');
INSERT INTO `dd_district` VALUES (748, 743, '0454', '230822', '桦南县', '130.553343', '46.239184', 'district');
INSERT INTO `dd_district` VALUES (749, 743, '0454', '230826', '桦川县', '130.71908', '47.023001', 'district');
INSERT INTO `dd_district` VALUES (750, 743, '0454', '230828', '汤原县', '129.905072', '46.730706', 'district');
INSERT INTO `dd_district` VALUES (751, 743, '0454', '230881', '同江市', '132.510919', '47.642707', 'district');
INSERT INTO `dd_district` VALUES (752, 743, '0454', '230882', '富锦市', '132.037686', '47.250107', 'district');
INSERT INTO `dd_district` VALUES (753, 743, '0454', '230883', '抚远市', '134.307884', '48.364687', 'district');
INSERT INTO `dd_district` VALUES (754, 650, '0464', '230900', '七台河市', '131.003082', '45.771396', 'city');
INSERT INTO `dd_district` VALUES (755, 754, '0464', '230902', '新兴区', '130.932143', '45.81593', 'district');
INSERT INTO `dd_district` VALUES (756, 754, '0464', '230903', '桃山区', '131.020202', '45.765705', 'district');
INSERT INTO `dd_district` VALUES (757, 754, '0464', '230904', '茄子河区', '131.068075', '45.785215', 'district');
INSERT INTO `dd_district` VALUES (758, 754, '0464', '230921', '勃利县', '130.59217', '45.755063', 'district');
INSERT INTO `dd_district` VALUES (759, 650, '0453', '231000', '牡丹江市', '129.633168', '44.551653', 'city');
INSERT INTO `dd_district` VALUES (760, 759, '0453', '231002', '东安区', '129.626641', '44.58136', 'district');
INSERT INTO `dd_district` VALUES (761, 759, '0453', '231003', '阳明区', '129.635615', '44.596104', 'district');
INSERT INTO `dd_district` VALUES (762, 759, '0453', '231004', '爱民区', '129.591537', '44.596042', 'district');
INSERT INTO `dd_district` VALUES (763, 759, '0453', '231005', '西安区', '129.616058', '44.577625', 'district');
INSERT INTO `dd_district` VALUES (764, 759, '0453', '231025', '林口县', '130.284033', '45.278046', 'district');
INSERT INTO `dd_district` VALUES (765, 759, '0453', '231081', '绥芬河市', '131.152545', '44.412308', 'district');
INSERT INTO `dd_district` VALUES (766, 759, '0453', '231083', '海林市', '129.380481', '44.594213', 'district');
INSERT INTO `dd_district` VALUES (767, 759, '0453', '231084', '宁安市', '129.482851', '44.34072', 'district');
INSERT INTO `dd_district` VALUES (768, 759, '0453', '231085', '穆棱市', '130.524436', '44.918813', 'district');
INSERT INTO `dd_district` VALUES (769, 759, '0453', '231086', '东宁市', '131.122915', '44.087585', 'district');
INSERT INTO `dd_district` VALUES (770, 650, '0456', '231100', '黑河市', '127.528293', '50.245129', 'city');
INSERT INTO `dd_district` VALUES (771, 770, '0456', '231102', '爱辉区', '127.50045', '50.252105', 'district');
INSERT INTO `dd_district` VALUES (772, 770, '0456', '231121', '嫩江县', '125.221192', '49.185766', 'district');
INSERT INTO `dd_district` VALUES (773, 770, '0456', '231123', '逊克县', '128.478749', '49.564252', 'district');
INSERT INTO `dd_district` VALUES (774, 770, '0456', '231124', '孙吴县', '127.336303', '49.425647', 'district');
INSERT INTO `dd_district` VALUES (775, 770, '0456', '231181', '北安市', '126.490864', '48.241365', 'district');
INSERT INTO `dd_district` VALUES (776, 770, '0456', '231182', '五大连池市', '126.205516', '48.517257', 'district');
INSERT INTO `dd_district` VALUES (777, 650, '0455', '231200', '绥化市', '126.968887', '46.653845', 'city');
INSERT INTO `dd_district` VALUES (778, 777, '0455', '231202', '北林区', '126.985504', '46.6375', 'district');
INSERT INTO `dd_district` VALUES (779, 777, '0455', '231221', '望奎县', '126.486075', '46.832719', 'district');
INSERT INTO `dd_district` VALUES (780, 777, '0455', '231222', '兰西县', '126.288117', '46.25245', 'district');
INSERT INTO `dd_district` VALUES (781, 777, '0455', '231223', '青冈县', '126.099195', '46.70391', 'district');
INSERT INTO `dd_district` VALUES (782, 777, '0455', '231224', '庆安县', '127.507824', '46.880102', 'district');
INSERT INTO `dd_district` VALUES (783, 777, '0455', '231225', '明水县', '125.906301', '47.173426', 'district');
INSERT INTO `dd_district` VALUES (784, 777, '0455', '231226', '绥棱县', '127.114832', '47.236015', 'district');
INSERT INTO `dd_district` VALUES (785, 777, '0455', '231281', '安达市', '125.346156', '46.419633', 'district');
INSERT INTO `dd_district` VALUES (786, 777, '0455', '231282', '肇东市', '125.961814', '46.051126', 'district');
INSERT INTO `dd_district` VALUES (787, 777, '0455', '231283', '海伦市', '126.930106', '47.45117', 'district');
INSERT INTO `dd_district` VALUES (788, 650, '0457', '232700', '大兴安岭地区', '124.711526', '52.335262', 'city');
INSERT INTO `dd_district` VALUES (789, 788, '0457', '232701', '加格达奇区', '124.139595', '50.408735', 'district');
INSERT INTO `dd_district` VALUES (790, 788, '0457', '232721', '呼玛县', '126.652396', '51.726091', 'district');
INSERT INTO `dd_district` VALUES (791, 788, '0457', '232722', '塔河县', '124.709996', '52.334456', 'district');
INSERT INTO `dd_district` VALUES (792, 788, '0457', '232723', '漠河县', '122.538591', '52.972272', 'district');
INSERT INTO `dd_district` VALUES (793, 1, '021', '310000', '上海市', '121.473662', '31.230372', 'province');
INSERT INTO `dd_district` VALUES (794, 793, '021', '310100', '上海市', '121.473662', '31.230372', 'city');
INSERT INTO `dd_district` VALUES (795, 794, '021', '310101', '黄浦区', '121.484428', '31.231739', 'district');
INSERT INTO `dd_district` VALUES (796, 794, '021', '310104', '徐汇区', '121.436128', '31.188464', 'district');
INSERT INTO `dd_district` VALUES (797, 794, '021', '310105', '长宁区', '121.424622', '31.220372', 'district');
INSERT INTO `dd_district` VALUES (798, 794, '021', '310106', '静安区', '121.447453', '31.227906', 'district');
INSERT INTO `dd_district` VALUES (799, 794, '021', '310107', '普陀区', '121.395514', '31.249603', 'district');
INSERT INTO `dd_district` VALUES (800, 794, '021', '310109', '虹口区', '121.505133', '31.2646', 'district');
INSERT INTO `dd_district` VALUES (801, 794, '021', '310110', '杨浦区', '121.525727', '31.259822', 'district');
INSERT INTO `dd_district` VALUES (802, 794, '021', '310112', '闵行区', '121.380831', '31.1129', 'district');
INSERT INTO `dd_district` VALUES (803, 794, '021', '310113', '宝山区', '121.489612', '31.405457', 'district');
INSERT INTO `dd_district` VALUES (804, 794, '021', '310114', '嘉定区', '121.265374', '31.375869', 'district');
INSERT INTO `dd_district` VALUES (805, 794, '021', '310115', '浦东新区', '121.544379', '31.221517', 'district');
INSERT INTO `dd_district` VALUES (806, 794, '021', '310116', '金山区', '121.342455', '30.741798', 'district');
INSERT INTO `dd_district` VALUES (807, 794, '021', '310117', '松江区', '121.227747', '31.032243', 'district');
INSERT INTO `dd_district` VALUES (808, 794, '021', '310118', '青浦区', '121.124178', '31.150681', 'district');
INSERT INTO `dd_district` VALUES (809, 794, '021', '310120', '奉贤区', '121.474055', '30.917766', 'district');
INSERT INTO `dd_district` VALUES (810, 794, '021', '310151', '崇明区', '121.397421', '31.623728', 'district');
INSERT INTO `dd_district` VALUES (811, 1, '0', '320000', '江苏省', '118.762765', '32.060875', 'province');
INSERT INTO `dd_district` VALUES (812, 811, '025', '320100', '南京市', '118.796682', '32.05957', 'city');
INSERT INTO `dd_district` VALUES (813, 812, '025', '320102', '玄武区', '118.797757', '32.048498', 'district');
INSERT INTO `dd_district` VALUES (814, 812, '025', '320104', '秦淮区', '118.79476', '32.039113', 'district');
INSERT INTO `dd_district` VALUES (815, 812, '025', '320105', '建邺区', '118.731793', '32.003731', 'district');
INSERT INTO `dd_district` VALUES (816, 812, '025', '320106', '鼓楼区', '118.770182', '32.066601', 'district');
INSERT INTO `dd_district` VALUES (817, 812, '025', '320111', '浦口区', '118.628003', '32.058903', 'district');
INSERT INTO `dd_district` VALUES (818, 812, '025', '320113', '栖霞区', '118.909153', '32.096388', 'district');
INSERT INTO `dd_district` VALUES (819, 812, '025', '320114', '雨花台区', '118.779051', '31.99126', 'district');
INSERT INTO `dd_district` VALUES (820, 812, '025', '320115', '江宁区', '118.840015', '31.952612', 'district');
INSERT INTO `dd_district` VALUES (821, 812, '025', '320116', '六合区', '118.822132', '32.323584', 'district');
INSERT INTO `dd_district` VALUES (822, 812, '025', '320117', '溧水区', '119.028288', '31.651099', 'district');
INSERT INTO `dd_district` VALUES (823, 812, '025', '320118', '高淳区', '118.89222', '31.327586', 'district');
INSERT INTO `dd_district` VALUES (824, 811, '0510', '320200', '无锡市', '120.31191', '31.491169', 'city');
INSERT INTO `dd_district` VALUES (825, 824, '0510', '320205', '锡山区', '120.357858', '31.589715', 'district');
INSERT INTO `dd_district` VALUES (826, 824, '0510', '320206', '惠山区', '120.298433', '31.680335', 'district');
INSERT INTO `dd_district` VALUES (827, 824, '0510', '320211', '滨湖区', '120.283811', '31.527276', 'district');
INSERT INTO `dd_district` VALUES (828, 824, '0510', '320213', '梁溪区', '120.303108', '31.566155', 'district');
INSERT INTO `dd_district` VALUES (829, 824, '0510', '320214', '新吴区', '120.352782', '31.550966', 'district');
INSERT INTO `dd_district` VALUES (830, 824, '0510', '320281', '江阴市', '120.286129', '31.921345', 'district');
INSERT INTO `dd_district` VALUES (831, 824, '0510', '320282', '宜兴市', '119.823308', '31.340637', 'district');
INSERT INTO `dd_district` VALUES (832, 811, '0516', '320300', '徐州市', '117.284124', '34.205768', 'city');
INSERT INTO `dd_district` VALUES (833, 832, '0516', '320302', '鼓楼区', '117.185576', '34.288646', 'district');
INSERT INTO `dd_district` VALUES (834, 832, '0516', '320303', '云龙区', '117.251076', '34.253164', 'district');
INSERT INTO `dd_district` VALUES (835, 832, '0516', '320305', '贾汪区', '117.464958', '34.436936', 'district');
INSERT INTO `dd_district` VALUES (836, 832, '0516', '320311', '泉山区', '117.194469', '34.225522', 'district');
INSERT INTO `dd_district` VALUES (837, 832, '0516', '320312', '铜山区', '117.169461', '34.180779', 'district');
INSERT INTO `dd_district` VALUES (838, 832, '0516', '320321', '丰县', '116.59539', '34.693906', 'district');
INSERT INTO `dd_district` VALUES (839, 832, '0516', '320322', '沛县', '116.936353', '34.760761', 'district');
INSERT INTO `dd_district` VALUES (840, 832, '0516', '320324', '睢宁县', '117.941563', '33.912597', 'district');
INSERT INTO `dd_district` VALUES (841, 832, '0516', '320381', '新沂市', '118.354537', '34.36958', 'district');
INSERT INTO `dd_district` VALUES (842, 832, '0516', '320382', '邳州市', '118.012531', '34.338888', 'district');
INSERT INTO `dd_district` VALUES (843, 811, '0519', '320400', '常州市', '119.974061', '31.811226', 'city');
INSERT INTO `dd_district` VALUES (844, 843, '0519', '320402', '天宁区', '119.999219', '31.792787', 'district');
INSERT INTO `dd_district` VALUES (845, 843, '0519', '320404', '钟楼区', '119.902369', '31.802089', 'district');
INSERT INTO `dd_district` VALUES (846, 843, '0519', '320411', '新北区', '119.971697', '31.830427', 'district');
INSERT INTO `dd_district` VALUES (847, 843, '0519', '320412', '武进区', '119.942437', '31.701187', 'district');
INSERT INTO `dd_district` VALUES (848, 843, '0519', '320413', '金坛区', '119.597811', '31.723219', 'district');
INSERT INTO `dd_district` VALUES (849, 843, '0519', '320481', '溧阳市', '119.48421', '31.416911', 'district');
INSERT INTO `dd_district` VALUES (850, 811, '0512', '320500', '苏州市', '120.585728', '31.2974', 'city');
INSERT INTO `dd_district` VALUES (851, 850, '0512', '320505', '虎丘区', '120.434238', '31.329601', 'district');
INSERT INTO `dd_district` VALUES (852, 850, '0512', '320506', '吴中区', '120.632308', '31.263183', 'district');
INSERT INTO `dd_district` VALUES (853, 850, '0512', '320507', '相城区', '120.642626', '31.369089', 'district');
INSERT INTO `dd_district` VALUES (854, 850, '0512', '320508', '姑苏区', '120.617369', '31.33565', 'district');
INSERT INTO `dd_district` VALUES (855, 850, '0512', '320509', '吴江区', '120.645157', '31.138677', 'district');
INSERT INTO `dd_district` VALUES (856, 850, '0512', '320581', '常熟市', '120.752481', '31.654375', 'district');
INSERT INTO `dd_district` VALUES (857, 850, '0512', '320582', '张家港市', '120.555982', '31.875571', 'district');
INSERT INTO `dd_district` VALUES (858, 850, '0512', '320583', '昆山市', '120.980736', '31.385597', 'district');
INSERT INTO `dd_district` VALUES (859, 850, '0512', '320585', '太仓市', '121.13055', '31.457735', 'district');
INSERT INTO `dd_district` VALUES (860, 811, '0513', '320600', '南通市', '120.894676', '31.981143', 'city');
INSERT INTO `dd_district` VALUES (861, 860, '0513', '320602', '崇川区', '120.857434', '32.009875', 'district');
INSERT INTO `dd_district` VALUES (862, 860, '0513', '320611', '港闸区', '120.818526', '32.032441', 'district');
INSERT INTO `dd_district` VALUES (863, 860, '0513', '320612', '通州区', '121.073828', '32.06568', 'district');
INSERT INTO `dd_district` VALUES (864, 860, '0513', '320621', '海安县', '120.467343', '32.533572', 'district');
INSERT INTO `dd_district` VALUES (865, 860, '0513', '320623', '如东县', '121.185201', '32.331765', 'district');
INSERT INTO `dd_district` VALUES (866, 860, '0513', '320681', '启东市', '121.655432', '31.793278', 'district');
INSERT INTO `dd_district` VALUES (867, 860, '0513', '320682', '如皋市', '120.573803', '32.371562', 'district');
INSERT INTO `dd_district` VALUES (868, 860, '0513', '320684', '海门市', '121.18181', '31.869483', 'district');
INSERT INTO `dd_district` VALUES (869, 811, '0518', '320700', '连云港市', '119.221611', '34.596653', 'city');
INSERT INTO `dd_district` VALUES (870, 869, '0518', '320703', '连云区', '119.338788', '34.760249', 'district');
INSERT INTO `dd_district` VALUES (871, 869, '0518', '320706', '海州区', '119.163509', '34.572274', 'district');
INSERT INTO `dd_district` VALUES (872, 869, '0518', '320707', '赣榆区', '119.17333', '34.841348', 'district');
INSERT INTO `dd_district` VALUES (873, 869, '0518', '320722', '东海县', '118.752842', '34.542308', 'district');
INSERT INTO `dd_district` VALUES (874, 869, '0518', '320723', '灌云县', '119.239381', '34.284381', 'district');
INSERT INTO `dd_district` VALUES (875, 869, '0518', '320724', '灌南县', '119.315651', '34.087134', 'district');
INSERT INTO `dd_district` VALUES (876, 811, '0517', '320800', '淮安市', '119.113185', '33.551052', 'city');
INSERT INTO `dd_district` VALUES (877, 876, '0517', '320802', '清江浦区', '119.026718', '33.552627', 'district');
INSERT INTO `dd_district` VALUES (878, 876, '0517', '320803', '淮安区', '119.141099', '33.502868', 'district');
INSERT INTO `dd_district` VALUES (879, 876, '0517', '320804', '淮阴区', '119.034725', '33.631892', 'district');
INSERT INTO `dd_district` VALUES (880, 876, '0517', '320813', '洪泽区', '118.873241', '33.294214', 'district');
INSERT INTO `dd_district` VALUES (881, 876, '0517', '320826', '涟水县', '119.260227', '33.781331', 'district');
INSERT INTO `dd_district` VALUES (882, 876, '0517', '320830', '盱眙县', '118.54436', '33.011971', 'district');
INSERT INTO `dd_district` VALUES (883, 876, '0517', '320831', '金湖县', '119.020584', '33.025433', 'district');
INSERT INTO `dd_district` VALUES (884, 811, '0515', '320900', '盐城市', '120.163107', '33.347708', 'city');
INSERT INTO `dd_district` VALUES (885, 884, '0515', '320902', '亭湖区', '120.197358', '33.390536', 'district');
INSERT INTO `dd_district` VALUES (886, 884, '0515', '320903', '盐都区', '120.153712', '33.338283', 'district');
INSERT INTO `dd_district` VALUES (887, 884, '0515', '320904', '大丰区', '120.50085', '33.200333', 'district');
INSERT INTO `dd_district` VALUES (888, 884, '0515', '320921', '响水县', '119.578364', '34.199479', 'district');
INSERT INTO `dd_district` VALUES (889, 884, '0515', '320922', '滨海县', '119.82083', '33.990334', 'district');
INSERT INTO `dd_district` VALUES (890, 884, '0515', '320923', '阜宁县', '119.802527', '33.759325', 'district');
INSERT INTO `dd_district` VALUES (891, 884, '0515', '320924', '射阳县', '120.229986', '33.758361', 'district');
INSERT INTO `dd_district` VALUES (892, 884, '0515', '320925', '建湖县', '119.7886', '33.439067', 'district');
INSERT INTO `dd_district` VALUES (893, 884, '0515', '320981', '东台市', '120.320328', '32.868426', 'district');
INSERT INTO `dd_district` VALUES (894, 811, '0514', '321000', '扬州市', '119.412939', '32.394209', 'city');
INSERT INTO `dd_district` VALUES (895, 894, '0514', '321002', '广陵区', '119.431849', '32.39472', 'district');
INSERT INTO `dd_district` VALUES (896, 894, '0514', '321003', '邗江区', '119.397994', '32.377655', 'district');
INSERT INTO `dd_district` VALUES (897, 894, '0514', '321012', '江都区', '119.569989', '32.434672', 'district');
INSERT INTO `dd_district` VALUES (898, 894, '0514', '321023', '宝应县', '119.360729', '33.240391', 'district');
INSERT INTO `dd_district` VALUES (899, 894, '0514', '321081', '仪征市', '119.184766', '32.272258', 'district');
INSERT INTO `dd_district` VALUES (900, 894, '0514', '321084', '高邮市', '119.459161', '32.781659', 'district');
INSERT INTO `dd_district` VALUES (901, 811, '0511', '321100', '镇江市', '119.425836', '32.187849', 'city');
INSERT INTO `dd_district` VALUES (902, 901, '0511', '321102', '京口区', '119.47016', '32.19828', 'district');
INSERT INTO `dd_district` VALUES (903, 901, '0511', '321111', '润州区', '119.411959', '32.195264', 'district');
INSERT INTO `dd_district` VALUES (904, 901, '0511', '321112', '丹徒区', '119.433853', '32.131962', 'district');
INSERT INTO `dd_district` VALUES (905, 901, '0511', '321181', '丹阳市', '119.606439', '32.010214', 'district');
INSERT INTO `dd_district` VALUES (906, 901, '0511', '321182', '扬中市', '119.797634', '32.23483', 'district');
INSERT INTO `dd_district` VALUES (907, 901, '0511', '321183', '句容市', '119.168695', '31.944998', 'district');
INSERT INTO `dd_district` VALUES (908, 811, '0523', '321200', '泰州市', '119.922933', '32.455536', 'city');
INSERT INTO `dd_district` VALUES (909, 908, '0523', '321202', '海陵区', '119.919424', '32.491016', 'district');
INSERT INTO `dd_district` VALUES (910, 908, '0523', '321203', '高港区', '119.881717', '32.318821', 'district');
INSERT INTO `dd_district` VALUES (911, 908, '0523', '321204', '姜堰区', '120.127934', '32.509155', 'district');
INSERT INTO `dd_district` VALUES (912, 908, '0523', '321281', '兴化市', '119.852541', '32.910459', 'district');
INSERT INTO `dd_district` VALUES (913, 908, '0523', '321282', '靖江市', '120.277138', '31.982751', 'district');
INSERT INTO `dd_district` VALUES (914, 908, '0523', '321283', '泰兴市', '120.051743', '32.171853', 'district');
INSERT INTO `dd_district` VALUES (915, 811, '0527', '321300', '宿迁市', '118.275198', '33.963232', 'city');
INSERT INTO `dd_district` VALUES (916, 915, '0527', '321302', '宿城区', '118.242533', '33.963029', 'district');
INSERT INTO `dd_district` VALUES (917, 915, '0527', '321311', '宿豫区', '118.330781', '33.946822', 'district');
INSERT INTO `dd_district` VALUES (918, 915, '0527', '321322', '沭阳县', '118.804784', '34.111022', 'district');
INSERT INTO `dd_district` VALUES (919, 915, '0527', '321323', '泗阳县', '118.703424', '33.722478', 'district');
INSERT INTO `dd_district` VALUES (920, 915, '0527', '321324', '泗洪县', '118.223591', '33.476051', 'district');
INSERT INTO `dd_district` VALUES (921, 1, '0', '330000', '浙江省', '120.152585', '30.266597', 'province');
INSERT INTO `dd_district` VALUES (922, 921, '0571', '330100', '杭州市', '120.209789', '30.24692', 'city');
INSERT INTO `dd_district` VALUES (923, 922, '0571', '330102', '上城区', '120.169312', '30.242404', 'district');
INSERT INTO `dd_district` VALUES (924, 922, '0571', '330103', '下城区', '120.180891', '30.281677', 'district');
INSERT INTO `dd_district` VALUES (925, 922, '0571', '330104', '江干区', '120.205001', '30.257012', 'district');
INSERT INTO `dd_district` VALUES (926, 922, '0571', '330105', '拱墅区', '120.141406', '30.319037', 'district');
INSERT INTO `dd_district` VALUES (927, 922, '0571', '330106', '西湖区', '120.130194', '30.259463', 'district');
INSERT INTO `dd_district` VALUES (928, 922, '0571', '330108', '滨江区', '120.211623', '30.208847', 'district');
INSERT INTO `dd_district` VALUES (929, 922, '0571', '330109', '萧山区', '120.264253', '30.183806', 'district');
INSERT INTO `dd_district` VALUES (930, 922, '0571', '330110', '余杭区', '120.299401', '30.419045', 'district');
INSERT INTO `dd_district` VALUES (931, 922, '0571', '330111', '富阳区', '119.960076', '30.048692', 'district');
INSERT INTO `dd_district` VALUES (932, 922, '0571', '330122', '桐庐县', '119.691467', '29.79299', 'district');
INSERT INTO `dd_district` VALUES (933, 922, '0571', '330127', '淳安县', '119.042037', '29.608886', 'district');
INSERT INTO `dd_district` VALUES (934, 922, '0571', '330182', '建德市', '119.281231', '29.474759', 'district');
INSERT INTO `dd_district` VALUES (935, 922, '0571', '330185', '临安市', '119.724734', '30.233873', 'district');
INSERT INTO `dd_district` VALUES (936, 921, '0574', '330200', '宁波市', '121.622485', '29.859971', 'city');
INSERT INTO `dd_district` VALUES (937, 936, '0574', '330203', '海曙区', '121.550752', '29.874903', 'district');
INSERT INTO `dd_district` VALUES (938, 936, '0574', '330205', '江北区', '121.555081', '29.886781', 'district');
INSERT INTO `dd_district` VALUES (939, 936, '0574', '330206', '北仑区', '121.844172', '29.899778', 'district');
INSERT INTO `dd_district` VALUES (940, 936, '0574', '330211', '镇海区', '121.596496', '29.965203', 'district');
INSERT INTO `dd_district` VALUES (941, 936, '0574', '330212', '鄞州区', '121.546603', '29.816511', 'district');
INSERT INTO `dd_district` VALUES (942, 936, '0574', '330225', '象山县', '121.869339', '29.476705', 'district');
INSERT INTO `dd_district` VALUES (943, 936, '0574', '330226', '宁海县', '121.429477', '29.287939', 'district');
INSERT INTO `dd_district` VALUES (944, 936, '0574', '330281', '余姚市', '121.154629', '30.037106', 'district');
INSERT INTO `dd_district` VALUES (945, 936, '0574', '330282', '慈溪市', '121.266561', '30.170261', 'district');
INSERT INTO `dd_district` VALUES (946, 936, '0574', '330283', '奉化区', '121.406997', '29.655144', 'district');
INSERT INTO `dd_district` VALUES (947, 921, '0577', '330300', '温州市', '120.699361', '27.993828', 'city');
INSERT INTO `dd_district` VALUES (948, 947, '0577', '330302', '鹿城区', '120.655271', '28.015737', 'district');
INSERT INTO `dd_district` VALUES (949, 947, '0577', '330303', '龙湾区', '120.811213', '27.932747', 'district');
INSERT INTO `dd_district` VALUES (950, 947, '0577', '330304', '瓯海区', '120.61491', '27.966844', 'district');
INSERT INTO `dd_district` VALUES (951, 947, '0577', '330305', '洞头区', '121.157249', '27.836154', 'district');
INSERT INTO `dd_district` VALUES (952, 947, '0577', '330324', '永嘉县', '120.692025', '28.153607', 'district');
INSERT INTO `dd_district` VALUES (953, 947, '0577', '330326', '平阳县', '120.565793', '27.661918', 'district');
INSERT INTO `dd_district` VALUES (954, 947, '0577', '330327', '苍南县', '120.427619', '27.519773', 'district');
INSERT INTO `dd_district` VALUES (955, 947, '0577', '330328', '文成县', '120.091498', '27.786996', 'district');
INSERT INTO `dd_district` VALUES (956, 947, '0577', '330329', '泰顺县', '119.717649', '27.556884', 'district');
INSERT INTO `dd_district` VALUES (957, 947, '0577', '330381', '瑞安市', '120.655148', '27.778657', 'district');
INSERT INTO `dd_district` VALUES (958, 947, '0577', '330382', '乐清市', '120.983906', '28.113725', 'district');
INSERT INTO `dd_district` VALUES (959, 921, '0573', '330400', '嘉兴市', '120.75547', '30.746191', 'city');
INSERT INTO `dd_district` VALUES (960, 959, '0573', '330402', '南湖区', '120.783024', '30.747842', 'district');
INSERT INTO `dd_district` VALUES (961, 959, '0573', '330411', '秀洲区', '120.710082', '30.765188', 'district');
INSERT INTO `dd_district` VALUES (962, 959, '0573', '330421', '嘉善县', '120.926028', '30.830864', 'district');
INSERT INTO `dd_district` VALUES (963, 959, '0573', '330424', '海盐县', '120.946263', '30.526435', 'district');
INSERT INTO `dd_district` VALUES (964, 959, '0573', '330481', '海宁市', '120.680239', '30.511539', 'district');
INSERT INTO `dd_district` VALUES (965, 959, '0573', '330482', '平湖市', '121.015142', '30.677233', 'district');
INSERT INTO `dd_district` VALUES (966, 959, '0573', '330483', '桐乡市', '120.565098', '30.630173', 'district');
INSERT INTO `dd_district` VALUES (967, 921, '0572', '330500', '湖州市', '120.086809', '30.89441', 'city');
INSERT INTO `dd_district` VALUES (968, 967, '0572', '330502', '吴兴区', '120.185838', '30.857151', 'district');
INSERT INTO `dd_district` VALUES (969, 967, '0572', '330503', '南浔区', '120.418513', '30.849689', 'district');
INSERT INTO `dd_district` VALUES (970, 967, '0572', '330521', '德清县', '119.9774', '30.54251', 'district');
INSERT INTO `dd_district` VALUES (971, 967, '0572', '330522', '长兴县', '119.910952', '31.026665', 'district');
INSERT INTO `dd_district` VALUES (972, 967, '0572', '330523', '安吉县', '119.680353', '30.638674', 'district');
INSERT INTO `dd_district` VALUES (973, 921, '0575', '330600', '绍兴市', '120.580364', '30.030192', 'city');
INSERT INTO `dd_district` VALUES (974, 973, '0575', '330602', '越城区', '120.582633', '29.988244', 'district');
INSERT INTO `dd_district` VALUES (975, 973, '0575', '330603', '柯桥区', '120.495085', '30.081929', 'district');
INSERT INTO `dd_district` VALUES (976, 973, '0575', '330604', '上虞区', '120.868122', '30.03312', 'district');
INSERT INTO `dd_district` VALUES (977, 973, '0575', '330624', '新昌县', '120.903866', '29.499831', 'district');
INSERT INTO `dd_district` VALUES (978, 973, '0575', '330681', '诸暨市', '120.246863', '29.708692', 'district');
INSERT INTO `dd_district` VALUES (979, 973, '0575', '330683', '嵊州市', '120.831025', '29.56141', 'district');
INSERT INTO `dd_district` VALUES (980, 921, '0579', '330700', '金华市', '119.647229', '29.079208', 'city');
INSERT INTO `dd_district` VALUES (981, 980, '0579', '330702', '婺城区', '119.571728', '29.0872', 'district');
INSERT INTO `dd_district` VALUES (982, 980, '0579', '330703', '金东区', '119.69278', '29.099723', 'district');
INSERT INTO `dd_district` VALUES (983, 980, '0579', '330723', '武义县', '119.816562', '28.89267', 'district');
INSERT INTO `dd_district` VALUES (984, 980, '0579', '330726', '浦江县', '119.892222', '29.452476', 'district');
INSERT INTO `dd_district` VALUES (985, 980, '0579', '330727', '磐安县', '120.450005', '29.054548', 'district');
INSERT INTO `dd_district` VALUES (986, 980, '0579', '330781', '兰溪市', '119.460472', '29.2084', 'district');
INSERT INTO `dd_district` VALUES (987, 980, '0579', '330782', '义乌市', '120.075106', '29.306775', 'district');
INSERT INTO `dd_district` VALUES (988, 980, '0579', '330783', '东阳市', '120.241566', '29.289648', 'district');
INSERT INTO `dd_district` VALUES (989, 980, '0579', '330784', '永康市', '120.047651', '28.888555', 'district');
INSERT INTO `dd_district` VALUES (990, 921, '0570', '330800', '衢州市', '118.859457', '28.970079', 'city');
INSERT INTO `dd_district` VALUES (991, 990, '0570', '330802', '柯城区', '118.871516', '28.96862', 'district');
INSERT INTO `dd_district` VALUES (992, 990, '0570', '330803', '衢江区', '118.95946', '28.97978', 'district');
INSERT INTO `dd_district` VALUES (993, 990, '0570', '330822', '常山县', '118.511235', '28.901462', 'district');
INSERT INTO `dd_district` VALUES (994, 990, '0570', '330824', '开化县', '118.415495', '29.137336', 'district');
INSERT INTO `dd_district` VALUES (995, 990, '0570', '330825', '龙游县', '119.172189', '29.028439', 'district');
INSERT INTO `dd_district` VALUES (996, 990, '0570', '330881', '江山市', '118.626991', '28.737331', 'district');
INSERT INTO `dd_district` VALUES (997, 921, '0580', '330900', '舟山市', '122.207106', '29.985553', 'city');
INSERT INTO `dd_district` VALUES (998, 997, '0580', '330902', '定海区', '122.106773', '30.019858', 'district');
INSERT INTO `dd_district` VALUES (999, 997, '0580', '330903', '普陀区', '122.323867', '29.97176', 'district');
INSERT INTO `dd_district` VALUES (1000, 997, '0580', '330921', '岱山县', '122.226237', '30.264139', 'district');
INSERT INTO `dd_district` VALUES (1001, 997, '0580', '330922', '嵊泗县', '122.451382', '30.725686', 'district');
INSERT INTO `dd_district` VALUES (1002, 921, '0576', '331000', '台州市', '121.42076', '28.65638', 'city');
INSERT INTO `dd_district` VALUES (1003, 1002, '0576', '331002', '椒江区', '121.442978', '28.672981', 'district');
INSERT INTO `dd_district` VALUES (1004, 1002, '0576', '331003', '黄岩区', '121.261972', '28.650083', 'district');
INSERT INTO `dd_district` VALUES (1005, 1002, '0576', '331004', '路桥区', '121.365123', '28.582654', 'district');
INSERT INTO `dd_district` VALUES (1006, 1002, '0576', '331021', '玉环县', '121.231805', '28.135929', 'district');
INSERT INTO `dd_district` VALUES (1007, 1002, '0576', '331022', '三门县', '121.395711', '29.104789', 'district');
INSERT INTO `dd_district` VALUES (1008, 1002, '0576', '331023', '天台县', '121.006595', '29.144064', 'district');
INSERT INTO `dd_district` VALUES (1009, 1002, '0576', '331024', '仙居县', '120.728801', '28.846966', 'district');
INSERT INTO `dd_district` VALUES (1010, 1002, '0576', '331081', '温岭市', '121.385604', '28.372506', 'district');
INSERT INTO `dd_district` VALUES (1011, 1002, '0576', '331082', '临海市', '121.144556', '28.858881', 'district');
INSERT INTO `dd_district` VALUES (1012, 921, '0578', '331100', '丽水市', '119.922796', '28.46763', 'city');
INSERT INTO `dd_district` VALUES (1013, 1012, '0578', '331102', '莲都区', '119.912626', '28.445928', 'district');
INSERT INTO `dd_district` VALUES (1014, 1012, '0578', '331121', '青田县', '120.289478', '28.139837', 'district');
INSERT INTO `dd_district` VALUES (1015, 1012, '0578', '331122', '缙云县', '120.091572', '28.659283', 'district');
INSERT INTO `dd_district` VALUES (1016, 1012, '0578', '331123', '遂昌县', '119.276103', '28.592148', 'district');
INSERT INTO `dd_district` VALUES (1017, 1012, '0578', '331124', '松阳县', '119.481511', '28.448803', 'district');
INSERT INTO `dd_district` VALUES (1018, 1012, '0578', '331125', '云和县', '119.573397', '28.11579', 'district');
INSERT INTO `dd_district` VALUES (1019, 1012, '0578', '331126', '庆元县', '119.06259', '27.61922', 'district');
INSERT INTO `dd_district` VALUES (1020, 1012, '0578', '331127', '景宁畲族自治县', '119.635739', '27.9733', 'district');
INSERT INTO `dd_district` VALUES (1021, 1012, '0578', '331181', '龙泉市', '119.141473', '28.074649', 'district');
INSERT INTO `dd_district` VALUES (1022, 1, '0', '340000', '安徽省', '117.329949', '31.733806', 'province');
INSERT INTO `dd_district` VALUES (1023, 1022, '0551', '340100', '合肥市', '117.227219', '31.820591', 'city');
INSERT INTO `dd_district` VALUES (1024, 1023, '0551', '340102', '瑶海区', '117.309546', '31.857917', 'district');
INSERT INTO `dd_district` VALUES (1025, 1023, '0551', '340103', '庐阳区', '117.264786', '31.878589', 'district');
INSERT INTO `dd_district` VALUES (1026, 1023, '0551', '340104', '蜀山区', '117.260521', '31.85124', 'district');
INSERT INTO `dd_district` VALUES (1027, 1023, '0551', '340111', '包河区', '117.309519', '31.793859', 'district');
INSERT INTO `dd_district` VALUES (1028, 1023, '0551', '340121', '长丰县', '117.167564', '32.478018', 'district');
INSERT INTO `dd_district` VALUES (1029, 1023, '0551', '340122', '肥东县', '117.469382', '31.88794', 'district');
INSERT INTO `dd_district` VALUES (1030, 1023, '0551', '340123', '肥西县', '117.157981', '31.706809', 'district');
INSERT INTO `dd_district` VALUES (1031, 1023, '0551', '340124', '庐江县', '117.2882', '31.256524', 'district');
INSERT INTO `dd_district` VALUES (1032, 1023, '0551', '340181', '巢湖市', '117.890354', '31.624522', 'district');
INSERT INTO `dd_district` VALUES (1033, 1022, '0553', '340200', '芜湖市', '118.432941', '31.352859', 'city');
INSERT INTO `dd_district` VALUES (1034, 1033, '0553', '340202', '镜湖区', '118.385009', '31.340728', 'district');
INSERT INTO `dd_district` VALUES (1035, 1033, '0553', '340203', '弋江区', '118.372655', '31.311756', 'district');
INSERT INTO `dd_district` VALUES (1036, 1033, '0553', '340207', '鸠江区', '118.391734', '31.369373', 'district');
INSERT INTO `dd_district` VALUES (1037, 1033, '0553', '340208', '三山区', '118.268101', '31.219568', 'district');
INSERT INTO `dd_district` VALUES (1038, 1033, '0553', '340221', '芜湖县', '118.576124', '31.134809', 'district');
INSERT INTO `dd_district` VALUES (1039, 1033, '0553', '340222', '繁昌县', '118.198703', '31.101782', 'district');
INSERT INTO `dd_district` VALUES (1040, 1033, '0553', '340223', '南陵县', '118.334359', '30.914922', 'district');
INSERT INTO `dd_district` VALUES (1041, 1033, '0553', '340225', '无为县', '117.902366', '31.303167', 'district');
INSERT INTO `dd_district` VALUES (1042, 1022, '0552', '340300', '蚌埠市', '117.388512', '32.91663', 'city');
INSERT INTO `dd_district` VALUES (1043, 1042, '0552', '340302', '龙子湖区', '117.379778', '32.950611', 'district');
INSERT INTO `dd_district` VALUES (1044, 1042, '0552', '340303', '蚌山区', '117.373595', '32.917048', 'district');
INSERT INTO `dd_district` VALUES (1045, 1042, '0552', '340304', '禹会区', '117.342155', '32.929799', 'district');
INSERT INTO `dd_district` VALUES (1046, 1042, '0552', '340311', '淮上区', '117.35933', '32.965435', 'district');
INSERT INTO `dd_district` VALUES (1047, 1042, '0552', '340321', '怀远县', '117.205237', '32.970031', 'district');
INSERT INTO `dd_district` VALUES (1048, 1042, '0552', '340322', '五河县', '117.879486', '33.127823', 'district');
INSERT INTO `dd_district` VALUES (1049, 1042, '0552', '340323', '固镇县', '117.316913', '33.31688', 'district');
INSERT INTO `dd_district` VALUES (1050, 1022, '0554', '340400', '淮南市', '117.018399', '32.587117', 'city');
INSERT INTO `dd_district` VALUES (1051, 1050, '0554', '340402', '大通区', '117.053314', '32.631519', 'district');
INSERT INTO `dd_district` VALUES (1052, 1050, '0554', '340403', '田家庵区', '117.017349', '32.647277', 'district');
INSERT INTO `dd_district` VALUES (1053, 1050, '0554', '340404', '谢家集区', '116.859188', '32.600037', 'district');
INSERT INTO `dd_district` VALUES (1054, 1050, '0554', '340405', '八公山区', '116.83349', '32.631379', 'district');
INSERT INTO `dd_district` VALUES (1055, 1050, '0554', '340406', '潘集区', '116.834715', '32.77208', 'district');
INSERT INTO `dd_district` VALUES (1056, 1050, '0554', '340421', '凤台县', '116.71105', '32.709444', 'district');
INSERT INTO `dd_district` VALUES (1057, 1050, '0554', '340422', '寿县', '116.798232', '32.545109', 'district');
INSERT INTO `dd_district` VALUES (1058, 1022, '0555', '340500', '马鞍山市', '118.507011', '31.67044', 'city');
INSERT INTO `dd_district` VALUES (1059, 1058, '0555', '340503', '花山区', '118.492565', '31.71971', 'district');
INSERT INTO `dd_district` VALUES (1060, 1058, '0555', '340504', '雨山区', '118.498578', '31.682132', 'district');
INSERT INTO `dd_district` VALUES (1061, 1058, '0555', '340506', '博望区', '118.844538', '31.558471', 'district');
INSERT INTO `dd_district` VALUES (1062, 1058, '0555', '340521', '当涂县', '118.497972', '31.571213', 'district');
INSERT INTO `dd_district` VALUES (1063, 1058, '0555', '340522', '含山县', '118.101421', '31.735598', 'district');
INSERT INTO `dd_district` VALUES (1064, 1058, '0555', '340523', '和县', '118.353667', '31.742293', 'district');
INSERT INTO `dd_district` VALUES (1065, 1022, '0561', '340600', '淮北市', '116.798265', '33.955844', 'city');
INSERT INTO `dd_district` VALUES (1066, 1065, '0561', '340602', '杜集区', '116.828133', '33.991451', 'district');
INSERT INTO `dd_district` VALUES (1067, 1065, '0561', '340603', '相山区', '116.794344', '33.959892', 'district');
INSERT INTO `dd_district` VALUES (1068, 1065, '0561', '340604', '烈山区', '116.813042', '33.895139', 'district');
INSERT INTO `dd_district` VALUES (1069, 1065, '0561', '340621', '濉溪县', '116.766298', '33.915477', 'district');
INSERT INTO `dd_district` VALUES (1070, 1022, '0562', '340700', '铜陵市', '117.81154', '30.945515', 'city');
INSERT INTO `dd_district` VALUES (1071, 1070, '0562', '340705', '铜官区', '117.85616', '30.936272', 'district');
INSERT INTO `dd_district` VALUES (1072, 1070, '0562', '340706', '义安区', '117.791544', '30.952823', 'district');
INSERT INTO `dd_district` VALUES (1073, 1070, '0562', '340711', '郊区', '117.768026', '30.821069', 'district');
INSERT INTO `dd_district` VALUES (1074, 1070, '0562', '340722', '枞阳县', '117.250594', '30.706018', 'district');
INSERT INTO `dd_district` VALUES (1075, 1022, '0556', '340800', '安庆市', '117.115101', '30.531919', 'city');
INSERT INTO `dd_district` VALUES (1076, 1075, '0556', '340802', '迎江区', '117.09115', '30.511548', 'district');
INSERT INTO `dd_district` VALUES (1077, 1075, '0556', '340803', '大观区', '117.013469', '30.553697', 'district');
INSERT INTO `dd_district` VALUES (1078, 1075, '0556', '340811', '宜秀区', '116.987542', '30.613332', 'district');
INSERT INTO `dd_district` VALUES (1079, 1075, '0556', '340822', '怀宁县', '116.829475', '30.733824', 'district');
INSERT INTO `dd_district` VALUES (1080, 1075, '0556', '340824', '潜山县', '116.581371', '30.631136', 'district');
INSERT INTO `dd_district` VALUES (1081, 1075, '0556', '340825', '太湖县', '116.308795', '30.45422', 'district');
INSERT INTO `dd_district` VALUES (1082, 1075, '0556', '340826', '宿松县', '116.129105', '30.153746', 'district');
INSERT INTO `dd_district` VALUES (1083, 1075, '0556', '340827', '望江县', '116.706498', '30.128002', 'district');
INSERT INTO `dd_district` VALUES (1084, 1075, '0556', '340828', '岳西县', '116.359692', '30.849762', 'district');
INSERT INTO `dd_district` VALUES (1085, 1075, '0556', '340881', '桐城市', '116.936748', '31.035848', 'district');
INSERT INTO `dd_district` VALUES (1086, 1022, '0559', '341000', '黄山市', '118.338272', '29.715185', 'city');
INSERT INTO `dd_district` VALUES (1087, 1086, '0559', '341002', '屯溪区', '118.315329', '29.696108', 'district');
INSERT INTO `dd_district` VALUES (1088, 1086, '0559', '341003', '黄山区', '118.141567', '30.272942', 'district');
INSERT INTO `dd_district` VALUES (1089, 1086, '0559', '341004', '徽州区', '118.336743', '29.827271', 'district');
INSERT INTO `dd_district` VALUES (1090, 1086, '0559', '341021', '歙县', '118.415345', '29.861379', 'district');
INSERT INTO `dd_district` VALUES (1091, 1086, '0559', '341022', '休宁县', '118.193618', '29.784124', 'district');
INSERT INTO `dd_district` VALUES (1092, 1086, '0559', '341023', '黟县', '117.938373', '29.924805', 'district');
INSERT INTO `dd_district` VALUES (1093, 1086, '0559', '341024', '祁门县', '117.717396', '29.854055', 'district');
INSERT INTO `dd_district` VALUES (1094, 1022, '0550', '341100', '滁州市', '118.327944', '32.255636', 'city');
INSERT INTO `dd_district` VALUES (1095, 1094, '0550', '341102', '琅琊区', '118.305961', '32.294631', 'district');
INSERT INTO `dd_district` VALUES (1096, 1094, '0550', '341103', '南谯区', '118.41697', '32.200197', 'district');
INSERT INTO `dd_district` VALUES (1097, 1094, '0550', '341122', '来安县', '118.435718', '32.452199', 'district');
INSERT INTO `dd_district` VALUES (1098, 1094, '0550', '341124', '全椒县', '118.274149', '32.08593', 'district');
INSERT INTO `dd_district` VALUES (1099, 1094, '0550', '341125', '定远县', '117.698562', '32.530981', 'district');
INSERT INTO `dd_district` VALUES (1100, 1094, '0550', '341126', '凤阳县', '117.531622', '32.874735', 'district');
INSERT INTO `dd_district` VALUES (1101, 1094, '0550', '341181', '天长市', '119.004816', '32.667571', 'district');
INSERT INTO `dd_district` VALUES (1102, 1094, '0550', '341182', '明光市', '118.018193', '32.78196', 'district');
INSERT INTO `dd_district` VALUES (1103, 1022, '1558', '341200', '阜阳市', '115.814504', '32.890479', 'city');
INSERT INTO `dd_district` VALUES (1104, 1103, '1558', '341202', '颍州区', '115.806942', '32.883468', 'district');
INSERT INTO `dd_district` VALUES (1105, 1103, '1558', '341203', '颍东区', '115.856762', '32.912477', 'district');
INSERT INTO `dd_district` VALUES (1106, 1103, '1558', '341204', '颍泉区', '115.80835', '32.925211', 'district');
INSERT INTO `dd_district` VALUES (1107, 1103, '1558', '341221', '临泉县', '115.263115', '33.039715', 'district');
INSERT INTO `dd_district` VALUES (1108, 1103, '1558', '341222', '太和县', '115.621941', '33.160327', 'district');
INSERT INTO `dd_district` VALUES (1109, 1103, '1558', '341225', '阜南县', '115.595643', '32.658297', 'district');
INSERT INTO `dd_district` VALUES (1110, 1103, '1558', '341226', '颍上县', '116.256772', '32.653211', 'district');
INSERT INTO `dd_district` VALUES (1111, 1103, '1558', '341282', '界首市', '115.374821', '33.258244', 'district');
INSERT INTO `dd_district` VALUES (1112, 1022, '0557', '341300', '宿州市', '116.964195', '33.647309', 'city');
INSERT INTO `dd_district` VALUES (1113, 1112, '0557', '341302', '埇桥区', '116.977203', '33.64059', 'district');
INSERT INTO `dd_district` VALUES (1114, 1112, '0557', '341321', '砀山县', '116.367095', '34.442561', 'district');
INSERT INTO `dd_district` VALUES (1115, 1112, '0557', '341322', '萧县', '116.947349', '34.188732', 'district');
INSERT INTO `dd_district` VALUES (1116, 1112, '0557', '341323', '灵璧县', '117.549395', '33.554604', 'district');
INSERT INTO `dd_district` VALUES (1117, 1112, '0557', '341324', '泗县', '117.910629', '33.482982', 'district');
INSERT INTO `dd_district` VALUES (1118, 1022, '0564', '341500', '六安市', '116.520139', '31.735456', 'city');
INSERT INTO `dd_district` VALUES (1119, 1118, '0564', '341502', '金安区', '116.539173', '31.750119', 'district');
INSERT INTO `dd_district` VALUES (1120, 1118, '0564', '341503', '裕安区', '116.479829', '31.738183', 'district');
INSERT INTO `dd_district` VALUES (1121, 1118, '0564', '341504', '叶集区', '115.925271', '31.863693', 'district');
INSERT INTO `dd_district` VALUES (1122, 1118, '0564', '341522', '霍邱县', '116.277911', '32.353038', 'district');
INSERT INTO `dd_district` VALUES (1123, 1118, '0564', '341523', '舒城县', '116.948736', '31.462234', 'district');
INSERT INTO `dd_district` VALUES (1124, 1118, '0564', '341524', '金寨县', '115.934366', '31.72717', 'district');
INSERT INTO `dd_district` VALUES (1125, 1118, '0564', '341525', '霍山县', '116.351892', '31.410561', 'district');
INSERT INTO `dd_district` VALUES (1126, 1022, '0558', '341600', '亳州市', '115.77867', '33.844592', 'city');
INSERT INTO `dd_district` VALUES (1127, 1126, '0558', '341602', '谯城区', '115.779025', '33.876235', 'district');
INSERT INTO `dd_district` VALUES (1128, 1126, '0558', '341621', '涡阳县', '116.215665', '33.492921', 'district');
INSERT INTO `dd_district` VALUES (1129, 1126, '0558', '341622', '蒙城县', '116.564247', '33.26583', 'district');
INSERT INTO `dd_district` VALUES (1130, 1126, '0558', '341623', '利辛县', '116.208564', '33.144515', 'district');
INSERT INTO `dd_district` VALUES (1131, 1022, '0566', '341700', '池州市', '117.491592', '30.664779', 'city');
INSERT INTO `dd_district` VALUES (1132, 1131, '0566', '341702', '贵池区', '117.567264', '30.687219', 'district');
INSERT INTO `dd_district` VALUES (1133, 1131, '0566', '341721', '东至县', '117.027618', '30.111163', 'district');
INSERT INTO `dd_district` VALUES (1134, 1131, '0566', '341722', '石台县', '117.486306', '30.210313', 'district');
INSERT INTO `dd_district` VALUES (1135, 1131, '0566', '341723', '青阳县', '117.84743', '30.63923', 'district');
INSERT INTO `dd_district` VALUES (1136, 1022, '0563', '341800', '宣城市', '118.75868', '30.940195', 'city');
INSERT INTO `dd_district` VALUES (1137, 1136, '0563', '341802', '宣州区', '118.785561', '30.944076', 'district');
INSERT INTO `dd_district` VALUES (1138, 1136, '0563', '341821', '郎溪县', '119.179656', '31.126412', 'district');
INSERT INTO `dd_district` VALUES (1139, 1136, '0563', '341822', '广德县', '119.420935', '30.877555', 'district');
INSERT INTO `dd_district` VALUES (1140, 1136, '0563', '341823', '泾县', '118.419859', '30.688634', 'district');
INSERT INTO `dd_district` VALUES (1141, 1136, '0563', '341824', '绩溪县', '118.578519', '30.067533', 'district');
INSERT INTO `dd_district` VALUES (1142, 1136, '0563', '341825', '旌德县', '118.549861', '30.298142', 'district');
INSERT INTO `dd_district` VALUES (1143, 1136, '0563', '341881', '宁国市', '118.983171', '30.633882', 'district');
INSERT INTO `dd_district` VALUES (1144, 1, '0', '350000', '福建省', '119.295143', '26.100779', 'province');
INSERT INTO `dd_district` VALUES (1145, 1144, '0591', '350100', '福州市', '119.296389', '26.074268', 'city');
INSERT INTO `dd_district` VALUES (1146, 1145, '0591', '350102', '鼓楼区', '119.303917', '26.081983', 'district');
INSERT INTO `dd_district` VALUES (1147, 1145, '0591', '350103', '台江区', '119.314041', '26.052843', 'district');
INSERT INTO `dd_district` VALUES (1148, 1145, '0591', '350104', '仓山区', '119.273545', '26.046743', 'district');
INSERT INTO `dd_district` VALUES (1149, 1145, '0591', '350105', '马尾区', '119.455588', '25.9895', 'district');
INSERT INTO `dd_district` VALUES (1150, 1145, '0591', '350111', '晋安区', '119.328521', '26.082107', 'district');
INSERT INTO `dd_district` VALUES (1151, 1145, '0591', '350121', '闽侯县', '119.131724', '26.150047', 'district');
INSERT INTO `dd_district` VALUES (1152, 1145, '0591', '350122', '连江县', '119.539704', '26.197364', 'district');
INSERT INTO `dd_district` VALUES (1153, 1145, '0591', '350123', '罗源县', '119.549776', '26.489558', 'district');
INSERT INTO `dd_district` VALUES (1154, 1145, '0591', '350124', '闽清县', '118.863361', '26.221197', 'district');
INSERT INTO `dd_district` VALUES (1155, 1145, '0591', '350125', '永泰县', '118.932592', '25.866694', 'district');
INSERT INTO `dd_district` VALUES (1156, 1145, '0591', '350128', '平潭县', '119.790168', '25.49872', 'district');
INSERT INTO `dd_district` VALUES (1157, 1145, '0591', '350181', '福清市', '119.384201', '25.72071', 'district');
INSERT INTO `dd_district` VALUES (1158, 1145, '0591', '350182', '长乐市', '119.523266', '25.962888', 'district');
INSERT INTO `dd_district` VALUES (1159, 1144, '0592', '350200', '厦门市', '118.089204', '24.479664', 'city');
INSERT INTO `dd_district` VALUES (1160, 1159, '0592', '350203', '思明区', '118.082649', '24.445484', 'district');
INSERT INTO `dd_district` VALUES (1161, 1159, '0592', '350205', '海沧区', '118.032984', '24.484685', 'district');
INSERT INTO `dd_district` VALUES (1162, 1159, '0592', '350206', '湖里区', '118.146768', '24.512904', 'district');
INSERT INTO `dd_district` VALUES (1163, 1159, '0592', '350211', '集美区', '118.097337', '24.575969', 'district');
INSERT INTO `dd_district` VALUES (1164, 1159, '0592', '350212', '同安区', '118.152041', '24.723234', 'district');
INSERT INTO `dd_district` VALUES (1165, 1159, '0592', '350213', '翔安区', '118.248034', '24.618543', 'district');
INSERT INTO `dd_district` VALUES (1166, 1144, '0594', '350300', '莆田市', '119.007777', '25.454084', 'city');
INSERT INTO `dd_district` VALUES (1167, 1166, '0594', '350302', '城厢区', '118.993884', '25.419319', 'district');
INSERT INTO `dd_district` VALUES (1168, 1166, '0594', '350303', '涵江区', '119.116289', '25.45872', 'district');
INSERT INTO `dd_district` VALUES (1169, 1166, '0594', '350304', '荔城区', '119.015061', '25.431941', 'district');
INSERT INTO `dd_district` VALUES (1170, 1166, '0594', '350305', '秀屿区', '119.105494', '25.31836', 'district');
INSERT INTO `dd_district` VALUES (1171, 1166, '0594', '350322', '仙游县', '118.691637', '25.362093', 'district');
INSERT INTO `dd_district` VALUES (1172, 1144, '0598', '350400', '三明市', '117.638678', '26.263406', 'city');
INSERT INTO `dd_district` VALUES (1173, 1172, '0598', '350402', '梅列区', '117.645855', '26.271711', 'district');
INSERT INTO `dd_district` VALUES (1174, 1172, '0598', '350403', '三元区', '117.608044', '26.234019', 'district');
INSERT INTO `dd_district` VALUES (1175, 1172, '0598', '350421', '明溪县', '117.202226', '26.355856', 'district');
INSERT INTO `dd_district` VALUES (1176, 1172, '0598', '350423', '清流县', '116.816909', '26.177796', 'district');
INSERT INTO `dd_district` VALUES (1177, 1172, '0598', '350424', '宁化县', '116.654365', '26.261754', 'district');
INSERT INTO `dd_district` VALUES (1178, 1172, '0598', '350425', '大田县', '117.847115', '25.692699', 'district');
INSERT INTO `dd_district` VALUES (1179, 1172, '0598', '350426', '尤溪县', '118.190467', '26.170171', 'district');
INSERT INTO `dd_district` VALUES (1180, 1172, '0598', '350427', '沙县', '117.792396', '26.397199', 'district');
INSERT INTO `dd_district` VALUES (1181, 1172, '0598', '350428', '将乐县', '117.471372', '26.728952', 'district');
INSERT INTO `dd_district` VALUES (1182, 1172, '0598', '350429', '泰宁县', '117.17574', '26.900259', 'district');
INSERT INTO `dd_district` VALUES (1183, 1172, '0598', '350430', '建宁县', '116.848443', '26.833588', 'district');
INSERT INTO `dd_district` VALUES (1184, 1172, '0598', '350481', '永安市', '117.365052', '25.941937', 'district');
INSERT INTO `dd_district` VALUES (1185, 1144, '0595', '350500', '泉州市', '118.675676', '24.874132', 'city');
INSERT INTO `dd_district` VALUES (1186, 1185, '0595', '350502', '鲤城区', '118.587097', '24.907424', 'district');
INSERT INTO `dd_district` VALUES (1187, 1185, '0595', '350503', '丰泽区', '118.613172', '24.891173', 'district');
INSERT INTO `dd_district` VALUES (1188, 1185, '0595', '350504', '洛江区', '118.671193', '24.939796', 'district');
INSERT INTO `dd_district` VALUES (1189, 1185, '0595', '350505', '泉港区', '118.916309', '25.119815', 'district');
INSERT INTO `dd_district` VALUES (1190, 1185, '0595', '350521', '惠安县', '118.796607', '25.030801', 'district');
INSERT INTO `dd_district` VALUES (1191, 1185, '0595', '350524', '安溪县', '118.186288', '25.055954', 'district');
INSERT INTO `dd_district` VALUES (1192, 1185, '0595', '350525', '永春县', '118.294048', '25.321565', 'district');
INSERT INTO `dd_district` VALUES (1193, 1185, '0595', '350526', '德化县', '118.241094', '25.491493', 'district');
INSERT INTO `dd_district` VALUES (1194, 1185, '0595', '350527', '金门县', '118.323221', '24.436417', 'district');
INSERT INTO `dd_district` VALUES (1195, 1185, '0595', '350581', '石狮市', '118.648066', '24.732204', 'district');
INSERT INTO `dd_district` VALUES (1196, 1185, '0595', '350582', '晋江市', '118.551682', '24.781636', 'district');
INSERT INTO `dd_district` VALUES (1197, 1185, '0595', '350583', '南安市', '118.386279', '24.960385', 'district');
INSERT INTO `dd_district` VALUES (1198, 1144, '0596', '350600', '漳州市', '117.647093', '24.513025', 'city');
INSERT INTO `dd_district` VALUES (1199, 1198, '0596', '350602', '芗城区', '117.653968', '24.510787', 'district');
INSERT INTO `dd_district` VALUES (1200, 1198, '0596', '350603', '龙文区', '117.709754', '24.503113', 'district');
INSERT INTO `dd_district` VALUES (1201, 1198, '0596', '350622', '云霄县', '117.339573', '23.957936', 'district');
INSERT INTO `dd_district` VALUES (1202, 1198, '0596', '350623', '漳浦县', '117.613808', '24.117102', 'district');
INSERT INTO `dd_district` VALUES (1203, 1198, '0596', '350624', '诏安县', '117.175184', '23.711579', 'district');
INSERT INTO `dd_district` VALUES (1204, 1198, '0596', '350625', '长泰县', '117.759153', '24.625449', 'district');
INSERT INTO `dd_district` VALUES (1205, 1198, '0596', '350626', '东山县', '117.430061', '23.701262', 'district');
INSERT INTO `dd_district` VALUES (1206, 1198, '0596', '350627', '南靖县', '117.35732', '24.514654', 'district');
INSERT INTO `dd_district` VALUES (1207, 1198, '0596', '350628', '平和县', '117.315017', '24.363508', 'district');
INSERT INTO `dd_district` VALUES (1208, 1198, '0596', '350629', '华安县', '117.534103', '25.004425', 'district');
INSERT INTO `dd_district` VALUES (1209, 1198, '0596', '350681', '龙海市', '117.818197', '24.446706', 'district');
INSERT INTO `dd_district` VALUES (1210, 1144, '0599', '350700', '南平市', '118.17771', '26.641774', 'city');
INSERT INTO `dd_district` VALUES (1211, 1210, '0599', '350702', '延平区', '118.182036', '26.637438', 'district');
INSERT INTO `dd_district` VALUES (1212, 1210, '0599', '350703', '建阳区', '118.120464', '27.331876', 'district');
INSERT INTO `dd_district` VALUES (1213, 1210, '0599', '350721', '顺昌县', '117.810357', '26.793288', 'district');
INSERT INTO `dd_district` VALUES (1214, 1210, '0599', '350722', '浦城县', '118.541256', '27.917263', 'district');
INSERT INTO `dd_district` VALUES (1215, 1210, '0599', '350723', '光泽县', '117.334106', '27.540987', 'district');
INSERT INTO `dd_district` VALUES (1216, 1210, '0599', '350724', '松溪县', '118.785468', '27.526232', 'district');
INSERT INTO `dd_district` VALUES (1217, 1210, '0599', '350725', '政和县', '118.857642', '27.366104', 'district');
INSERT INTO `dd_district` VALUES (1218, 1210, '0599', '350781', '邵武市', '117.492533', '27.340326', 'district');
INSERT INTO `dd_district` VALUES (1219, 1210, '0599', '350782', '武夷山市', '118.035309', '27.756647', 'district');
INSERT INTO `dd_district` VALUES (1220, 1210, '0599', '350783', '建瓯市', '118.304966', '27.022774', 'district');
INSERT INTO `dd_district` VALUES (1221, 1144, '0597', '350800', '龙岩市', '117.017295', '25.075119', 'city');
INSERT INTO `dd_district` VALUES (1222, 1221, '0597', '350802', '新罗区', '117.037155', '25.098312', 'district');
INSERT INTO `dd_district` VALUES (1223, 1221, '0597', '350803', '永定区', '116.732091', '24.723961', 'district');
INSERT INTO `dd_district` VALUES (1224, 1221, '0597', '350821', '长汀县', '116.357581', '25.833531', 'district');
INSERT INTO `dd_district` VALUES (1225, 1221, '0597', '350823', '上杭县', '116.420098', '25.049518', 'district');
INSERT INTO `dd_district` VALUES (1226, 1221, '0597', '350824', '武平县', '116.100414', '25.095386', 'district');
INSERT INTO `dd_district` VALUES (1227, 1221, '0597', '350825', '连城县', '116.754472', '25.710538', 'district');
INSERT INTO `dd_district` VALUES (1228, 1221, '0597', '350881', '漳平市', '117.419998', '25.290184', 'district');
INSERT INTO `dd_district` VALUES (1229, 1144, '0593', '350900', '宁德市', '119.547932', '26.665617', 'city');
INSERT INTO `dd_district` VALUES (1230, 1229, '0593', '350902', '蕉城区', '119.526299', '26.66061', 'district');
INSERT INTO `dd_district` VALUES (1231, 1229, '0593', '350921', '霞浦县', '120.005146', '26.885703', 'district');
INSERT INTO `dd_district` VALUES (1232, 1229, '0593', '350922', '古田县', '118.746284', '26.577837', 'district');
INSERT INTO `dd_district` VALUES (1233, 1229, '0593', '350923', '屏南县', '118.985895', '26.908276', 'district');
INSERT INTO `dd_district` VALUES (1234, 1229, '0593', '350924', '寿宁县', '119.514986', '27.454479', 'district');
INSERT INTO `dd_district` VALUES (1235, 1229, '0593', '350925', '周宁县', '119.339025', '27.104591', 'district');
INSERT INTO `dd_district` VALUES (1236, 1229, '0593', '350926', '柘荣县', '119.900609', '27.233933', 'district');
INSERT INTO `dd_district` VALUES (1237, 1229, '0593', '350981', '福安市', '119.64785', '27.08834', 'district');
INSERT INTO `dd_district` VALUES (1238, 1229, '0593', '350982', '福鼎市', '120.216977', '27.324479', 'district');
INSERT INTO `dd_district` VALUES (1239, 1, '0', '360000', '江西省', '115.81635', '28.63666', 'province');
INSERT INTO `dd_district` VALUES (1240, 1239, '0791', '360100', '南昌市', '115.858198', '28.682892', 'city');
INSERT INTO `dd_district` VALUES (1241, 1240, '0791', '360102', '东湖区', '115.903526', '28.698731', 'district');
INSERT INTO `dd_district` VALUES (1242, 1240, '0791', '360103', '西湖区', '115.877233', '28.657595', 'district');
INSERT INTO `dd_district` VALUES (1243, 1240, '0791', '360104', '青云谱区', '115.925749', '28.621169', 'district');
INSERT INTO `dd_district` VALUES (1244, 1240, '0791', '360105', '湾里区', '115.730847', '28.714796', 'district');
INSERT INTO `dd_district` VALUES (1245, 1240, '0791', '360111', '青山湖区', '115.962144', '28.682984', 'district');
INSERT INTO `dd_district` VALUES (1246, 1240, '0791', '360112', '新建区', '115.815277', '28.692864', 'district');
INSERT INTO `dd_district` VALUES (1247, 1240, '0791', '360121', '南昌县', '115.933742', '28.558296', 'district');
INSERT INTO `dd_district` VALUES (1248, 1240, '0791', '360123', '安义县', '115.548658', '28.846', 'district');
INSERT INTO `dd_district` VALUES (1249, 1240, '0791', '360124', '进贤县', '116.241288', '28.377343', 'district');
INSERT INTO `dd_district` VALUES (1250, 1239, '0798', '360200', '景德镇市', '117.178222', '29.268945', 'city');
INSERT INTO `dd_district` VALUES (1251, 1250, '0798', '360202', '昌江区', '117.18363', '29.273565', 'district');
INSERT INTO `dd_district` VALUES (1252, 1250, '0798', '360203', '珠山区', '117.202919', '29.299938', 'district');
INSERT INTO `dd_district` VALUES (1253, 1250, '0798', '360222', '浮梁县', '117.215066', '29.352253', 'district');
INSERT INTO `dd_district` VALUES (1254, 1250, '0798', '360281', '乐平市', '117.151796', '28.97844', 'district');
INSERT INTO `dd_district` VALUES (1255, 1239, '0799', '360300', '萍乡市', '113.887083', '27.658373', 'city');
INSERT INTO `dd_district` VALUES (1256, 1255, '0799', '360302', '安源区', '113.870704', '27.61511', 'district');
INSERT INTO `dd_district` VALUES (1257, 1255, '0799', '360313', '湘东区', '113.733047', '27.640075', 'district');
INSERT INTO `dd_district` VALUES (1258, 1255, '0799', '360321', '莲花县', '113.961488', '27.127664', 'district');
INSERT INTO `dd_district` VALUES (1259, 1255, '0799', '360322', '上栗县', '113.795311', '27.880301', 'district');
INSERT INTO `dd_district` VALUES (1260, 1255, '0799', '360323', '芦溪县', '114.029827', '27.630806', 'district');
INSERT INTO `dd_district` VALUES (1261, 1239, '0792', '360400', '九江市', '115.952914', '29.662117', 'city');
INSERT INTO `dd_district` VALUES (1262, 1261, '0792', '360402', '濂溪区', '115.992842', '29.668064', 'district');
INSERT INTO `dd_district` VALUES (1263, 1261, '0792', '360403', '浔阳区', '115.990301', '29.727593', 'district');
INSERT INTO `dd_district` VALUES (1264, 1261, '0792', '360421', '九江县', '115.911323', '29.608431', 'district');
INSERT INTO `dd_district` VALUES (1265, 1261, '0792', '360423', '武宁县', '115.092757', '29.246591', 'district');
INSERT INTO `dd_district` VALUES (1266, 1261, '0792', '360424', '修水县', '114.546836', '29.025726', 'district');
INSERT INTO `dd_district` VALUES (1267, 1261, '0792', '360425', '永修县', '115.831956', '29.011871', 'district');
INSERT INTO `dd_district` VALUES (1268, 1261, '0792', '360426', '德安县', '115.767447', '29.298696', 'district');
INSERT INTO `dd_district` VALUES (1269, 1261, '0792', '360427', '庐山市', '116.04506', '29.448128', 'district');
INSERT INTO `dd_district` VALUES (1270, 1261, '0792', '360428', '都昌县', '116.203979', '29.273239', 'district');
INSERT INTO `dd_district` VALUES (1271, 1261, '0792', '360429', '湖口县', '116.251947', '29.731101', 'district');
INSERT INTO `dd_district` VALUES (1272, 1261, '0792', '360430', '彭泽县', '116.56438', '29.876991', 'district');
INSERT INTO `dd_district` VALUES (1273, 1261, '0792', '360481', '瑞昌市', '115.681335', '29.675834', 'district');
INSERT INTO `dd_district` VALUES (1274, 1261, '0792', '360482', '共青城市', '115.808844', '29.248316', 'district');
INSERT INTO `dd_district` VALUES (1275, 1239, '0790', '360500', '新余市', '114.917346', '27.817808', 'city');
INSERT INTO `dd_district` VALUES (1276, 1275, '0790', '360502', '渝水区', '114.944549', '27.800148', 'district');
INSERT INTO `dd_district` VALUES (1277, 1275, '0790', '360521', '分宜县', '114.692049', '27.814757', 'district');
INSERT INTO `dd_district` VALUES (1278, 1239, '0701', '360600', '鹰潭市', '117.042173', '28.272537', 'city');
INSERT INTO `dd_district` VALUES (1279, 1278, '0701', '360602', '月湖区', '117.102475', '28.267018', 'district');
INSERT INTO `dd_district` VALUES (1280, 1278, '0701', '360622', '余江县', '116.85926', '28.198652', 'district');
INSERT INTO `dd_district` VALUES (1281, 1278, '0701', '360681', '贵溪市', '117.245497', '28.292519', 'district');
INSERT INTO `dd_district` VALUES (1282, 1239, '0797', '360700', '赣州市', '114.933546', '25.830694', 'city');
INSERT INTO `dd_district` VALUES (1283, 1282, '0797', '360702', '章贡区', '114.921171', '25.817816', 'district');
INSERT INTO `dd_district` VALUES (1284, 1282, '0797', '360703', '南康区', '114.765412', '25.66145', 'district');
INSERT INTO `dd_district` VALUES (1285, 1282, '0797', '360721', '赣县区', '115.011561', '25.86069', 'district');
INSERT INTO `dd_district` VALUES (1286, 1282, '0797', '360722', '信丰县', '114.922922', '25.386379', 'district');
INSERT INTO `dd_district` VALUES (1287, 1282, '0797', '360723', '大余县', '114.362112', '25.401313', 'district');
INSERT INTO `dd_district` VALUES (1288, 1282, '0797', '360724', '上犹县', '114.551138', '25.785172', 'district');
INSERT INTO `dd_district` VALUES (1289, 1282, '0797', '360725', '崇义县', '114.308267', '25.681784', 'district');
INSERT INTO `dd_district` VALUES (1290, 1282, '0797', '360726', '安远县', '115.393922', '25.136927', 'district');
INSERT INTO `dd_district` VALUES (1291, 1282, '0797', '360727', '龙南县', '114.789873', '24.911069', 'district');
INSERT INTO `dd_district` VALUES (1292, 1282, '0797', '360728', '定南县', '115.027845', '24.78441', 'district');
INSERT INTO `dd_district` VALUES (1293, 1282, '0797', '360729', '全南县', '114.530125', '24.742403', 'district');
INSERT INTO `dd_district` VALUES (1294, 1282, '0797', '360730', '宁都县', '116.009472', '26.470116', 'district');
INSERT INTO `dd_district` VALUES (1295, 1282, '0797', '360731', '于都县', '115.415508', '25.952068', 'district');
INSERT INTO `dd_district` VALUES (1296, 1282, '0797', '360732', '兴国县', '115.363189', '26.337937', 'district');
INSERT INTO `dd_district` VALUES (1297, 1282, '0797', '360733', '会昌县', '115.786056', '25.600272', 'district');
INSERT INTO `dd_district` VALUES (1298, 1282, '0797', '360734', '寻乌县', '115.637933', '24.969167', 'district');
INSERT INTO `dd_district` VALUES (1299, 1282, '0797', '360735', '石城县', '116.346995', '26.314775', 'district');
INSERT INTO `dd_district` VALUES (1300, 1282, '0797', '360781', '瑞金市', '116.027134', '25.885555', 'district');
INSERT INTO `dd_district` VALUES (1301, 1239, '0796', '360800', '吉安市', '114.966567', '27.090763', 'city');
INSERT INTO `dd_district` VALUES (1302, 1301, '0796', '360802', '吉州区', '114.994763', '27.143801', 'district');
INSERT INTO `dd_district` VALUES (1303, 1301, '0796', '360803', '青原区', '115.014811', '27.081977', 'district');
INSERT INTO `dd_district` VALUES (1304, 1301, '0796', '360821', '吉安县', '114.907875', '27.039787', 'district');
INSERT INTO `dd_district` VALUES (1305, 1301, '0796', '360822', '吉水县', '115.135507', '27.229632', 'district');
INSERT INTO `dd_district` VALUES (1306, 1301, '0796', '360823', '峡江县', '115.316566', '27.582901', 'district');
INSERT INTO `dd_district` VALUES (1307, 1301, '0796', '360824', '新干县', '115.387052', '27.740191', 'district');
INSERT INTO `dd_district` VALUES (1308, 1301, '0796', '360825', '永丰县', '115.421344', '27.316939', 'district');
INSERT INTO `dd_district` VALUES (1309, 1301, '0796', '360826', '泰和县', '114.92299', '26.801628', 'district');
INSERT INTO `dd_district` VALUES (1310, 1301, '0796', '360827', '遂川县', '114.520537', '26.313737', 'district');
INSERT INTO `dd_district` VALUES (1311, 1301, '0796', '360828', '万安县', '114.759364', '26.456553', 'district');
INSERT INTO `dd_district` VALUES (1312, 1301, '0796', '360829', '安福县', '114.619893', '27.392873', 'district');
INSERT INTO `dd_district` VALUES (1313, 1301, '0796', '360830', '永新县', '114.243072', '26.944962', 'district');
INSERT INTO `dd_district` VALUES (1314, 1301, '0796', '360881', '井冈山市', '114.289228', '26.748081', 'district');
INSERT INTO `dd_district` VALUES (1315, 1239, '0795', '360900', '宜春市', '114.416785', '27.815743', 'city');
INSERT INTO `dd_district` VALUES (1316, 1315, '0795', '360902', '袁州区', '114.427858', '27.797091', 'district');
INSERT INTO `dd_district` VALUES (1317, 1315, '0795', '360921', '奉新县', '115.400491', '28.688423', 'district');
INSERT INTO `dd_district` VALUES (1318, 1315, '0795', '360922', '万载县', '114.444854', '28.105689', 'district');
INSERT INTO `dd_district` VALUES (1319, 1315, '0795', '360923', '上高县', '114.947683', '28.238061', 'district');
INSERT INTO `dd_district` VALUES (1320, 1315, '0795', '360924', '宜丰县', '114.802852', '28.394565', 'district');
INSERT INTO `dd_district` VALUES (1321, 1315, '0795', '360925', '靖安县', '115.362628', '28.861478', 'district');
INSERT INTO `dd_district` VALUES (1322, 1315, '0795', '360926', '铜鼓县', '114.371172', '28.520769', 'district');
INSERT INTO `dd_district` VALUES (1323, 1315, '0795', '360981', '丰城市', '115.771093', '28.159141', 'district');
INSERT INTO `dd_district` VALUES (1324, 1315, '0795', '360982', '樟树市', '115.546152', '28.055853', 'district');
INSERT INTO `dd_district` VALUES (1325, 1315, '0795', '360983', '高安市', '115.360619', '28.441152', 'district');
INSERT INTO `dd_district` VALUES (1326, 1239, '0794', '361000', '抚州市', '116.358181', '27.949217', 'city');
INSERT INTO `dd_district` VALUES (1327, 1326, '0794', '361002', '临川区', '116.312166', '27.934572', 'district');
INSERT INTO `dd_district` VALUES (1328, 1326, '0794', '361021', '南城县', '116.63704', '27.569678', 'district');
INSERT INTO `dd_district` VALUES (1329, 1326, '0794', '361022', '黎川县', '116.907681', '27.282333', 'district');
INSERT INTO `dd_district` VALUES (1330, 1326, '0794', '361023', '南丰县', '116.525725', '27.218444', 'district');
INSERT INTO `dd_district` VALUES (1331, 1326, '0794', '361024', '崇仁县', '116.07626', '27.754466', 'district');
INSERT INTO `dd_district` VALUES (1332, 1326, '0794', '361025', '乐安县', '115.83048', '27.428765', 'district');
INSERT INTO `dd_district` VALUES (1333, 1326, '0794', '361026', '宜黄县', '116.236201', '27.554886', 'district');
INSERT INTO `dd_district` VALUES (1334, 1326, '0794', '361027', '金溪县', '116.755058', '27.918959', 'district');
INSERT INTO `dd_district` VALUES (1335, 1326, '0794', '361028', '资溪县', '117.060263', '27.706101', 'district');
INSERT INTO `dd_district` VALUES (1336, 1326, '0794', '361029', '东乡县', '116.603559', '28.247696', 'district');
INSERT INTO `dd_district` VALUES (1337, 1326, '0794', '361030', '广昌县', '116.335686', '26.843684', 'district');
INSERT INTO `dd_district` VALUES (1338, 1239, '0793', '361100', '上饶市', '117.943433', '28.454863', 'city');
INSERT INTO `dd_district` VALUES (1339, 1338, '0793', '361102', '信州区', '117.966268', '28.431006', 'district');
INSERT INTO `dd_district` VALUES (1340, 1338, '0793', '361103', '广丰区', '118.19124', '28.436285', 'district');
INSERT INTO `dd_district` VALUES (1341, 1338, '0793', '361121', '上饶县', '117.907849', '28.448982', 'district');
INSERT INTO `dd_district` VALUES (1342, 1338, '0793', '361123', '玉山县', '118.244769', '28.682309', 'district');
INSERT INTO `dd_district` VALUES (1343, 1338, '0793', '361124', '铅山县', '117.709659', '28.315664', 'district');
INSERT INTO `dd_district` VALUES (1344, 1338, '0793', '361125', '横峰县', '117.596452', '28.407117', 'district');
INSERT INTO `dd_district` VALUES (1345, 1338, '0793', '361126', '弋阳县', '117.449588', '28.378044', 'district');
INSERT INTO `dd_district` VALUES (1346, 1338, '0793', '361127', '余干县', '116.695646', '28.702302', 'district');
INSERT INTO `dd_district` VALUES (1347, 1338, '0793', '361128', '鄱阳县', '116.70359', '29.004847', 'district');
INSERT INTO `dd_district` VALUES (1348, 1338, '0793', '361129', '万年县', '117.058445', '28.694582', 'district');
INSERT INTO `dd_district` VALUES (1349, 1338, '0793', '361130', '婺源县', '117.861797', '29.248085', 'district');
INSERT INTO `dd_district` VALUES (1350, 1338, '0793', '361181', '德兴市', '117.578713', '28.946464', 'district');
INSERT INTO `dd_district` VALUES (1351, 1, '0', '370000', '山东省', '117.019915', '36.671156', 'province');
INSERT INTO `dd_district` VALUES (1352, 1351, '0531', '370100', '济南市', '117.120098', '36.6512', 'city');
INSERT INTO `dd_district` VALUES (1353, 1352, '0531', '370102', '历下区', '117.076441', '36.666465', 'district');
INSERT INTO `dd_district` VALUES (1354, 1352, '0531', '370103', '市中区', '116.997845', '36.651335', 'district');
INSERT INTO `dd_district` VALUES (1355, 1352, '0531', '370104', '槐荫区', '116.901224', '36.651441', 'district');
INSERT INTO `dd_district` VALUES (1356, 1352, '0531', '370105', '天桥区', '116.987153', '36.678589', 'district');
INSERT INTO `dd_district` VALUES (1357, 1352, '0531', '370112', '历城区', '117.06523', '36.680259', 'district');
INSERT INTO `dd_district` VALUES (1358, 1352, '0531', '370113', '长清区', '116.751843', '36.55371', 'district');
INSERT INTO `dd_district` VALUES (1359, 1352, '0531', '370124', '平阴县', '116.456006', '36.289251', 'district');
INSERT INTO `dd_district` VALUES (1360, 1352, '0531', '370125', '济阳县', '117.173524', '36.978537', 'district');
INSERT INTO `dd_district` VALUES (1361, 1352, '0531', '370126', '商河县', '117.157232', '37.309041', 'district');
INSERT INTO `dd_district` VALUES (1362, 1352, '0531', '370181', '章丘区', '117.526228', '36.681258', 'district');
INSERT INTO `dd_district` VALUES (1363, 1351, '0532', '370200', '青岛市', '120.382621', '36.067131', 'city');
INSERT INTO `dd_district` VALUES (1364, 1363, '0532', '370202', '市南区', '120.412392', '36.075651', 'district');
INSERT INTO `dd_district` VALUES (1365, 1363, '0532', '370203', '市北区', '120.374701', '36.0876', 'district');
INSERT INTO `dd_district` VALUES (1366, 1363, '0532', '370211', '黄岛区', '120.198055', '35.960933', 'district');
INSERT INTO `dd_district` VALUES (1367, 1363, '0532', '370212', '崂山区', '120.468956', '36.107538', 'district');
INSERT INTO `dd_district` VALUES (1368, 1363, '0532', '370213', '李沧区', '120.432922', '36.145519', 'district');
INSERT INTO `dd_district` VALUES (1369, 1363, '0532', '370214', '城阳区', '120.396256', '36.307559', 'district');
INSERT INTO `dd_district` VALUES (1370, 1363, '0532', '370281', '胶州市', '120.033382', '36.26468', 'district');
INSERT INTO `dd_district` VALUES (1371, 1363, '0532', '370282', '即墨市', '120.447158', '36.389408', 'district');
INSERT INTO `dd_district` VALUES (1372, 1363, '0532', '370283', '平度市', '119.98842', '36.776357', 'district');
INSERT INTO `dd_district` VALUES (1373, 1363, '0532', '370285', '莱西市', '120.51769', '36.889084', 'district');
INSERT INTO `dd_district` VALUES (1374, 1351, '0533', '370300', '淄博市', '118.055019', '36.813546', 'city');
INSERT INTO `dd_district` VALUES (1375, 1374, '0533', '370302', '淄川区', '117.966723', '36.643452', 'district');
INSERT INTO `dd_district` VALUES (1376, 1374, '0533', '370303', '张店区', '118.017938', '36.806669', 'district');
INSERT INTO `dd_district` VALUES (1377, 1374, '0533', '370304', '博山区', '117.861851', '36.494701', 'district');
INSERT INTO `dd_district` VALUES (1378, 1374, '0533', '370305', '临淄区', '118.309118', '36.826981', 'district');
INSERT INTO `dd_district` VALUES (1379, 1374, '0533', '370306', '周村区', '117.869886', '36.803072', 'district');
INSERT INTO `dd_district` VALUES (1380, 1374, '0533', '370321', '桓台县', '118.097922', '36.959804', 'district');
INSERT INTO `dd_district` VALUES (1381, 1374, '0533', '370322', '高青县', '117.826924', '37.170979', 'district');
INSERT INTO `dd_district` VALUES (1382, 1374, '0533', '370323', '沂源县', '118.170855', '36.185038', 'district');
INSERT INTO `dd_district` VALUES (1383, 1351, '0632', '370400', '枣庄市', '117.323725', '34.810488', 'city');
INSERT INTO `dd_district` VALUES (1384, 1383, '0632', '370402', '市中区', '117.556139', '34.863554', 'district');
INSERT INTO `dd_district` VALUES (1385, 1383, '0632', '370403', '薛城区', '117.263164', '34.795062', 'district');
INSERT INTO `dd_district` VALUES (1386, 1383, '0632', '370404', '峄城区', '117.590816', '34.773263', 'district');
INSERT INTO `dd_district` VALUES (1387, 1383, '0632', '370405', '台儿庄区', '117.734414', '34.56244', 'district');
INSERT INTO `dd_district` VALUES (1388, 1383, '0632', '370406', '山亭区', '117.461517', '35.099528', 'district');
INSERT INTO `dd_district` VALUES (1389, 1383, '0632', '370481', '滕州市', '117.165824', '35.114155', 'district');
INSERT INTO `dd_district` VALUES (1390, 1351, '0546', '370500', '东营市', '118.674614', '37.433963', 'city');
INSERT INTO `dd_district` VALUES (1391, 1390, '0546', '370502', '东营区', '118.582184', '37.448964', 'district');
INSERT INTO `dd_district` VALUES (1392, 1390, '0546', '370503', '河口区', '118.525543', '37.886162', 'district');
INSERT INTO `dd_district` VALUES (1393, 1390, '0546', '370505', '垦利区', '118.575228', '37.573054', 'district');
INSERT INTO `dd_district` VALUES (1394, 1390, '0546', '370522', '利津县', '118.255287', '37.490328', 'district');
INSERT INTO `dd_district` VALUES (1395, 1390, '0546', '370523', '广饶县', '118.407107', '37.053555', 'district');
INSERT INTO `dd_district` VALUES (1396, 1351, '0535', '370600', '烟台市', '121.447852', '37.464539', 'city');
INSERT INTO `dd_district` VALUES (1397, 1396, '0535', '370602', '芝罘区', '121.400445', '37.541475', 'district');
INSERT INTO `dd_district` VALUES (1398, 1396, '0535', '370611', '福山区', '121.267741', '37.498246', 'district');
INSERT INTO `dd_district` VALUES (1399, 1396, '0535', '370612', '牟平区', '121.600455', '37.387061', 'district');
INSERT INTO `dd_district` VALUES (1400, 1396, '0535', '370613', '莱山区', '121.445301', '37.511291', 'district');
INSERT INTO `dd_district` VALUES (1401, 1396, '0535', '370634', '长岛县', '120.73658', '37.921368', 'district');
INSERT INTO `dd_district` VALUES (1402, 1396, '0535', '370681', '龙口市', '120.477813', '37.646107', 'district');
INSERT INTO `dd_district` VALUES (1403, 1396, '0535', '370682', '莱阳市', '120.711672', '36.978941', 'district');
INSERT INTO `dd_district` VALUES (1404, 1396, '0535', '370683', '莱州市', '119.942274', '37.177129', 'district');
INSERT INTO `dd_district` VALUES (1405, 1396, '0535', '370684', '蓬莱市', '120.758848', '37.810661', 'district');
INSERT INTO `dd_district` VALUES (1406, 1396, '0535', '370685', '招远市', '120.434071', '37.355469', 'district');
INSERT INTO `dd_district` VALUES (1407, 1396, '0535', '370686', '栖霞市', '120.849675', '37.335123', 'district');
INSERT INTO `dd_district` VALUES (1408, 1396, '0535', '370687', '海阳市', '121.173793', '36.688', 'district');
INSERT INTO `dd_district` VALUES (1409, 1351, '0536', '370700', '潍坊市', '119.161748', '36.706962', 'city');
INSERT INTO `dd_district` VALUES (1410, 1409, '0536', '370702', '潍城区', '119.024835', '36.7281', 'district');
INSERT INTO `dd_district` VALUES (1411, 1409, '0536', '370703', '寒亭区', '119.211157', '36.755623', 'district');
INSERT INTO `dd_district` VALUES (1412, 1409, '0536', '370704', '坊子区', '119.166485', '36.654448', 'district');
INSERT INTO `dd_district` VALUES (1413, 1409, '0536', '370705', '奎文区', '119.132482', '36.70759', 'district');
INSERT INTO `dd_district` VALUES (1414, 1409, '0536', '370724', '临朐县', '118.542982', '36.512506', 'district');
INSERT INTO `dd_district` VALUES (1415, 1409, '0536', '370725', '昌乐县', '118.829992', '36.706964', 'district');
INSERT INTO `dd_district` VALUES (1416, 1409, '0536', '370781', '青州市', '118.479654', '36.684789', 'district');
INSERT INTO `dd_district` VALUES (1417, 1409, '0536', '370782', '诸城市', '119.410103', '35.995654', 'district');
INSERT INTO `dd_district` VALUES (1418, 1409, '0536', '370783', '寿光市', '118.790739', '36.85576', 'district');
INSERT INTO `dd_district` VALUES (1419, 1409, '0536', '370784', '安丘市', '119.218978', '36.478493', 'district');
INSERT INTO `dd_district` VALUES (1420, 1409, '0536', '370785', '高密市', '119.755597', '36.382594', 'district');
INSERT INTO `dd_district` VALUES (1421, 1409, '0536', '370786', '昌邑市', '119.403069', '36.843319', 'district');
INSERT INTO `dd_district` VALUES (1422, 1351, '0537', '370800', '济宁市', '116.587282', '35.414982', 'city');
INSERT INTO `dd_district` VALUES (1423, 1422, '0537', '370811', '任城区', '116.606103', '35.444028', 'district');
INSERT INTO `dd_district` VALUES (1424, 1422, '0537', '370812', '兖州区', '116.783833', '35.553144', 'district');
INSERT INTO `dd_district` VALUES (1425, 1422, '0537', '370826', '微山县', '117.128827', '34.806554', 'district');
INSERT INTO `dd_district` VALUES (1426, 1422, '0537', '370827', '鱼台县', '116.650608', '35.012749', 'district');
INSERT INTO `dd_district` VALUES (1427, 1422, '0537', '370828', '金乡县', '116.311532', '35.066619', 'district');
INSERT INTO `dd_district` VALUES (1428, 1422, '0537', '370829', '嘉祥县', '116.342449', '35.408824', 'district');
INSERT INTO `dd_district` VALUES (1429, 1422, '0537', '370830', '汶上县', '116.49708', '35.712298', 'district');
INSERT INTO `dd_district` VALUES (1430, 1422, '0537', '370831', '泗水县', '117.251195', '35.664323', 'district');
INSERT INTO `dd_district` VALUES (1431, 1422, '0537', '370832', '梁山县', '116.096044', '35.802306', 'district');
INSERT INTO `dd_district` VALUES (1432, 1422, '0537', '370881', '曲阜市', '116.986526', '35.581108', 'district');
INSERT INTO `dd_district` VALUES (1433, 1422, '0537', '370883', '邹城市', '117.007453', '35.40268', 'district');
INSERT INTO `dd_district` VALUES (1434, 1351, '0538', '370900', '泰安市', '117.087614', '36.200252', 'city');
INSERT INTO `dd_district` VALUES (1435, 1434, '0538', '370902', '泰山区', '117.135354', '36.192083', 'district');
INSERT INTO `dd_district` VALUES (1436, 1434, '0538', '370911', '岱岳区', '117.041581', '36.187989', 'district');
INSERT INTO `dd_district` VALUES (1437, 1434, '0538', '370921', '宁阳县', '116.805796', '35.758786', 'district');
INSERT INTO `dd_district` VALUES (1438, 1434, '0538', '370923', '东平县', '116.470304', '35.937102', 'district');
INSERT INTO `dd_district` VALUES (1439, 1434, '0538', '370982', '新泰市', '117.767952', '35.909032', 'district');
INSERT INTO `dd_district` VALUES (1440, 1434, '0538', '370983', '肥城市', '116.768358', '36.182571', 'district');
INSERT INTO `dd_district` VALUES (1441, 1351, '0631', '371000', '威海市', '122.120282', '37.513412', 'city');
INSERT INTO `dd_district` VALUES (1442, 1441, '0631', '371002', '环翠区', '122.123443', '37.50199', 'district');
INSERT INTO `dd_district` VALUES (1443, 1441, '0631', '371003', '文登区', '122.05767', '37.193735', 'district');
INSERT INTO `dd_district` VALUES (1444, 1441, '0631', '371082', '荣成市', '122.486657', '37.16516', 'district');
INSERT INTO `dd_district` VALUES (1445, 1441, '0631', '371083', '乳山市', '121.539764', '36.919816', 'district');
INSERT INTO `dd_district` VALUES (1446, 1351, '0633', '371100', '日照市', '119.526925', '35.416734', 'city');
INSERT INTO `dd_district` VALUES (1447, 1446, '0633', '371102', '东港区', '119.462267', '35.42548', 'district');
INSERT INTO `dd_district` VALUES (1448, 1446, '0633', '371103', '岚山区', '119.318928', '35.121884', 'district');
INSERT INTO `dd_district` VALUES (1449, 1446, '0633', '371121', '五莲县', '119.213619', '35.760228', 'district');
INSERT INTO `dd_district` VALUES (1450, 1446, '0633', '371122', '莒县', '118.837063', '35.579868', 'district');
INSERT INTO `dd_district` VALUES (1451, 1351, '0634', '371200', '莱芜市', '117.676723', '36.213813', 'city');
INSERT INTO `dd_district` VALUES (1452, 1451, '0634', '371202', '莱城区', '117.659884', '36.203179', 'district');
INSERT INTO `dd_district` VALUES (1453, 1451, '0634', '371203', '钢城区', '117.811354', '36.058572', 'district');
INSERT INTO `dd_district` VALUES (1454, 1351, '0539', '371300', '临沂市', '118.356414', '35.104673', 'city');
INSERT INTO `dd_district` VALUES (1455, 1454, '0539', '371302', '兰山区', '118.347842', '35.051804', 'district');
INSERT INTO `dd_district` VALUES (1456, 1454, '0539', '371311', '罗庄区', '118.284786', '34.996741', 'district');
INSERT INTO `dd_district` VALUES (1457, 1454, '0539', '371312', '河东区', '118.402893', '35.089916', 'district');
INSERT INTO `dd_district` VALUES (1458, 1454, '0539', '371321', '沂南县', '118.465221', '35.550217', 'district');
INSERT INTO `dd_district` VALUES (1459, 1454, '0539', '371322', '郯城县', '118.367215', '34.613586', 'district');
INSERT INTO `dd_district` VALUES (1460, 1454, '0539', '371323', '沂水县', '118.627917', '35.79045', 'district');
INSERT INTO `dd_district` VALUES (1461, 1454, '0539', '371324', '兰陵县', '118.07065', '34.857149', 'district');
INSERT INTO `dd_district` VALUES (1462, 1454, '0539', '371325', '费县', '117.977325', '35.26596', 'district');
INSERT INTO `dd_district` VALUES (1463, 1454, '0539', '371326', '平邑县', '117.640352', '35.505943', 'district');
INSERT INTO `dd_district` VALUES (1464, 1454, '0539', '371327', '莒南县', '118.835163', '35.174846', 'district');
INSERT INTO `dd_district` VALUES (1465, 1454, '0539', '371328', '蒙阴县', '117.953621', '35.719396', 'district');
INSERT INTO `dd_district` VALUES (1466, 1454, '0539', '371329', '临沭县', '118.650781', '34.919851', 'district');
INSERT INTO `dd_district` VALUES (1467, 1351, '0534', '371400', '德州市', '116.359381', '37.436657', 'city');
INSERT INTO `dd_district` VALUES (1468, 1467, '0534', '371402', '德城区', '116.29947', '37.450804', 'district');
INSERT INTO `dd_district` VALUES (1469, 1467, '0534', '371403', '陵城区', '116.576092', '37.335794', 'district');
INSERT INTO `dd_district` VALUES (1470, 1467, '0534', '371422', '宁津县', '116.800306', '37.652189', 'district');
INSERT INTO `dd_district` VALUES (1471, 1467, '0534', '371423', '庆云县', '117.385256', '37.775349', 'district');
INSERT INTO `dd_district` VALUES (1472, 1467, '0534', '371424', '临邑县', '116.866799', '37.189797', 'district');
INSERT INTO `dd_district` VALUES (1473, 1467, '0534', '371425', '齐河县', '116.762893', '36.784158', 'district');
INSERT INTO `dd_district` VALUES (1474, 1467, '0534', '371426', '平原县', '116.434032', '37.165323', 'district');
INSERT INTO `dd_district` VALUES (1475, 1467, '0534', '371427', '夏津县', '116.001726', '36.948371', 'district');
INSERT INTO `dd_district` VALUES (1476, 1467, '0534', '371428', '武城县', '116.069302', '37.213311', 'district');
INSERT INTO `dd_district` VALUES (1477, 1467, '0534', '371481', '乐陵市', '117.231934', '37.729907', 'district');
INSERT INTO `dd_district` VALUES (1478, 1467, '0534', '371482', '禹城市', '116.638327', '36.933812', 'district');
INSERT INTO `dd_district` VALUES (1479, 1351, '0635', '371500', '聊城市', '115.985389', '36.456684', 'city');
INSERT INTO `dd_district` VALUES (1480, 1479, '0635', '371502', '东昌府区', '115.988349', '36.434669', 'district');
INSERT INTO `dd_district` VALUES (1481, 1479, '0635', '371521', '阳谷县', '115.79182', '36.114392', 'district');
INSERT INTO `dd_district` VALUES (1482, 1479, '0635', '371522', '莘县', '115.671191', '36.233598', 'district');
INSERT INTO `dd_district` VALUES (1483, 1479, '0635', '371523', '茌平县', '116.25527', '36.580688', 'district');
INSERT INTO `dd_district` VALUES (1484, 1479, '0635', '371524', '东阿县', '116.247579', '36.334917', 'district');
INSERT INTO `dd_district` VALUES (1485, 1479, '0635', '371525', '冠县', '115.442739', '36.484009', 'district');
INSERT INTO `dd_district` VALUES (1486, 1479, '0635', '371526', '高唐县', '116.23016', '36.846762', 'district');
INSERT INTO `dd_district` VALUES (1487, 1479, '0635', '371581', '临清市', '115.704881', '36.838277', 'district');
INSERT INTO `dd_district` VALUES (1488, 1351, '0543', '371600', '滨州市', '117.970699', '37.38198', 'city');
INSERT INTO `dd_district` VALUES (1489, 1488, '0543', '371602', '滨城区', '118.019326', '37.430724', 'district');
INSERT INTO `dd_district` VALUES (1490, 1488, '0543', '371603', '沾化区', '118.098902', '37.69926', 'district');
INSERT INTO `dd_district` VALUES (1491, 1488, '0543', '371621', '惠民县', '117.509921', '37.489877', 'district');
INSERT INTO `dd_district` VALUES (1492, 1488, '0543', '371622', '阳信县', '117.603339', '37.632433', 'district');
INSERT INTO `dd_district` VALUES (1493, 1488, '0543', '371623', '无棣县', '117.625696', '37.77026', 'district');
INSERT INTO `dd_district` VALUES (1494, 1488, '0543', '371625', '博兴县', '118.110709', '37.15457', 'district');
INSERT INTO `dd_district` VALUES (1495, 1488, '0543', '371626', '邹平县', '117.743109', '36.862989', 'district');
INSERT INTO `dd_district` VALUES (1496, 1351, '0530', '371700', '菏泽市', '115.480656', '35.23375', 'city');
INSERT INTO `dd_district` VALUES (1497, 1496, '0530', '371702', '牡丹区', '115.417826', '35.252512', 'district');
INSERT INTO `dd_district` VALUES (1498, 1496, '0530', '371703', '定陶区', '115.57302', '35.070995', 'district');
INSERT INTO `dd_district` VALUES (1499, 1496, '0530', '371721', '曹县', '115.542328', '34.825508', 'district');
INSERT INTO `dd_district` VALUES (1500, 1496, '0530', '371722', '单县', '116.107428', '34.778808', 'district');
INSERT INTO `dd_district` VALUES (1501, 1496, '0530', '371723', '成武县', '115.889764', '34.952459', 'district');
INSERT INTO `dd_district` VALUES (1502, 1496, '0530', '371724', '巨野县', '116.062394', '35.388925', 'district');
INSERT INTO `dd_district` VALUES (1503, 1496, '0530', '371725', '郓城县', '115.9389', '35.575135', 'district');
INSERT INTO `dd_district` VALUES (1504, 1496, '0530', '371726', '鄄城县', '115.510192', '35.563408', 'district');
INSERT INTO `dd_district` VALUES (1505, 1496, '0530', '371728', '东明县', '115.107404', '35.276162', 'district');
INSERT INTO `dd_district` VALUES (1506, 1, '0', '410000', '河南省', '113.753394', '34.765869', 'province');
INSERT INTO `dd_district` VALUES (1507, 1506, '0371', '410100', '郑州市', '113.625328', '34.746611', 'city');
INSERT INTO `dd_district` VALUES (1508, 1507, '0371', '410102', '中原区', '113.613337', '34.748256', 'district');
INSERT INTO `dd_district` VALUES (1509, 1507, '0371', '410103', '二七区', '113.640211', '34.724114', 'district');
INSERT INTO `dd_district` VALUES (1510, 1507, '0371', '410104', '管城回族区', '113.6775', '34.75429', 'district');
INSERT INTO `dd_district` VALUES (1511, 1507, '0371', '410105', '金水区', '113.660617', '34.800004', 'district');
INSERT INTO `dd_district` VALUES (1512, 1507, '0371', '410106', '上街区', '113.30893', '34.802752', 'district');
INSERT INTO `dd_district` VALUES (1513, 1507, '0371', '410108', '惠济区', '113.6169', '34.867457', 'district');
INSERT INTO `dd_district` VALUES (1514, 1507, '0371', '410122', '中牟县', '113.976253', '34.718936', 'district');
INSERT INTO `dd_district` VALUES (1515, 1507, '0371', '410181', '巩义市', '113.022406', '34.7481', 'district');
INSERT INTO `dd_district` VALUES (1516, 1507, '0371', '410182', '荥阳市', '113.38324', '34.786948', 'district');
INSERT INTO `dd_district` VALUES (1517, 1507, '0371', '410183', '新密市', '113.391087', '34.539376', 'district');
INSERT INTO `dd_district` VALUES (1518, 1507, '0371', '410184', '新郑市', '113.740662', '34.395949', 'district');
INSERT INTO `dd_district` VALUES (1519, 1507, '0371', '410185', '登封市', '113.050581', '34.454443', 'district');
INSERT INTO `dd_district` VALUES (1520, 1506, '0378', '410200', '开封市', '114.307677', '34.797966', 'city');
INSERT INTO `dd_district` VALUES (1521, 1520, '0378', '410202', '龙亭区', '114.356076', '34.815565', 'district');
INSERT INTO `dd_district` VALUES (1522, 1520, '0378', '410203', '顺河回族区', '114.364875', '34.800458', 'district');
INSERT INTO `dd_district` VALUES (1523, 1520, '0378', '410204', '鼓楼区', '114.348306', '34.78856', 'district');
INSERT INTO `dd_district` VALUES (1524, 1520, '0378', '410205', '禹王台区', '114.34817', '34.777104', 'district');
INSERT INTO `dd_district` VALUES (1525, 1520, '0378', '410212', '祥符区', '114.441285', '34.756916', 'district');
INSERT INTO `dd_district` VALUES (1526, 1520, '0378', '410221', '杞县', '114.783139', '34.549174', 'district');
INSERT INTO `dd_district` VALUES (1527, 1520, '0378', '410222', '通许县', '114.467467', '34.480433', 'district');
INSERT INTO `dd_district` VALUES (1528, 1520, '0378', '410223', '尉氏县', '114.193081', '34.411494', 'district');
INSERT INTO `dd_district` VALUES (1529, 1520, '0378', '410225', '兰考县', '114.821348', '34.822211', 'district');
INSERT INTO `dd_district` VALUES (1530, 1506, '0379', '410300', '洛阳市', '112.453926', '34.620202', 'city');
INSERT INTO `dd_district` VALUES (1531, 1530, '0379', '410302', '老城区', '112.469766', '34.6842', 'district');
INSERT INTO `dd_district` VALUES (1532, 1530, '0379', '410303', '西工区', '112.427914', '34.660378', 'district');
INSERT INTO `dd_district` VALUES (1533, 1530, '0379', '410304', '瀍河回族区', '112.500131', '34.679773', 'district');
INSERT INTO `dd_district` VALUES (1534, 1530, '0379', '410305', '涧西区', '112.395756', '34.658033', 'district');
INSERT INTO `dd_district` VALUES (1535, 1530, '0379', '410306', '吉利区', '112.589112', '34.900467', 'district');
INSERT INTO `dd_district` VALUES (1536, 1530, '0379', '410311', '洛龙区', '112.463833', '34.619711', 'district');
INSERT INTO `dd_district` VALUES (1537, 1530, '0379', '410322', '孟津县', '112.445354', '34.825638', 'district');
INSERT INTO `dd_district` VALUES (1538, 1530, '0379', '410323', '新安县', '112.13244', '34.728284', 'district');
INSERT INTO `dd_district` VALUES (1539, 1530, '0379', '410324', '栾川县', '111.615768', '33.785698', 'district');
INSERT INTO `dd_district` VALUES (1540, 1530, '0379', '410325', '嵩县', '112.085634', '34.134516', 'district');
INSERT INTO `dd_district` VALUES (1541, 1530, '0379', '410326', '汝阳县', '112.473139', '34.153939', 'district');
INSERT INTO `dd_district` VALUES (1542, 1530, '0379', '410327', '宜阳县', '112.179238', '34.514644', 'district');
INSERT INTO `dd_district` VALUES (1543, 1530, '0379', '410328', '洛宁县', '111.653111', '34.389197', 'district');
INSERT INTO `dd_district` VALUES (1544, 1530, '0379', '410329', '伊川县', '112.425676', '34.421323', 'district');
INSERT INTO `dd_district` VALUES (1545, 1530, '0379', '410381', '偃师市', '112.789534', '34.72722', 'district');
INSERT INTO `dd_district` VALUES (1546, 1506, '0375', '410400', '平顶山市', '113.192661', '33.766169', 'city');
INSERT INTO `dd_district` VALUES (1547, 1546, '0375', '410402', '新华区', '113.293977', '33.737251', 'district');
INSERT INTO `dd_district` VALUES (1548, 1546, '0375', '410403', '卫东区', '113.335192', '33.734706', 'district');
INSERT INTO `dd_district` VALUES (1549, 1546, '0375', '410404', '石龙区', '112.898818', '33.898713', 'district');
INSERT INTO `dd_district` VALUES (1550, 1546, '0375', '410411', '湛河区', '113.320873', '33.725681', 'district');
INSERT INTO `dd_district` VALUES (1551, 1546, '0375', '410421', '宝丰县', '113.054801', '33.868434', 'district');
INSERT INTO `dd_district` VALUES (1552, 1546, '0375', '410422', '叶县', '113.357239', '33.626731', 'district');
INSERT INTO `dd_district` VALUES (1553, 1546, '0375', '410423', '鲁山县', '112.908202', '33.738293', 'district');
INSERT INTO `dd_district` VALUES (1554, 1546, '0375', '410425', '郏县', '113.212609', '33.971787', 'district');
INSERT INTO `dd_district` VALUES (1555, 1546, '0375', '410481', '舞钢市', '113.516343', '33.314033', 'district');
INSERT INTO `dd_district` VALUES (1556, 1546, '0375', '410482', '汝州市', '112.844517', '34.167029', 'district');
INSERT INTO `dd_district` VALUES (1557, 1506, '0372', '410500', '安阳市', '114.392392', '36.097577', 'city');
INSERT INTO `dd_district` VALUES (1558, 1557, '0372', '410502', '文峰区', '114.357082', '36.090468', 'district');
INSERT INTO `dd_district` VALUES (1559, 1557, '0372', '410503', '北关区', '114.355742', '36.10766', 'district');
INSERT INTO `dd_district` VALUES (1560, 1557, '0372', '410505', '殷都区', '114.303553', '36.10989', 'district');
INSERT INTO `dd_district` VALUES (1561, 1557, '0372', '410506', '龙安区', '114.301331', '36.076225', 'district');
INSERT INTO `dd_district` VALUES (1562, 1557, '0372', '410522', '安阳县', '114.130207', '36.130584', 'district');
INSERT INTO `dd_district` VALUES (1563, 1557, '0372', '410523', '汤阴县', '114.357763', '35.924514', 'district');
INSERT INTO `dd_district` VALUES (1564, 1557, '0372', '410526', '滑县', '114.519311', '35.575417', 'district');
INSERT INTO `dd_district` VALUES (1565, 1557, '0372', '410527', '内黄县', '114.901452', '35.971704', 'district');
INSERT INTO `dd_district` VALUES (1566, 1557, '0372', '410581', '林州市', '113.820129', '36.083046', 'district');
INSERT INTO `dd_district` VALUES (1567, 1506, '0392', '410600', '鹤壁市', '114.297309', '35.748325', 'city');
INSERT INTO `dd_district` VALUES (1568, 1567, '0392', '410602', '鹤山区', '114.163258', '35.954611', 'district');
INSERT INTO `dd_district` VALUES (1569, 1567, '0392', '410603', '山城区', '114.184318', '35.898033', 'district');
INSERT INTO `dd_district` VALUES (1570, 1567, '0392', '410611', '淇滨区', '114.298789', '35.741592', 'district');
INSERT INTO `dd_district` VALUES (1571, 1567, '0392', '410621', '浚县', '114.55091', '35.67636', 'district');
INSERT INTO `dd_district` VALUES (1572, 1567, '0392', '410622', '淇县', '114.208828', '35.622507', 'district');
INSERT INTO `dd_district` VALUES (1573, 1506, '0373', '410700', '新乡市', '113.926763', '35.303704', 'city');
INSERT INTO `dd_district` VALUES (1574, 1573, '0373', '410702', '红旗区', '113.875245', '35.30385', 'district');
INSERT INTO `dd_district` VALUES (1575, 1573, '0373', '410703', '卫滨区', '113.865663', '35.301992', 'district');
INSERT INTO `dd_district` VALUES (1576, 1573, '0373', '410704', '凤泉区', '113.915184', '35.383978', 'district');
INSERT INTO `dd_district` VALUES (1577, 1573, '0373', '410711', '牧野区', '113.908772', '35.315039', 'district');
INSERT INTO `dd_district` VALUES (1578, 1573, '0373', '410721', '新乡县', '113.805205', '35.190836', 'district');
INSERT INTO `dd_district` VALUES (1579, 1573, '0373', '410724', '获嘉县', '113.657433', '35.259808', 'district');
INSERT INTO `dd_district` VALUES (1580, 1573, '0373', '410725', '原阳县', '113.940046', '35.065587', 'district');
INSERT INTO `dd_district` VALUES (1581, 1573, '0373', '410726', '延津县', '114.20509', '35.141889', 'district');
INSERT INTO `dd_district` VALUES (1582, 1573, '0373', '410727', '封丘县', '114.418882', '35.041198', 'district');
INSERT INTO `dd_district` VALUES (1583, 1573, '0373', '410728', '长垣县', '114.668936', '35.201548', 'district');
INSERT INTO `dd_district` VALUES (1584, 1573, '0373', '410781', '卫辉市', '114.064907', '35.398494', 'district');
INSERT INTO `dd_district` VALUES (1585, 1573, '0373', '410782', '辉县市', '113.805468', '35.462312', 'district');
INSERT INTO `dd_district` VALUES (1586, 1506, '0391', '410800', '焦作市', '113.241823', '35.215893', 'city');
INSERT INTO `dd_district` VALUES (1587, 1586, '0391', '410802', '解放区', '113.230816', '35.240282', 'district');
INSERT INTO `dd_district` VALUES (1588, 1586, '0391', '410803', '中站区', '113.182946', '35.236819', 'district');
INSERT INTO `dd_district` VALUES (1589, 1586, '0391', '410804', '马村区', '113.322332', '35.256108', 'district');
INSERT INTO `dd_district` VALUES (1590, 1586, '0391', '410811', '山阳区', '113.254881', '35.214507', 'district');
INSERT INTO `dd_district` VALUES (1591, 1586, '0391', '410821', '修武县', '113.447755', '35.223514', 'district');
INSERT INTO `dd_district` VALUES (1592, 1586, '0391', '410822', '博爱县', '113.064379', '35.171045', 'district');
INSERT INTO `dd_district` VALUES (1593, 1586, '0391', '410823', '武陟县', '113.401679', '35.099378', 'district');
INSERT INTO `dd_district` VALUES (1594, 1586, '0391', '410825', '温县', '113.08053', '34.940189', 'district');
INSERT INTO `dd_district` VALUES (1595, 1586, '0391', '410882', '沁阳市', '112.950716', '35.087539', 'district');
INSERT INTO `dd_district` VALUES (1596, 1586, '0391', '410883', '孟州市', '112.791401', '34.907315', 'district');
INSERT INTO `dd_district` VALUES (1597, 1506, '0393', '410900', '濮阳市', '115.029216', '35.761829', 'city');
INSERT INTO `dd_district` VALUES (1598, 1597, '0393', '410902', '华龙区', '115.074151', '35.777346', 'district');
INSERT INTO `dd_district` VALUES (1599, 1597, '0393', '410922', '清丰县', '115.104389', '35.88518', 'district');
INSERT INTO `dd_district` VALUES (1600, 1597, '0393', '410923', '南乐县', '115.204675', '36.069476', 'district');
INSERT INTO `dd_district` VALUES (1601, 1597, '0393', '410926', '范县', '115.504201', '35.851906', 'district');
INSERT INTO `dd_district` VALUES (1602, 1597, '0393', '410927', '台前县', '115.871906', '35.96939', 'district');
INSERT INTO `dd_district` VALUES (1603, 1597, '0393', '410928', '濮阳县', '115.029078', '35.712193', 'district');
INSERT INTO `dd_district` VALUES (1604, 1506, '0374', '411000', '许昌市', '113.852454', '34.035771', 'city');
INSERT INTO `dd_district` VALUES (1605, 1604, '0374', '411002', '魏都区', '113.822647', '34.025341', 'district');
INSERT INTO `dd_district` VALUES (1606, 1604, '0374', '411023', '建安区', '113.822983', '34.12466', 'district');
INSERT INTO `dd_district` VALUES (1607, 1604, '0374', '411024', '鄢陵县', '114.177399', '34.102332', 'district');
INSERT INTO `dd_district` VALUES (1608, 1604, '0374', '411025', '襄城县', '113.505874', '33.851459', 'district');
INSERT INTO `dd_district` VALUES (1609, 1604, '0374', '411081', '禹州市', '113.488478', '34.140701', 'district');
INSERT INTO `dd_district` VALUES (1610, 1604, '0374', '411082', '长葛市', '113.813714', '34.19592', 'district');
INSERT INTO `dd_district` VALUES (1611, 1506, '0395', '411100', '漯河市', '114.016536', '33.580873', 'city');
INSERT INTO `dd_district` VALUES (1612, 1611, '0395', '411102', '源汇区', '114.017948', '33.565441', 'district');
INSERT INTO `dd_district` VALUES (1613, 1611, '0395', '411103', '郾城区', '114.006943', '33.587409', 'district');
INSERT INTO `dd_district` VALUES (1614, 1611, '0395', '411104', '召陵区', '114.093902', '33.586565', 'district');
INSERT INTO `dd_district` VALUES (1615, 1611, '0395', '411121', '舞阳县', '113.609286', '33.437876', 'district');
INSERT INTO `dd_district` VALUES (1616, 1611, '0395', '411122', '临颍县', '113.931261', '33.828042', 'district');
INSERT INTO `dd_district` VALUES (1617, 1506, '0398', '411200', '三门峡市', '111.200367', '34.772792', 'city');
INSERT INTO `dd_district` VALUES (1618, 1617, '0398', '411202', '湖滨区', '111.188397', '34.770886', 'district');
INSERT INTO `dd_district` VALUES (1619, 1617, '0398', '411203', '陕州区', '111.103563', '34.720547', 'district');
INSERT INTO `dd_district` VALUES (1620, 1617, '0398', '411221', '渑池县', '111.761797', '34.767951', 'district');
INSERT INTO `dd_district` VALUES (1621, 1617, '0398', '411224', '卢氏县', '111.047858', '34.054324', 'district');
INSERT INTO `dd_district` VALUES (1622, 1617, '0398', '411281', '义马市', '111.87448', '34.7474', 'district');
INSERT INTO `dd_district` VALUES (1623, 1617, '0398', '411282', '灵宝市', '110.89422', '34.516828', 'district');
INSERT INTO `dd_district` VALUES (1624, 1506, '0377', '411300', '南阳市', '112.528308', '32.990664', 'city');
INSERT INTO `dd_district` VALUES (1625, 1624, '0377', '411302', '宛城区', '112.539558', '33.003784', 'district');
INSERT INTO `dd_district` VALUES (1626, 1624, '0377', '411303', '卧龙区', '112.528789', '32.989877', 'district');
INSERT INTO `dd_district` VALUES (1627, 1624, '0377', '411321', '南召县', '112.429133', '33.489877', 'district');
INSERT INTO `dd_district` VALUES (1628, 1624, '0377', '411322', '方城县', '113.012494', '33.254391', 'district');
INSERT INTO `dd_district` VALUES (1629, 1624, '0377', '411323', '西峡县', '111.47353', '33.307294', 'district');
INSERT INTO `dd_district` VALUES (1630, 1624, '0377', '411324', '镇平县', '112.234697', '33.03411', 'district');
INSERT INTO `dd_district` VALUES (1631, 1624, '0377', '411325', '内乡县', '111.849392', '33.044864', 'district');
INSERT INTO `dd_district` VALUES (1632, 1624, '0377', '411326', '淅川县', '111.490964', '33.13782', 'district');
INSERT INTO `dd_district` VALUES (1633, 1624, '0377', '411327', '社旗县', '112.948245', '33.056109', 'district');
INSERT INTO `dd_district` VALUES (1634, 1624, '0377', '411328', '唐河县', '112.807636', '32.681335', 'district');
INSERT INTO `dd_district` VALUES (1635, 1624, '0377', '411329', '新野县', '112.360026', '32.520805', 'district');
INSERT INTO `dd_district` VALUES (1636, 1624, '0377', '411330', '桐柏县', '113.428287', '32.380073', 'district');
INSERT INTO `dd_district` VALUES (1637, 1624, '0377', '411381', '邓州市', '112.087493', '32.68758', 'district');
INSERT INTO `dd_district` VALUES (1638, 1506, '0370', '411400', '商丘市', '115.656339', '34.414961', 'city');
INSERT INTO `dd_district` VALUES (1639, 1638, '0370', '411402', '梁园区', '115.613965', '34.443893', 'district');
INSERT INTO `dd_district` VALUES (1640, 1638, '0370', '411403', '睢阳区', '115.653301', '34.388389', 'district');
INSERT INTO `dd_district` VALUES (1641, 1638, '0370', '411421', '民权县', '115.173971', '34.648191', 'district');
INSERT INTO `dd_district` VALUES (1642, 1638, '0370', '411422', '睢县', '115.071879', '34.445655', 'district');
INSERT INTO `dd_district` VALUES (1643, 1638, '0370', '411423', '宁陵县', '115.313743', '34.460399', 'district');
INSERT INTO `dd_district` VALUES (1644, 1638, '0370', '411424', '柘城县', '115.305708', '34.091082', 'district');
INSERT INTO `dd_district` VALUES (1645, 1638, '0370', '411425', '虞城县', '115.828319', '34.400835', 'district');
INSERT INTO `dd_district` VALUES (1646, 1638, '0370', '411426', '夏邑县', '116.131447', '34.237553', 'district');
INSERT INTO `dd_district` VALUES (1647, 1638, '0370', '411481', '永城市', '116.4495', '33.929291', 'district');
INSERT INTO `dd_district` VALUES (1648, 1506, '0376', '411500', '信阳市', '114.091193', '32.147679', 'city');
INSERT INTO `dd_district` VALUES (1649, 1648, '0376', '411502', '浉河区', '114.058713', '32.116803', 'district');
INSERT INTO `dd_district` VALUES (1650, 1648, '0376', '411503', '平桥区', '114.125656', '32.101031', 'district');
INSERT INTO `dd_district` VALUES (1651, 1648, '0376', '411521', '罗山县', '114.512872', '32.203883', 'district');
INSERT INTO `dd_district` VALUES (1652, 1648, '0376', '411522', '光山县', '114.919152', '32.010002', 'district');
INSERT INTO `dd_district` VALUES (1653, 1648, '0376', '411523', '新县', '114.879239', '31.643918', 'district');
INSERT INTO `dd_district` VALUES (1654, 1648, '0376', '411524', '商城县', '115.406862', '31.798377', 'district');
INSERT INTO `dd_district` VALUES (1655, 1648, '0376', '411525', '固始县', '115.654481', '32.168137', 'district');
INSERT INTO `dd_district` VALUES (1656, 1648, '0376', '411526', '潢川县', '115.051908', '32.131522', 'district');
INSERT INTO `dd_district` VALUES (1657, 1648, '0376', '411527', '淮滨县', '115.419537', '32.473258', 'district');
INSERT INTO `dd_district` VALUES (1658, 1648, '0376', '411528', '息县', '114.740456', '32.342792', 'district');
INSERT INTO `dd_district` VALUES (1659, 1506, '0394', '411600', '周口市', '114.69695', '33.626149', 'city');
INSERT INTO `dd_district` VALUES (1660, 1659, '0394', '411602', '川汇区', '114.650628', '33.647598', 'district');
INSERT INTO `dd_district` VALUES (1661, 1659, '0394', '411621', '扶沟县', '114.394821', '34.059968', 'district');
INSERT INTO `dd_district` VALUES (1662, 1659, '0394', '411622', '西华县', '114.529756', '33.767407', 'district');
INSERT INTO `dd_district` VALUES (1663, 1659, '0394', '411623', '商水县', '114.611651', '33.542138', 'district');
INSERT INTO `dd_district` VALUES (1664, 1659, '0394', '411624', '沈丘县', '115.098583', '33.409369', 'district');
INSERT INTO `dd_district` VALUES (1665, 1659, '0394', '411625', '郸城县', '115.177188', '33.644743', 'district');
INSERT INTO `dd_district` VALUES (1666, 1659, '0394', '411626', '淮阳县', '114.886153', '33.731561', 'district');
INSERT INTO `dd_district` VALUES (1667, 1659, '0394', '411627', '太康县', '114.837888', '34.064463', 'district');
INSERT INTO `dd_district` VALUES (1668, 1659, '0394', '411628', '鹿邑县', '115.484454', '33.86', 'district');
INSERT INTO `dd_district` VALUES (1669, 1659, '0394', '411681', '项城市', '114.875333', '33.465838', 'district');
INSERT INTO `dd_district` VALUES (1670, 1506, '0396', '411700', '驻马店市', '114.022247', '33.012885', 'city');
INSERT INTO `dd_district` VALUES (1671, 1670, '0396', '411702', '驿城区', '113.993914', '32.973054', 'district');
INSERT INTO `dd_district` VALUES (1672, 1670, '0396', '411721', '西平县', '114.021538', '33.387684', 'district');
INSERT INTO `dd_district` VALUES (1673, 1670, '0396', '411722', '上蔡县', '114.264381', '33.262439', 'district');
INSERT INTO `dd_district` VALUES (1674, 1670, '0396', '411723', '平舆县', '114.619159', '32.96271', 'district');
INSERT INTO `dd_district` VALUES (1675, 1670, '0396', '411724', '正阳县', '114.392773', '32.605697', 'district');
INSERT INTO `dd_district` VALUES (1676, 1670, '0396', '411725', '确山县', '114.026429', '32.802064', 'district');
INSERT INTO `dd_district` VALUES (1677, 1670, '0396', '411726', '泌阳县', '113.327144', '32.723975', 'district');
INSERT INTO `dd_district` VALUES (1678, 1670, '0396', '411727', '汝南县', '114.362379', '33.006729', 'district');
INSERT INTO `dd_district` VALUES (1679, 1670, '0396', '411728', '遂平县', '114.013182', '33.145649', 'district');
INSERT INTO `dd_district` VALUES (1680, 1670, '0396', '411729', '新蔡县', '114.96547', '32.744896', 'district');
INSERT INTO `dd_district` VALUES (1681, 1506, '1391', '419001', '济源市', '112.602256', '35.067199', 'city');
INSERT INTO `dd_district` VALUES (1682, 1681, '1391', '419001', '济源市', '112.602256', '35.067199', 'district');
INSERT INTO `dd_district` VALUES (1683, 1, '0', '420000', '湖北省', '114.341745', '30.546557', 'province');
INSERT INTO `dd_district` VALUES (1684, 1683, '027', '420100', '武汉市', '114.305469', '30.593175', 'city');
INSERT INTO `dd_district` VALUES (1685, 1684, '027', '420102', '江岸区', '114.30911', '30.600052', 'district');
INSERT INTO `dd_district` VALUES (1686, 1684, '027', '420103', '江汉区', '114.270867', '30.601475', 'district');
INSERT INTO `dd_district` VALUES (1687, 1684, '027', '420104', '硚口区', '114.21492', '30.582202', 'district');
INSERT INTO `dd_district` VALUES (1688, 1684, '027', '420105', '汉阳区', '114.21861', '30.553983', 'district');
INSERT INTO `dd_district` VALUES (1689, 1684, '027', '420106', '武昌区', '114.31665', '30.554408', 'district');
INSERT INTO `dd_district` VALUES (1690, 1684, '027', '420107', '青山区', '114.384968', '30.640191', 'district');
INSERT INTO `dd_district` VALUES (1691, 1684, '027', '420111', '洪山区', '114.343796', '30.500247', 'district');
INSERT INTO `dd_district` VALUES (1692, 1684, '027', '420112', '东西湖区', '114.137116', '30.619917', 'district');
INSERT INTO `dd_district` VALUES (1693, 1684, '027', '420113', '汉南区', '114.084597', '30.308829', 'district');
INSERT INTO `dd_district` VALUES (1694, 1684, '027', '420114', '蔡甸区', '114.087285', '30.536454', 'district');
INSERT INTO `dd_district` VALUES (1695, 1684, '027', '420115', '江夏区', '114.319097', '30.376308', 'district');
INSERT INTO `dd_district` VALUES (1696, 1684, '027', '420116', '黄陂区', '114.375725', '30.882174', 'district');
INSERT INTO `dd_district` VALUES (1697, 1684, '027', '420117', '新洲区', '114.801096', '30.841425', 'district');
INSERT INTO `dd_district` VALUES (1698, 1683, '0714', '420200', '黄石市', '115.038962', '30.201038', 'city');
INSERT INTO `dd_district` VALUES (1699, 1698, '0714', '420202', '黄石港区', '115.065849', '30.222938', 'district');
INSERT INTO `dd_district` VALUES (1700, 1698, '0714', '420203', '西塞山区', '115.109955', '30.204924', 'district');
INSERT INTO `dd_district` VALUES (1701, 1698, '0714', '420204', '下陆区', '114.961327', '30.173912', 'district');
INSERT INTO `dd_district` VALUES (1702, 1698, '0714', '420205', '铁山区', '114.891605', '30.203118', 'district');
INSERT INTO `dd_district` VALUES (1703, 1698, '0714', '420222', '阳新县', '115.215227', '29.830257', 'district');
INSERT INTO `dd_district` VALUES (1704, 1698, '0714', '420281', '大冶市', '114.980424', '30.096147', 'district');
INSERT INTO `dd_district` VALUES (1705, 1683, '0719', '420300', '十堰市', '110.799291', '32.629462', 'city');
INSERT INTO `dd_district` VALUES (1706, 1705, '0719', '420302', '茅箭区', '110.813719', '32.591904', 'district');
INSERT INTO `dd_district` VALUES (1707, 1705, '0719', '420303', '张湾区', '110.769132', '32.652297', 'district');
INSERT INTO `dd_district` VALUES (1708, 1705, '0719', '420304', '郧阳区', '110.81205', '32.834775', 'district');
INSERT INTO `dd_district` VALUES (1709, 1705, '0719', '420322', '郧西县', '110.425983', '32.993182', 'district');
INSERT INTO `dd_district` VALUES (1710, 1705, '0719', '420323', '竹山县', '110.228747', '32.224808', 'district');
INSERT INTO `dd_district` VALUES (1711, 1705, '0719', '420324', '竹溪县', '109.715304', '32.318255', 'district');
INSERT INTO `dd_district` VALUES (1712, 1705, '0719', '420325', '房县', '110.733181', '32.050378', 'district');
INSERT INTO `dd_district` VALUES (1713, 1705, '0719', '420381', '丹江口市', '111.513127', '32.540157', 'district');
INSERT INTO `dd_district` VALUES (1714, 1683, '0717', '420500', '宜昌市', '111.286445', '30.691865', 'city');
INSERT INTO `dd_district` VALUES (1715, 1714, '0717', '420502', '西陵区', '111.285646', '30.710781', 'district');
INSERT INTO `dd_district` VALUES (1716, 1714, '0717', '420503', '伍家岗区', '111.361037', '30.644334', 'district');
INSERT INTO `dd_district` VALUES (1717, 1714, '0717', '420504', '点军区', '111.268119', '30.693247', 'district');
INSERT INTO `dd_district` VALUES (1718, 1714, '0717', '420505', '猇亭区', '111.43462', '30.530903', 'district');
INSERT INTO `dd_district` VALUES (1719, 1714, '0717', '420506', '夷陵区', '111.32638', '30.770006', 'district');
INSERT INTO `dd_district` VALUES (1720, 1714, '0717', '420525', '远安县', '111.640508', '31.060869', 'district');
INSERT INTO `dd_district` VALUES (1721, 1714, '0717', '420526', '兴山县', '110.746804', '31.348196', 'district');
INSERT INTO `dd_district` VALUES (1722, 1714, '0717', '420527', '秭归县', '110.977711', '30.825897', 'district');
INSERT INTO `dd_district` VALUES (1723, 1714, '0717', '420528', '长阳土家族自治县', '111.207242', '30.472763', 'district');
INSERT INTO `dd_district` VALUES (1724, 1714, '0717', '420529', '五峰土家族自治县', '111.07374', '30.156741', 'district');
INSERT INTO `dd_district` VALUES (1725, 1714, '0717', '420581', '宜都市', '111.450096', '30.378299', 'district');
INSERT INTO `dd_district` VALUES (1726, 1714, '0717', '420582', '当阳市', '111.788312', '30.821266', 'district');
INSERT INTO `dd_district` VALUES (1727, 1714, '0717', '420583', '枝江市', '111.76053', '30.42594', 'district');
INSERT INTO `dd_district` VALUES (1728, 1683, '0710', '420600', '襄阳市', '112.122426', '32.009016', 'city');
INSERT INTO `dd_district` VALUES (1729, 1728, '0710', '420602', '襄城区', '112.134052', '32.010366', 'district');
INSERT INTO `dd_district` VALUES (1730, 1728, '0710', '420606', '樊城区', '112.135684', '32.044832', 'district');
INSERT INTO `dd_district` VALUES (1731, 1728, '0710', '420607', '襄州区', '112.211982', '32.087127', 'district');
INSERT INTO `dd_district` VALUES (1732, 1728, '0710', '420624', '南漳县', '111.838905', '31.774636', 'district');
INSERT INTO `dd_district` VALUES (1733, 1728, '0710', '420625', '谷城县', '111.652982', '32.263849', 'district');
INSERT INTO `dd_district` VALUES (1734, 1728, '0710', '420626', '保康县', '111.261308', '31.87831', 'district');
INSERT INTO `dd_district` VALUES (1735, 1728, '0710', '420682', '老河口市', '111.683861', '32.359068', 'district');
INSERT INTO `dd_district` VALUES (1736, 1728, '0710', '420683', '枣阳市', '112.771959', '32.128818', 'district');
INSERT INTO `dd_district` VALUES (1737, 1728, '0710', '420684', '宜城市', '112.257788', '31.719806', 'district');
INSERT INTO `dd_district` VALUES (1738, 1683, '0711', '420700', '鄂州市', '114.894935', '30.391141', 'city');
INSERT INTO `dd_district` VALUES (1739, 1738, '0711', '420702', '梁子湖区', '114.684731', '30.100141', 'district');
INSERT INTO `dd_district` VALUES (1740, 1738, '0711', '420703', '华容区', '114.729878', '30.534309', 'district');
INSERT INTO `dd_district` VALUES (1741, 1738, '0711', '420704', '鄂城区', '114.891586', '30.400651', 'district');
INSERT INTO `dd_district` VALUES (1742, 1683, '0724', '420800', '荆门市', '112.199427', '31.035395', 'city');
INSERT INTO `dd_district` VALUES (1743, 1742, '0724', '420802', '东宝区', '112.201493', '31.051852', 'district');
INSERT INTO `dd_district` VALUES (1744, 1742, '0724', '420804', '掇刀区', '112.207962', '30.973451', 'district');
INSERT INTO `dd_district` VALUES (1745, 1742, '0724', '420821', '京山县', '113.119566', '31.018457', 'district');
INSERT INTO `dd_district` VALUES (1746, 1742, '0724', '420822', '沙洋县', '112.588581', '30.709221', 'district');
INSERT INTO `dd_district` VALUES (1747, 1742, '0724', '420881', '钟祥市', '112.58812', '31.167819', 'district');
INSERT INTO `dd_district` VALUES (1748, 1683, '0712', '420900', '孝感市', '113.957037', '30.917766', 'city');
INSERT INTO `dd_district` VALUES (1749, 1748, '0712', '420902', '孝南区', '113.910705', '30.916812', 'district');
INSERT INTO `dd_district` VALUES (1750, 1748, '0712', '420921', '孝昌县', '113.998009', '31.258159', 'district');
INSERT INTO `dd_district` VALUES (1751, 1748, '0712', '420922', '大悟县', '114.127022', '31.561164', 'district');
INSERT INTO `dd_district` VALUES (1752, 1748, '0712', '420923', '云梦县', '113.753554', '31.020983', 'district');
INSERT INTO `dd_district` VALUES (1753, 1748, '0712', '420981', '应城市', '113.572707', '30.92837', 'district');
INSERT INTO `dd_district` VALUES (1754, 1748, '0712', '420982', '安陆市', '113.688941', '31.25561', 'district');
INSERT INTO `dd_district` VALUES (1755, 1748, '0712', '420984', '汉川市', '113.839149', '30.661243', 'district');
INSERT INTO `dd_district` VALUES (1756, 1683, '0716', '421000', '荆州市', '112.239746', '30.335184', 'city');
INSERT INTO `dd_district` VALUES (1757, 1756, '0716', '421002', '沙市区', '112.25193', '30.326009', 'district');
INSERT INTO `dd_district` VALUES (1758, 1756, '0716', '421003', '荆州区', '112.190185', '30.352853', 'district');
INSERT INTO `dd_district` VALUES (1759, 1756, '0716', '421022', '公安县', '112.229648', '30.058336', 'district');
INSERT INTO `dd_district` VALUES (1760, 1756, '0716', '421023', '监利县', '112.904788', '29.840179', 'district');
INSERT INTO `dd_district` VALUES (1761, 1756, '0716', '421024', '江陵县', '112.424664', '30.041822', 'district');
INSERT INTO `dd_district` VALUES (1762, 1756, '0716', '421081', '石首市', '112.425454', '29.720938', 'district');
INSERT INTO `dd_district` VALUES (1763, 1756, '0716', '421083', '洪湖市', '113.475801', '29.826916', 'district');
INSERT INTO `dd_district` VALUES (1764, 1756, '0716', '421087', '松滋市', '111.756781', '30.174529', 'district');
INSERT INTO `dd_district` VALUES (1765, 1683, '0713', '421100', '黄冈市', '114.872199', '30.453667', 'city');
INSERT INTO `dd_district` VALUES (1766, 1765, '0713', '421102', '黄州区', '114.880104', '30.434354', 'district');
INSERT INTO `dd_district` VALUES (1767, 1765, '0713', '421121', '团风县', '114.872191', '30.643569', 'district');
INSERT INTO `dd_district` VALUES (1768, 1765, '0713', '421122', '红安县', '114.618236', '31.288153', 'district');
INSERT INTO `dd_district` VALUES (1769, 1765, '0713', '421123', '罗田县', '115.399222', '30.78429', 'district');
INSERT INTO `dd_district` VALUES (1770, 1765, '0713', '421124', '英山县', '115.681359', '30.735157', 'district');
INSERT INTO `dd_district` VALUES (1771, 1765, '0713', '421125', '浠水县', '115.265355', '30.452115', 'district');
INSERT INTO `dd_district` VALUES (1772, 1765, '0713', '421126', '蕲春县', '115.437007', '30.225964', 'district');
INSERT INTO `dd_district` VALUES (1773, 1765, '0713', '421127', '黄梅县', '115.944219', '30.070453', 'district');
INSERT INTO `dd_district` VALUES (1774, 1765, '0713', '421181', '麻城市', '115.008163', '31.172739', 'district');
INSERT INTO `dd_district` VALUES (1775, 1765, '0713', '421182', '武穴市', '115.561217', '29.844107', 'district');
INSERT INTO `dd_district` VALUES (1776, 1683, '0715', '421200', '咸宁市', '114.322616', '29.841362', 'city');
INSERT INTO `dd_district` VALUES (1777, 1776, '0715', '421202', '咸安区', '114.298711', '29.852891', 'district');
INSERT INTO `dd_district` VALUES (1778, 1776, '0715', '421221', '嘉鱼县', '113.939271', '29.970676', 'district');
INSERT INTO `dd_district` VALUES (1779, 1776, '0715', '421222', '通城县', '113.816966', '29.245269', 'district');
INSERT INTO `dd_district` VALUES (1780, 1776, '0715', '421223', '崇阳县', '114.039523', '29.556688', 'district');
INSERT INTO `dd_district` VALUES (1781, 1776, '0715', '421224', '通山县', '114.482622', '29.606372', 'district');
INSERT INTO `dd_district` VALUES (1782, 1776, '0715', '421281', '赤壁市', '113.90038', '29.725184', 'district');
INSERT INTO `dd_district` VALUES (1783, 1683, '0722', '421300', '随州市', '113.382515', '31.690191', 'city');
INSERT INTO `dd_district` VALUES (1784, 1783, '0722', '421303', '曾都区', '113.37112', '31.71628', 'district');
INSERT INTO `dd_district` VALUES (1785, 1783, '0722', '421321', '随县', '113.290634', '31.883739', 'district');
INSERT INTO `dd_district` VALUES (1786, 1783, '0722', '421381', '广水市', '113.825889', '31.616853', 'district');
INSERT INTO `dd_district` VALUES (1787, 1683, '0718', '422800', '恩施土家族苗族自治州', '109.488172', '30.272156', 'city');
INSERT INTO `dd_district` VALUES (1788, 1787, '0718', '422801', '恩施市', '109.479664', '30.29468', 'district');
INSERT INTO `dd_district` VALUES (1789, 1787, '0718', '422802', '利川市', '108.936452', '30.29098', 'district');
INSERT INTO `dd_district` VALUES (1790, 1787, '0718', '422822', '建始县', '109.722109', '30.602129', 'district');
INSERT INTO `dd_district` VALUES (1791, 1787, '0718', '422823', '巴东县', '110.340756', '31.042324', 'district');
INSERT INTO `dd_district` VALUES (1792, 1787, '0718', '422825', '宣恩县', '109.489926', '29.98692', 'district');
INSERT INTO `dd_district` VALUES (1793, 1787, '0718', '422826', '咸丰县', '109.139726', '29.665202', 'district');
INSERT INTO `dd_district` VALUES (1794, 1787, '0718', '422827', '来凤县', '109.407828', '29.493484', 'district');
INSERT INTO `dd_district` VALUES (1795, 1787, '0718', '422828', '鹤峰县', '110.033662', '29.890171', 'district');
INSERT INTO `dd_district` VALUES (1796, 1683, '2728', '429005', '潜江市', '112.899762', '30.402167', 'city');
INSERT INTO `dd_district` VALUES (1797, 1796, '2728', '429005', '潜江市', '112.899762', '30.402167', 'district');
INSERT INTO `dd_district` VALUES (1798, 1683, '1719', '429021', '神农架林区', '110.675743', '31.744915', 'city');
INSERT INTO `dd_district` VALUES (1799, 1798, '1719', '429021', '神农架林区', '110.675743', '31.744915', 'district');
INSERT INTO `dd_district` VALUES (1800, 1683, '1728', '429006', '天门市', '113.166078', '30.663337', 'city');
INSERT INTO `dd_district` VALUES (1801, 1800, '1728', '429006', '天门市', '113.166078', '30.663337', 'district');
INSERT INTO `dd_district` VALUES (1802, 1683, '0728', '429004', '仙桃市', '113.423583', '30.361438', 'city');
INSERT INTO `dd_district` VALUES (1803, 1802, '0728', '429004', '仙桃市', '113.423583', '30.361438', 'district');
INSERT INTO `dd_district` VALUES (1804, 1, '0', '430000', '湖南省', '112.9836', '28.112743', 'province');
INSERT INTO `dd_district` VALUES (1805, 1804, '0731', '430100', '长沙市', '112.938884', '28.22808', 'city');
INSERT INTO `dd_district` VALUES (1806, 1805, '0731', '430102', '芙蓉区', '113.032539', '28.185389', 'district');
INSERT INTO `dd_district` VALUES (1807, 1805, '0731', '430103', '天心区', '112.989897', '28.114526', 'district');
INSERT INTO `dd_district` VALUES (1808, 1805, '0731', '430104', '岳麓区', '112.93132', '28.234538', 'district');
INSERT INTO `dd_district` VALUES (1809, 1805, '0731', '430105', '开福区', '112.985884', '28.256298', 'district');
INSERT INTO `dd_district` VALUES (1810, 1805, '0731', '430111', '雨花区', '113.03826', '28.135722', 'district');
INSERT INTO `dd_district` VALUES (1811, 1805, '0731', '430112', '望城区', '112.831176', '28.353434', 'district');
INSERT INTO `dd_district` VALUES (1812, 1805, '0731', '430121', '长沙县', '113.081097', '28.246918', 'district');
INSERT INTO `dd_district` VALUES (1813, 1805, '0731', '430124', '宁乡县', '112.551885', '28.277483', 'district');
INSERT INTO `dd_district` VALUES (1814, 1805, '0731', '430181', '浏阳市', '113.643076', '28.162833', 'district');
INSERT INTO `dd_district` VALUES (1815, 1804, '0733', '430200', '株洲市', '113.133853', '27.827986', 'city');
INSERT INTO `dd_district` VALUES (1816, 1815, '0733', '430202', '荷塘区', '113.173487', '27.855928', 'district');
INSERT INTO `dd_district` VALUES (1817, 1815, '0733', '430203', '芦淞区', '113.152724', '27.78507', 'district');
INSERT INTO `dd_district` VALUES (1818, 1815, '0733', '430204', '石峰区', '113.117731', '27.875445', 'district');
INSERT INTO `dd_district` VALUES (1819, 1815, '0733', '430211', '天元区', '113.082216', '27.826866', 'district');
INSERT INTO `dd_district` VALUES (1820, 1815, '0733', '430221', '株洲县', '113.144109', '27.699232', 'district');
INSERT INTO `dd_district` VALUES (1821, 1815, '0733', '430223', '攸县', '113.396385', '27.014583', 'district');
INSERT INTO `dd_district` VALUES (1822, 1815, '0733', '430224', '茶陵县', '113.539094', '26.777521', 'district');
INSERT INTO `dd_district` VALUES (1823, 1815, '0733', '430225', '炎陵县', '113.772655', '26.489902', 'district');
INSERT INTO `dd_district` VALUES (1824, 1815, '0733', '430281', '醴陵市', '113.496999', '27.646096', 'district');
INSERT INTO `dd_district` VALUES (1825, 1804, '0732', '430300', '湘潭市', '112.944026', '27.829795', 'city');
INSERT INTO `dd_district` VALUES (1826, 1825, '0732', '430302', '雨湖区', '112.907162', '27.856325', 'district');
INSERT INTO `dd_district` VALUES (1827, 1825, '0732', '430304', '岳塘区', '112.969479', '27.872028', 'district');
INSERT INTO `dd_district` VALUES (1828, 1825, '0732', '430321', '湘潭县', '112.950831', '27.778958', 'district');
INSERT INTO `dd_district` VALUES (1829, 1825, '0732', '430381', '湘乡市', '112.550205', '27.718549', 'district');
INSERT INTO `dd_district` VALUES (1830, 1825, '0732', '430382', '韶山市', '112.52667', '27.915008', 'district');
INSERT INTO `dd_district` VALUES (1831, 1804, '0734', '430400', '衡阳市', '112.572018', '26.893368', 'city');
INSERT INTO `dd_district` VALUES (1832, 1831, '0734', '430405', '珠晖区', '112.620209', '26.894765', 'district');
INSERT INTO `dd_district` VALUES (1833, 1831, '0734', '430406', '雁峰区', '112.6154', '26.840602', 'district');
INSERT INTO `dd_district` VALUES (1834, 1831, '0734', '430407', '石鼓区', '112.597992', '26.943755', 'district');
INSERT INTO `dd_district` VALUES (1835, 1831, '0734', '430408', '蒸湘区', '112.567107', '26.911854', 'district');
INSERT INTO `dd_district` VALUES (1836, 1831, '0734', '430412', '南岳区', '112.738604', '27.232443', 'district');
INSERT INTO `dd_district` VALUES (1837, 1831, '0734', '430421', '衡阳县', '112.370546', '26.969577', 'district');
INSERT INTO `dd_district` VALUES (1838, 1831, '0734', '430422', '衡南县', '112.677877', '26.738247', 'district');
INSERT INTO `dd_district` VALUES (1839, 1831, '0734', '430423', '衡山县', '112.868268', '27.23029', 'district');
INSERT INTO `dd_district` VALUES (1840, 1831, '0734', '430424', '衡东县', '112.953168', '27.08117', 'district');
INSERT INTO `dd_district` VALUES (1841, 1831, '0734', '430426', '祁东县', '112.090356', '26.799896', 'district');
INSERT INTO `dd_district` VALUES (1842, 1831, '0734', '430481', '耒阳市', '112.859759', '26.422277', 'district');
INSERT INTO `dd_district` VALUES (1843, 1831, '0734', '430482', '常宁市', '112.399878', '26.421956', 'district');
INSERT INTO `dd_district` VALUES (1844, 1804, '0739', '430500', '邵阳市', '111.467674', '27.23895', 'city');
INSERT INTO `dd_district` VALUES (1845, 1844, '0739', '430502', '双清区', '111.496341', '27.232708', 'district');
INSERT INTO `dd_district` VALUES (1846, 1844, '0739', '430503', '大祥区', '111.439091', '27.221452', 'district');
INSERT INTO `dd_district` VALUES (1847, 1844, '0739', '430511', '北塔区', '111.452196', '27.246489', 'district');
INSERT INTO `dd_district` VALUES (1848, 1844, '0739', '430521', '邵东县', '111.74427', '27.258987', 'district');
INSERT INTO `dd_district` VALUES (1849, 1844, '0739', '430522', '新邵县', '111.458656', '27.320917', 'district');
INSERT INTO `dd_district` VALUES (1850, 1844, '0739', '430523', '邵阳县', '111.273805', '26.990637', 'district');
INSERT INTO `dd_district` VALUES (1851, 1844, '0739', '430524', '隆回县', '111.032437', '27.113978', 'district');
INSERT INTO `dd_district` VALUES (1852, 1844, '0739', '430525', '洞口县', '110.575846', '27.06032', 'district');
INSERT INTO `dd_district` VALUES (1853, 1844, '0739', '430527', '绥宁县', '110.155655', '26.581954', 'district');
INSERT INTO `dd_district` VALUES (1854, 1844, '0739', '430528', '新宁县', '110.856988', '26.433367', 'district');
INSERT INTO `dd_district` VALUES (1855, 1844, '0739', '430529', '城步苗族自治县', '110.322239', '26.390598', 'district');
INSERT INTO `dd_district` VALUES (1856, 1844, '0739', '430581', '武冈市', '110.631884', '26.726599', 'district');
INSERT INTO `dd_district` VALUES (1857, 1804, '0730', '430600', '岳阳市', '113.12873', '29.356803', 'city');
INSERT INTO `dd_district` VALUES (1858, 1857, '0730', '430602', '岳阳楼区', '113.129684', '29.371814', 'district');
INSERT INTO `dd_district` VALUES (1859, 1857, '0730', '430603', '云溪区', '113.272312', '29.472745', 'district');
INSERT INTO `dd_district` VALUES (1860, 1857, '0730', '430611', '君山区', '113.006435', '29.461106', 'district');
INSERT INTO `dd_district` VALUES (1861, 1857, '0730', '430621', '岳阳县', '113.116418', '29.144066', 'district');
INSERT INTO `dd_district` VALUES (1862, 1857, '0730', '430623', '华容县', '112.540463', '29.531057', 'district');
INSERT INTO `dd_district` VALUES (1863, 1857, '0730', '430624', '湘阴县', '112.909426', '28.689104', 'district');
INSERT INTO `dd_district` VALUES (1864, 1857, '0730', '430626', '平江县', '113.581234', '28.701868', 'district');
INSERT INTO `dd_district` VALUES (1865, 1857, '0730', '430681', '汨罗市', '113.067251', '28.806881', 'district');
INSERT INTO `dd_district` VALUES (1866, 1857, '0730', '430682', '临湘市', '113.450423', '29.476849', 'district');
INSERT INTO `dd_district` VALUES (1867, 1804, '0736', '430700', '常德市', '111.698784', '29.031654', 'city');
INSERT INTO `dd_district` VALUES (1868, 1867, '0736', '430702', '武陵区', '111.683153', '29.055163', 'district');
INSERT INTO `dd_district` VALUES (1869, 1867, '0736', '430703', '鼎城区', '111.680783', '29.018593', 'district');
INSERT INTO `dd_district` VALUES (1870, 1867, '0736', '430721', '安乡县', '112.171131', '29.411309', 'district');
INSERT INTO `dd_district` VALUES (1871, 1867, '0736', '430722', '汉寿县', '111.970514', '28.906106', 'district');
INSERT INTO `dd_district` VALUES (1872, 1867, '0736', '430723', '澧县', '111.758702', '29.633236', 'district');
INSERT INTO `dd_district` VALUES (1873, 1867, '0736', '430724', '临澧县', '111.647517', '29.440793', 'district');
INSERT INTO `dd_district` VALUES (1874, 1867, '0736', '430725', '桃源县', '111.488925', '28.902503', 'district');
INSERT INTO `dd_district` VALUES (1875, 1867, '0736', '430726', '石门县', '111.380014', '29.584292', 'district');
INSERT INTO `dd_district` VALUES (1876, 1867, '0736', '430781', '津市市', '111.877499', '29.60548', 'district');
INSERT INTO `dd_district` VALUES (1877, 1804, '0744', '430800', '张家界市', '110.479148', '29.117013', 'city');
INSERT INTO `dd_district` VALUES (1878, 1877, '0744', '430802', '永定区', '110.537138', '29.119855', 'district');
INSERT INTO `dd_district` VALUES (1879, 1877, '0744', '430811', '武陵源区', '110.550433', '29.34573', 'district');
INSERT INTO `dd_district` VALUES (1880, 1877, '0744', '430821', '慈利县', '111.139775', '29.429999', 'district');
INSERT INTO `dd_district` VALUES (1881, 1877, '0744', '430822', '桑植县', '110.204652', '29.414111', 'district');
INSERT INTO `dd_district` VALUES (1882, 1804, '0737', '430900', '益阳市', '112.355129', '28.554349', 'city');
INSERT INTO `dd_district` VALUES (1883, 1882, '0737', '430902', '资阳区', '112.324272', '28.59111', 'district');
INSERT INTO `dd_district` VALUES (1884, 1882, '0737', '430903', '赫山区', '112.374145', '28.579494', 'district');
INSERT INTO `dd_district` VALUES (1885, 1882, '0737', '430921', '南县', '112.396337', '29.362275', 'district');
INSERT INTO `dd_district` VALUES (1886, 1882, '0737', '430922', '桃江县', '112.155822', '28.518084', 'district');
INSERT INTO `dd_district` VALUES (1887, 1882, '0737', '430923', '安化县', '111.212846', '28.374107', 'district');
INSERT INTO `dd_district` VALUES (1888, 1882, '0737', '430981', '沅江市', '112.355954', '28.847045', 'district');
INSERT INTO `dd_district` VALUES (1889, 1804, '0735', '431000', '郴州市', '113.014984', '25.770532', 'city');
INSERT INTO `dd_district` VALUES (1890, 1889, '0735', '431002', '北湖区', '113.011035', '25.784054', 'district');
INSERT INTO `dd_district` VALUES (1891, 1889, '0735', '431003', '苏仙区', '113.112105', '25.797013', 'district');
INSERT INTO `dd_district` VALUES (1892, 1889, '0735', '431021', '桂阳县', '112.734173', '25.754172', 'district');
INSERT INTO `dd_district` VALUES (1893, 1889, '0735', '431022', '宜章县', '112.948712', '25.399938', 'district');
INSERT INTO `dd_district` VALUES (1894, 1889, '0735', '431023', '永兴县', '113.116527', '26.12715', 'district');
INSERT INTO `dd_district` VALUES (1895, 1889, '0735', '431024', '嘉禾县', '112.36902', '25.587519', 'district');
INSERT INTO `dd_district` VALUES (1896, 1889, '0735', '431025', '临武县', '112.563456', '25.27556', 'district');
INSERT INTO `dd_district` VALUES (1897, 1889, '0735', '431026', '汝城县', '113.684727', '25.532816', 'district');
INSERT INTO `dd_district` VALUES (1898, 1889, '0735', '431027', '桂东县', '113.944614', '26.077616', 'district');
INSERT INTO `dd_district` VALUES (1899, 1889, '0735', '431028', '安仁县', '113.26932', '26.709061', 'district');
INSERT INTO `dd_district` VALUES (1900, 1889, '0735', '431081', '资兴市', '113.236146', '25.976243', 'district');
INSERT INTO `dd_district` VALUES (1901, 1804, '0746', '431100', '永州市', '111.613418', '26.419641', 'city');
INSERT INTO `dd_district` VALUES (1902, 1901, '0746', '431102', '零陵区', '111.631109', '26.221936', 'district');
INSERT INTO `dd_district` VALUES (1903, 1901, '0746', '431103', '冷水滩区', '111.592343', '26.46128', 'district');
INSERT INTO `dd_district` VALUES (1904, 1901, '0746', '431121', '祁阳县', '111.840657', '26.58012', 'district');
INSERT INTO `dd_district` VALUES (1905, 1901, '0746', '431122', '东安县', '111.316464', '26.392183', 'district');
INSERT INTO `dd_district` VALUES (1906, 1901, '0746', '431123', '双牌县', '111.659967', '25.961909', 'district');
INSERT INTO `dd_district` VALUES (1907, 1901, '0746', '431124', '道县', '111.600795', '25.526437', 'district');
INSERT INTO `dd_district` VALUES (1908, 1901, '0746', '431125', '江永县', '111.343911', '25.273539', 'district');
INSERT INTO `dd_district` VALUES (1909, 1901, '0746', '431126', '宁远县', '111.945844', '25.570888', 'district');
INSERT INTO `dd_district` VALUES (1910, 1901, '0746', '431127', '蓝山县', '112.196567', '25.369725', 'district');
INSERT INTO `dd_district` VALUES (1911, 1901, '0746', '431128', '新田县', '112.203287', '25.904305', 'district');
INSERT INTO `dd_district` VALUES (1912, 1901, '0746', '431129', '江华瑶族自治县', '111.579535', '25.185809', 'district');
INSERT INTO `dd_district` VALUES (1913, 1804, '0745', '431200', '怀化市', '110.001923', '27.569517', 'city');
INSERT INTO `dd_district` VALUES (1914, 1913, '0745', '431202', '鹤城区', '110.040315', '27.578926', 'district');
INSERT INTO `dd_district` VALUES (1915, 1913, '0745', '431221', '中方县', '109.944711', '27.440138', 'district');
INSERT INTO `dd_district` VALUES (1916, 1913, '0745', '431222', '沅陵县', '110.393844', '28.452686', 'district');
INSERT INTO `dd_district` VALUES (1917, 1913, '0745', '431223', '辰溪县', '110.183917', '28.006336', 'district');
INSERT INTO `dd_district` VALUES (1918, 1913, '0745', '431224', '溆浦县', '110.594879', '27.908267', 'district');
INSERT INTO `dd_district` VALUES (1919, 1913, '0745', '431225', '会同县', '109.735661', '26.887238', 'district');
INSERT INTO `dd_district` VALUES (1920, 1913, '0745', '431226', '麻阳苗族自治县', '109.81701', '27.857569', 'district');
INSERT INTO `dd_district` VALUES (1921, 1913, '0745', '431227', '新晃侗族自治县', '109.174932', '27.352673', 'district');
INSERT INTO `dd_district` VALUES (1922, 1913, '0745', '431228', '芷江侗族自治县', '109.684629', '27.443499', 'district');
INSERT INTO `dd_district` VALUES (1923, 1913, '0745', '431229', '靖州苗族侗族自治县', '109.696273', '26.575107', 'district');
INSERT INTO `dd_district` VALUES (1924, 1913, '0745', '431230', '通道侗族自治县', '109.784412', '26.158054', 'district');
INSERT INTO `dd_district` VALUES (1925, 1913, '0745', '431281', '洪江市', '109.836669', '27.208609', 'district');
INSERT INTO `dd_district` VALUES (1926, 1804, '0738', '431300', '娄底市', '111.994482', '27.70027', 'city');
INSERT INTO `dd_district` VALUES (1927, 1926, '0738', '431302', '娄星区', '112.001914', '27.729863', 'district');
INSERT INTO `dd_district` VALUES (1928, 1926, '0738', '431321', '双峰县', '112.175163', '27.457172', 'district');
INSERT INTO `dd_district` VALUES (1929, 1926, '0738', '431322', '新化县', '111.327412', '27.726514', 'district');
INSERT INTO `dd_district` VALUES (1930, 1926, '0738', '431381', '冷水江市', '111.434984', '27.686251', 'district');
INSERT INTO `dd_district` VALUES (1931, 1926, '0738', '431382', '涟源市', '111.664329', '27.692577', 'district');
INSERT INTO `dd_district` VALUES (1932, 1804, '0743', '433100', '湘西土家族苗族自治州', '109.738906', '28.31195', 'city');
INSERT INTO `dd_district` VALUES (1933, 1932, '0743', '433101', '吉首市', '109.698015', '28.262376', 'district');
INSERT INTO `dd_district` VALUES (1934, 1932, '0743', '433122', '泸溪县', '110.21961', '28.216641', 'district');
INSERT INTO `dd_district` VALUES (1935, 1932, '0743', '433123', '凤凰县', '109.581083', '27.958081', 'district');
INSERT INTO `dd_district` VALUES (1936, 1932, '0743', '433124', '花垣县', '109.482078', '28.572029', 'district');
INSERT INTO `dd_district` VALUES (1937, 1932, '0743', '433125', '保靖县', '109.660559', '28.699878', 'district');
INSERT INTO `dd_district` VALUES (1938, 1932, '0743', '433126', '古丈县', '109.950728', '28.616935', 'district');
INSERT INTO `dd_district` VALUES (1939, 1932, '0743', '433127', '永顺县', '109.856933', '28.979955', 'district');
INSERT INTO `dd_district` VALUES (1940, 1932, '0743', '433130', '龙山县', '109.443938', '29.457663', 'district');
INSERT INTO `dd_district` VALUES (1941, 1, '0', '440000', '广东省', '113.26641', '23.132324', 'province');
INSERT INTO `dd_district` VALUES (1942, 1941, '020', '440100', '广州市', '113.264385', '23.12911', 'city');
INSERT INTO `dd_district` VALUES (1943, 1942, '020', '440103', '荔湾区', '113.244258', '23.125863', 'district');
INSERT INTO `dd_district` VALUES (1944, 1942, '020', '440104', '越秀区', '113.266835', '23.128537', 'district');
INSERT INTO `dd_district` VALUES (1945, 1942, '020', '440105', '海珠区', '113.317443', '23.083788', 'district');
INSERT INTO `dd_district` VALUES (1946, 1942, '020', '440106', '天河区', '113.361575', '23.124807', 'district');
INSERT INTO `dd_district` VALUES (1947, 1942, '020', '440111', '白云区', '113.273238', '23.157367', 'district');
INSERT INTO `dd_district` VALUES (1948, 1942, '020', '440112', '黄埔区', '113.480541', '23.181706', 'district');
INSERT INTO `dd_district` VALUES (1949, 1942, '020', '440113', '番禺区', '113.384152', '22.937556', 'district');
INSERT INTO `dd_district` VALUES (1950, 1942, '020', '440114', '花都区', '113.220463', '23.403744', 'district');
INSERT INTO `dd_district` VALUES (1951, 1942, '020', '440115', '南沙区', '113.525165', '22.801624', 'district');
INSERT INTO `dd_district` VALUES (1952, 1942, '020', '440117', '从化区', '113.586679', '23.548748', 'district');
INSERT INTO `dd_district` VALUES (1953, 1942, '020', '440118', '增城区', '113.810627', '23.261465', 'district');
INSERT INTO `dd_district` VALUES (1954, 1941, '0751', '440200', '韶关市', '113.59762', '24.810879', 'city');
INSERT INTO `dd_district` VALUES (1955, 1954, '0751', '440203', '武江区', '113.587756', '24.792926', 'district');
INSERT INTO `dd_district` VALUES (1956, 1954, '0751', '440204', '浈江区', '113.611098', '24.804381', 'district');
INSERT INTO `dd_district` VALUES (1957, 1954, '0751', '440205', '曲江区', '113.604535', '24.682501', 'district');
INSERT INTO `dd_district` VALUES (1958, 1954, '0751', '440222', '始兴县', '114.061789', '24.952976', 'district');
INSERT INTO `dd_district` VALUES (1959, 1954, '0751', '440224', '仁化县', '113.749027', '25.085621', 'district');
INSERT INTO `dd_district` VALUES (1960, 1954, '0751', '440229', '翁源县', '114.130342', '24.350346', 'district');
INSERT INTO `dd_district` VALUES (1961, 1954, '0751', '440232', '乳源瑶族自治县', '113.275883', '24.776078', 'district');
INSERT INTO `dd_district` VALUES (1962, 1954, '0751', '440233', '新丰县', '114.206867', '24.05976', 'district');
INSERT INTO `dd_district` VALUES (1963, 1954, '0751', '440281', '乐昌市', '113.347545', '25.130602', 'district');
INSERT INTO `dd_district` VALUES (1964, 1954, '0751', '440282', '南雄市', '114.311982', '25.117753', 'district');
INSERT INTO `dd_district` VALUES (1965, 1941, '0755', '440300', '深圳市', '114.057939', '22.543527', 'city');
INSERT INTO `dd_district` VALUES (1966, 1965, '0755', '440303', '罗湖区', '114.131459', '22.548389', 'district');
INSERT INTO `dd_district` VALUES (1967, 1965, '0755', '440304', '福田区', '114.055072', '22.521521', 'district');
INSERT INTO `dd_district` VALUES (1968, 1965, '0755', '440305', '南山区', '113.930413', '22.533287', 'district');
INSERT INTO `dd_district` VALUES (1969, 1965, '0755', '440306', '宝安区', '113.883802', '22.554996', 'district');
INSERT INTO `dd_district` VALUES (1970, 1965, '0755', '440307', '龙岗区', '114.246899', '22.720974', 'district');
INSERT INTO `dd_district` VALUES (1971, 1965, '0755', '440308', '盐田区', '114.236739', '22.557001', 'district');
INSERT INTO `dd_district` VALUES (1972, 1965, '0755', '440309', '龙华区', '114.045422', '22.696667', 'district');
INSERT INTO `dd_district` VALUES (1973, 1965, '0755', '440310', '坪山区', '114.350584', '22.708881', 'district');
INSERT INTO `dd_district` VALUES (1974, 1941, '0756', '440400', '珠海市', '113.576677', '22.270978', 'city');
INSERT INTO `dd_district` VALUES (1975, 1974, '0756', '440402', '香洲区', '113.543784', '22.265811', 'district');
INSERT INTO `dd_district` VALUES (1976, 1974, '0756', '440403', '斗门区', '113.296467', '22.2092', 'district');
INSERT INTO `dd_district` VALUES (1977, 1974, '0756', '440404', '金湾区', '113.362656', '22.147471', 'district');
INSERT INTO `dd_district` VALUES (1978, 1941, '0754', '440500', '汕头市', '116.681972', '23.354091', 'city');
INSERT INTO `dd_district` VALUES (1979, 1978, '0754', '440507', '龙湖区', '116.716446', '23.372254', 'district');
INSERT INTO `dd_district` VALUES (1980, 1978, '0754', '440511', '金平区', '116.70345', '23.365556', 'district');
INSERT INTO `dd_district` VALUES (1981, 1978, '0754', '440512', '濠江区', '116.726973', '23.286079', 'district');
INSERT INTO `dd_district` VALUES (1982, 1978, '0754', '440513', '潮阳区', '116.601509', '23.265356', 'district');
INSERT INTO `dd_district` VALUES (1983, 1978, '0754', '440514', '潮南区', '116.439178', '23.23865', 'district');
INSERT INTO `dd_district` VALUES (1984, 1978, '0754', '440515', '澄海区', '116.755992', '23.466709', 'district');
INSERT INTO `dd_district` VALUES (1985, 1978, '0754', '440523', '南澳县', '117.023374', '23.421724', 'district');
INSERT INTO `dd_district` VALUES (1986, 1941, '0757', '440600', '佛山市', '113.121435', '23.021478', 'city');
INSERT INTO `dd_district` VALUES (1987, 1986, '0757', '440604', '禅城区', '113.122421', '23.009551', 'district');
INSERT INTO `dd_district` VALUES (1988, 1986, '0757', '440605', '南海区', '113.143441', '23.028956', 'district');
INSERT INTO `dd_district` VALUES (1989, 1986, '0757', '440606', '顺德区', '113.293359', '22.80524', 'district');
INSERT INTO `dd_district` VALUES (1990, 1986, '0757', '440607', '三水区', '112.896685', '23.155931', 'district');
INSERT INTO `dd_district` VALUES (1991, 1986, '0757', '440608', '高明区', '112.892585', '22.900139', 'district');
INSERT INTO `dd_district` VALUES (1992, 1941, '0750', '440700', '江门市', '113.081542', '22.57899', 'city');
INSERT INTO `dd_district` VALUES (1993, 1992, '0750', '440703', '蓬江区', '113.078521', '22.595149', 'district');
INSERT INTO `dd_district` VALUES (1994, 1992, '0750', '440704', '江海区', '113.111612', '22.560473', 'district');
INSERT INTO `dd_district` VALUES (1995, 1992, '0750', '440705', '新会区', '113.034187', '22.4583', 'district');
INSERT INTO `dd_district` VALUES (1996, 1992, '0750', '440781', '台山市', '112.794065', '22.251924', 'district');
INSERT INTO `dd_district` VALUES (1997, 1992, '0750', '440783', '开平市', '112.698545', '22.376395', 'district');
INSERT INTO `dd_district` VALUES (1998, 1992, '0750', '440784', '鹤山市', '112.964252', '22.76545', 'district');
INSERT INTO `dd_district` VALUES (1999, 1992, '0750', '440785', '恩平市', '112.305145', '22.183206', 'district');
INSERT INTO `dd_district` VALUES (2000, 1941, '0759', '440800', '湛江市', '110.356639', '21.270145', 'city');
INSERT INTO `dd_district` VALUES (2001, 2000, '0759', '440802', '赤坎区', '110.365899', '21.266119', 'district');
INSERT INTO `dd_district` VALUES (2002, 2000, '0759', '440803', '霞山区', '110.397656', '21.192457', 'district');
INSERT INTO `dd_district` VALUES (2003, 2000, '0759', '440804', '坡头区', '110.455332', '21.244721', 'district');
INSERT INTO `dd_district` VALUES (2004, 2000, '0759', '440811', '麻章区', '110.334387', '21.263442', 'district');
INSERT INTO `dd_district` VALUES (2005, 2000, '0759', '440823', '遂溪县', '110.250123', '21.377246', 'district');
INSERT INTO `dd_district` VALUES (2006, 2000, '0759', '440825', '徐闻县', '110.176749', '20.325489', 'district');
INSERT INTO `dd_district` VALUES (2007, 2000, '0759', '440881', '廉江市', '110.286208', '21.6097', 'district');
INSERT INTO `dd_district` VALUES (2008, 2000, '0759', '440882', '雷州市', '110.096586', '20.914178', 'district');
INSERT INTO `dd_district` VALUES (2009, 2000, '0759', '440883', '吴川市', '110.778411', '21.441808', 'district');
INSERT INTO `dd_district` VALUES (2010, 1941, '0668', '440900', '茂名市', '110.925439', '21.662991', 'city');
INSERT INTO `dd_district` VALUES (2011, 2010, '0668', '440902', '茂南区', '110.918026', '21.641337', 'district');
INSERT INTO `dd_district` VALUES (2012, 2010, '0668', '440904', '电白区', '111.013556', '21.514163', 'district');
INSERT INTO `dd_district` VALUES (2013, 2010, '0668', '440981', '高州市', '110.853299', '21.918203', 'district');
INSERT INTO `dd_district` VALUES (2014, 2010, '0668', '440982', '化州市', '110.639565', '21.66463', 'district');
INSERT INTO `dd_district` VALUES (2015, 2010, '0668', '440983', '信宜市', '110.947043', '22.354385', 'district');
INSERT INTO `dd_district` VALUES (2016, 1941, '0758', '441200', '肇庆市', '112.465091', '23.047191', 'city');
INSERT INTO `dd_district` VALUES (2017, 2016, '0758', '441202', '端州区', '112.484848', '23.052101', 'district');
INSERT INTO `dd_district` VALUES (2018, 2016, '0758', '441203', '鼎湖区', '112.567588', '23.158447', 'district');
INSERT INTO `dd_district` VALUES (2019, 2016, '0758', '441204', '高要区', '112.457981', '23.025305', 'district');
INSERT INTO `dd_district` VALUES (2020, 2016, '0758', '441223', '广宁县', '112.44069', '23.634675', 'district');
INSERT INTO `dd_district` VALUES (2021, 2016, '0758', '441224', '怀集县', '112.167742', '23.92035', 'district');
INSERT INTO `dd_district` VALUES (2022, 2016, '0758', '441225', '封开县', '111.512343', '23.424033', 'district');
INSERT INTO `dd_district` VALUES (2023, 2016, '0758', '441226', '德庆县', '111.785937', '23.143722', 'district');
INSERT INTO `dd_district` VALUES (2024, 2016, '0758', '441284', '四会市', '112.734103', '23.327001', 'district');
INSERT INTO `dd_district` VALUES (2025, 1941, '0752', '441300', '惠州市', '114.415612', '23.112381', 'city');
INSERT INTO `dd_district` VALUES (2026, 2025, '0752', '441302', '惠城区', '114.382474', '23.084137', 'district');
INSERT INTO `dd_district` VALUES (2027, 2025, '0752', '441303', '惠阳区', '114.456176', '22.789788', 'district');
INSERT INTO `dd_district` VALUES (2028, 2025, '0752', '441322', '博罗县', '114.289528', '23.172771', 'district');
INSERT INTO `dd_district` VALUES (2029, 2025, '0752', '441323', '惠东县', '114.719988', '22.985014', 'district');
INSERT INTO `dd_district` VALUES (2030, 2025, '0752', '441324', '龙门县', '114.254863', '23.727737', 'district');
INSERT INTO `dd_district` VALUES (2031, 1941, '0753', '441400', '梅州市', '116.122523', '24.288578', 'city');
INSERT INTO `dd_district` VALUES (2032, 2031, '0753', '441402', '梅江区', '116.116695', '24.31049', 'district');
INSERT INTO `dd_district` VALUES (2033, 2031, '0753', '441403', '梅县区', '116.081656', '24.265926', 'district');
INSERT INTO `dd_district` VALUES (2034, 2031, '0753', '441422', '大埔县', '116.695195', '24.347782', 'district');
INSERT INTO `dd_district` VALUES (2035, 2031, '0753', '441423', '丰顺县', '116.181691', '23.739343', 'district');
INSERT INTO `dd_district` VALUES (2036, 2031, '0753', '441424', '五华县', '115.775788', '23.932409', 'district');
INSERT INTO `dd_district` VALUES (2037, 2031, '0753', '441426', '平远县', '115.891638', '24.567261', 'district');
INSERT INTO `dd_district` VALUES (2038, 2031, '0753', '441427', '蕉岭县', '116.171355', '24.658699', 'district');
INSERT INTO `dd_district` VALUES (2039, 2031, '0753', '441481', '兴宁市', '115.731167', '24.136708', 'district');
INSERT INTO `dd_district` VALUES (2040, 1941, '0660', '441500', '汕尾市', '115.375431', '22.78705', 'city');
INSERT INTO `dd_district` VALUES (2041, 2040, '0660', '441502', '城区', '115.365058', '22.779207', 'district');
INSERT INTO `dd_district` VALUES (2042, 2040, '0660', '441521', '海丰县', '115.323436', '22.966585', 'district');
INSERT INTO `dd_district` VALUES (2043, 2040, '0660', '441523', '陆河县', '115.660143', '23.301616', 'district');
INSERT INTO `dd_district` VALUES (2044, 2040, '0660', '441581', '陆丰市', '115.652151', '22.919228', 'district');
INSERT INTO `dd_district` VALUES (2045, 1941, '0762', '441600', '河源市', '114.700961', '23.743686', 'city');
INSERT INTO `dd_district` VALUES (2046, 2045, '0762', '441602', '源城区', '114.702517', '23.733969', 'district');
INSERT INTO `dd_district` VALUES (2047, 2045, '0762', '441621', '紫金县', '115.184107', '23.635745', 'district');
INSERT INTO `dd_district` VALUES (2048, 2045, '0762', '441622', '龙川县', '115.259871', '24.100066', 'district');
INSERT INTO `dd_district` VALUES (2049, 2045, '0762', '441623', '连平县', '114.488556', '24.369583', 'district');
INSERT INTO `dd_district` VALUES (2050, 2045, '0762', '441624', '和平县', '114.938684', '24.44218', 'district');
INSERT INTO `dd_district` VALUES (2051, 2045, '0762', '441625', '东源县', '114.746344', '23.788189', 'district');
INSERT INTO `dd_district` VALUES (2052, 1941, '0662', '441700', '阳江市', '111.982589', '21.857887', 'city');
INSERT INTO `dd_district` VALUES (2053, 2052, '0662', '441702', '江城区', '111.955058', '21.861786', 'district');
INSERT INTO `dd_district` VALUES (2054, 2052, '0662', '441704', '阳东区', '112.006363', '21.868337', 'district');
INSERT INTO `dd_district` VALUES (2055, 2052, '0662', '441721', '阳西县', '111.61766', '21.752771', 'district');
INSERT INTO `dd_district` VALUES (2056, 2052, '0662', '441781', '阳春市', '111.791587', '22.17041', 'district');
INSERT INTO `dd_district` VALUES (2057, 1941, '0763', '441800', '清远市', '113.056042', '23.681774', 'city');
INSERT INTO `dd_district` VALUES (2058, 2057, '0763', '441802', '清城区', '113.062692', '23.697899', 'district');
INSERT INTO `dd_district` VALUES (2059, 2057, '0763', '441803', '清新区', '113.017747', '23.734677', 'district');
INSERT INTO `dd_district` VALUES (2060, 2057, '0763', '441821', '佛冈县', '113.531607', '23.879192', 'district');
INSERT INTO `dd_district` VALUES (2061, 2057, '0763', '441823', '阳山县', '112.641363', '24.465359', 'district');
INSERT INTO `dd_district` VALUES (2062, 2057, '0763', '441825', '连山壮族瑶族自治县', '112.093617', '24.570491', 'district');
INSERT INTO `dd_district` VALUES (2063, 2057, '0763', '441826', '连南瑶族自治县', '112.287012', '24.726017', 'district');
INSERT INTO `dd_district` VALUES (2064, 2057, '0763', '441881', '英德市', '113.401701', '24.206986', 'district');
INSERT INTO `dd_district` VALUES (2065, 2057, '0763', '441882', '连州市', '112.377361', '24.780966', 'district');
INSERT INTO `dd_district` VALUES (2066, 1941, '0769', '441900', '东莞市', '113.751799', '23.020673', 'city');
INSERT INTO `dd_district` VALUES (2067, 2066, '0769', '441900', '东莞市', '113.751799', '23.020673', 'district');
INSERT INTO `dd_district` VALUES (2068, 1941, '0760', '442000', '中山市', '113.39277', '22.517585', 'city');
INSERT INTO `dd_district` VALUES (2069, 2068, '0760', '442000', '中山市', '113.39277', '22.517585', 'district');
INSERT INTO `dd_district` VALUES (2070, 1941, '0768', '445100', '潮州市', '116.622444', '23.657262', 'city');
INSERT INTO `dd_district` VALUES (2071, 2070, '0768', '445102', '湘桥区', '116.628627', '23.674387', 'district');
INSERT INTO `dd_district` VALUES (2072, 2070, '0768', '445103', '潮安区', '116.678203', '23.462613', 'district');
INSERT INTO `dd_district` VALUES (2073, 2070, '0768', '445122', '饶平县', '117.0039', '23.663824', 'district');
INSERT INTO `dd_district` VALUES (2074, 1941, '0663', '445200', '揭阳市', '116.372708', '23.549701', 'city');
INSERT INTO `dd_district` VALUES (2075, 2074, '0663', '445202', '榕城区', '116.367012', '23.525382', 'district');
INSERT INTO `dd_district` VALUES (2076, 2074, '0663', '445203', '揭东区', '116.412015', '23.566126', 'district');
INSERT INTO `dd_district` VALUES (2077, 2074, '0663', '445222', '揭西县', '115.841837', '23.431294', 'district');
INSERT INTO `dd_district` VALUES (2078, 2074, '0663', '445224', '惠来县', '116.29515', '23.033266', 'district');
INSERT INTO `dd_district` VALUES (2079, 2074, '0663', '445281', '普宁市', '116.165777', '23.297493', 'district');
INSERT INTO `dd_district` VALUES (2080, 1941, '0766', '445300', '云浮市', '112.044491', '22.915094', 'city');
INSERT INTO `dd_district` VALUES (2081, 2080, '0766', '445302', '云城区', '112.043945', '22.92815', 'district');
INSERT INTO `dd_district` VALUES (2082, 2080, '0766', '445303', '云安区', '112.003208', '23.071019', 'district');
INSERT INTO `dd_district` VALUES (2083, 2080, '0766', '445321', '新兴县', '112.225334', '22.69569', 'district');
INSERT INTO `dd_district` VALUES (2084, 2080, '0766', '445322', '郁南县', '111.535285', '23.23456', 'district');
INSERT INTO `dd_district` VALUES (2085, 2080, '0766', '445381', '罗定市', '111.569892', '22.768285', 'district');
INSERT INTO `dd_district` VALUES (2086, 1941, '0', '442100', '东沙群岛', '116.887613', '20.617825', 'city');
INSERT INTO `dd_district` VALUES (2087, 2086, '0', '442100', '东沙群岛', '116.887613', '20.617825', 'district');
INSERT INTO `dd_district` VALUES (2088, 1, '0', '450000', '广西壮族自治区', '108.327546', '22.815478', 'province');
INSERT INTO `dd_district` VALUES (2089, 2088, '0771', '450100', '南宁市', '108.366543', '22.817002', 'city');
INSERT INTO `dd_district` VALUES (2090, 2089, '0771', '450102', '兴宁区', '108.368871', '22.854021', 'district');
INSERT INTO `dd_district` VALUES (2091, 2089, '0771', '450103', '青秀区', '108.494024', '22.785879', 'district');
INSERT INTO `dd_district` VALUES (2092, 2089, '0771', '450105', '江南区', '108.273133', '22.78136', 'district');
INSERT INTO `dd_district` VALUES (2093, 2089, '0771', '450107', '西乡塘区', '108.313494', '22.833928', 'district');
INSERT INTO `dd_district` VALUES (2094, 2089, '0771', '450108', '良庆区', '108.39301', '22.752997', 'district');
INSERT INTO `dd_district` VALUES (2095, 2089, '0771', '450109', '邕宁区', '108.487368', '22.75839', 'district');
INSERT INTO `dd_district` VALUES (2096, 2089, '0771', '450110', '武鸣区', '108.27467', '23.158595', 'district');
INSERT INTO `dd_district` VALUES (2097, 2089, '0771', '450123', '隆安县', '107.696153', '23.166028', 'district');
INSERT INTO `dd_district` VALUES (2098, 2089, '0771', '450124', '马山县', '108.177019', '23.708321', 'district');
INSERT INTO `dd_district` VALUES (2099, 2089, '0771', '450125', '上林县', '108.602846', '23.431908', 'district');
INSERT INTO `dd_district` VALUES (2100, 2089, '0771', '450126', '宾阳县', '108.810326', '23.217786', 'district');
INSERT INTO `dd_district` VALUES (2101, 2089, '0771', '450127', '横县', '109.261384', '22.679931', 'district');
INSERT INTO `dd_district` VALUES (2102, 2088, '0772', '450200', '柳州市', '109.428608', '24.326291', 'city');
INSERT INTO `dd_district` VALUES (2103, 2102, '0772', '450202', '城中区', '109.4273', '24.366', 'district');
INSERT INTO `dd_district` VALUES (2104, 2102, '0772', '450203', '鱼峰区', '109.452442', '24.318516', 'district');
INSERT INTO `dd_district` VALUES (2105, 2102, '0772', '450204', '柳南区', '109.385518', '24.336229', 'district');
INSERT INTO `dd_district` VALUES (2106, 2102, '0772', '450205', '柳北区', '109.402049', '24.362691', 'district');
INSERT INTO `dd_district` VALUES (2107, 2102, '0772', '450221', '柳江区', '109.32638', '24.254891', 'district');
INSERT INTO `dd_district` VALUES (2108, 2102, '0772', '450222', '柳城县', '109.24473', '24.651518', 'district');
INSERT INTO `dd_district` VALUES (2109, 2102, '0772', '450223', '鹿寨县', '109.750638', '24.472897', 'district');
INSERT INTO `dd_district` VALUES (2110, 2102, '0772', '450224', '融安县', '109.397538', '25.224549', 'district');
INSERT INTO `dd_district` VALUES (2111, 2102, '0772', '450225', '融水苗族自治县', '109.256334', '25.065934', 'district');
INSERT INTO `dd_district` VALUES (2112, 2102, '0772', '450226', '三江侗族自治县', '109.607675', '25.783198', 'district');
INSERT INTO `dd_district` VALUES (2113, 2088, '0773', '450300', '桂林市', '110.179953', '25.234479', 'city');
INSERT INTO `dd_district` VALUES (2114, 2113, '0773', '450302', '秀峰区', '110.264183', '25.273625', 'district');
INSERT INTO `dd_district` VALUES (2115, 2113, '0773', '450303', '叠彩区', '110.301723', '25.314', 'district');
INSERT INTO `dd_district` VALUES (2116, 2113, '0773', '450304', '象山区', '110.281082', '25.261686', 'district');
INSERT INTO `dd_district` VALUES (2117, 2113, '0773', '450305', '七星区', '110.317826', '25.252701', 'district');
INSERT INTO `dd_district` VALUES (2118, 2113, '0773', '450311', '雁山区', '110.28669', '25.101934', 'district');
INSERT INTO `dd_district` VALUES (2119, 2113, '0773', '450312', '临桂区', '110.212463', '25.238628', 'district');
INSERT INTO `dd_district` VALUES (2120, 2113, '0773', '450321', '阳朔县', '110.496593', '24.77848', 'district');
INSERT INTO `dd_district` VALUES (2121, 2113, '0773', '450323', '灵川县', '110.319897', '25.394781', 'district');
INSERT INTO `dd_district` VALUES (2122, 2113, '0773', '450324', '全州县', '111.072946', '25.928387', 'district');
INSERT INTO `dd_district` VALUES (2123, 2113, '0773', '450325', '兴安县', '110.67167', '25.611704', 'district');
INSERT INTO `dd_district` VALUES (2124, 2113, '0773', '450326', '永福县', '109.983076', '24.979855', 'district');
INSERT INTO `dd_district` VALUES (2125, 2113, '0773', '450327', '灌阳县', '111.160851', '25.489383', 'district');
INSERT INTO `dd_district` VALUES (2126, 2113, '0773', '450328', '龙胜各族自治县', '110.011238', '25.797931', 'district');
INSERT INTO `dd_district` VALUES (2127, 2113, '0773', '450329', '资源县', '110.6527', '26.042443', 'district');
INSERT INTO `dd_district` VALUES (2128, 2113, '0773', '450330', '平乐县', '110.643305', '24.633362', 'district');
INSERT INTO `dd_district` VALUES (2129, 2113, '0773', '450331', '荔浦县', '110.395104', '24.488342', 'district');
INSERT INTO `dd_district` VALUES (2130, 2113, '0773', '450332', '恭城瑶族自治县', '110.828409', '24.831682', 'district');
INSERT INTO `dd_district` VALUES (2131, 2088, '0774', '450400', '梧州市', '111.279115', '23.476962', 'city');
INSERT INTO `dd_district` VALUES (2132, 2131, '0774', '450403', '万秀区', '111.320518', '23.472991', 'district');
INSERT INTO `dd_district` VALUES (2133, 2131, '0774', '450405', '长洲区', '111.274673', '23.485944', 'district');
INSERT INTO `dd_district` VALUES (2134, 2131, '0774', '450406', '龙圩区', '111.246606', '23.404772', 'district');
INSERT INTO `dd_district` VALUES (2135, 2131, '0774', '450421', '苍梧县', '111.544007', '23.845097', 'district');
INSERT INTO `dd_district` VALUES (2136, 2131, '0774', '450422', '藤县', '110.914849', '23.374983', 'district');
INSERT INTO `dd_district` VALUES (2137, 2131, '0774', '450423', '蒙山县', '110.525003', '24.19357', 'district');
INSERT INTO `dd_district` VALUES (2138, 2131, '0774', '450481', '岑溪市', '110.994913', '22.91835', 'district');
INSERT INTO `dd_district` VALUES (2139, 2088, '0779', '450500', '北海市', '109.120161', '21.481291', 'city');
INSERT INTO `dd_district` VALUES (2140, 2139, '0779', '450502', '海城区', '109.117209', '21.475004', 'district');
INSERT INTO `dd_district` VALUES (2141, 2139, '0779', '450503', '银海区', '109.139862', '21.449308', 'district');
INSERT INTO `dd_district` VALUES (2142, 2139, '0779', '450512', '铁山港区', '109.42158', '21.529127', 'district');
INSERT INTO `dd_district` VALUES (2143, 2139, '0779', '450521', '合浦县', '109.207335', '21.660935', 'district');
INSERT INTO `dd_district` VALUES (2144, 2088, '0770', '450600', '防城港市', '108.353846', '21.68686', 'city');
INSERT INTO `dd_district` VALUES (2145, 2144, '0770', '450602', '港口区', '108.380143', '21.643383', 'district');
INSERT INTO `dd_district` VALUES (2146, 2144, '0770', '450603', '防城区', '108.353499', '21.769211', 'district');
INSERT INTO `dd_district` VALUES (2147, 2144, '0770', '450621', '上思县', '107.983627', '22.153671', 'district');
INSERT INTO `dd_district` VALUES (2148, 2144, '0770', '450681', '东兴市', '107.971828', '21.547821', 'district');
INSERT INTO `dd_district` VALUES (2149, 2088, '0777', '450700', '钦州市', '108.654146', '21.979933', 'city');
INSERT INTO `dd_district` VALUES (2150, 2149, '0777', '450702', '钦南区', '108.657209', '21.938859', 'district');
INSERT INTO `dd_district` VALUES (2151, 2149, '0777', '450703', '钦北区', '108.44911', '22.132761', 'district');
INSERT INTO `dd_district` VALUES (2152, 2149, '0777', '450721', '灵山县', '109.291006', '22.416536', 'district');
INSERT INTO `dd_district` VALUES (2153, 2149, '0777', '450722', '浦北县', '109.556953', '22.271651', 'district');
INSERT INTO `dd_district` VALUES (2154, 2088, '1755', '450800', '贵港市', '109.598926', '23.11153', 'city');
INSERT INTO `dd_district` VALUES (2155, 2154, '1755', '450802', '港北区', '109.57224', '23.11153', 'district');
INSERT INTO `dd_district` VALUES (2156, 2154, '1755', '450803', '港南区', '109.599556', '23.075573', 'district');
INSERT INTO `dd_district` VALUES (2157, 2154, '1755', '450804', '覃塘区', '109.452662', '23.127149', 'district');
INSERT INTO `dd_district` VALUES (2158, 2154, '1755', '450821', '平南县', '110.392311', '23.539264', 'district');
INSERT INTO `dd_district` VALUES (2159, 2154, '1755', '450881', '桂平市', '110.079379', '23.394325', 'district');
INSERT INTO `dd_district` VALUES (2160, 2088, '0775', '450900', '玉林市', '110.18122', '22.654032', 'city');
INSERT INTO `dd_district` VALUES (2161, 2160, '0775', '450902', '玉州区', '110.151153', '22.628087', 'district');
INSERT INTO `dd_district` VALUES (2162, 2160, '0775', '450903', '福绵区', '110.059439', '22.585556', 'district');
INSERT INTO `dd_district` VALUES (2163, 2160, '0775', '450921', '容县', '110.558074', '22.857839', 'district');
INSERT INTO `dd_district` VALUES (2164, 2160, '0775', '450922', '陆川县', '110.264052', '22.321048', 'district');
INSERT INTO `dd_district` VALUES (2165, 2160, '0775', '450923', '博白县', '109.975985', '22.273048', 'district');
INSERT INTO `dd_district` VALUES (2166, 2160, '0775', '450924', '兴业县', '109.875304', '22.736421', 'district');
INSERT INTO `dd_district` VALUES (2167, 2160, '0775', '450981', '北流市', '110.354214', '22.70831', 'district');
INSERT INTO `dd_district` VALUES (2168, 2088, '0776', '451000', '百色市', '106.618202', '23.90233', 'city');
INSERT INTO `dd_district` VALUES (2169, 2168, '0776', '451002', '右江区', '106.618225', '23.90097', 'district');
INSERT INTO `dd_district` VALUES (2170, 2168, '0776', '451021', '田阳县', '106.915496', '23.735692', 'district');
INSERT INTO `dd_district` VALUES (2171, 2168, '0776', '451022', '田东县', '107.12608', '23.597194', 'district');
INSERT INTO `dd_district` VALUES (2172, 2168, '0776', '451023', '平果县', '107.589809', '23.329376', 'district');
INSERT INTO `dd_district` VALUES (2173, 2168, '0776', '451024', '德保县', '106.615373', '23.32345', 'district');
INSERT INTO `dd_district` VALUES (2174, 2168, '0776', '451026', '那坡县', '105.83253', '23.387441', 'district');
INSERT INTO `dd_district` VALUES (2175, 2168, '0776', '451027', '凌云县', '106.56131', '24.347557', 'district');
INSERT INTO `dd_district` VALUES (2176, 2168, '0776', '451028', '乐业县', '106.556519', '24.776827', 'district');
INSERT INTO `dd_district` VALUES (2177, 2168, '0776', '451029', '田林县', '106.228538', '24.294487', 'district');
INSERT INTO `dd_district` VALUES (2178, 2168, '0776', '451030', '西林县', '105.093825', '24.489823', 'district');
INSERT INTO `dd_district` VALUES (2179, 2168, '0776', '451031', '隆林各族自治县', '105.34404', '24.770896', 'district');
INSERT INTO `dd_district` VALUES (2180, 2168, '0776', '451081', '靖西市', '106.417805', '23.134117', 'district');
INSERT INTO `dd_district` VALUES (2181, 2088, '1774', '451100', '贺州市', '111.566871', '24.403528', 'city');
INSERT INTO `dd_district` VALUES (2182, 2181, '1774', '451102', '八步区', '111.552095', '24.411805', 'district');
INSERT INTO `dd_district` VALUES (2183, 2181, '1774', '451103', '平桂区', '111.479923', '24.453845', 'district');
INSERT INTO `dd_district` VALUES (2184, 2181, '1774', '451121', '昭平县', '110.811325', '24.169385', 'district');
INSERT INTO `dd_district` VALUES (2185, 2181, '1774', '451122', '钟山县', '111.303009', '24.525957', 'district');
INSERT INTO `dd_district` VALUES (2186, 2181, '1774', '451123', '富川瑶族自治县', '111.27745', '24.814443', 'district');
INSERT INTO `dd_district` VALUES (2187, 2088, '0778', '451200', '河池市', '108.085261', '24.692931', 'city');
INSERT INTO `dd_district` VALUES (2188, 2187, '0778', '451202', '金城江区', '108.037276', '24.689703', 'district');
INSERT INTO `dd_district` VALUES (2189, 2187, '0778', '451221', '南丹县', '107.541244', '24.975631', 'district');
INSERT INTO `dd_district` VALUES (2190, 2187, '0778', '451222', '天峨县', '107.173802', '24.999108', 'district');
INSERT INTO `dd_district` VALUES (2191, 2187, '0778', '451223', '凤山县', '107.04219', '24.546876', 'district');
INSERT INTO `dd_district` VALUES (2192, 2187, '0778', '451224', '东兰县', '107.374293', '24.510842', 'district');
INSERT INTO `dd_district` VALUES (2193, 2187, '0778', '451225', '罗城仫佬族自治县', '108.904706', '24.777411', 'district');
INSERT INTO `dd_district` VALUES (2194, 2187, '0778', '451226', '环江毛南族自治县', '108.258028', '24.825664', 'district');
INSERT INTO `dd_district` VALUES (2195, 2187, '0778', '451227', '巴马瑶族自治县', '107.258588', '24.142298', 'district');
INSERT INTO `dd_district` VALUES (2196, 2187, '0778', '451228', '都安瑶族自治县', '108.105311', '23.932675', 'district');
INSERT INTO `dd_district` VALUES (2197, 2187, '0778', '451229', '大化瑶族自治县', '107.998149', '23.736457', 'district');
INSERT INTO `dd_district` VALUES (2198, 2187, '0778', '451281', '宜州市', '108.636414', '24.485214', 'district');
INSERT INTO `dd_district` VALUES (2199, 2088, '1772', '451300', '来宾市', '109.221465', '23.750306', 'city');
INSERT INTO `dd_district` VALUES (2200, 2199, '1772', '451302', '兴宾区', '109.183333', '23.72892', 'district');
INSERT INTO `dd_district` VALUES (2201, 2199, '1772', '451321', '忻城县', '108.665666', '24.066234', 'district');
INSERT INTO `dd_district` VALUES (2202, 2199, '1772', '451322', '象州县', '109.705065', '23.973793', 'district');
INSERT INTO `dd_district` VALUES (2203, 2199, '1772', '451323', '武宣县', '109.663206', '23.59411', 'district');
INSERT INTO `dd_district` VALUES (2204, 2199, '1772', '451324', '金秀瑶族自治县', '110.189462', '24.130374', 'district');
INSERT INTO `dd_district` VALUES (2205, 2199, '1772', '451381', '合山市', '108.886082', '23.806535', 'district');
INSERT INTO `dd_district` VALUES (2206, 2088, '1771', '451400', '崇左市', '107.365094', '22.377253', 'city');
INSERT INTO `dd_district` VALUES (2207, 2206, '1771', '451402', '江州区', '107.353437', '22.405325', 'district');
INSERT INTO `dd_district` VALUES (2208, 2206, '1771', '451421', '扶绥县', '107.904186', '22.635012', 'district');
INSERT INTO `dd_district` VALUES (2209, 2206, '1771', '451422', '宁明县', '107.076456', '22.140192', 'district');
INSERT INTO `dd_district` VALUES (2210, 2206, '1771', '451423', '龙州县', '106.854482', '22.342778', 'district');
INSERT INTO `dd_district` VALUES (2211, 2206, '1771', '451424', '大新县', '107.200654', '22.829287', 'district');
INSERT INTO `dd_district` VALUES (2212, 2206, '1771', '451425', '天等县', '107.143432', '23.081394', 'district');
INSERT INTO `dd_district` VALUES (2213, 2206, '1771', '451481', '凭祥市', '106.766293', '22.094484', 'district');
INSERT INTO `dd_district` VALUES (2214, 1, '0', '460000', '海南省', '110.349228', '20.017377', 'province');
INSERT INTO `dd_district` VALUES (2215, 2214, '0802', '469025', '白沙黎族自治县', '109.451484', '19.224823', 'city');
INSERT INTO `dd_district` VALUES (2216, 2215, '0802', '469025', '白沙黎族自治县', '109.451484', '19.224823', 'district');
INSERT INTO `dd_district` VALUES (2217, 2214, '0801', '469029', '保亭黎族苗族自治县', '109.70259', '18.63913', 'city');
INSERT INTO `dd_district` VALUES (2218, 2217, '0801', '469029', '保亭黎族苗族自治县', '109.70259', '18.63913', 'district');
INSERT INTO `dd_district` VALUES (2219, 2214, '0803', '469026', '昌江黎族自治县', '109.055739', '19.298184', 'city');
INSERT INTO `dd_district` VALUES (2220, 2219, '0803', '469026', '昌江黎族自治县', '109.055739', '19.298184', 'district');
INSERT INTO `dd_district` VALUES (2221, 2214, '0804', '469023', '澄迈县', '110.006754', '19.738521', 'city');
INSERT INTO `dd_district` VALUES (2222, 2221, '0804', '469023', '澄迈县', '110.006754', '19.738521', 'district');
INSERT INTO `dd_district` VALUES (2223, 2214, '0898', '460100', '海口市', '110.198286', '20.044412', 'city');
INSERT INTO `dd_district` VALUES (2224, 2223, '0898', '460105', '秀英区', '110.293603', '20.007494', 'district');
INSERT INTO `dd_district` VALUES (2225, 2223, '0898', '460106', '龙华区', '110.328492', '20.031006', 'district');
INSERT INTO `dd_district` VALUES (2226, 2223, '0898', '460107', '琼山区', '110.353972', '20.003169', 'district');
INSERT INTO `dd_district` VALUES (2227, 2223, '0898', '460108', '美兰区', '110.366358', '20.029083', 'district');
INSERT INTO `dd_district` VALUES (2228, 2214, '0899', '460200', '三亚市', '109.511772', '18.253135', 'city');
INSERT INTO `dd_district` VALUES (2229, 2228, '0899', '460202', '海棠区', '109.752569', '18.400106', 'district');
INSERT INTO `dd_district` VALUES (2230, 2228, '0899', '460203', '吉阳区', '109.578336', '18.281406', 'district');
INSERT INTO `dd_district` VALUES (2231, 2228, '0899', '460204', '天涯区', '109.452378', '18.298156', 'district');
INSERT INTO `dd_district` VALUES (2232, 2228, '0899', '460205', '崖州区', '109.171841', '18.357291', 'district');
INSERT INTO `dd_district` VALUES (2233, 2214, '2898', '460300', '三沙市', '112.338695', '16.831839', 'city');
INSERT INTO `dd_district` VALUES (2234, 2233, '1895', '460321', '西沙群岛', '111.792944', '16.204546', 'district');
INSERT INTO `dd_district` VALUES (2235, 2233, '1891', '460322', '南沙群岛', '116.749997', '11.471888', 'district');
INSERT INTO `dd_district` VALUES (2236, 2233, '2801', '460323', '中沙群岛的岛礁及其海域', '117.740071', '15.112855', 'district');
INSERT INTO `dd_district` VALUES (2237, 2214, '0805', '460400', '儋州市', '109.580811', '19.521134', 'city');
INSERT INTO `dd_district` VALUES (2238, 2237, '0805', '460400', '儋州市', '109.580811', '19.521134', 'district');
INSERT INTO `dd_district` VALUES (2239, 2214, '0806', '469021', '定安县', '110.359339', '19.681404', 'city');
INSERT INTO `dd_district` VALUES (2240, 2239, '0806', '469021', '定安县', '110.359339', '19.681404', 'district');
INSERT INTO `dd_district` VALUES (2241, 2214, '0807', '469007', '东方市', '108.651815', '19.095351', 'city');
INSERT INTO `dd_district` VALUES (2242, 2241, '0807', '469007', '东方市', '108.651815', '19.095351', 'district');
INSERT INTO `dd_district` VALUES (2243, 2214, '2802', '469027', '乐东黎族自治县', '109.173054', '18.750259', 'city');
INSERT INTO `dd_district` VALUES (2244, 2243, '2802', '469027', '乐东黎族自治县', '109.173054', '18.750259', 'district');
INSERT INTO `dd_district` VALUES (2245, 2214, '1896', '469024', '临高县', '109.690508', '19.912025', 'city');
INSERT INTO `dd_district` VALUES (2246, 2245, '1896', '469024', '临高县', '109.690508', '19.912025', 'district');
INSERT INTO `dd_district` VALUES (2247, 2214, '0809', '469028', '陵水黎族自治县', '110.037503', '18.506048', 'city');
INSERT INTO `dd_district` VALUES (2248, 2247, '0809', '469028', '陵水黎族自治县', '110.037503', '18.506048', 'district');
INSERT INTO `dd_district` VALUES (2249, 2214, '1894', '469002', '琼海市', '110.474497', '19.259134', 'city');
INSERT INTO `dd_district` VALUES (2250, 2249, '1894', '469002', '琼海市', '110.474497', '19.259134', 'district');
INSERT INTO `dd_district` VALUES (2251, 2214, '1899', '469030', '琼中黎族苗族自治县', '109.838389', '19.033369', 'city');
INSERT INTO `dd_district` VALUES (2252, 2251, '1899', '469030', '琼中黎族苗族自治县', '109.838389', '19.033369', 'district');
INSERT INTO `dd_district` VALUES (2253, 2214, '1892', '469022', '屯昌县', '110.103415', '19.351765', 'city');
INSERT INTO `dd_district` VALUES (2254, 2253, '1892', '469022', '屯昌县', '110.103415', '19.351765', 'district');
INSERT INTO `dd_district` VALUES (2255, 2214, '1898', '469006', '万宁市', '110.391073', '18.795143', 'city');
INSERT INTO `dd_district` VALUES (2256, 2255, '1898', '469006', '万宁市', '110.391073', '18.795143', 'district');
INSERT INTO `dd_district` VALUES (2257, 2214, '1893', '469005', '文昌市', '110.797717', '19.543422', 'city');
INSERT INTO `dd_district` VALUES (2258, 2257, '1893', '469005', '文昌市', '110.797717', '19.543422', 'district');
INSERT INTO `dd_district` VALUES (2259, 2214, '1897', '469001', '五指山市', '109.516925', '18.775146', 'city');
INSERT INTO `dd_district` VALUES (2260, 2259, '1897', '469001', '五指山市', '109.516925', '18.775146', 'district');
INSERT INTO `dd_district` VALUES (2261, 1, '023', '500000', '重庆市', '106.551643', '29.562849', 'province');
INSERT INTO `dd_district` VALUES (2262, 2261, '023', '500100', '重庆市', '106.551643', '29.562849', 'city');
INSERT INTO `dd_district` VALUES (2263, 2262, '023', '500101', '万州区', '108.408661', '30.807667', 'district');
INSERT INTO `dd_district` VALUES (2264, 2262, '023', '500102', '涪陵区', '107.38977', '29.703022', 'district');
INSERT INTO `dd_district` VALUES (2265, 2262, '023', '500103', '渝中区', '106.568896', '29.552736', 'district');
INSERT INTO `dd_district` VALUES (2266, 2262, '023', '500104', '大渡口区', '106.482346', '29.484527', 'district');
INSERT INTO `dd_district` VALUES (2267, 2262, '023', '500105', '江北区', '106.574271', '29.606703', 'district');
INSERT INTO `dd_district` VALUES (2268, 2262, '023', '500106', '沙坪坝区', '106.456878', '29.541144', 'district');
INSERT INTO `dd_district` VALUES (2269, 2262, '023', '500107', '九龙坡区', '106.510676', '29.502272', 'district');
INSERT INTO `dd_district` VALUES (2270, 2262, '023', '500108', '南岸区', '106.644447', '29.50126', 'district');
INSERT INTO `dd_district` VALUES (2271, 2262, '023', '500109', '北碚区', '106.395612', '29.805107', 'district');
INSERT INTO `dd_district` VALUES (2272, 2262, '023', '500110', '綦江区', '106.651361', '29.028066', 'district');
INSERT INTO `dd_district` VALUES (2273, 2262, '023', '500111', '大足区', '105.721733', '29.707032', 'district');
INSERT INTO `dd_district` VALUES (2274, 2262, '023', '500112', '渝北区', '106.631187', '29.718142', 'district');
INSERT INTO `dd_district` VALUES (2275, 2262, '023', '500113', '巴南区', '106.540256', '29.402408', 'district');
INSERT INTO `dd_district` VALUES (2276, 2262, '023', '500114', '黔江区', '108.770677', '29.533609', 'district');
INSERT INTO `dd_district` VALUES (2277, 2262, '023', '500115', '长寿区', '107.080734', '29.857912', 'district');
INSERT INTO `dd_district` VALUES (2278, 2262, '023', '500116', '江津区', '106.259281', '29.290069', 'district');
INSERT INTO `dd_district` VALUES (2279, 2262, '023', '500117', '合川区', '106.27613', '29.972084', 'district');
INSERT INTO `dd_district` VALUES (2280, 2262, '023', '500118', '永川区', '105.927001', '29.356311', 'district');
INSERT INTO `dd_district` VALUES (2281, 2262, '023', '500119', '南川区', '107.099266', '29.15789', 'district');
INSERT INTO `dd_district` VALUES (2282, 2262, '023', '500120', '璧山区', '106.227305', '29.592024', 'district');
INSERT INTO `dd_district` VALUES (2283, 2262, '023', '500151', '铜梁区', '106.056404', '29.844811', 'district');
INSERT INTO `dd_district` VALUES (2284, 2262, '023', '500152', '潼南区', '105.840431', '30.190992', 'district');
INSERT INTO `dd_district` VALUES (2285, 2262, '023', '500153', '荣昌区', '105.594623', '29.405002', 'district');
INSERT INTO `dd_district` VALUES (2286, 2262, '023', '500154', '开州区', '108.393135', '31.160711', 'district');
INSERT INTO `dd_district` VALUES (2287, 2261, '023', '500200', '重庆郊县', '108.165537', '29.293902', 'city');
INSERT INTO `dd_district` VALUES (2288, 2287, '023', '500228', '梁平区', '107.769568', '30.654233', 'district');
INSERT INTO `dd_district` VALUES (2289, 2287, '023', '500229', '城口县', '108.664214', '31.947633', 'district');
INSERT INTO `dd_district` VALUES (2290, 2287, '023', '500230', '丰都县', '107.730894', '29.8635', 'district');
INSERT INTO `dd_district` VALUES (2291, 2287, '023', '500231', '垫江县', '107.33339', '30.327716', 'district');
INSERT INTO `dd_district` VALUES (2292, 2287, '023', '500232', '武隆区', '107.760025', '29.325601', 'district');
INSERT INTO `dd_district` VALUES (2293, 2287, '023', '500233', '忠县', '108.039002', '30.299559', 'district');
INSERT INTO `dd_district` VALUES (2294, 2287, '023', '500235', '云阳县', '108.697324', '30.930612', 'district');
INSERT INTO `dd_district` VALUES (2295, 2287, '023', '500236', '奉节县', '109.400403', '31.018363', 'district');
INSERT INTO `dd_district` VALUES (2296, 2287, '023', '500237', '巫山县', '109.879153', '31.074834', 'district');
INSERT INTO `dd_district` VALUES (2297, 2287, '023', '500238', '巫溪县', '109.570062', '31.398604', 'district');
INSERT INTO `dd_district` VALUES (2298, 2287, '023', '500240', '石柱土家族自治县', '108.114069', '29.999285', 'district');
INSERT INTO `dd_district` VALUES (2299, 2287, '023', '500241', '秀山土家族苗族自治县', '109.007094', '28.447997', 'district');
INSERT INTO `dd_district` VALUES (2300, 2287, '023', '500242', '酉阳土家族苗族自治县', '108.767747', '28.841244', 'district');
INSERT INTO `dd_district` VALUES (2301, 2287, '023', '500243', '彭水苗族土家族自治县', '108.165537', '29.293902', 'district');
INSERT INTO `dd_district` VALUES (2302, 1, '0', '510000', '四川省', '104.075809', '30.651239', 'province');
INSERT INTO `dd_district` VALUES (2303, 2302, '028', '510100', '成都市', '104.066794', '30.572893', 'city');
INSERT INTO `dd_district` VALUES (2304, 2303, '028', '510104', '锦江区', '104.117022', '30.598158', 'district');
INSERT INTO `dd_district` VALUES (2305, 2303, '028', '510105', '青羊区', '104.061442', '30.673914', 'district');
INSERT INTO `dd_district` VALUES (2306, 2303, '028', '510106', '金牛区', '104.052236', '30.691359', 'district');
INSERT INTO `dd_district` VALUES (2307, 2303, '028', '510107', '武侯区', '104.043235', '30.641907', 'district');
INSERT INTO `dd_district` VALUES (2308, 2303, '028', '510108', '成华区', '104.101515', '30.659966', 'district');
INSERT INTO `dd_district` VALUES (2309, 2303, '028', '510112', '龙泉驿区', '104.274632', '30.556506', 'district');
INSERT INTO `dd_district` VALUES (2310, 2303, '028', '510113', '青白江区', '104.250945', '30.878629', 'district');
INSERT INTO `dd_district` VALUES (2311, 2303, '028', '510114', '新都区', '104.158705', '30.823498', 'district');
INSERT INTO `dd_district` VALUES (2312, 2303, '028', '510115', '温江区', '103.856646', '30.682203', 'district');
INSERT INTO `dd_district` VALUES (2313, 2303, '028', '510116', '双流区', '103.923566', '30.574449', 'district');
INSERT INTO `dd_district` VALUES (2314, 2303, '028', '510121', '金堂县', '104.411976', '30.861979', 'district');
INSERT INTO `dd_district` VALUES (2315, 2303, '028', '510124', '郫都区', '103.901091', '30.795854', 'district');
INSERT INTO `dd_district` VALUES (2316, 2303, '028', '510129', '大邑县', '103.511865', '30.572268', 'district');
INSERT INTO `dd_district` VALUES (2317, 2303, '028', '510131', '蒲江县', '103.506498', '30.196788', 'district');
INSERT INTO `dd_district` VALUES (2318, 2303, '028', '510132', '新津县', '103.811286', '30.410346', 'district');
INSERT INTO `dd_district` VALUES (2319, 2303, '028', '510180', '简阳市', '104.54722', '30.411264', 'district');
INSERT INTO `dd_district` VALUES (2320, 2303, '028', '510181', '都江堰市', '103.647153', '30.988767', 'district');
INSERT INTO `dd_district` VALUES (2321, 2303, '028', '510182', '彭州市', '103.957983', '30.990212', 'district');
INSERT INTO `dd_district` VALUES (2322, 2303, '028', '510183', '邛崃市', '103.464207', '30.410324', 'district');
INSERT INTO `dd_district` VALUES (2323, 2303, '028', '510184', '崇州市', '103.673001', '30.630122', 'district');
INSERT INTO `dd_district` VALUES (2324, 2302, '0813', '510300', '自贡市', '104.778442', '29.33903', 'city');
INSERT INTO `dd_district` VALUES (2325, 2324, '0813', '510302', '自流井区', '104.777191', '29.337429', 'district');
INSERT INTO `dd_district` VALUES (2326, 2324, '0813', '510303', '贡井区', '104.715288', '29.345313', 'district');
INSERT INTO `dd_district` VALUES (2327, 2324, '0813', '510304', '大安区', '104.773994', '29.363702', 'district');
INSERT INTO `dd_district` VALUES (2328, 2324, '0813', '510311', '沿滩区', '104.874079', '29.272586', 'district');
INSERT INTO `dd_district` VALUES (2329, 2324, '0813', '510321', '荣县', '104.417493', '29.445479', 'district');
INSERT INTO `dd_district` VALUES (2330, 2324, '0813', '510322', '富顺县', '104.975048', '29.181429', 'district');
INSERT INTO `dd_district` VALUES (2331, 2302, '0812', '510400', '攀枝花市', '101.718637', '26.582347', 'city');
INSERT INTO `dd_district` VALUES (2332, 2331, '0812', '510402', '东区', '101.704109', '26.546491', 'district');
INSERT INTO `dd_district` VALUES (2333, 2331, '0812', '510403', '西区', '101.630619', '26.597781', 'district');
INSERT INTO `dd_district` VALUES (2334, 2331, '0812', '510411', '仁和区', '101.738528', '26.497765', 'district');
INSERT INTO `dd_district` VALUES (2335, 2331, '0812', '510421', '米易县', '102.112895', '26.897694', 'district');
INSERT INTO `dd_district` VALUES (2336, 2331, '0812', '510422', '盐边县', '101.855071', '26.683213', 'district');
INSERT INTO `dd_district` VALUES (2337, 2302, '0830', '510500', '泸州市', '105.442285', '28.871805', 'city');
INSERT INTO `dd_district` VALUES (2338, 2337, '0830', '510502', '江阳区', '105.434982', '28.87881', 'district');
INSERT INTO `dd_district` VALUES (2339, 2337, '0830', '510503', '纳溪区', '105.371505', '28.773134', 'district');
INSERT INTO `dd_district` VALUES (2340, 2337, '0830', '510504', '龙马潭区', '105.437751', '28.913257', 'district');
INSERT INTO `dd_district` VALUES (2341, 2337, '0830', '510521', '泸县', '105.381893', '29.151534', 'district');
INSERT INTO `dd_district` VALUES (2342, 2337, '0830', '510522', '合江县', '105.830986', '28.811164', 'district');
INSERT INTO `dd_district` VALUES (2343, 2337, '0830', '510524', '叙永县', '105.444765', '28.155801', 'district');
INSERT INTO `dd_district` VALUES (2344, 2337, '0830', '510525', '古蔺县', '105.812601', '28.038801', 'district');
INSERT INTO `dd_district` VALUES (2345, 2302, '0838', '510600', '德阳市', '104.397894', '31.126855', 'city');
INSERT INTO `dd_district` VALUES (2346, 2345, '0838', '510603', '旌阳区', '104.416966', '31.142633', 'district');
INSERT INTO `dd_district` VALUES (2347, 2345, '0838', '510623', '中江县', '104.678751', '31.03307', 'district');
INSERT INTO `dd_district` VALUES (2348, 2345, '0838', '510626', '罗江县', '104.510249', '31.317045', 'district');
INSERT INTO `dd_district` VALUES (2349, 2345, '0838', '510681', '广汉市', '104.282429', '30.977119', 'district');
INSERT INTO `dd_district` VALUES (2350, 2345, '0838', '510682', '什邡市', '104.167501', '31.12678', 'district');
INSERT INTO `dd_district` VALUES (2351, 2345, '0838', '510683', '绵竹市', '104.22075', '31.338077', 'district');
INSERT INTO `dd_district` VALUES (2352, 2302, '0816', '510700', '绵阳市', '104.679004', '31.467459', 'city');
INSERT INTO `dd_district` VALUES (2353, 2352, '0816', '510703', '涪城区', '104.756944', '31.455101', 'district');
INSERT INTO `dd_district` VALUES (2354, 2352, '0816', '510704', '游仙区', '104.766392', '31.473779', 'district');
INSERT INTO `dd_district` VALUES (2355, 2352, '0816', '510705', '安州区', '104.567187', '31.534886', 'district');
INSERT INTO `dd_district` VALUES (2356, 2352, '0816', '510722', '三台县', '105.094586', '31.095979', 'district');
INSERT INTO `dd_district` VALUES (2357, 2352, '0816', '510723', '盐亭县', '105.389453', '31.208362', 'district');
INSERT INTO `dd_district` VALUES (2358, 2352, '0816', '510725', '梓潼县', '105.170845', '31.642718', 'district');
INSERT INTO `dd_district` VALUES (2359, 2352, '0816', '510726', '北川羌族自治县', '104.46797', '31.617203', 'district');
INSERT INTO `dd_district` VALUES (2360, 2352, '0816', '510727', '平武县', '104.555583', '32.409675', 'district');
INSERT INTO `dd_district` VALUES (2361, 2352, '0816', '510781', '江油市', '104.745915', '31.778026', 'district');
INSERT INTO `dd_district` VALUES (2362, 2302, '0839', '510800', '广元市', '105.843357', '32.435435', 'city');
INSERT INTO `dd_district` VALUES (2363, 2362, '0839', '510802', '利州区', '105.845307', '32.433756', 'district');
INSERT INTO `dd_district` VALUES (2364, 2362, '0839', '510811', '昭化区', '105.962819', '32.323256', 'district');
INSERT INTO `dd_district` VALUES (2365, 2362, '0839', '510812', '朝天区', '105.882642', '32.651336', 'district');
INSERT INTO `dd_district` VALUES (2366, 2362, '0839', '510821', '旺苍县', '106.289983', '32.229058', 'district');
INSERT INTO `dd_district` VALUES (2367, 2362, '0839', '510822', '青川县', '105.238842', '32.575484', 'district');
INSERT INTO `dd_district` VALUES (2368, 2362, '0839', '510823', '剑阁县', '105.524766', '32.287722', 'district');
INSERT INTO `dd_district` VALUES (2369, 2362, '0839', '510824', '苍溪县', '105.934756', '31.731709', 'district');
INSERT INTO `dd_district` VALUES (2370, 2302, '0825', '510900', '遂宁市', '105.592803', '30.53292', 'city');
INSERT INTO `dd_district` VALUES (2371, 2370, '0825', '510903', '船山区', '105.568297', '30.525475', 'district');
INSERT INTO `dd_district` VALUES (2372, 2370, '0825', '510904', '安居区', '105.456342', '30.355379', 'district');
INSERT INTO `dd_district` VALUES (2373, 2370, '0825', '510921', '蓬溪县', '105.70757', '30.757575', 'district');
INSERT INTO `dd_district` VALUES (2374, 2370, '0825', '510922', '射洪县', '105.388412', '30.871131', 'district');
INSERT INTO `dd_district` VALUES (2375, 2370, '0825', '510923', '大英县', '105.236923', '30.594409', 'district');
INSERT INTO `dd_district` VALUES (2376, 2302, '1832', '511000', '内江市', '105.058432', '29.580228', 'city');
INSERT INTO `dd_district` VALUES (2377, 2376, '1832', '511002', '市中区', '105.067597', '29.587053', 'district');
INSERT INTO `dd_district` VALUES (2378, 2376, '1832', '511011', '东兴区', '105.075489', '29.592756', 'district');
INSERT INTO `dd_district` VALUES (2379, 2376, '1832', '511024', '威远县', '104.668879', '29.52744', 'district');
INSERT INTO `dd_district` VALUES (2380, 2376, '1832', '511025', '资中县', '104.851944', '29.764059', 'district');
INSERT INTO `dd_district` VALUES (2381, 2376, '1832', '511028', '隆昌县', '105.287612', '29.339476', 'district');
INSERT INTO `dd_district` VALUES (2382, 2302, '0833', '511100', '乐山市', '103.765678', '29.552115', 'city');
INSERT INTO `dd_district` VALUES (2383, 2382, '0833', '511102', '市中区', '103.761329', '29.555374', 'district');
INSERT INTO `dd_district` VALUES (2384, 2382, '0833', '511111', '沙湾区', '103.549991', '29.413091', 'district');
INSERT INTO `dd_district` VALUES (2385, 2382, '0833', '511112', '五通桥区', '103.818014', '29.406945', 'district');
INSERT INTO `dd_district` VALUES (2386, 2382, '0833', '511113', '金口河区', '103.07862', '29.244345', 'district');
INSERT INTO `dd_district` VALUES (2387, 2382, '0833', '511123', '犍为县', '103.949326', '29.20817', 'district');
INSERT INTO `dd_district` VALUES (2388, 2382, '0833', '511124', '井研县', '104.069726', '29.651287', 'district');
INSERT INTO `dd_district` VALUES (2389, 2382, '0833', '511126', '夹江县', '103.571656', '29.73763', 'district');
INSERT INTO `dd_district` VALUES (2390, 2382, '0833', '511129', '沐川县', '103.902334', '28.956647', 'district');
INSERT INTO `dd_district` VALUES (2391, 2382, '0833', '511132', '峨边彝族自治县', '103.262048', '29.230425', 'district');
INSERT INTO `dd_district` VALUES (2392, 2382, '0833', '511133', '马边彝族自治县', '103.546347', '28.83552', 'district');
INSERT INTO `dd_district` VALUES (2393, 2382, '0833', '511181', '峨眉山市', '103.484503', '29.601198', 'district');
INSERT INTO `dd_district` VALUES (2394, 2302, '0817', '511300', '南充市', '106.110698', '30.837793', 'city');
INSERT INTO `dd_district` VALUES (2395, 2394, '0817', '511302', '顺庆区', '106.09245', '30.796803', 'district');
INSERT INTO `dd_district` VALUES (2396, 2394, '0817', '511303', '高坪区', '106.118808', '30.781623', 'district');
INSERT INTO `dd_district` VALUES (2397, 2394, '0817', '511304', '嘉陵区', '106.071876', '30.758823', 'district');
INSERT INTO `dd_district` VALUES (2398, 2394, '0817', '511321', '南部县', '106.036584', '31.347467', 'district');
INSERT INTO `dd_district` VALUES (2399, 2394, '0817', '511322', '营山县', '106.565519', '31.076579', 'district');
INSERT INTO `dd_district` VALUES (2400, 2394, '0817', '511323', '蓬安县', '106.412136', '31.029091', 'district');
INSERT INTO `dd_district` VALUES (2401, 2394, '0817', '511324', '仪陇县', '106.303042', '31.271561', 'district');
INSERT INTO `dd_district` VALUES (2402, 2394, '0817', '511325', '西充县', '105.90087', '30.995683', 'district');
INSERT INTO `dd_district` VALUES (2403, 2394, '0817', '511381', '阆中市', '106.005046', '31.558356', 'district');
INSERT INTO `dd_district` VALUES (2404, 2302, '1833', '511400', '眉山市', '103.848403', '30.076994', 'city');
INSERT INTO `dd_district` VALUES (2405, 2404, '1833', '511402', '东坡区', '103.831863', '30.042308', 'district');
INSERT INTO `dd_district` VALUES (2406, 2404, '1833', '511403', '彭山区', '103.872949', '30.193056', 'district');
INSERT INTO `dd_district` VALUES (2407, 2404, '1833', '511421', '仁寿县', '104.133995', '29.995635', 'district');
INSERT INTO `dd_district` VALUES (2408, 2404, '1833', '511423', '洪雅县', '103.372863', '29.90489', 'district');
INSERT INTO `dd_district` VALUES (2409, 2404, '1833', '511424', '丹棱县', '103.512783', '30.01521', 'district');
INSERT INTO `dd_district` VALUES (2410, 2404, '1833', '511425', '青神县', '103.846688', '29.831357', 'district');
INSERT INTO `dd_district` VALUES (2411, 2302, '0831', '511500', '宜宾市', '104.642845', '28.752134', 'city');
INSERT INTO `dd_district` VALUES (2412, 2411, '0831', '511502', '翠屏区', '104.620009', '28.765689', 'district');
INSERT INTO `dd_district` VALUES (2413, 2411, '0831', '511503', '南溪区', '104.969152', '28.846382', 'district');
INSERT INTO `dd_district` VALUES (2414, 2411, '0831', '511521', '宜宾县', '104.533212', '28.690045', 'district');
INSERT INTO `dd_district` VALUES (2415, 2411, '0831', '511523', '江安县', '105.066879', '28.723855', 'district');
INSERT INTO `dd_district` VALUES (2416, 2411, '0831', '511524', '长宁县', '104.921174', '28.582169', 'district');
INSERT INTO `dd_district` VALUES (2417, 2411, '0831', '511525', '高县', '104.517748', '28.436166', 'district');
INSERT INTO `dd_district` VALUES (2418, 2411, '0831', '511526', '珙县', '104.709202', '28.43863', 'district');
INSERT INTO `dd_district` VALUES (2419, 2411, '0831', '511527', '筠连县', '104.512025', '28.167831', 'district');
INSERT INTO `dd_district` VALUES (2420, 2411, '0831', '511528', '兴文县', '105.236325', '28.303614', 'district');
INSERT INTO `dd_district` VALUES (2421, 2411, '0831', '511529', '屏山县', '104.345974', '28.828482', 'district');
INSERT INTO `dd_district` VALUES (2422, 2302, '0826', '511600', '广安市', '106.633088', '30.456224', 'city');
INSERT INTO `dd_district` VALUES (2423, 2422, '0826', '511602', '广安区', '106.641662', '30.473913', 'district');
INSERT INTO `dd_district` VALUES (2424, 2422, '0826', '511603', '前锋区', '106.886143', '30.495804', 'district');
INSERT INTO `dd_district` VALUES (2425, 2422, '0826', '511621', '岳池县', '106.440114', '30.537863', 'district');
INSERT INTO `dd_district` VALUES (2426, 2422, '0826', '511622', '武胜县', '106.295764', '30.348772', 'district');
INSERT INTO `dd_district` VALUES (2427, 2422, '0826', '511623', '邻水县', '106.93038', '30.334768', 'district');
INSERT INTO `dd_district` VALUES (2428, 2422, '0826', '511681', '华蓥市', '106.7831', '30.390188', 'district');
INSERT INTO `dd_district` VALUES (2429, 2302, '0818', '511700', '达州市', '107.467758', '31.209121', 'city');
INSERT INTO `dd_district` VALUES (2430, 2429, '0818', '511702', '通川区', '107.504928', '31.214715', 'district');
INSERT INTO `dd_district` VALUES (2431, 2429, '0818', '511703', '达川区', '107.511749', '31.196157', 'district');
INSERT INTO `dd_district` VALUES (2432, 2429, '0818', '511722', '宣汉县', '107.72719', '31.353835', 'district');
INSERT INTO `dd_district` VALUES (2433, 2429, '0818', '511723', '开江县', '107.868736', '31.082986', 'district');
INSERT INTO `dd_district` VALUES (2434, 2429, '0818', '511724', '大竹县', '107.204795', '30.73641', 'district');
INSERT INTO `dd_district` VALUES (2435, 2429, '0818', '511725', '渠县', '106.97303', '30.836618', 'district');
INSERT INTO `dd_district` VALUES (2436, 2429, '0818', '511781', '万源市', '108.034657', '32.081631', 'district');
INSERT INTO `dd_district` VALUES (2437, 2302, '0835', '511800', '雅安市', '103.042375', '30.010602', 'city');
INSERT INTO `dd_district` VALUES (2438, 2437, '0835', '511802', '雨城区', '103.033026', '30.005461', 'district');
INSERT INTO `dd_district` VALUES (2439, 2437, '0835', '511803', '名山区', '103.109184', '30.069954', 'district');
INSERT INTO `dd_district` VALUES (2440, 2437, '0835', '511822', '荥经县', '102.846737', '29.792931', 'district');
INSERT INTO `dd_district` VALUES (2441, 2437, '0835', '511823', '汉源县', '102.645467', '29.347192', 'district');
INSERT INTO `dd_district` VALUES (2442, 2437, '0835', '511824', '石棉县', '102.359462', '29.227874', 'district');
INSERT INTO `dd_district` VALUES (2443, 2437, '0835', '511825', '天全县', '102.758317', '30.066712', 'district');
INSERT INTO `dd_district` VALUES (2444, 2437, '0835', '511826', '芦山县', '102.932385', '30.142307', 'district');
INSERT INTO `dd_district` VALUES (2445, 2437, '0835', '511827', '宝兴县', '102.815403', '30.37641', 'district');
INSERT INTO `dd_district` VALUES (2446, 2302, '0827', '511900', '巴中市', '106.747477', '31.867903', 'city');
INSERT INTO `dd_district` VALUES (2447, 2446, '0827', '511902', '巴州区', '106.768878', '31.851478', 'district');
INSERT INTO `dd_district` VALUES (2448, 2446, '0827', '511903', '恩阳区', '106.654386', '31.787186', 'district');
INSERT INTO `dd_district` VALUES (2449, 2446, '0827', '511921', '通江县', '107.245033', '31.911705', 'district');
INSERT INTO `dd_district` VALUES (2450, 2446, '0827', '511922', '南江县', '106.828697', '32.346589', 'district');
INSERT INTO `dd_district` VALUES (2451, 2446, '0827', '511923', '平昌县', '107.104008', '31.560874', 'district');
INSERT INTO `dd_district` VALUES (2452, 2302, '0832', '512000', '资阳市', '104.627636', '30.128901', 'city');
INSERT INTO `dd_district` VALUES (2453, 2452, '0832', '512002', '雁江区', '104.677091', '30.108216', 'district');
INSERT INTO `dd_district` VALUES (2454, 2452, '0832', '512021', '安岳县', '105.35534', '30.103107', 'district');
INSERT INTO `dd_district` VALUES (2455, 2452, '0832', '512022', '乐至县', '105.02019', '30.276121', 'district');
INSERT INTO `dd_district` VALUES (2456, 2302, '0837', '513200', '阿坝藏族羌族自治州', '102.224653', '31.899413', 'city');
INSERT INTO `dd_district` VALUES (2457, 2456, '0837', '513201', '马尔康市', '102.20652', '31.905693', 'district');
INSERT INTO `dd_district` VALUES (2458, 2456, '0837', '513221', '汶川县', '103.590179', '31.476854', 'district');
INSERT INTO `dd_district` VALUES (2459, 2456, '0837', '513222', '理县', '103.164661', '31.435174', 'district');
INSERT INTO `dd_district` VALUES (2460, 2456, '0837', '513223', '茂县', '103.853363', '31.681547', 'district');
INSERT INTO `dd_district` VALUES (2461, 2456, '0837', '513224', '松潘县', '103.604698', '32.655325', 'district');
INSERT INTO `dd_district` VALUES (2462, 2456, '0837', '513225', '九寨沟县', '104.243841', '33.252056', 'district');
INSERT INTO `dd_district` VALUES (2463, 2456, '0837', '513226', '金川县', '102.063829', '31.476277', 'district');
INSERT INTO `dd_district` VALUES (2464, 2456, '0837', '513227', '小金县', '102.362984', '30.995823', 'district');
INSERT INTO `dd_district` VALUES (2465, 2456, '0837', '513228', '黑水县', '102.990108', '32.061895', 'district');
INSERT INTO `dd_district` VALUES (2466, 2456, '0837', '513230', '壤塘县', '100.978526', '32.265796', 'district');
INSERT INTO `dd_district` VALUES (2467, 2456, '0837', '513231', '阿坝县', '101.706655', '32.902459', 'district');
INSERT INTO `dd_district` VALUES (2468, 2456, '0837', '513232', '若尔盖县', '102.967826', '33.578159', 'district');
INSERT INTO `dd_district` VALUES (2469, 2456, '0837', '513233', '红原县', '102.544405', '32.790891', 'district');
INSERT INTO `dd_district` VALUES (2470, 2302, '0836', '513300', '甘孜藏族自治州', '101.96231', '30.04952', 'city');
INSERT INTO `dd_district` VALUES (2471, 2470, '0836', '513301', '康定市', '101.957146', '29.998435', 'district');
INSERT INTO `dd_district` VALUES (2472, 2470, '0836', '513322', '泸定县', '102.234617', '29.91416', 'district');
INSERT INTO `dd_district` VALUES (2473, 2470, '0836', '513323', '丹巴县', '101.890358', '30.878577', 'district');
INSERT INTO `dd_district` VALUES (2474, 2470, '0836', '513324', '九龙县', '101.507294', '29.000347', 'district');
INSERT INTO `dd_district` VALUES (2475, 2470, '0836', '513325', '雅江县', '101.014425', '30.031533', 'district');
INSERT INTO `dd_district` VALUES (2476, 2470, '0836', '513326', '道孚县', '101.125237', '30.979545', 'district');
INSERT INTO `dd_district` VALUES (2477, 2470, '0836', '513327', '炉霍县', '100.676372', '31.39179', 'district');
INSERT INTO `dd_district` VALUES (2478, 2470, '0836', '513328', '甘孜县', '99.99267', '31.622933', 'district');
INSERT INTO `dd_district` VALUES (2479, 2470, '0836', '513329', '新龙县', '100.311368', '30.939169', 'district');
INSERT INTO `dd_district` VALUES (2480, 2470, '0836', '513330', '德格县', '98.580914', '31.806118', 'district');
INSERT INTO `dd_district` VALUES (2481, 2470, '0836', '513331', '白玉县', '98.824182', '31.209913', 'district');
INSERT INTO `dd_district` VALUES (2482, 2470, '0836', '513332', '石渠县', '98.102914', '32.97896', 'district');
INSERT INTO `dd_district` VALUES (2483, 2470, '0836', '513333', '色达县', '100.332743', '32.268129', 'district');
INSERT INTO `dd_district` VALUES (2484, 2470, '0836', '513334', '理塘县', '100.269817', '29.996049', 'district');
INSERT INTO `dd_district` VALUES (2485, 2470, '0836', '513335', '巴塘县', '99.110712', '30.004677', 'district');
INSERT INTO `dd_district` VALUES (2486, 2470, '0836', '513336', '乡城县', '99.798435', '28.931172', 'district');
INSERT INTO `dd_district` VALUES (2487, 2470, '0836', '513337', '稻城县', '100.298403', '29.037007', 'district');
INSERT INTO `dd_district` VALUES (2488, 2470, '0836', '513338', '得荣县', '99.286335', '28.713036', 'district');
INSERT INTO `dd_district` VALUES (2489, 2302, '0834', '513400', '凉山彝族自治州', '102.267712', '27.88157', 'city');
INSERT INTO `dd_district` VALUES (2490, 2489, '0834', '513401', '西昌市', '102.264449', '27.894504', 'district');
INSERT INTO `dd_district` VALUES (2491, 2489, '0834', '513422', '木里藏族自治县', '101.280205', '27.928835', 'district');
INSERT INTO `dd_district` VALUES (2492, 2489, '0834', '513423', '盐源县', '101.509188', '27.422645', 'district');
INSERT INTO `dd_district` VALUES (2493, 2489, '0834', '513424', '德昌县', '102.17567', '27.402839', 'district');
INSERT INTO `dd_district` VALUES (2494, 2489, '0834', '513425', '会理县', '102.244683', '26.655026', 'district');
INSERT INTO `dd_district` VALUES (2495, 2489, '0834', '513426', '会东县', '102.57796', '26.634669', 'district');
INSERT INTO `dd_district` VALUES (2496, 2489, '0834', '513427', '宁南县', '102.751745', '27.061189', 'district');
INSERT INTO `dd_district` VALUES (2497, 2489, '0834', '513428', '普格县', '102.540901', '27.376413', 'district');
INSERT INTO `dd_district` VALUES (2498, 2489, '0834', '513429', '布拖县', '102.812061', '27.706061', 'district');
INSERT INTO `dd_district` VALUES (2499, 2489, '0834', '513430', '金阳县', '103.248772', '27.69686', 'district');
INSERT INTO `dd_district` VALUES (2500, 2489, '0834', '513431', '昭觉县', '102.840264', '28.015333', 'district');
INSERT INTO `dd_district` VALUES (2501, 2489, '0834', '513432', '喜德县', '102.412518', '28.306726', 'district');
INSERT INTO `dd_district` VALUES (2502, 2489, '0834', '513433', '冕宁县', '102.17701', '28.549656', 'district');
INSERT INTO `dd_district` VALUES (2503, 2489, '0834', '513434', '越西县', '102.50768', '28.639801', 'district');
INSERT INTO `dd_district` VALUES (2504, 2489, '0834', '513435', '甘洛县', '102.771504', '28.959157', 'district');
INSERT INTO `dd_district` VALUES (2505, 2489, '0834', '513436', '美姑县', '103.132179', '28.32864', 'district');
INSERT INTO `dd_district` VALUES (2506, 2489, '0834', '513437', '雷波县', '103.571696', '28.262682', 'district');
INSERT INTO `dd_district` VALUES (2507, 1, '0', '520000', '贵州省', '106.70546', '26.600055', 'province');
INSERT INTO `dd_district` VALUES (2508, 2507, '0851', '520100', '贵阳市', '106.630153', '26.647661', 'city');
INSERT INTO `dd_district` VALUES (2509, 2508, '0851', '520102', '南明区', '106.714374', '26.567944', 'district');
INSERT INTO `dd_district` VALUES (2510, 2508, '0851', '520103', '云岩区', '106.724494', '26.604688', 'district');
INSERT INTO `dd_district` VALUES (2511, 2508, '0851', '520111', '花溪区', '106.67026', '26.409817', 'district');
INSERT INTO `dd_district` VALUES (2512, 2508, '0851', '520112', '乌当区', '106.750625', '26.630845', 'district');
INSERT INTO `dd_district` VALUES (2513, 2508, '0851', '520113', '白云区', '106.623007', '26.678561', 'district');
INSERT INTO `dd_district` VALUES (2514, 2508, '0851', '520115', '观山湖区', '106.622453', '26.60145', 'district');
INSERT INTO `dd_district` VALUES (2515, 2508, '0851', '520121', '开阳县', '106.965089', '27.057764', 'district');
INSERT INTO `dd_district` VALUES (2516, 2508, '0851', '520122', '息烽县', '106.740407', '27.090479', 'district');
INSERT INTO `dd_district` VALUES (2517, 2508, '0851', '520123', '修文县', '106.592108', '26.838926', 'district');
INSERT INTO `dd_district` VALUES (2518, 2508, '0851', '520181', '清镇市', '106.470714', '26.556079', 'district');
INSERT INTO `dd_district` VALUES (2519, 2507, '0858', '520200', '六盘水市', '104.830458', '26.592707', 'city');
INSERT INTO `dd_district` VALUES (2520, 2519, '0858', '520201', '钟山区', '104.843555', '26.574979', 'district');
INSERT INTO `dd_district` VALUES (2521, 2519, '0858', '520203', '六枝特区', '105.476608', '26.213108', 'district');
INSERT INTO `dd_district` VALUES (2522, 2519, '0858', '520221', '水城县', '104.95783', '26.547904', 'district');
INSERT INTO `dd_district` VALUES (2523, 2519, '0858', '520222', '盘县', '104.471375', '25.709852', 'district');
INSERT INTO `dd_district` VALUES (2524, 2507, '0852', '520300', '遵义市', '106.927389', '27.725654', 'city');
INSERT INTO `dd_district` VALUES (2525, 2524, '0852', '520302', '红花岗区', '106.8937', '27.644754', 'district');
INSERT INTO `dd_district` VALUES (2526, 2524, '0852', '520303', '汇川区', '106.93427', '27.750125', 'district');
INSERT INTO `dd_district` VALUES (2527, 2524, '0852', '520304', '播州区', '106.829574', '27.536298', 'district');
INSERT INTO `dd_district` VALUES (2528, 2524, '0852', '520322', '桐梓县', '106.825198', '28.133311', 'district');
INSERT INTO `dd_district` VALUES (2529, 2524, '0852', '520323', '绥阳县', '107.191222', '27.946222', 'district');
INSERT INTO `dd_district` VALUES (2530, 2524, '0852', '520324', '正安县', '107.453945', '28.553285', 'district');
INSERT INTO `dd_district` VALUES (2531, 2524, '0852', '520325', '道真仡佬族苗族自治县', '107.613133', '28.862425', 'district');
INSERT INTO `dd_district` VALUES (2532, 2524, '0852', '520326', '务川仡佬族苗族自治县', '107.898956', '28.563086', 'district');
INSERT INTO `dd_district` VALUES (2533, 2524, '0852', '520327', '凤冈县', '107.716355', '27.954695', 'district');
INSERT INTO `dd_district` VALUES (2534, 2524, '0852', '520328', '湄潭县', '107.465407', '27.749055', 'district');
INSERT INTO `dd_district` VALUES (2535, 2524, '0852', '520329', '余庆县', '107.905197', '27.215491', 'district');
INSERT INTO `dd_district` VALUES (2536, 2524, '0852', '520330', '习水县', '106.197137', '28.33127', 'district');
INSERT INTO `dd_district` VALUES (2537, 2524, '0852', '520381', '赤水市', '105.697472', '28.590337', 'district');
INSERT INTO `dd_district` VALUES (2538, 2524, '0852', '520382', '仁怀市', '106.40109', '27.792514', 'district');
INSERT INTO `dd_district` VALUES (2539, 2507, '0853', '520400', '安顺市', '105.947594', '26.253088', 'city');
INSERT INTO `dd_district` VALUES (2540, 2539, '0853', '520402', '西秀区', '105.965116', '26.245315', 'district');
INSERT INTO `dd_district` VALUES (2541, 2539, '0853', '520403', '平坝区', '106.256412', '26.405715', 'district');
INSERT INTO `dd_district` VALUES (2542, 2539, '0853', '520422', '普定县', '105.743277', '26.301565', 'district');
INSERT INTO `dd_district` VALUES (2543, 2539, '0853', '520423', '镇宁布依族苗族自治县', '105.770283', '26.058086', 'district');
INSERT INTO `dd_district` VALUES (2544, 2539, '0853', '520424', '关岭布依族苗族自治县', '105.61933', '25.94361', 'district');
INSERT INTO `dd_district` VALUES (2545, 2539, '0853', '520425', '紫云苗族布依族自治县', '106.084441', '25.751047', 'district');
INSERT INTO `dd_district` VALUES (2546, 2507, '0857', '520500', '毕节市', '105.291702', '27.283908', 'city');
INSERT INTO `dd_district` VALUES (2547, 2546, '0857', '520502', '七星关区', '105.30474', '27.298458', 'district');
INSERT INTO `dd_district` VALUES (2548, 2546, '0857', '520521', '大方县', '105.613037', '27.141735', 'district');
INSERT INTO `dd_district` VALUES (2549, 2546, '0857', '520522', '黔西县', '106.033544', '27.007713', 'district');
INSERT INTO `dd_district` VALUES (2550, 2546, '0857', '520523', '金沙县', '106.220227', '27.459214', 'district');
INSERT INTO `dd_district` VALUES (2551, 2546, '0857', '520524', '织金县', '105.770542', '26.663449', 'district');
INSERT INTO `dd_district` VALUES (2552, 2546, '0857', '520525', '纳雍县', '105.382714', '26.777645', 'district');
INSERT INTO `dd_district` VALUES (2553, 2546, '0857', '520526', '威宁彝族回族苗族自治县', '104.253071', '26.873806', 'district');
INSERT INTO `dd_district` VALUES (2554, 2546, '0857', '520527', '赫章县', '104.727418', '27.123078', 'district');
INSERT INTO `dd_district` VALUES (2555, 2507, '0856', '520600', '铜仁市', '109.189598', '27.731514', 'city');
INSERT INTO `dd_district` VALUES (2556, 2555, '0856', '520602', '碧江区', '109.263998', '27.815927', 'district');
INSERT INTO `dd_district` VALUES (2557, 2555, '0856', '520603', '万山区', '109.213644', '27.517896', 'district');
INSERT INTO `dd_district` VALUES (2558, 2555, '0856', '520621', '江口县', '108.839557', '27.69965', 'district');
INSERT INTO `dd_district` VALUES (2559, 2555, '0856', '520622', '玉屏侗族自治县', '108.906411', '27.235813', 'district');
INSERT INTO `dd_district` VALUES (2560, 2555, '0856', '520623', '石阡县', '108.223612', '27.513829', 'district');
INSERT INTO `dd_district` VALUES (2561, 2555, '0856', '520624', '思南县', '108.253882', '27.93755', 'district');
INSERT INTO `dd_district` VALUES (2562, 2555, '0856', '520625', '印江土家族苗族自治县', '108.409751', '27.994246', 'district');
INSERT INTO `dd_district` VALUES (2563, 2555, '0856', '520626', '德江县', '108.119807', '28.263963', 'district');
INSERT INTO `dd_district` VALUES (2564, 2555, '0856', '520627', '沿河土家族自治县', '108.50387', '28.563927', 'district');
INSERT INTO `dd_district` VALUES (2565, 2555, '0856', '520628', '松桃苗族自治县', '109.202886', '28.154071', 'district');
INSERT INTO `dd_district` VALUES (2566, 2507, '0859', '522300', '黔西南布依族苗族自治州', '104.906397', '25.087856', 'city');
INSERT INTO `dd_district` VALUES (2567, 2566, '0859', '522301', '兴义市', '104.895467', '25.09204', 'district');
INSERT INTO `dd_district` VALUES (2568, 2566, '0859', '522322', '兴仁县', '105.186237', '25.435183', 'district');
INSERT INTO `dd_district` VALUES (2569, 2566, '0859', '522323', '普安县', '104.953062', '25.784135', 'district');
INSERT INTO `dd_district` VALUES (2570, 2566, '0859', '522324', '晴隆县', '105.218991', '25.834783', 'district');
INSERT INTO `dd_district` VALUES (2571, 2566, '0859', '522325', '贞丰县', '105.649864', '25.38576', 'district');
INSERT INTO `dd_district` VALUES (2572, 2566, '0859', '522326', '望谟县', '106.099617', '25.178421', 'district');
INSERT INTO `dd_district` VALUES (2573, 2566, '0859', '522327', '册亨县', '105.811592', '24.983663', 'district');
INSERT INTO `dd_district` VALUES (2574, 2566, '0859', '522328', '安龙县', '105.442701', '25.099014', 'district');
INSERT INTO `dd_district` VALUES (2575, 2507, '0855', '522600', '黔东南苗族侗族自治州', '107.982874', '26.583457', 'city');
INSERT INTO `dd_district` VALUES (2576, 2575, '0855', '522601', '凯里市', '107.97754', '26.582963', 'district');
INSERT INTO `dd_district` VALUES (2577, 2575, '0855', '522622', '黄平县', '107.916411', '26.905396', 'district');
INSERT INTO `dd_district` VALUES (2578, 2575, '0855', '522623', '施秉县', '108.124379', '27.03292', 'district');
INSERT INTO `dd_district` VALUES (2579, 2575, '0855', '522624', '三穗县', '108.675267', '26.952967', 'district');
INSERT INTO `dd_district` VALUES (2580, 2575, '0855', '522625', '镇远县', '108.429534', '27.049497', 'district');
INSERT INTO `dd_district` VALUES (2581, 2575, '0855', '522626', '岑巩县', '108.81606', '27.173887', 'district');
INSERT INTO `dd_district` VALUES (2582, 2575, '0855', '522627', '天柱县', '109.207751', '26.909639', 'district');
INSERT INTO `dd_district` VALUES (2583, 2575, '0855', '522628', '锦屏县', '109.200534', '26.676233', 'district');
INSERT INTO `dd_district` VALUES (2584, 2575, '0855', '522629', '剑河县', '108.441501', '26.728274', 'district');
INSERT INTO `dd_district` VALUES (2585, 2575, '0855', '522630', '台江县', '108.321245', '26.667525', 'district');
INSERT INTO `dd_district` VALUES (2586, 2575, '0855', '522631', '黎平县', '109.136932', '26.230706', 'district');
INSERT INTO `dd_district` VALUES (2587, 2575, '0855', '522632', '榕江县', '108.52188', '25.931893', 'district');
INSERT INTO `dd_district` VALUES (2588, 2575, '0855', '522633', '从江县', '108.905329', '25.753009', 'district');
INSERT INTO `dd_district` VALUES (2589, 2575, '0855', '522634', '雷山县', '108.07754', '26.378442', 'district');
INSERT INTO `dd_district` VALUES (2590, 2575, '0855', '522635', '麻江县', '107.589359', '26.491105', 'district');
INSERT INTO `dd_district` VALUES (2591, 2575, '0855', '522636', '丹寨县', '107.788727', '26.19832', 'district');
INSERT INTO `dd_district` VALUES (2592, 2507, '0854', '522700', '黔南布依族苗族自治州', '107.522171', '26.253275', 'city');
INSERT INTO `dd_district` VALUES (2593, 2592, '0854', '522701', '都匀市', '107.518847', '26.259427', 'district');
INSERT INTO `dd_district` VALUES (2594, 2592, '0854', '522702', '福泉市', '107.520386', '26.686335', 'district');
INSERT INTO `dd_district` VALUES (2595, 2592, '0854', '522722', '荔波县', '107.898882', '25.423895', 'district');
INSERT INTO `dd_district` VALUES (2596, 2592, '0854', '522723', '贵定县', '107.232793', '26.557089', 'district');
INSERT INTO `dd_district` VALUES (2597, 2592, '0854', '522725', '瓮安县', '107.470942', '27.078441', 'district');
INSERT INTO `dd_district` VALUES (2598, 2592, '0854', '522726', '独山县', '107.545048', '25.822132', 'district');
INSERT INTO `dd_district` VALUES (2599, 2592, '0854', '522727', '平塘县', '107.322323', '25.822349', 'district');
INSERT INTO `dd_district` VALUES (2600, 2592, '0854', '522728', '罗甸县', '106.751589', '25.426173', 'district');
INSERT INTO `dd_district` VALUES (2601, 2592, '0854', '522729', '长顺县', '106.441805', '26.025626', 'district');
INSERT INTO `dd_district` VALUES (2602, 2592, '0854', '522730', '龙里县', '106.979524', '26.453154', 'district');
INSERT INTO `dd_district` VALUES (2603, 2592, '0854', '522731', '惠水县', '106.656442', '26.13278', 'district');
INSERT INTO `dd_district` VALUES (2604, 2592, '0854', '522732', '三都水族自治县', '107.869749', '25.983202', 'district');
INSERT INTO `dd_district` VALUES (2605, 1, '0', '530000', '云南省', '102.710002', '25.045806', 'province');
INSERT INTO `dd_district` VALUES (2606, 2605, '0871', '530100', '昆明市', '102.832891', '24.880095', 'city');
INSERT INTO `dd_district` VALUES (2607, 2606, '0871', '530102', '五华区', '102.707262', '25.043635', 'district');
INSERT INTO `dd_district` VALUES (2608, 2606, '0871', '530103', '盘龙区', '102.751941', '25.116465', 'district');
INSERT INTO `dd_district` VALUES (2609, 2606, '0871', '530111', '官渡区', '102.749026', '24.950231', 'district');
INSERT INTO `dd_district` VALUES (2610, 2606, '0871', '530112', '西山区', '102.664382', '25.038604', 'district');
INSERT INTO `dd_district` VALUES (2611, 2606, '0871', '530113', '东川区', '103.187824', '26.082873', 'district');
INSERT INTO `dd_district` VALUES (2612, 2606, '0871', '530114', '呈贡区', '102.821675', '24.885587', 'district');
INSERT INTO `dd_district` VALUES (2613, 2606, '0871', '530122', '晋宁区', '102.595412', '24.66974', 'district');
INSERT INTO `dd_district` VALUES (2614, 2606, '0871', '530124', '富民县', '102.4976', '25.221935', 'district');
INSERT INTO `dd_district` VALUES (2615, 2606, '0871', '530125', '宜良县', '103.141603', '24.919839', 'district');
INSERT INTO `dd_district` VALUES (2616, 2606, '0871', '530126', '石林彝族自治县', '103.290536', '24.771761', 'district');
INSERT INTO `dd_district` VALUES (2617, 2606, '0871', '530127', '嵩明县', '103.036908', '25.338643', 'district');
INSERT INTO `dd_district` VALUES (2618, 2606, '0871', '530128', '禄劝彝族苗族自治县', '102.471518', '25.551332', 'district');
INSERT INTO `dd_district` VALUES (2619, 2606, '0871', '530129', '寻甸回族彝族自治县', '103.256615', '25.558201', 'district');
INSERT INTO `dd_district` VALUES (2620, 2606, '0871', '530181', '安宁市', '102.478494', '24.919493', 'district');
INSERT INTO `dd_district` VALUES (2621, 2605, '0874', '530300', '曲靖市', '103.796167', '25.489999', 'city');
INSERT INTO `dd_district` VALUES (2622, 2621, '0874', '530302', '麒麟区', '103.80474', '25.495326', 'district');
INSERT INTO `dd_district` VALUES (2623, 2621, '0874', '530303', '沾益区', '103.822324', '25.600507', 'district');
INSERT INTO `dd_district` VALUES (2624, 2621, '0874', '530321', '马龙县', '103.578478', '25.42805', 'district');
INSERT INTO `dd_district` VALUES (2625, 2621, '0874', '530322', '陆良县', '103.666663', '25.030051', 'district');
INSERT INTO `dd_district` VALUES (2626, 2621, '0874', '530323', '师宗县', '103.985321', '24.822233', 'district');
INSERT INTO `dd_district` VALUES (2627, 2621, '0874', '530324', '罗平县', '104.308675', '24.884626', 'district');
INSERT INTO `dd_district` VALUES (2628, 2621, '0874', '530325', '富源县', '104.255014', '25.674238', 'district');
INSERT INTO `dd_district` VALUES (2629, 2621, '0874', '530326', '会泽县', '103.297386', '26.417345', 'district');
INSERT INTO `dd_district` VALUES (2630, 2621, '0874', '530381', '宣威市', '104.10455', '26.219735', 'district');
INSERT INTO `dd_district` VALUES (2631, 2605, '0877', '530400', '玉溪市', '102.527197', '24.347324', 'city');
INSERT INTO `dd_district` VALUES (2632, 2631, '0877', '530402', '红塔区', '102.540122', '24.341215', 'district');
INSERT INTO `dd_district` VALUES (2633, 2631, '0877', '530403', '江川区', '102.75344', '24.287485', 'district');
INSERT INTO `dd_district` VALUES (2634, 2631, '0877', '530422', '澄江县', '102.904629', '24.675689', 'district');
INSERT INTO `dd_district` VALUES (2635, 2631, '0877', '530423', '通海县', '102.725452', '24.111048', 'district');
INSERT INTO `dd_district` VALUES (2636, 2631, '0877', '530424', '华宁县', '102.928835', '24.19276', 'district');
INSERT INTO `dd_district` VALUES (2637, 2631, '0877', '530425', '易门县', '102.162531', '24.671651', 'district');
INSERT INTO `dd_district` VALUES (2638, 2631, '0877', '530426', '峨山彝族自治县', '102.405819', '24.168957', 'district');
INSERT INTO `dd_district` VALUES (2639, 2631, '0877', '530427', '新平彝族傣族自治县', '101.990157', '24.07005', 'district');
INSERT INTO `dd_district` VALUES (2640, 2631, '0877', '530428', '元江哈尼族彝族傣族自治县', '101.998103', '23.596503', 'district');
INSERT INTO `dd_district` VALUES (2641, 2605, '0875', '530500', '保山市', '99.161761', '25.112046', 'city');
INSERT INTO `dd_district` VALUES (2642, 2641, '0875', '530502', '隆阳区', '99.165607', '25.121154', 'district');
INSERT INTO `dd_district` VALUES (2643, 2641, '0875', '530521', '施甸县', '99.189221', '24.723064', 'district');
INSERT INTO `dd_district` VALUES (2644, 2641, '0875', '530523', '龙陵县', '98.689261', '24.586794', 'district');
INSERT INTO `dd_district` VALUES (2645, 2641, '0875', '530524', '昌宁县', '99.605142', '24.827839', 'district');
INSERT INTO `dd_district` VALUES (2646, 2641, '0875', '530581', '腾冲市', '98.490966', '25.020439', 'district');
INSERT INTO `dd_district` VALUES (2647, 2605, '0870', '530600', '昭通市', '103.717465', '27.338257', 'city');
INSERT INTO `dd_district` VALUES (2648, 2647, '0870', '530602', '昭阳区', '103.706539', '27.320075', 'district');
INSERT INTO `dd_district` VALUES (2649, 2647, '0870', '530621', '鲁甸县', '103.558042', '27.186659', 'district');
INSERT INTO `dd_district` VALUES (2650, 2647, '0870', '530622', '巧家县', '102.930164', '26.90846', 'district');
INSERT INTO `dd_district` VALUES (2651, 2647, '0870', '530623', '盐津县', '104.234441', '28.10871', 'district');
INSERT INTO `dd_district` VALUES (2652, 2647, '0870', '530624', '大关县', '103.891146', '27.747978', 'district');
INSERT INTO `dd_district` VALUES (2653, 2647, '0870', '530625', '永善县', '103.638067', '28.229112', 'district');
INSERT INTO `dd_district` VALUES (2654, 2647, '0870', '530626', '绥江县', '103.968978', '28.592099', 'district');
INSERT INTO `dd_district` VALUES (2655, 2647, '0870', '530627', '镇雄县', '104.87376', '27.441622', 'district');
INSERT INTO `dd_district` VALUES (2656, 2647, '0870', '530628', '彝良县', '104.048289', '27.625418', 'district');
INSERT INTO `dd_district` VALUES (2657, 2647, '0870', '530629', '威信县', '105.049027', '27.8469', 'district');
INSERT INTO `dd_district` VALUES (2658, 2647, '0870', '530630', '水富县', '104.41603', '28.62988', 'district');
INSERT INTO `dd_district` VALUES (2659, 2605, '0888', '530700', '丽江市', '100.22775', '26.855047', 'city');
INSERT INTO `dd_district` VALUES (2660, 2659, '0888', '530702', '古城区', '100.225784', '26.876927', 'district');
INSERT INTO `dd_district` VALUES (2661, 2659, '0888', '530721', '玉龙纳西族自治县', '100.236954', '26.821459', 'district');
INSERT INTO `dd_district` VALUES (2662, 2659, '0888', '530722', '永胜县', '100.750826', '26.684225', 'district');
INSERT INTO `dd_district` VALUES (2663, 2659, '0888', '530723', '华坪县', '101.266195', '26.629211', 'district');
INSERT INTO `dd_district` VALUES (2664, 2659, '0888', '530724', '宁蒗彝族自治县', '100.852001', '27.28207', 'district');
INSERT INTO `dd_district` VALUES (2665, 2605, '0879', '530800', '普洱市', '100.966156', '22.825155', 'city');
INSERT INTO `dd_district` VALUES (2666, 2665, '0879', '530802', '思茅区', '100.977256', '22.787115', 'district');
INSERT INTO `dd_district` VALUES (2667, 2665, '0879', '530821', '宁洱哈尼族彝族自治县', '101.045837', '23.048401', 'district');
INSERT INTO `dd_district` VALUES (2668, 2665, '0879', '530822', '墨江哈尼族自治县', '101.692461', '23.431894', 'district');
INSERT INTO `dd_district` VALUES (2669, 2665, '0879', '530823', '景东彝族自治县', '100.833877', '24.446731', 'district');
INSERT INTO `dd_district` VALUES (2670, 2665, '0879', '530824', '景谷傣族彝族自治县', '100.702871', '23.497028', 'district');
INSERT INTO `dd_district` VALUES (2671, 2665, '0879', '530825', '镇沅彝族哈尼族拉祜族自治县', '101.108595', '24.004441', 'district');
INSERT INTO `dd_district` VALUES (2672, 2665, '0879', '530826', '江城哈尼族彝族自治县', '101.86212', '22.585867', 'district');
INSERT INTO `dd_district` VALUES (2673, 2665, '0879', '530827', '孟连傣族拉祜族佤族自治县', '99.584157', '22.329099', 'district');
INSERT INTO `dd_district` VALUES (2674, 2665, '0879', '530828', '澜沧拉祜族自治县', '99.931975', '22.555904', 'district');
INSERT INTO `dd_district` VALUES (2675, 2665, '0879', '530829', '西盟佤族自治县', '99.590123', '22.644508', 'district');
INSERT INTO `dd_district` VALUES (2676, 2605, '0883', '530900', '临沧市', '100.08879', '23.883955', 'city');
INSERT INTO `dd_district` VALUES (2677, 2676, '0883', '530902', '临翔区', '100.082523', '23.895137', 'district');
INSERT INTO `dd_district` VALUES (2678, 2676, '0883', '530921', '凤庆县', '99.928459', '24.580424', 'district');
INSERT INTO `dd_district` VALUES (2679, 2676, '0883', '530922', '云县', '100.129354', '24.44422', 'district');
INSERT INTO `dd_district` VALUES (2680, 2676, '0883', '530923', '永德县', '99.259339', '24.018357', 'district');
INSERT INTO `dd_district` VALUES (2681, 2676, '0883', '530924', '镇康县', '98.825284', '23.762584', 'district');
INSERT INTO `dd_district` VALUES (2682, 2676, '0883', '530925', '双江拉祜族佤族布朗族傣族自治县', '99.827697', '23.473499', 'district');
INSERT INTO `dd_district` VALUES (2683, 2676, '0883', '530926', '耿马傣族佤族自治县', '99.397126', '23.538092', 'district');
INSERT INTO `dd_district` VALUES (2684, 2676, '0883', '530927', '沧源佤族自治县', '99.246196', '23.146712', 'district');
INSERT INTO `dd_district` VALUES (2685, 2605, '0878', '532300', '楚雄彝族自治州', '101.527992', '25.045513', 'city');
INSERT INTO `dd_district` VALUES (2686, 2685, '0878', '532301', '楚雄市', '101.545906', '25.032889', 'district');
INSERT INTO `dd_district` VALUES (2687, 2685, '0878', '532322', '双柏县', '101.641937', '24.688875', 'district');
INSERT INTO `dd_district` VALUES (2688, 2685, '0878', '532323', '牟定县', '101.546566', '25.313121', 'district');
INSERT INTO `dd_district` VALUES (2689, 2685, '0878', '532324', '南华县', '101.273577', '25.192293', 'district');
INSERT INTO `dd_district` VALUES (2690, 2685, '0878', '532325', '姚安县', '101.241728', '25.504173', 'district');
INSERT INTO `dd_district` VALUES (2691, 2685, '0878', '532326', '大姚县', '101.336617', '25.729513', 'district');
INSERT INTO `dd_district` VALUES (2692, 2685, '0878', '532327', '永仁县', '101.666132', '26.049464', 'district');
INSERT INTO `dd_district` VALUES (2693, 2685, '0878', '532328', '元谋县', '101.87452', '25.704338', 'district');
INSERT INTO `dd_district` VALUES (2694, 2685, '0878', '532329', '武定县', '102.404337', '25.530389', 'district');
INSERT INTO `dd_district` VALUES (2695, 2685, '0878', '532331', '禄丰县', '102.079027', '25.150111', 'district');
INSERT INTO `dd_district` VALUES (2696, 2605, '0873', '532500', '红河哈尼族彝族自治州', '103.374893', '23.363245', 'city');
INSERT INTO `dd_district` VALUES (2697, 2696, '0873', '532501', '个旧市', '103.160034', '23.359121', 'district');
INSERT INTO `dd_district` VALUES (2698, 2696, '0873', '532502', '开远市', '103.266624', '23.714523', 'district');
INSERT INTO `dd_district` VALUES (2699, 2696, '0873', '532503', '蒙自市', '103.364905', '23.396201', 'district');
INSERT INTO `dd_district` VALUES (2700, 2696, '0873', '532504', '弥勒市', '103.414874', '24.411912', 'district');
INSERT INTO `dd_district` VALUES (2701, 2696, '0873', '532523', '屏边苗族自治县', '103.687612', '22.983559', 'district');
INSERT INTO `dd_district` VALUES (2702, 2696, '0873', '532524', '建水县', '102.826557', '23.6347', 'district');
INSERT INTO `dd_district` VALUES (2703, 2696, '0873', '532525', '石屏县', '102.494983', '23.705936', 'district');
INSERT INTO `dd_district` VALUES (2704, 2696, '0873', '532527', '泸西县', '103.766196', '24.532025', 'district');
INSERT INTO `dd_district` VALUES (2705, 2696, '0873', '532528', '元阳县', '102.835223', '23.219932', 'district');
INSERT INTO `dd_district` VALUES (2706, 2696, '0873', '532529', '红河县', '102.4206', '23.369161', 'district');
INSERT INTO `dd_district` VALUES (2707, 2696, '0873', '532530', '金平苗族瑶族傣族自治县', '103.226448', '22.779543', 'district');
INSERT INTO `dd_district` VALUES (2708, 2696, '0873', '532531', '绿春县', '102.392463', '22.993717', 'district');
INSERT INTO `dd_district` VALUES (2709, 2696, '0873', '532532', '河口瑶族自治县', '103.93952', '22.529645', 'district');
INSERT INTO `dd_district` VALUES (2710, 2605, '0876', '532600', '文山壮族苗族自治州', '104.216248', '23.400733', 'city');
INSERT INTO `dd_district` VALUES (2711, 2710, '0876', '532601', '文山市', '104.232665', '23.386527', 'district');
INSERT INTO `dd_district` VALUES (2712, 2710, '0876', '532622', '砚山县', '104.337211', '23.605768', 'district');
INSERT INTO `dd_district` VALUES (2713, 2710, '0876', '532623', '西畴县', '104.672597', '23.437782', 'district');
INSERT INTO `dd_district` VALUES (2714, 2710, '0876', '532624', '麻栗坡县', '104.702799', '23.125714', 'district');
INSERT INTO `dd_district` VALUES (2715, 2710, '0876', '532625', '马关县', '104.394157', '23.012915', 'district');
INSERT INTO `dd_district` VALUES (2716, 2710, '0876', '532626', '丘北县', '104.166587', '24.051746', 'district');
INSERT INTO `dd_district` VALUES (2717, 2710, '0876', '532627', '广南县', '105.055107', '24.046386', 'district');
INSERT INTO `dd_district` VALUES (2718, 2710, '0876', '532628', '富宁县', '105.630999', '23.625283', 'district');
INSERT INTO `dd_district` VALUES (2719, 2605, '0691', '532800', '西双版纳傣族自治州', '100.796984', '22.009113', 'city');
INSERT INTO `dd_district` VALUES (2720, 2719, '0691', '532801', '景洪市', '100.799545', '22.011928', 'district');
INSERT INTO `dd_district` VALUES (2721, 2719, '0691', '532822', '勐海县', '100.452547', '21.957353', 'district');
INSERT INTO `dd_district` VALUES (2722, 2719, '0691', '532823', '勐腊县', '101.564635', '21.459233', 'district');
INSERT INTO `dd_district` VALUES (2723, 2605, '0872', '532900', '大理白族自治州', '100.267638', '25.606486', 'city');
INSERT INTO `dd_district` VALUES (2724, 2723, '0872', '532901', '大理市', '100.30127', '25.678068', 'district');
INSERT INTO `dd_district` VALUES (2725, 2723, '0872', '532922', '漾濞彝族自治县', '99.958015', '25.670148', 'district');
INSERT INTO `dd_district` VALUES (2726, 2723, '0872', '532923', '祥云县', '100.550945', '25.48385', 'district');
INSERT INTO `dd_district` VALUES (2727, 2723, '0872', '532924', '宾川县', '100.590473', '25.829828', 'district');
INSERT INTO `dd_district` VALUES (2728, 2723, '0872', '532925', '弥渡县', '100.49099', '25.343804', 'district');
INSERT INTO `dd_district` VALUES (2729, 2723, '0872', '532926', '南涧彝族自治县', '100.509035', '25.04351', 'district');
INSERT INTO `dd_district` VALUES (2730, 2723, '0872', '532927', '巍山彝族回族自治县', '100.307174', '25.227212', 'district');
INSERT INTO `dd_district` VALUES (2731, 2723, '0872', '532928', '永平县', '99.541236', '25.464681', 'district');
INSERT INTO `dd_district` VALUES (2732, 2723, '0872', '532929', '云龙县', '99.37112', '25.885595', 'district');
INSERT INTO `dd_district` VALUES (2733, 2723, '0872', '532930', '洱源县', '99.951053', '26.11116', 'district');
INSERT INTO `dd_district` VALUES (2734, 2723, '0872', '532931', '剑川县', '99.905559', '26.537033', 'district');
INSERT INTO `dd_district` VALUES (2735, 2723, '0872', '532932', '鹤庆县', '100.176498', '26.560231', 'district');
INSERT INTO `dd_district` VALUES (2736, 2605, '0692', '533100', '德宏傣族景颇族自治州', '98.584895', '24.433353', 'city');
INSERT INTO `dd_district` VALUES (2737, 2736, '0692', '533102', '瑞丽市', '97.85559', '24.017958', 'district');
INSERT INTO `dd_district` VALUES (2738, 2736, '0692', '533103', '芒市', '98.588086', '24.43369', 'district');
INSERT INTO `dd_district` VALUES (2739, 2736, '0692', '533122', '梁河县', '98.296657', '24.804232', 'district');
INSERT INTO `dd_district` VALUES (2740, 2736, '0692', '533123', '盈江县', '97.931936', '24.705164', 'district');
INSERT INTO `dd_district` VALUES (2741, 2736, '0692', '533124', '陇川县', '97.792104', '24.182965', 'district');
INSERT INTO `dd_district` VALUES (2742, 2605, '0886', '533300', '怒江傈僳族自治州', '98.8566', '25.817555', 'city');
INSERT INTO `dd_district` VALUES (2743, 2742, '0886', '533301', '泸水市', '98.857977', '25.822879', 'district');
INSERT INTO `dd_district` VALUES (2744, 2742, '0886', '533323', '福贡县', '98.869132', '26.901831', 'district');
INSERT INTO `dd_district` VALUES (2745, 2742, '0886', '533324', '贡山独龙族怒族自治县', '98.665964', '27.740999', 'district');
INSERT INTO `dd_district` VALUES (2746, 2742, '0886', '533325', '兰坪白族普米族自治县', '99.416677', '26.453571', 'district');
INSERT INTO `dd_district` VALUES (2747, 2605, '0887', '533400', '迪庆藏族自治州', '99.702583', '27.818807', 'city');
INSERT INTO `dd_district` VALUES (2748, 2747, '0887', '533401', '香格里拉市', '99.700904', '27.829578', 'district');
INSERT INTO `dd_district` VALUES (2749, 2747, '0887', '533422', '德钦县', '98.911559', '28.486163', 'district');
INSERT INTO `dd_district` VALUES (2750, 2747, '0887', '533423', '维西傈僳族自治县', '99.287173', '27.177161', 'district');
INSERT INTO `dd_district` VALUES (2751, 1, '0', '540000', '西藏自治区', '91.117525', '29.647535', 'province');
INSERT INTO `dd_district` VALUES (2752, 2751, '0891', '540100', '拉萨市', '91.172148', '29.652341', 'city');
INSERT INTO `dd_district` VALUES (2753, 2752, '0891', '540102', '城关区', '91.140552', '29.654838', 'district');
INSERT INTO `dd_district` VALUES (2754, 2752, '0891', '540103', '堆龙德庆区', '91.003339', '29.646063', 'district');
INSERT INTO `dd_district` VALUES (2755, 2752, '0891', '540121', '林周县', '91.265287', '29.893545', 'district');
INSERT INTO `dd_district` VALUES (2756, 2752, '0891', '540122', '当雄县', '91.101162', '30.473118', 'district');
INSERT INTO `dd_district` VALUES (2757, 2752, '0891', '540123', '尼木县', '90.164524', '29.431831', 'district');
INSERT INTO `dd_district` VALUES (2758, 2752, '0891', '540124', '曲水县', '90.743853', '29.353058', 'district');
INSERT INTO `dd_district` VALUES (2759, 2752, '0891', '540126', '达孜县', '91.349867', '29.66941', 'district');
INSERT INTO `dd_district` VALUES (2760, 2752, '0891', '540127', '墨竹工卡县', '91.730732', '29.834111', 'district');
INSERT INTO `dd_district` VALUES (2761, 2751, '0892', '540200', '日喀则市', '88.880583', '29.266869', 'city');
INSERT INTO `dd_district` VALUES (2762, 2761, '0892', '540202', '桑珠孜区', '88.898483', '29.24779', 'district');
INSERT INTO `dd_district` VALUES (2763, 2761, '0892', '540221', '南木林县', '89.099242', '29.68233', 'district');
INSERT INTO `dd_district` VALUES (2764, 2761, '0892', '540222', '江孜县', '89.605627', '28.911626', 'district');
INSERT INTO `dd_district` VALUES (2765, 2761, '0892', '540223', '定日县', '87.12612', '28.658743', 'district');
INSERT INTO `dd_district` VALUES (2766, 2761, '0892', '540224', '萨迦县', '88.021674', '28.899664', 'district');
INSERT INTO `dd_district` VALUES (2767, 2761, '0892', '540225', '拉孜县', '87.63704', '29.081659', 'district');
INSERT INTO `dd_district` VALUES (2768, 2761, '0892', '540226', '昂仁县', '87.236051', '29.294802', 'district');
INSERT INTO `dd_district` VALUES (2769, 2761, '0892', '540227', '谢通门县', '88.261664', '29.432476', 'district');
INSERT INTO `dd_district` VALUES (2770, 2761, '0892', '540228', '白朗县', '89.261977', '29.107688', 'district');
INSERT INTO `dd_district` VALUES (2771, 2761, '0892', '540229', '仁布县', '89.841983', '29.230933', 'district');
INSERT INTO `dd_district` VALUES (2772, 2761, '0892', '540230', '康马县', '89.681663', '28.555627', 'district');
INSERT INTO `dd_district` VALUES (2773, 2761, '0892', '540231', '定结县', '87.765872', '28.364159', 'district');
INSERT INTO `dd_district` VALUES (2774, 2761, '0892', '540232', '仲巴县', '84.03153', '29.770279', 'district');
INSERT INTO `dd_district` VALUES (2775, 2761, '0892', '540233', '亚东县', '88.907093', '27.484806', 'district');
INSERT INTO `dd_district` VALUES (2776, 2761, '0892', '540234', '吉隆县', '85.297534', '28.852393', 'district');
INSERT INTO `dd_district` VALUES (2777, 2761, '0892', '540235', '聂拉木县', '85.982237', '28.155186', 'district');
INSERT INTO `dd_district` VALUES (2778, 2761, '0892', '540236', '萨嘎县', '85.232941', '29.328818', 'district');
INSERT INTO `dd_district` VALUES (2779, 2761, '0892', '540237', '岗巴县', '88.520031', '28.274601', 'district');
INSERT INTO `dd_district` VALUES (2780, 2751, '0895', '540300', '昌都市', '97.17202', '31.140969', 'city');
INSERT INTO `dd_district` VALUES (2781, 2780, '0895', '540302', '卡若区', '97.196021', '31.112087', 'district');
INSERT INTO `dd_district` VALUES (2782, 2780, '0895', '540321', '江达县', '98.21843', '31.499202', 'district');
INSERT INTO `dd_district` VALUES (2783, 2780, '0895', '540322', '贡觉县', '98.27097', '30.860099', 'district');
INSERT INTO `dd_district` VALUES (2784, 2780, '0895', '540323', '类乌齐县', '96.600246', '31.211601', 'district');
INSERT INTO `dd_district` VALUES (2785, 2780, '0895', '540324', '丁青县', '95.619868', '31.409024', 'district');
INSERT INTO `dd_district` VALUES (2786, 2780, '0895', '540325', '察雅县', '97.568752', '30.653943', 'district');
INSERT INTO `dd_district` VALUES (2787, 2780, '0895', '540326', '八宿县', '96.917836', '30.053209', 'district');
INSERT INTO `dd_district` VALUES (2788, 2780, '0895', '540327', '左贡县', '97.841022', '29.671069', 'district');
INSERT INTO `dd_district` VALUES (2789, 2780, '0895', '540328', '芒康县', '98.593113', '29.679907', 'district');
INSERT INTO `dd_district` VALUES (2790, 2780, '0895', '540329', '洛隆县', '95.825197', '30.741845', 'district');
INSERT INTO `dd_district` VALUES (2791, 2780, '0895', '540330', '边坝县', '94.7078', '30.933652', 'district');
INSERT INTO `dd_district` VALUES (2792, 2751, '0894', '540400', '林芝市', '94.36149', '29.649128', 'city');
INSERT INTO `dd_district` VALUES (2793, 2792, '0894', '540402', '巴宜区', '94.361094', '29.636576', 'district');
INSERT INTO `dd_district` VALUES (2794, 2792, '0894', '540421', '工布江达县', '93.246077', '29.88528', 'district');
INSERT INTO `dd_district` VALUES (2795, 2792, '0894', '540422', '米林县', '94.213679', '29.213811', 'district');
INSERT INTO `dd_district` VALUES (2796, 2792, '0894', '540423', '墨脱县', '95.333197', '29.325298', 'district');
INSERT INTO `dd_district` VALUES (2797, 2792, '0894', '540424', '波密县', '95.767913', '29.859028', 'district');
INSERT INTO `dd_district` VALUES (2798, 2792, '0894', '540425', '察隅县', '97.466919', '28.66128', 'district');
INSERT INTO `dd_district` VALUES (2799, 2792, '0894', '540426', '朗县', '93.074702', '29.046337', 'district');
INSERT INTO `dd_district` VALUES (2800, 2751, '0893', '540500', '山南市', '91.773134', '29.237137', 'city');
INSERT INTO `dd_district` VALUES (2801, 2800, '0893', '540502', '乃东区', '91.761538', '29.224904', 'district');
INSERT INTO `dd_district` VALUES (2802, 2800, '0893', '540521', '扎囊县', '91.33725', '29.245113', 'district');
INSERT INTO `dd_district` VALUES (2803, 2800, '0893', '540522', '贡嘎县', '90.98414', '29.289455', 'district');
INSERT INTO `dd_district` VALUES (2804, 2800, '0893', '540523', '桑日县', '92.015818', '29.259189', 'district');
INSERT INTO `dd_district` VALUES (2805, 2800, '0893', '540524', '琼结县', '91.683881', '29.024625', 'district');
INSERT INTO `dd_district` VALUES (2806, 2800, '0893', '540525', '曲松县', '92.203738', '29.062826', 'district');
INSERT INTO `dd_district` VALUES (2807, 2800, '0893', '540526', '措美县', '91.433509', '28.438202', 'district');
INSERT INTO `dd_district` VALUES (2808, 2800, '0893', '540527', '洛扎县', '90.859992', '28.385713', 'district');
INSERT INTO `dd_district` VALUES (2809, 2800, '0893', '540528', '加查县', '92.593993', '29.14029', 'district');
INSERT INTO `dd_district` VALUES (2810, 2800, '0893', '540529', '隆子县', '92.463308', '28.408548', 'district');
INSERT INTO `dd_district` VALUES (2811, 2800, '0893', '540530', '错那县', '91.960132', '27.991707', 'district');
INSERT INTO `dd_district` VALUES (2812, 2800, '0893', '540531', '浪卡子县', '90.397977', '28.968031', 'district');
INSERT INTO `dd_district` VALUES (2813, 2751, '0896', '542400', '那曲地区', '92.052064', '31.476479', 'city');
INSERT INTO `dd_district` VALUES (2814, 2813, '0896', '542421', '那曲县', '92.0535', '31.469643', 'district');
INSERT INTO `dd_district` VALUES (2815, 2813, '0896', '542422', '嘉黎县', '93.232528', '30.640814', 'district');
INSERT INTO `dd_district` VALUES (2816, 2813, '0896', '542423', '比如县', '93.679639', '31.480249', 'district');
INSERT INTO `dd_district` VALUES (2817, 2813, '0896', '542424', '聂荣县', '92.303377', '32.10775', 'district');
INSERT INTO `dd_district` VALUES (2818, 2813, '0896', '542425', '安多县', '91.68233', '32.265176', 'district');
INSERT INTO `dd_district` VALUES (2819, 2813, '0896', '542426', '申扎县', '88.709852', '30.930505', 'district');
INSERT INTO `dd_district` VALUES (2820, 2813, '0896', '542427', '索县', '93.785516', '31.886671', 'district');
INSERT INTO `dd_district` VALUES (2821, 2813, '0896', '542428', '班戈县', '90.009957', '31.392411', 'district');
INSERT INTO `dd_district` VALUES (2822, 2813, '0896', '542429', '巴青县', '94.053438', '31.91847', 'district');
INSERT INTO `dd_district` VALUES (2823, 2813, '0896', '542430', '尼玛县', '87.236772', '31.784701', 'district');
INSERT INTO `dd_district` VALUES (2824, 2813, '0896', '542431', '双湖县', '88.837641', '33.188514', 'district');
INSERT INTO `dd_district` VALUES (2825, 2751, '0897', '542500', '阿里地区', '80.105804', '32.501111', 'city');
INSERT INTO `dd_district` VALUES (2826, 2825, '0897', '542521', '普兰县', '81.176237', '30.294402', 'district');
INSERT INTO `dd_district` VALUES (2827, 2825, '0897', '542522', '札达县', '79.802706', '31.479216', 'district');
INSERT INTO `dd_district` VALUES (2828, 2825, '0897', '542523', '噶尔县', '80.096419', '32.491488', 'district');
INSERT INTO `dd_district` VALUES (2829, 2825, '0897', '542524', '日土县', '79.732427', '33.381359', 'district');
INSERT INTO `dd_district` VALUES (2830, 2825, '0897', '542525', '革吉县', '81.145433', '32.387233', 'district');
INSERT INTO `dd_district` VALUES (2831, 2825, '0897', '542526', '改则县', '84.06259', '32.302713', 'district');
INSERT INTO `dd_district` VALUES (2832, 2825, '0897', '542527', '措勤县', '85.151455', '31.017312', 'district');
INSERT INTO `dd_district` VALUES (2833, 1, '0', '610000', '陕西省', '108.954347', '34.265502', 'province');
INSERT INTO `dd_district` VALUES (2834, 2833, '029', '610100', '西安市', '108.93977', '34.341574', 'city');
INSERT INTO `dd_district` VALUES (2835, 2834, '029', '610102', '新城区', '108.960716', '34.266447', 'district');
INSERT INTO `dd_district` VALUES (2836, 2834, '029', '610103', '碑林区', '108.94059', '34.256783', 'district');
INSERT INTO `dd_district` VALUES (2837, 2834, '029', '610104', '莲湖区', '108.943895', '34.265239', 'district');
INSERT INTO `dd_district` VALUES (2838, 2834, '029', '610111', '灞桥区', '109.064646', '34.272793', 'district');
INSERT INTO `dd_district` VALUES (2839, 2834, '029', '610112', '未央区', '108.946825', '34.29292', 'district');
INSERT INTO `dd_district` VALUES (2840, 2834, '029', '610113', '雁塔区', '108.944644', '34.214113', 'district');
INSERT INTO `dd_district` VALUES (2841, 2834, '029', '610114', '阎良区', '109.226124', '34.662232', 'district');
INSERT INTO `dd_district` VALUES (2842, 2834, '029', '610115', '临潼区', '109.214237', '34.367069', 'district');
INSERT INTO `dd_district` VALUES (2843, 2834, '029', '610116', '长安区', '108.907173', '34.158926', 'district');
INSERT INTO `dd_district` VALUES (2844, 2834, '029', '610117', '高陵区', '109.088297', '34.534829', 'district');
INSERT INTO `dd_district` VALUES (2845, 2834, '029', '610122', '蓝田县', '109.32345', '34.151298', 'district');
INSERT INTO `dd_district` VALUES (2846, 2834, '029', '610124', '周至县', '108.222162', '34.163669', 'district');
INSERT INTO `dd_district` VALUES (2847, 2834, '029', '610125', '鄠邑区', '108.604894', '34.109244', 'district');
INSERT INTO `dd_district` VALUES (2848, 2833, '0919', '610200', '铜川市', '108.945019', '34.897887', 'city');
INSERT INTO `dd_district` VALUES (2849, 2848, '0919', '610202', '王益区', '109.075578', '35.068964', 'district');
INSERT INTO `dd_district` VALUES (2850, 2848, '0919', '610203', '印台区', '109.099974', '35.114492', 'district');
INSERT INTO `dd_district` VALUES (2851, 2848, '0919', '610204', '耀州区', '108.980102', '34.909793', 'district');
INSERT INTO `dd_district` VALUES (2852, 2848, '0919', '610222', '宜君县', '109.116932', '35.398577', 'district');
INSERT INTO `dd_district` VALUES (2853, 2833, '0917', '610300', '宝鸡市', '107.237743', '34.363184', 'city');
INSERT INTO `dd_district` VALUES (2854, 2853, '0917', '610302', '渭滨区', '107.155344', '34.355068', 'district');
INSERT INTO `dd_district` VALUES (2855, 2853, '0917', '610303', '金台区', '107.146806', '34.376069', 'district');
INSERT INTO `dd_district` VALUES (2856, 2853, '0917', '610304', '陈仓区', '107.369987', '34.35147', 'district');
INSERT INTO `dd_district` VALUES (2857, 2853, '0917', '610322', '凤翔县', '107.400737', '34.521217', 'district');
INSERT INTO `dd_district` VALUES (2858, 2853, '0917', '610323', '岐山县', '107.621053', '34.443459', 'district');
INSERT INTO `dd_district` VALUES (2859, 2853, '0917', '610324', '扶风县', '107.900219', '34.37541', 'district');
INSERT INTO `dd_district` VALUES (2860, 2853, '0917', '610326', '眉县', '107.749766', '34.274246', 'district');
INSERT INTO `dd_district` VALUES (2861, 2853, '0917', '610327', '陇县', '106.864397', '34.89305', 'district');
INSERT INTO `dd_district` VALUES (2862, 2853, '0917', '610328', '千阳县', '107.132441', '34.642381', 'district');
INSERT INTO `dd_district` VALUES (2863, 2853, '0917', '610329', '麟游县', '107.793524', '34.677902', 'district');
INSERT INTO `dd_district` VALUES (2864, 2853, '0917', '610330', '凤县', '106.515803', '33.91091', 'district');
INSERT INTO `dd_district` VALUES (2865, 2853, '0917', '610331', '太白县', '107.319116', '34.058401', 'district');
INSERT INTO `dd_district` VALUES (2866, 2833, '0910', '610400', '咸阳市', '108.709136', '34.32987', 'city');
INSERT INTO `dd_district` VALUES (2867, 2866, '0910', '610402', '秦都区', '108.706272', '34.329567', 'district');
INSERT INTO `dd_district` VALUES (2868, 2866, '0910', '610403', '杨陵区', '108.084731', '34.272117', 'district');
INSERT INTO `dd_district` VALUES (2869, 2866, '0910', '610404', '渭城区', '108.737204', '34.36195', 'district');
INSERT INTO `dd_district` VALUES (2870, 2866, '0910', '610422', '三原县', '108.940509', '34.617381', 'district');
INSERT INTO `dd_district` VALUES (2871, 2866, '0910', '610423', '泾阳县', '108.842622', '34.527114', 'district');
INSERT INTO `dd_district` VALUES (2872, 2866, '0910', '610424', '乾县', '108.239473', '34.527551', 'district');
INSERT INTO `dd_district` VALUES (2873, 2866, '0910', '610425', '礼泉县', '108.425018', '34.481764', 'district');
INSERT INTO `dd_district` VALUES (2874, 2866, '0910', '610426', '永寿县', '108.142311', '34.691979', 'district');
INSERT INTO `dd_district` VALUES (2875, 2866, '0910', '610427', '彬县', '108.077658', '35.043911', 'district');
INSERT INTO `dd_district` VALUES (2876, 2866, '0910', '610428', '长武县', '107.798757', '35.205886', 'district');
INSERT INTO `dd_district` VALUES (2877, 2866, '0910', '610429', '旬邑县', '108.333986', '35.111978', 'district');
INSERT INTO `dd_district` VALUES (2878, 2866, '0910', '610430', '淳化县', '108.580681', '34.79925', 'district');
INSERT INTO `dd_district` VALUES (2879, 2866, '0910', '610431', '武功县', '108.200398', '34.260203', 'district');
INSERT INTO `dd_district` VALUES (2880, 2866, '0910', '610481', '兴平市', '108.490475', '34.29922', 'district');
INSERT INTO `dd_district` VALUES (2881, 2833, '0913', '610500', '渭南市', '109.471094', '34.52044', 'city');
INSERT INTO `dd_district` VALUES (2882, 2881, '0913', '610502', '临渭区', '109.510175', '34.499314', 'district');
INSERT INTO `dd_district` VALUES (2883, 2881, '0913', '610503', '华州区', '109.775247', '34.495915', 'district');
INSERT INTO `dd_district` VALUES (2884, 2881, '0913', '610522', '潼关县', '110.246349', '34.544296', 'district');
INSERT INTO `dd_district` VALUES (2885, 2881, '0913', '610523', '大荔县', '109.941734', '34.797259', 'district');
INSERT INTO `dd_district` VALUES (2886, 2881, '0913', '610524', '合阳县', '110.149453', '35.237988', 'district');
INSERT INTO `dd_district` VALUES (2887, 2881, '0913', '610525', '澄城县', '109.93235', '35.190245', 'district');
INSERT INTO `dd_district` VALUES (2888, 2881, '0913', '610526', '蒲城县', '109.586403', '34.955562', 'district');
INSERT INTO `dd_district` VALUES (2889, 2881, '0913', '610527', '白水县', '109.590671', '35.177451', 'district');
INSERT INTO `dd_district` VALUES (2890, 2881, '0913', '610528', '富平县', '109.18032', '34.751077', 'district');
INSERT INTO `dd_district` VALUES (2891, 2881, '0913', '610581', '韩城市', '110.442846', '35.476788', 'district');
INSERT INTO `dd_district` VALUES (2892, 2881, '0913', '610582', '华阴市', '110.092078', '34.566079', 'district');
INSERT INTO `dd_district` VALUES (2893, 2833, '0911', '610600', '延安市', '109.494112', '36.651381', 'city');
INSERT INTO `dd_district` VALUES (2894, 2893, '0911', '610602', '宝塔区', '109.48976', '36.585472', 'district');
INSERT INTO `dd_district` VALUES (2895, 2893, '0911', '610621', '延长县', '110.012334', '36.579313', 'district');
INSERT INTO `dd_district` VALUES (2896, 2893, '0911', '610622', '延川县', '110.193514', '36.878117', 'district');
INSERT INTO `dd_district` VALUES (2897, 2893, '0911', '610623', '子长县', '109.675264', '37.142535', 'district');
INSERT INTO `dd_district` VALUES (2898, 2893, '0911', '610624', '安塞区', '109.328842', '36.863853', 'district');
INSERT INTO `dd_district` VALUES (2899, 2893, '0911', '610625', '志丹县', '108.768432', '36.822194', 'district');
INSERT INTO `dd_district` VALUES (2900, 2893, '0911', '610626', '吴起县', '108.175933', '36.927215', 'district');
INSERT INTO `dd_district` VALUES (2901, 2893, '0911', '610627', '甘泉县', '109.351019', '36.276526', 'district');
INSERT INTO `dd_district` VALUES (2902, 2893, '0911', '610628', '富县', '109.379776', '35.987953', 'district');
INSERT INTO `dd_district` VALUES (2903, 2893, '0911', '610629', '洛川县', '109.432369', '35.761974', 'district');
INSERT INTO `dd_district` VALUES (2904, 2893, '0911', '610630', '宜川县', '110.168963', '36.050178', 'district');
INSERT INTO `dd_district` VALUES (2905, 2893, '0911', '610631', '黄龙县', '109.840314', '35.584743', 'district');
INSERT INTO `dd_district` VALUES (2906, 2893, '0911', '610632', '黄陵县', '109.262961', '35.579427', 'district');
INSERT INTO `dd_district` VALUES (2907, 2833, '0916', '610700', '汉中市', '107.02305', '33.067225', 'city');
INSERT INTO `dd_district` VALUES (2908, 2907, '0916', '610702', '汉台区', '107.031856', '33.067771', 'district');
INSERT INTO `dd_district` VALUES (2909, 2907, '0916', '610721', '南郑县', '106.93623', '32.999333', 'district');
INSERT INTO `dd_district` VALUES (2910, 2907, '0916', '610722', '城固县', '107.33393', '33.157131', 'district');
INSERT INTO `dd_district` VALUES (2911, 2907, '0916', '610723', '洋县', '107.545836', '33.222738', 'district');
INSERT INTO `dd_district` VALUES (2912, 2907, '0916', '610724', '西乡县', '107.766613', '32.983101', 'district');
INSERT INTO `dd_district` VALUES (2913, 2907, '0916', '610725', '勉县', '106.673221', '33.153553', 'district');
INSERT INTO `dd_district` VALUES (2914, 2907, '0916', '610726', '宁强县', '106.257171', '32.829694', 'district');
INSERT INTO `dd_district` VALUES (2915, 2907, '0916', '610727', '略阳县', '106.156718', '33.327281', 'district');
INSERT INTO `dd_district` VALUES (2916, 2907, '0916', '610728', '镇巴县', '107.895035', '32.536704', 'district');
INSERT INTO `dd_district` VALUES (2917, 2907, '0916', '610729', '留坝县', '106.920808', '33.617571', 'district');
INSERT INTO `dd_district` VALUES (2918, 2907, '0916', '610730', '佛坪县', '107.990538', '33.524359', 'district');
INSERT INTO `dd_district` VALUES (2919, 2833, '0912', '610800', '榆林市', '109.734474', '38.285369', 'city');
INSERT INTO `dd_district` VALUES (2920, 2919, '0912', '610802', '榆阳区', '109.721069', '38.277046', 'district');
INSERT INTO `dd_district` VALUES (2921, 2919, '0912', '610803', '横山区', '109.294346', '37.962208', 'district');
INSERT INTO `dd_district` VALUES (2922, 2919, '0912', '610821', '神木县', '110.498939', '38.842578', 'district');
INSERT INTO `dd_district` VALUES (2923, 2919, '0912', '610822', '府谷县', '111.067276', '39.028116', 'district');
INSERT INTO `dd_district` VALUES (2924, 2919, '0912', '610824', '靖边县', '108.793988', '37.599438', 'district');
INSERT INTO `dd_district` VALUES (2925, 2919, '0912', '610825', '定边县', '107.601267', '37.594612', 'district');
INSERT INTO `dd_district` VALUES (2926, 2919, '0912', '610826', '绥德县', '110.263362', '37.50294', 'district');
INSERT INTO `dd_district` VALUES (2927, 2919, '0912', '610827', '米脂县', '110.183754', '37.755416', 'district');
INSERT INTO `dd_district` VALUES (2928, 2919, '0912', '610828', '佳县', '110.491345', '38.01951', 'district');
INSERT INTO `dd_district` VALUES (2929, 2919, '0912', '610829', '吴堡县', '110.739673', '37.452067', 'district');
INSERT INTO `dd_district` VALUES (2930, 2919, '0912', '610830', '清涧县', '110.121209', '37.088878', 'district');
INSERT INTO `dd_district` VALUES (2931, 2919, '0912', '610831', '子洲县', '110.03525', '37.610683', 'district');
INSERT INTO `dd_district` VALUES (2932, 2833, '0915', '610900', '安康市', '109.029113', '32.68481', 'city');
INSERT INTO `dd_district` VALUES (2933, 2932, '0915', '610902', '汉滨区', '109.026836', '32.695172', 'district');
INSERT INTO `dd_district` VALUES (2934, 2932, '0915', '610921', '汉阴县', '108.508745', '32.893026', 'district');
INSERT INTO `dd_district` VALUES (2935, 2932, '0915', '610922', '石泉县', '108.247886', '33.038408', 'district');
INSERT INTO `dd_district` VALUES (2936, 2932, '0915', '610923', '宁陕县', '108.314283', '33.310527', 'district');
INSERT INTO `dd_district` VALUES (2937, 2932, '0915', '610924', '紫阳县', '108.534228', '32.520246', 'district');
INSERT INTO `dd_district` VALUES (2938, 2932, '0915', '610925', '岚皋县', '108.902049', '32.307001', 'district');
INSERT INTO `dd_district` VALUES (2939, 2932, '0915', '610926', '平利县', '109.361864', '32.388854', 'district');
INSERT INTO `dd_district` VALUES (2940, 2932, '0915', '610927', '镇坪县', '109.526873', '31.883672', 'district');
INSERT INTO `dd_district` VALUES (2941, 2932, '0915', '610928', '旬阳县', '109.361024', '32.832012', 'district');
INSERT INTO `dd_district` VALUES (2942, 2932, '0915', '610929', '白河县', '110.112629', '32.809026', 'district');
INSERT INTO `dd_district` VALUES (2943, 2833, '0914', '611000', '商洛市', '109.91857', '33.872726', 'city');
INSERT INTO `dd_district` VALUES (2944, 2943, '0914', '611002', '商州区', '109.941839', '33.862599', 'district');
INSERT INTO `dd_district` VALUES (2945, 2943, '0914', '611021', '洛南县', '110.148508', '34.090837', 'district');
INSERT INTO `dd_district` VALUES (2946, 2943, '0914', '611022', '丹凤县', '110.32733', '33.695783', 'district');
INSERT INTO `dd_district` VALUES (2947, 2943, '0914', '611023', '商南县', '110.881807', '33.530995', 'district');
INSERT INTO `dd_district` VALUES (2948, 2943, '0914', '611024', '山阳县', '109.882289', '33.532172', 'district');
INSERT INTO `dd_district` VALUES (2949, 2943, '0914', '611025', '镇安县', '109.152892', '33.423357', 'district');
INSERT INTO `dd_district` VALUES (2950, 2943, '0914', '611026', '柞水县', '109.114206', '33.68611', 'district');
INSERT INTO `dd_district` VALUES (2951, 1, '0', '620000', '甘肃省', '103.826447', '36.05956', 'province');
INSERT INTO `dd_district` VALUES (2952, 2951, '0931', '620100', '兰州市', '103.834303', '36.061089', 'city');
INSERT INTO `dd_district` VALUES (2953, 2952, '0931', '620102', '城关区', '103.825307', '36.057464', 'district');
INSERT INTO `dd_district` VALUES (2954, 2952, '0931', '620103', '七里河区', '103.785949', '36.066146', 'district');
INSERT INTO `dd_district` VALUES (2955, 2952, '0931', '620104', '西固区', '103.627951', '36.088552', 'district');
INSERT INTO `dd_district` VALUES (2956, 2952, '0931', '620105', '安宁区', '103.719054', '36.104579', 'district');
INSERT INTO `dd_district` VALUES (2957, 2952, '0931', '620111', '红古区', '102.859323', '36.345669', 'district');
INSERT INTO `dd_district` VALUES (2958, 2952, '0931', '620121', '永登县', '103.26038', '36.736513', 'district');
INSERT INTO `dd_district` VALUES (2959, 2952, '0931', '620122', '皋兰县', '103.947377', '36.332663', 'district');
INSERT INTO `dd_district` VALUES (2960, 2952, '0931', '620123', '榆中县', '104.112527', '35.843056', 'district');
INSERT INTO `dd_district` VALUES (2961, 2951, '1937', '620200', '嘉峪关市', '98.289419', '39.772554', 'city');
INSERT INTO `dd_district` VALUES (2962, 2961, '1937', '620200', '嘉峪关市', '98.289419', '39.772554', 'district');
INSERT INTO `dd_district` VALUES (2963, 2951, '0935', '620300', '金昌市', '102.188117', '38.520717', 'city');
INSERT INTO `dd_district` VALUES (2964, 2963, '0935', '620302', '金川区', '102.194015', '38.521087', 'district');
INSERT INTO `dd_district` VALUES (2965, 2963, '0935', '620321', '永昌县', '101.984458', '38.243434', 'district');
INSERT INTO `dd_district` VALUES (2966, 2951, '0943', '620400', '白银市', '104.138771', '36.545261', 'city');
INSERT INTO `dd_district` VALUES (2967, 2966, '0943', '620402', '白银区', '104.148556', '36.535398', 'district');
INSERT INTO `dd_district` VALUES (2968, 2966, '0943', '620403', '平川区', '104.825208', '36.728304', 'district');
INSERT INTO `dd_district` VALUES (2969, 2966, '0943', '620421', '靖远县', '104.676774', '36.571365', 'district');
INSERT INTO `dd_district` VALUES (2970, 2966, '0943', '620422', '会宁县', '105.053358', '35.692823', 'district');
INSERT INTO `dd_district` VALUES (2971, 2966, '0943', '620423', '景泰县', '104.063091', '37.183804', 'district');
INSERT INTO `dd_district` VALUES (2972, 2951, '0938', '620500', '天水市', '105.724979', '34.580885', 'city');
INSERT INTO `dd_district` VALUES (2973, 2972, '0938', '620502', '秦州区', '105.724215', '34.580888', 'district');
INSERT INTO `dd_district` VALUES (2974, 2972, '0938', '620503', '麦积区', '105.889556', '34.570384', 'district');
INSERT INTO `dd_district` VALUES (2975, 2972, '0938', '620521', '清水县', '106.137293', '34.749864', 'district');
INSERT INTO `dd_district` VALUES (2976, 2972, '0938', '620522', '秦安县', '105.674982', '34.858916', 'district');
INSERT INTO `dd_district` VALUES (2977, 2972, '0938', '620523', '甘谷县', '105.340747', '34.745486', 'district');
INSERT INTO `dd_district` VALUES (2978, 2972, '0938', '620524', '武山县', '104.890587', '34.72139', 'district');
INSERT INTO `dd_district` VALUES (2979, 2972, '0938', '620525', '张家川回族自治县', '106.204517', '34.988037', 'district');
INSERT INTO `dd_district` VALUES (2980, 2951, '1935', '620600', '武威市', '102.638201', '37.928267', 'city');
INSERT INTO `dd_district` VALUES (2981, 2980, '1935', '620602', '凉州区', '102.642184', '37.928224', 'district');
INSERT INTO `dd_district` VALUES (2982, 2980, '1935', '620621', '民勤县', '103.093791', '38.62435', 'district');
INSERT INTO `dd_district` VALUES (2983, 2980, '1935', '620622', '古浪县', '102.897533', '37.47012', 'district');
INSERT INTO `dd_district` VALUES (2984, 2980, '1935', '620623', '天祝藏族自治县', '103.141757', '36.97174', 'district');
INSERT INTO `dd_district` VALUES (2985, 2951, '0936', '620700', '张掖市', '100.449913', '38.925548', 'city');
INSERT INTO `dd_district` VALUES (2986, 2985, '0936', '620702', '甘州区', '100.415096', '38.944662', 'district');
INSERT INTO `dd_district` VALUES (2987, 2985, '0936', '620721', '肃南裕固族自治县', '99.615601', '38.836931', 'district');
INSERT INTO `dd_district` VALUES (2988, 2985, '0936', '620722', '民乐县', '100.812629', '38.430347', 'district');
INSERT INTO `dd_district` VALUES (2989, 2985, '0936', '620723', '临泽县', '100.164283', '39.152462', 'district');
INSERT INTO `dd_district` VALUES (2990, 2985, '0936', '620724', '高台县', '99.819519', '39.378311', 'district');
INSERT INTO `dd_district` VALUES (2991, 2985, '0936', '620725', '山丹县', '101.088529', '38.784505', 'district');
INSERT INTO `dd_district` VALUES (2992, 2951, '0933', '620800', '平凉市', '106.665061', '35.542606', 'city');
INSERT INTO `dd_district` VALUES (2993, 2992, '0933', '620802', '崆峒区', '106.674767', '35.542491', 'district');
INSERT INTO `dd_district` VALUES (2994, 2992, '0933', '620821', '泾川县', '107.36785', '35.332666', 'district');
INSERT INTO `dd_district` VALUES (2995, 2992, '0933', '620822', '灵台县', '107.595874', '35.070027', 'district');
INSERT INTO `dd_district` VALUES (2996, 2992, '0933', '620823', '崇信县', '107.025763', '35.305596', 'district');
INSERT INTO `dd_district` VALUES (2997, 2992, '0933', '620824', '华亭县', '106.653158', '35.218292', 'district');
INSERT INTO `dd_district` VALUES (2998, 2992, '0933', '620825', '庄浪县', '106.036686', '35.202385', 'district');
INSERT INTO `dd_district` VALUES (2999, 2992, '0933', '620826', '静宁县', '105.732556', '35.521976', 'district');
INSERT INTO `dd_district` VALUES (3000, 2951, '0937', '620900', '酒泉市', '98.493927', '39.732795', 'city');
INSERT INTO `dd_district` VALUES (3001, 3000, '0937', '620902', '肃州区', '98.507843', '39.744953', 'district');
INSERT INTO `dd_district` VALUES (3002, 3000, '0937', '620921', '金塔县', '98.901252', '39.983955', 'district');
INSERT INTO `dd_district` VALUES (3003, 3000, '0937', '620922', '瓜州县', '95.782318', '40.520538', 'district');
INSERT INTO `dd_district` VALUES (3004, 3000, '0937', '620923', '肃北蒙古族自治县', '94.876579', '39.51245', 'district');
INSERT INTO `dd_district` VALUES (3005, 3000, '0937', '620924', '阿克塞哈萨克族自治县', '94.340204', '39.633943', 'district');
INSERT INTO `dd_district` VALUES (3006, 3000, '0937', '620981', '玉门市', '97.045661', '40.292106', 'district');
INSERT INTO `dd_district` VALUES (3007, 3000, '0937', '620982', '敦煌市', '94.661941', '40.142089', 'district');
INSERT INTO `dd_district` VALUES (3008, 2951, '0934', '621000', '庆阳市', '107.643571', '35.70898', 'city');
INSERT INTO `dd_district` VALUES (3009, 3008, '0934', '621002', '西峰区', '107.651077', '35.730652', 'district');
INSERT INTO `dd_district` VALUES (3010, 3008, '0934', '621021', '庆城县', '107.881802', '36.016299', 'district');
INSERT INTO `dd_district` VALUES (3011, 3008, '0934', '621022', '环县', '107.308501', '36.568434', 'district');
INSERT INTO `dd_district` VALUES (3012, 3008, '0934', '621023', '华池县', '107.990062', '36.461306', 'district');
INSERT INTO `dd_district` VALUES (3013, 3008, '0934', '621024', '合水县', '108.019554', '35.819194', 'district');
INSERT INTO `dd_district` VALUES (3014, 3008, '0934', '621025', '正宁县', '108.359865', '35.49178', 'district');
INSERT INTO `dd_district` VALUES (3015, 3008, '0934', '621026', '宁县', '107.928371', '35.502176', 'district');
INSERT INTO `dd_district` VALUES (3016, 3008, '0934', '621027', '镇原县', '107.200832', '35.677462', 'district');
INSERT INTO `dd_district` VALUES (3017, 2951, '0932', '621100', '定西市', '104.592225', '35.606978', 'city');
INSERT INTO `dd_district` VALUES (3018, 3017, '0932', '621102', '安定区', '104.610668', '35.580629', 'district');
INSERT INTO `dd_district` VALUES (3019, 3017, '0932', '621121', '通渭县', '105.24206', '35.210831', 'district');
INSERT INTO `dd_district` VALUES (3020, 3017, '0932', '621122', '陇西县', '104.634983', '35.00394', 'district');
INSERT INTO `dd_district` VALUES (3021, 3017, '0932', '621123', '渭源县', '104.215467', '35.136755', 'district');
INSERT INTO `dd_district` VALUES (3022, 3017, '0932', '621124', '临洮县', '103.859565', '35.394988', 'district');
INSERT INTO `dd_district` VALUES (3023, 3017, '0932', '621125', '漳县', '104.471572', '34.848444', 'district');
INSERT INTO `dd_district` VALUES (3024, 3017, '0932', '621126', '岷县', '104.03688', '34.438075', 'district');
INSERT INTO `dd_district` VALUES (3025, 2951, '2935', '621200', '陇南市', '104.960851', '33.37068', 'city');
INSERT INTO `dd_district` VALUES (3026, 3025, '2935', '621202', '武都区', '104.926337', '33.392211', 'district');
INSERT INTO `dd_district` VALUES (3027, 3025, '2935', '621221', '成县', '105.742424', '33.75061', 'district');
INSERT INTO `dd_district` VALUES (3028, 3025, '2935', '621222', '文县', '104.683433', '32.943815', 'district');
INSERT INTO `dd_district` VALUES (3029, 3025, '2935', '621223', '宕昌县', '104.393385', '34.047261', 'district');
INSERT INTO `dd_district` VALUES (3030, 3025, '2935', '621224', '康县', '105.609169', '33.329136', 'district');
INSERT INTO `dd_district` VALUES (3031, 3025, '2935', '621225', '西和县', '105.298756', '34.014215', 'district');
INSERT INTO `dd_district` VALUES (3032, 3025, '2935', '621226', '礼县', '105.17864', '34.189345', 'district');
INSERT INTO `dd_district` VALUES (3033, 3025, '2935', '621227', '徽县', '106.08778', '33.768826', 'district');
INSERT INTO `dd_district` VALUES (3034, 3025, '2935', '621228', '两当县', '106.304966', '33.908917', 'district');
INSERT INTO `dd_district` VALUES (3035, 2951, '0930', '622900', '临夏回族自治州', '103.210655', '35.601352', 'city');
INSERT INTO `dd_district` VALUES (3036, 3035, '0930', '622901', '临夏市', '103.243021', '35.604376', 'district');
INSERT INTO `dd_district` VALUES (3037, 3035, '0930', '622921', '临夏县', '103.039826', '35.478722', 'district');
INSERT INTO `dd_district` VALUES (3038, 3035, '0930', '622922', '康乐县', '103.708354', '35.370505', 'district');
INSERT INTO `dd_district` VALUES (3039, 3035, '0930', '622923', '永靖县', '103.285853', '35.958306', 'district');
INSERT INTO `dd_district` VALUES (3040, 3035, '0930', '622924', '广河县', '103.575834', '35.488051', 'district');
INSERT INTO `dd_district` VALUES (3041, 3035, '0930', '622925', '和政县', '103.350997', '35.424603', 'district');
INSERT INTO `dd_district` VALUES (3042, 3035, '0930', '622926', '东乡族自治县', '103.389346', '35.663752', 'district');
INSERT INTO `dd_district` VALUES (3043, 3035, '0930', '622927', '积石山保安族东乡族撒拉族自治县', '102.875843', '35.71766', 'district');
INSERT INTO `dd_district` VALUES (3044, 2951, '0941', '623000', '甘南藏族自治州', '102.910995', '34.983409', 'city');
INSERT INTO `dd_district` VALUES (3045, 3044, '0941', '623001', '合作市', '102.910484', '35.000286', 'district');
INSERT INTO `dd_district` VALUES (3046, 3044, '0941', '623021', '临潭县', '103.353919', '34.692747', 'district');
INSERT INTO `dd_district` VALUES (3047, 3044, '0941', '623022', '卓尼县', '103.507109', '34.589588', 'district');
INSERT INTO `dd_district` VALUES (3048, 3044, '0941', '623023', '舟曲县', '104.251482', '33.793631', 'district');
INSERT INTO `dd_district` VALUES (3049, 3044, '0941', '623024', '迭部县', '103.221869', '34.055938', 'district');
INSERT INTO `dd_district` VALUES (3050, 3044, '0941', '623025', '玛曲县', '102.072698', '33.997712', 'district');
INSERT INTO `dd_district` VALUES (3051, 3044, '0941', '623026', '碌曲县', '102.487327', '34.590944', 'district');
INSERT INTO `dd_district` VALUES (3052, 3044, '0941', '623027', '夏河县', '102.521807', '35.202503', 'district');
INSERT INTO `dd_district` VALUES (3053, 1, '0', '630000', '青海省', '101.780268', '36.620939', 'province');
INSERT INTO `dd_district` VALUES (3054, 3053, '0971', '630100', '西宁市', '101.778223', '36.617134', 'city');
INSERT INTO `dd_district` VALUES (3055, 3054, '0971', '630102', '城东区', '101.803717', '36.599744', 'district');
INSERT INTO `dd_district` VALUES (3056, 3054, '0971', '630103', '城中区', '101.705298', '36.545652', 'district');
INSERT INTO `dd_district` VALUES (3057, 3054, '0971', '630104', '城西区', '101.765843', '36.628304', 'district');
INSERT INTO `dd_district` VALUES (3058, 3054, '0971', '630105', '城北区', '101.766228', '36.650038', 'district');
INSERT INTO `dd_district` VALUES (3059, 3054, '0971', '630121', '大通回族土族自治县', '101.685643', '36.926954', 'district');
INSERT INTO `dd_district` VALUES (3060, 3054, '0971', '630122', '湟中县', '101.571667', '36.500879', 'district');
INSERT INTO `dd_district` VALUES (3061, 3054, '0971', '630123', '湟源县', '101.256464', '36.682426', 'district');
INSERT INTO `dd_district` VALUES (3062, 3053, '0972', '630200', '海东市', '102.104287', '36.502039', 'city');
INSERT INTO `dd_district` VALUES (3063, 3062, '0972', '630202', '乐都区', '102.401724', '36.482058', 'district');
INSERT INTO `dd_district` VALUES (3064, 3062, '0972', '630203', '平安区', '102.108834', '36.500563', 'district');
INSERT INTO `dd_district` VALUES (3065, 3062, '0972', '630222', '民和回族土族自治县', '102.830892', '36.320321', 'district');
INSERT INTO `dd_district` VALUES (3066, 3062, '0972', '630223', '互助土族自治县', '101.959271', '36.844248', 'district');
INSERT INTO `dd_district` VALUES (3067, 3062, '0972', '630224', '化隆回族自治县', '102.264143', '36.094908', 'district');
INSERT INTO `dd_district` VALUES (3068, 3062, '0972', '630225', '循化撒拉族自治县', '102.489135', '35.851152', 'district');
INSERT INTO `dd_district` VALUES (3069, 3053, '0970', '632200', '海北藏族自治州', '100.900997', '36.954413', 'city');
INSERT INTO `dd_district` VALUES (3070, 3069, '0970', '632221', '门源回族自治县', '101.611539', '37.388746', 'district');
INSERT INTO `dd_district` VALUES (3071, 3069, '0970', '632222', '祁连县', '100.253211', '38.177112', 'district');
INSERT INTO `dd_district` VALUES (3072, 3069, '0970', '632223', '海晏县', '100.99426', '36.896359', 'district');
INSERT INTO `dd_district` VALUES (3073, 3069, '0970', '632224', '刚察县', '100.145833', '37.32547', 'district');
INSERT INTO `dd_district` VALUES (3074, 3053, '0973', '632300', '黄南藏族自治州', '102.015248', '35.519548', 'city');
INSERT INTO `dd_district` VALUES (3075, 3074, '0973', '632321', '同仁县', '102.018323', '35.516063', 'district');
INSERT INTO `dd_district` VALUES (3076, 3074, '0973', '632322', '尖扎县', '102.04014', '35.943156', 'district');
INSERT INTO `dd_district` VALUES (3077, 3074, '0973', '632323', '泽库县', '101.466689', '35.035313', 'district');
INSERT INTO `dd_district` VALUES (3078, 3074, '0973', '632324', '河南蒙古族自治县', '101.617503', '34.734568', 'district');
INSERT INTO `dd_district` VALUES (3079, 3053, '0974', '632500', '海南藏族自治州', '100.622692', '36.296529', 'city');
INSERT INTO `dd_district` VALUES (3080, 3079, '0974', '632521', '共和县', '100.620031', '36.284107', 'district');
INSERT INTO `dd_district` VALUES (3081, 3079, '0974', '632522', '同德县', '100.578051', '35.25479', 'district');
INSERT INTO `dd_district` VALUES (3082, 3079, '0974', '632523', '贵德县', '101.433391', '36.040166', 'district');
INSERT INTO `dd_district` VALUES (3083, 3079, '0974', '632524', '兴海县', '99.987965', '35.588612', 'district');
INSERT INTO `dd_district` VALUES (3084, 3079, '0974', '632525', '贵南县', '100.747503', '35.586714', 'district');
INSERT INTO `dd_district` VALUES (3085, 3053, '0975', '632600', '果洛藏族自治州', '100.244808', '34.471431', 'city');
INSERT INTO `dd_district` VALUES (3086, 3085, '0975', '632621', '玛沁县', '100.238888', '34.477433', 'district');
INSERT INTO `dd_district` VALUES (3087, 3085, '0975', '632622', '班玛县', '100.737138', '32.932723', 'district');
INSERT INTO `dd_district` VALUES (3088, 3085, '0975', '632623', '甘德县', '99.900923', '33.969216', 'district');
INSERT INTO `dd_district` VALUES (3089, 3085, '0975', '632624', '达日县', '99.651392', '33.74892', 'district');
INSERT INTO `dd_district` VALUES (3090, 3085, '0975', '632625', '久治县', '101.482831', '33.429471', 'district');
INSERT INTO `dd_district` VALUES (3091, 3085, '0975', '632626', '玛多县', '98.209206', '34.915946', 'district');
INSERT INTO `dd_district` VALUES (3092, 3053, '0976', '632700', '玉树藏族自治州', '97.091934', '33.011674', 'city');
INSERT INTO `dd_district` VALUES (3093, 3092, '0976', '632701', '玉树市', '97.008784', '32.993106', 'district');
INSERT INTO `dd_district` VALUES (3094, 3092, '0976', '632722', '杂多县', '95.300723', '32.893185', 'district');
INSERT INTO `dd_district` VALUES (3095, 3092, '0976', '632723', '称多县', '97.110831', '33.369218', 'district');
INSERT INTO `dd_district` VALUES (3096, 3092, '0976', '632724', '治多县', '95.61896', '33.844956', 'district');
INSERT INTO `dd_district` VALUES (3097, 3092, '0976', '632725', '囊谦县', '96.48943', '32.203432', 'district');
INSERT INTO `dd_district` VALUES (3098, 3092, '0976', '632726', '曲麻莱县', '95.797367', '34.126428', 'district');
INSERT INTO `dd_district` VALUES (3099, 3053, '0977', '632800', '海西蒙古族藏族自治州', '97.369751', '37.377139', 'city');
INSERT INTO `dd_district` VALUES (3100, 3099, '0977', '632801', '格尔木市', '94.928453', '36.406367', 'district');
INSERT INTO `dd_district` VALUES (3101, 3099, '0977', '632802', '德令哈市', '97.360984', '37.369436', 'district');
INSERT INTO `dd_district` VALUES (3102, 3099, '0977', '632821', '乌兰县', '98.480195', '36.929749', 'district');
INSERT INTO `dd_district` VALUES (3103, 3099, '0977', '632822', '都兰县', '98.095844', '36.302496', 'district');
INSERT INTO `dd_district` VALUES (3104, 3099, '0977', '632823', '天峻县', '99.022984', '37.300851', 'district');
INSERT INTO `dd_district` VALUES (3105, 3099, '0977', '632825', '海西蒙古族藏族自治州直辖', '95.356546', '37.853328', 'district');
INSERT INTO `dd_district` VALUES (3106, 1, '0', '640000', '宁夏回族自治区', '106.259126', '38.472641', 'province');
INSERT INTO `dd_district` VALUES (3107, 3106, '0951', '640100', '银川市', '106.230909', '38.487193', 'city');
INSERT INTO `dd_district` VALUES (3108, 3107, '0951', '640104', '兴庆区', '106.28865', '38.473609', 'district');
INSERT INTO `dd_district` VALUES (3109, 3107, '0951', '640105', '西夏区', '106.161106', '38.502605', 'district');
INSERT INTO `dd_district` VALUES (3110, 3107, '0951', '640106', '金凤区', '106.239679', '38.47436', 'district');
INSERT INTO `dd_district` VALUES (3111, 3107, '0951', '640121', '永宁县', '106.253145', '38.277372', 'district');
INSERT INTO `dd_district` VALUES (3112, 3107, '0951', '640122', '贺兰县', '106.349861', '38.554599', 'district');
INSERT INTO `dd_district` VALUES (3113, 3107, '0951', '640181', '灵武市', '106.340053', '38.102655', 'district');
INSERT INTO `dd_district` VALUES (3114, 3106, '0952', '640200', '石嘴山市', '106.383303', '38.983236', 'city');
INSERT INTO `dd_district` VALUES (3115, 3114, '0952', '640202', '大武口区', '106.367958', '39.01918', 'district');
INSERT INTO `dd_district` VALUES (3116, 3114, '0952', '640205', '惠农区', '106.781176', '39.239302', 'district');
INSERT INTO `dd_district` VALUES (3117, 3114, '0952', '640221', '平罗县', '106.523474', '38.913544', 'district');
INSERT INTO `dd_district` VALUES (3118, 3106, '0953', '640300', '吴忠市', '106.198913', '37.997428', 'city');
INSERT INTO `dd_district` VALUES (3119, 3118, '0953', '640302', '利通区', '106.212613', '37.98349', 'district');
INSERT INTO `dd_district` VALUES (3120, 3118, '0953', '640303', '红寺堡区', '106.062113', '37.425702', 'district');
INSERT INTO `dd_district` VALUES (3121, 3118, '0953', '640323', '盐池县', '107.407358', '37.783205', 'district');
INSERT INTO `dd_district` VALUES (3122, 3118, '0953', '640324', '同心县', '105.895309', '36.95449', 'district');
INSERT INTO `dd_district` VALUES (3123, 3118, '0953', '640381', '青铜峡市', '106.078817', '38.021302', 'district');
INSERT INTO `dd_district` VALUES (3124, 3106, '0954', '640400', '固原市', '106.24261', '36.015855', 'city');
INSERT INTO `dd_district` VALUES (3125, 3124, '0954', '640402', '原州区', '106.287781', '36.003739', 'district');
INSERT INTO `dd_district` VALUES (3126, 3124, '0954', '640422', '西吉县', '105.729085', '35.963912', 'district');
INSERT INTO `dd_district` VALUES (3127, 3124, '0954', '640423', '隆德县', '106.111595', '35.625914', 'district');
INSERT INTO `dd_district` VALUES (3128, 3124, '0954', '640424', '泾源县', '106.330646', '35.498159', 'district');
INSERT INTO `dd_district` VALUES (3129, 3124, '0954', '640425', '彭阳县', '106.631809', '35.858815', 'district');
INSERT INTO `dd_district` VALUES (3130, 3106, '1953', '640500', '中卫市', '105.196902', '37.499972', 'city');
INSERT INTO `dd_district` VALUES (3131, 3130, '1953', '640502', '沙坡头区', '105.173721', '37.516883', 'district');
INSERT INTO `dd_district` VALUES (3132, 3130, '1953', '640521', '中宁县', '105.685218', '37.491546', 'district');
INSERT INTO `dd_district` VALUES (3133, 3130, '1953', '640522', '海原县', '105.643487', '36.565033', 'district');
INSERT INTO `dd_district` VALUES (3134, 1, '0', '650000', '新疆维吾尔自治区', '87.627704', '43.793026', 'province');
INSERT INTO `dd_district` VALUES (3135, 3134, '1997', '659002', '阿拉尔市', '81.280527', '40.547653', 'city');
INSERT INTO `dd_district` VALUES (3136, 3135, '1997', '659002', '阿拉尔市', '81.280527', '40.547653', 'district');
INSERT INTO `dd_district` VALUES (3137, 3134, '1906', '659005', '北屯市', '87.837075', '47.332643', 'city');
INSERT INTO `dd_district` VALUES (3138, 3137, '1906', '659005', '北屯市', '87.837075', '47.332643', 'district');
INSERT INTO `dd_district` VALUES (3139, 3134, '1999', '659008', '可克达拉市', '81.044542', '43.944798', 'city');
INSERT INTO `dd_district` VALUES (3140, 3139, '1999', '659008', '可克达拉市', '81.044542', '43.944798', 'district');
INSERT INTO `dd_district` VALUES (3141, 3134, '1903', '659009', '昆玉市', '79.291083', '37.209642', 'city');
INSERT INTO `dd_district` VALUES (3142, 3141, '1903', '659009', '昆玉市', '79.291083', '37.209642', 'district');
INSERT INTO `dd_district` VALUES (3143, 3134, '0993', '659001', '石河子市', '86.080602', '44.306097', 'city');
INSERT INTO `dd_district` VALUES (3144, 3143, '0993', '659001', '石河子市', '86.080602', '44.306097', 'district');
INSERT INTO `dd_district` VALUES (3145, 3134, '1909', '659007', '双河市', '82.353656', '44.840524', 'city');
INSERT INTO `dd_district` VALUES (3146, 3145, '1909', '659007', '双河市', '82.353656', '44.840524', 'district');
INSERT INTO `dd_district` VALUES (3147, 3134, '0991', '650100', '乌鲁木齐市', '87.616848', '43.825592', 'city');
INSERT INTO `dd_district` VALUES (3148, 3147, '0991', '650102', '天山区', '87.631676', '43.794399', 'district');
INSERT INTO `dd_district` VALUES (3149, 3147, '0991', '650103', '沙依巴克区', '87.598195', '43.800939', 'district');
INSERT INTO `dd_district` VALUES (3150, 3147, '0991', '650104', '新市区', '87.569431', '43.855378', 'district');
INSERT INTO `dd_district` VALUES (3151, 3147, '0991', '650105', '水磨沟区', '87.642481', '43.832459', 'district');
INSERT INTO `dd_district` VALUES (3152, 3147, '0991', '650106', '头屯河区', '87.428141', '43.877664', 'district');
INSERT INTO `dd_district` VALUES (3153, 3147, '0991', '650107', '达坂城区', '88.311099', '43.363668', 'district');
INSERT INTO `dd_district` VALUES (3154, 3147, '0991', '650109', '米东区', '87.655935', '43.974784', 'district');
INSERT INTO `dd_district` VALUES (3155, 3147, '0991', '650121', '乌鲁木齐县', '87.409417', '43.47136', 'district');
INSERT INTO `dd_district` VALUES (3156, 3134, '0990', '650200', '克拉玛依市', '84.889207', '45.579888', 'city');
INSERT INTO `dd_district` VALUES (3157, 3156, '0990', '650202', '独山子区', '84.886974', '44.328095', 'district');
INSERT INTO `dd_district` VALUES (3158, 3156, '0990', '650203', '克拉玛依区', '84.867844', '45.602525', 'district');
INSERT INTO `dd_district` VALUES (3159, 3156, '0990', '650204', '白碱滩区', '85.131696', '45.687854', 'district');
INSERT INTO `dd_district` VALUES (3160, 3156, '0990', '650205', '乌尔禾区', '85.693742', '46.089148', 'district');
INSERT INTO `dd_district` VALUES (3161, 3134, '0995', '650400', '吐鲁番市', '89.189752', '42.951303', 'city');
INSERT INTO `dd_district` VALUES (3162, 3161, '0995', '650402', '高昌区', '89.185877', '42.942327', 'district');
INSERT INTO `dd_district` VALUES (3163, 3161, '0995', '650421', '鄯善县', '90.21333', '42.868744', 'district');
INSERT INTO `dd_district` VALUES (3164, 3161, '0995', '650422', '托克逊县', '88.653827', '42.792526', 'district');
INSERT INTO `dd_district` VALUES (3165, 3134, '0902', '650500', '哈密市', '93.515224', '42.819541', 'city');
INSERT INTO `dd_district` VALUES (3166, 3165, '0902', '650502', '伊州区', '93.514797', '42.827254', 'district');
INSERT INTO `dd_district` VALUES (3167, 3165, '0902', '650521', '巴里坤哈萨克自治县', '93.010383', '43.599929', 'district');
INSERT INTO `dd_district` VALUES (3168, 3165, '0902', '650522', '伊吾县', '94.697074', '43.254978', 'district');
INSERT INTO `dd_district` VALUES (3169, 3134, '0994', '652300', '昌吉回族自治州', '87.308224', '44.011182', 'city');
INSERT INTO `dd_district` VALUES (3170, 3169, '0994', '652301', '昌吉市', '87.267532', '44.014435', 'district');
INSERT INTO `dd_district` VALUES (3171, 3169, '0994', '652302', '阜康市', '87.952991', '44.164402', 'district');
INSERT INTO `dd_district` VALUES (3172, 3169, '0994', '652323', '呼图壁县', '86.871584', '44.179361', 'district');
INSERT INTO `dd_district` VALUES (3173, 3169, '0994', '652324', '玛纳斯县', '86.20368', '44.284722', 'district');
INSERT INTO `dd_district` VALUES (3174, 3169, '0994', '652325', '奇台县', '89.593967', '44.022066', 'district');
INSERT INTO `dd_district` VALUES (3175, 3169, '0994', '652327', '吉木萨尔县', '89.180437', '44.000497', 'district');
INSERT INTO `dd_district` VALUES (3176, 3169, '0994', '652328', '木垒哈萨克自治县', '90.286028', '43.834689', 'district');
INSERT INTO `dd_district` VALUES (3177, 3134, '0909', '652700', '博尔塔拉蒙古自治州', '82.066363', '44.906039', 'city');
INSERT INTO `dd_district` VALUES (3178, 3177, '0909', '652701', '博乐市', '82.051004', '44.853869', 'district');
INSERT INTO `dd_district` VALUES (3179, 3177, '0909', '652702', '阿拉山口市', '82.559396', '45.172227', 'district');
INSERT INTO `dd_district` VALUES (3180, 3177, '0909', '652722', '精河县', '82.890656', '44.599393', 'district');
INSERT INTO `dd_district` VALUES (3181, 3177, '0909', '652723', '温泉县', '81.024816', '44.968856', 'district');
INSERT INTO `dd_district` VALUES (3182, 3134, '0996', '652800', '巴音郭楞蒙古自治州', '86.145297', '41.764115', 'city');
INSERT INTO `dd_district` VALUES (3183, 3182, '0996', '652801', '库尔勒市', '86.174633', '41.725891', 'district');
INSERT INTO `dd_district` VALUES (3184, 3182, '0996', '652822', '轮台县', '84.252156', '41.777702', 'district');
INSERT INTO `dd_district` VALUES (3185, 3182, '0996', '652823', '尉犁县', '86.261321', '41.343933', 'district');
INSERT INTO `dd_district` VALUES (3186, 3182, '0996', '652824', '若羌县', '88.167152', '39.023241', 'district');
INSERT INTO `dd_district` VALUES (3187, 3182, '0996', '652825', '且末县', '85.529702', '38.145485', 'district');
INSERT INTO `dd_district` VALUES (3188, 3182, '0996', '652826', '焉耆回族自治县', '86.574067', '42.059759', 'district');
INSERT INTO `dd_district` VALUES (3189, 3182, '0996', '652827', '和静县', '86.384065', '42.323625', 'district');
INSERT INTO `dd_district` VALUES (3190, 3182, '0996', '652828', '和硕县', '86.876799', '42.284331', 'district');
INSERT INTO `dd_district` VALUES (3191, 3182, '0996', '652829', '博湖县', '86.631997', '41.980152', 'district');
INSERT INTO `dd_district` VALUES (3192, 3134, '0997', '652900', '阿克苏地区', '80.260605', '41.168779', 'city');
INSERT INTO `dd_district` VALUES (3193, 3192, '0997', '652901', '阿克苏市', '80.263387', '41.167548', 'district');
INSERT INTO `dd_district` VALUES (3194, 3192, '0997', '652922', '温宿县', '80.238959', '41.276688', 'district');
INSERT INTO `dd_district` VALUES (3195, 3192, '0997', '652923', '库车县', '82.987312', '41.714696', 'district');
INSERT INTO `dd_district` VALUES (3196, 3192, '0997', '652924', '沙雅县', '82.781818', '41.221666', 'district');
INSERT INTO `dd_district` VALUES (3197, 3192, '0997', '652925', '新和县', '82.618736', '41.551206', 'district');
INSERT INTO `dd_district` VALUES (3198, 3192, '0997', '652926', '拜城县', '81.85148', '41.795912', 'district');
INSERT INTO `dd_district` VALUES (3199, 3192, '0997', '652927', '乌什县', '79.224616', '41.222319', 'district');
INSERT INTO `dd_district` VALUES (3200, 3192, '0997', '652928', '阿瓦提县', '80.375053', '40.643647', 'district');
INSERT INTO `dd_district` VALUES (3201, 3192, '0997', '652929', '柯坪县', '79.054497', '40.501936', 'district');
INSERT INTO `dd_district` VALUES (3202, 3134, '0908', '653000', '克孜勒苏柯尔克孜自治州', '76.167819', '39.714526', 'city');
INSERT INTO `dd_district` VALUES (3203, 3202, '0908', '653001', '阿图什市', '76.1684', '39.71616', 'district');
INSERT INTO `dd_district` VALUES (3204, 3202, '0908', '653022', '阿克陶县', '75.947396', '39.147785', 'district');
INSERT INTO `dd_district` VALUES (3205, 3202, '0908', '653023', '阿合奇县', '78.446253', '40.936936', 'district');
INSERT INTO `dd_district` VALUES (3206, 3202, '0908', '653024', '乌恰县', '75.259227', '39.71931', 'district');
INSERT INTO `dd_district` VALUES (3207, 3134, '0998', '653100', '喀什地区', '75.989741', '39.47046', 'city');
INSERT INTO `dd_district` VALUES (3208, 3207, '0998', '653101', '喀什市', '75.99379', '39.467685', 'district');
INSERT INTO `dd_district` VALUES (3209, 3207, '0998', '653121', '疏附县', '75.862813', '39.375043', 'district');
INSERT INTO `dd_district` VALUES (3210, 3207, '0998', '653122', '疏勒县', '76.048139', '39.401384', 'district');
INSERT INTO `dd_district` VALUES (3211, 3207, '0998', '653123', '英吉沙县', '76.175729', '38.930381', 'district');
INSERT INTO `dd_district` VALUES (3212, 3207, '0998', '653124', '泽普县', '77.259675', '38.18529', 'district');
INSERT INTO `dd_district` VALUES (3213, 3207, '0998', '653125', '莎车县', '77.245761', '38.41422', 'district');
INSERT INTO `dd_district` VALUES (3214, 3207, '0998', '653126', '叶城县', '77.413836', '37.882989', 'district');
INSERT INTO `dd_district` VALUES (3215, 3207, '0998', '653127', '麦盖提县', '77.610125', '38.898001', 'district');
INSERT INTO `dd_district` VALUES (3216, 3207, '0998', '653128', '岳普湖县', '76.8212', '39.2198', 'district');
INSERT INTO `dd_district` VALUES (3217, 3207, '0998', '653129', '伽师县', '76.723719', '39.488181', 'district');
INSERT INTO `dd_district` VALUES (3218, 3207, '0998', '653130', '巴楚县', '78.549296', '39.785155', 'district');
INSERT INTO `dd_district` VALUES (3219, 3207, '0998', '653131', '塔什库尔干塔吉克自治县', '75.229889', '37.772094', 'district');
INSERT INTO `dd_district` VALUES (3220, 3134, '0903', '653200', '和田地区', '79.922211', '37.114157', 'city');
INSERT INTO `dd_district` VALUES (3221, 3220, '0903', '653201', '和田市', '79.913534', '37.112148', 'district');
INSERT INTO `dd_district` VALUES (3222, 3220, '0903', '653221', '和田县', '79.81907', '37.120031', 'district');
INSERT INTO `dd_district` VALUES (3223, 3220, '0903', '653222', '墨玉县', '79.728683', '37.277143', 'district');
INSERT INTO `dd_district` VALUES (3224, 3220, '0903', '653223', '皮山县', '78.283669', '37.62145', 'district');
INSERT INTO `dd_district` VALUES (3225, 3220, '0903', '653224', '洛浦县', '80.188986', '37.073667', 'district');
INSERT INTO `dd_district` VALUES (3226, 3220, '0903', '653225', '策勒县', '80.806159', '36.998335', 'district');
INSERT INTO `dd_district` VALUES (3227, 3220, '0903', '653226', '于田县', '81.677418', '36.85708', 'district');
INSERT INTO `dd_district` VALUES (3228, 3220, '0903', '653227', '民丰县', '82.695861', '37.06408', 'district');
INSERT INTO `dd_district` VALUES (3229, 3134, '0999', '654000', '伊犁哈萨克自治州', '81.324136', '43.916823', 'city');
INSERT INTO `dd_district` VALUES (3230, 3229, '0999', '654002', '伊宁市', '81.27795', '43.908558', 'district');
INSERT INTO `dd_district` VALUES (3231, 3229, '0999', '654003', '奎屯市', '84.903267', '44.426529', 'district');
INSERT INTO `dd_district` VALUES (3232, 3229, '0999', '654004', '霍尔果斯市', '80.411271', '44.213941', 'district');
INSERT INTO `dd_district` VALUES (3233, 3229, '0999', '654021', '伊宁县', '81.52745', '43.977119', 'district');
INSERT INTO `dd_district` VALUES (3234, 3229, '0999', '654022', '察布查尔锡伯自治县', '81.151337', '43.840726', 'district');
INSERT INTO `dd_district` VALUES (3235, 3229, '0999', '654023', '霍城县', '80.87898', '44.055984', 'district');
INSERT INTO `dd_district` VALUES (3236, 3229, '0999', '654024', '巩留县', '82.231718', '43.482628', 'district');
INSERT INTO `dd_district` VALUES (3237, 3229, '0999', '654025', '新源县', '83.232848', '43.433896', 'district');
INSERT INTO `dd_district` VALUES (3238, 3229, '0999', '654026', '昭苏县', '81.130974', '43.157293', 'district');
INSERT INTO `dd_district` VALUES (3239, 3229, '0999', '654027', '特克斯县', '81.836206', '43.217183', 'district');
INSERT INTO `dd_district` VALUES (3240, 3229, '0999', '654028', '尼勒克县', '82.511809', '43.800247', 'district');
INSERT INTO `dd_district` VALUES (3241, 3134, '0901', '654200', '塔城地区', '82.980316', '46.745364', 'city');
INSERT INTO `dd_district` VALUES (3242, 3241, '0901', '654201', '塔城市', '82.986978', '46.751428', 'district');
INSERT INTO `dd_district` VALUES (3243, 3241, '0901', '654202', '乌苏市', '84.713396', '44.41881', 'district');
INSERT INTO `dd_district` VALUES (3244, 3241, '0901', '654221', '额敏县', '83.628303', '46.524673', 'district');
INSERT INTO `dd_district` VALUES (3245, 3241, '0901', '654223', '沙湾县', '85.619416', '44.326388', 'district');
INSERT INTO `dd_district` VALUES (3246, 3241, '0901', '654224', '托里县', '83.60695', '45.947638', 'district');
INSERT INTO `dd_district` VALUES (3247, 3241, '0901', '654225', '裕民县', '82.982667', '46.201104', 'district');
INSERT INTO `dd_district` VALUES (3248, 3241, '0901', '654226', '和布克赛尔蒙古自治县', '85.728328', '46.793235', 'district');
INSERT INTO `dd_district` VALUES (3249, 3134, '0906', '654300', '阿勒泰地区', '88.141253', '47.844924', 'city');
INSERT INTO `dd_district` VALUES (3250, 3249, '0906', '654301', '阿勒泰市', '88.131842', '47.827308', 'district');
INSERT INTO `dd_district` VALUES (3251, 3249, '0906', '654321', '布尔津县', '86.874923', '47.702163', 'district');
INSERT INTO `dd_district` VALUES (3252, 3249, '0906', '654322', '富蕴县', '89.525504', '46.994115', 'district');
INSERT INTO `dd_district` VALUES (3253, 3249, '0906', '654323', '福海县', '87.486703', '47.111918', 'district');
INSERT INTO `dd_district` VALUES (3254, 3249, '0906', '654324', '哈巴河县', '86.418621', '48.060846', 'district');
INSERT INTO `dd_district` VALUES (3255, 3249, '0906', '654325', '青河县', '90.37555', '46.679113', 'district');
INSERT INTO `dd_district` VALUES (3256, 3249, '0906', '654326', '吉木乃县', '85.874096', '47.443101', 'district');
INSERT INTO `dd_district` VALUES (3257, 3134, '1996', '659006', '铁门关市', '85.501217', '41.82725', 'city');
INSERT INTO `dd_district` VALUES (3258, 3257, '1996', '659006', '铁门关市', '85.501217', '41.82725', 'district');
INSERT INTO `dd_district` VALUES (3259, 3134, '1998', '659003', '图木舒克市', '79.073963', '39.868965', 'city');
INSERT INTO `dd_district` VALUES (3260, 3259, '1998', '659003', '图木舒克市', '79.073963', '39.868965', 'district');
INSERT INTO `dd_district` VALUES (3261, 3134, '1994', '659004', '五家渠市', '87.54324', '44.166756', 'city');
INSERT INTO `dd_district` VALUES (3262, 3261, '1994', '659004', '五家渠市', '87.54324', '44.166756', 'district');
INSERT INTO `dd_district` VALUES (3263, 850, '320589', '320589', '高新区', '120', '30', 'district');
INSERT INTO `dd_district` VALUES (3264, 850, '320589', '320589', '高新区', '120', '30', 'district');
INSERT INTO `dd_district` VALUES (3265, 850, '320589', '320589', '高新区', '120', '30', 'district');
INSERT INTO `dd_district` VALUES (3271, 1409, '0536', '370787', '高新区', '119', '36', 'district');

-- ----------------------------
-- Table structure for dd_dividend_record
-- ----------------------------
DROP TABLE IF EXISTS `dd_dividend_record`;
CREATE TABLE `dd_dividend_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'add' COMMENT '当为sub时提现支出',
  `stock_id` int(10) NULL DEFAULT NULL,
  `dividend` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '分红',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_dividend_record
-- ----------------------------
INSERT INTO `dd_dividend_record` VALUES (4, 5, 'add', 1, 0.00, 0, NULL, 1553415529, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (3, 2, 'add', 1, 0.00, 0, NULL, 1553415527, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (5, 6, 'add', 1, 0.00, 0, NULL, 1553415529, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (6, 2, 'add', 1, 0.51, 0, NULL, 1553415758, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (7, 5, 'add', 1, 0.51, 0, NULL, 1553415760, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (8, 6, 'add', 1, 0.51, 0, NULL, 1553415760, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (9, 2, 'add', 1, 0.51, 0, NULL, 1553415861, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (10, 5, 'add', 1, 0.51, 0, NULL, 1553415862, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (11, 6, 'add', 1, 0.51, 0, NULL, 1553415862, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (12, 2, 'add', 1, 51.02, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (13, 2, 'add', 2, 7.14, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (14, 2, 'add', 3, 102.04, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (15, 5, 'add', 1, 0.51, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (16, 22, 'add', 1, 59.18, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (17, 22, 'add', 2, 28.57, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (18, 22, 'add', 3, 102.04, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (19, 23, 'add', 1, 51.02, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (20, 23, 'add', 2, 7.14, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (21, 23, 'add', 3, 102.04, 0, NULL, 1553670933, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (22, 2, 'sub', NULL, 101.00, 0, NULL, 1554122759, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (23, 22, 'sub', NULL, 180.00, 0, NULL, 1554273037, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (24, 2, 'add', 1, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (25, 2, 'add', 2, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (26, 2, 'add', 3, 0.01, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (27, 5, 'add', 1, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (28, 15, 'add', 1, 0.01, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (29, 15, 'add', 2, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (30, 15, 'add', 3, 0.02, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (31, 48, 'add', 1, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (32, 48, 'add', 2, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (33, 48, 'add', 3, 0.01, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (34, 51, 'add', 1, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);
INSERT INTO `dd_dividend_record` VALUES (35, 51, 'add', 2, 0.00, 0, NULL, 1555171201, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_enumeration
-- ----------------------------
DROP TABLE IF EXISTS `dd_enumeration`;
CREATE TABLE `dd_enumeration`  (
  `enumerationcategory` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `itemname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `itemvalue` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disorder` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`enumerationcategory`, `itemname`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_enumeration
-- ----------------------------
INSERT INTO `dd_enumeration` VALUES ('loginterminal', 'iphone', 'IPHONE手机', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('loginterminal', 'ipad', 'IPAD平板电脑', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('loginterminal', 'android', 'Android手机', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('loginterminal', 'androidpad', 'Android平板电脑', 4, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('loginterminal', 'web', 'Web', 5, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('loginterminal', 'weixin', '微信', 6, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'superadministrator', '超级管理员', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'platformadmin', '平台管理员', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'firstleveldistributor', '总经销', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'distributor', '分销商', 4, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'shop', '网点', 5, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'companyshop', '独立公司网点', 6, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'personalshop', '独立个人网点', 7, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'electrician', '水电工', 8, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'person', '普通用户', 9, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('userattribute', 'primary', '主帐户', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('userattribute', 'common', '普通帐户', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('sex', 'male', '男', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('sex', 'female', '女', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('companytype', 'firstleveldistributor', '总经销', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('companytype', 'distributor', '分销商', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('companytype', 'shop', '网点', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('companytype', 'personfromlulan', '公司内部人员', 4, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('taxtype', 'generaltaxpayer', '一般纳税人', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('taxtype', 'smallscaletaxpayer', '小规模纳税人', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('certificatetype', 'electriciancertifer', '水电工认证', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('whetheridentifiedstatus', 'failured', '认证失败', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('whetheridentifiedstatus', 'unwhetheridentified', '未认证', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('whetheridentifiedstatus', 'ongoing', '认证中', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('whetheridentifiedstatus', 'whetheridentified', '认证通过', 4, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('onlinetype', 'qq', 'qq', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('banktype', 'bank', '银行', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('banktype', 'alipay', '支付宝', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('banktype', 'weixinpay', '微信', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('material', 'copper', '铜', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('material', 'aluminum', '铝', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('material', 'lead', '铅', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('invoicetype', 'telegraphictransfer', '电汇', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('invoicetype', 'acceptancebill', '承兑', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'new', '新建', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'usersubmit', '提交', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'retreat', '退回', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'audited', '已审核', 4, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'cancelaudit', '已取消审核', 5, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'exporttox3', '已上传到X3系统', 6, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('orderstatus', 'close', '关闭', 7, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('documenttype', 'doc', 'word文档', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('documenttype', 'pdf', 'pdf文档', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('documenttype', 'excel', 'excel文档', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('dbbackupandresotretype', 'backup', '备份', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('dbbackupandresotretype', 'restore', '恢复', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('operationresult', 'failed', '失败', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('operationresult', 'success', '成功', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('paymentsstatus', 'new', '新建', 1, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('paymentsstatus', 'needconfirm', '等待确认', 2, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('paymentsstatus', 'failed', '确认未通过', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('paymentsstatus', 'confirmed', '确认', 4, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('taxtype', 'individual', '个体工商户', 3, '', 1, 1);
INSERT INTO `dd_enumeration` VALUES ('usertype', 'company', '公司内部人员', NULL, '', 1, 1);

-- ----------------------------
-- Table structure for dd_group
-- ----------------------------
DROP TABLE IF EXISTS `dd_group`;
CREATE TABLE `dd_group`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  `sort` smallint(3) NULL DEFAULT NULL,
  `show` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dd_lottery_apply
-- ----------------------------
DROP TABLE IF EXISTS `dd_lottery_apply`;
CREATE TABLE `dd_lottery_apply`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '报名者ID',
  `number` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '每天抽奖轮数的第几轮',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_lottery_apply
-- ----------------------------
INSERT INTO `dd_lottery_apply` VALUES (42, 6, 0, 0, NULL, 1553475226, NULL, NULL, 1, 1);
INSERT INTO `dd_lottery_apply` VALUES (43, 2, 0, 0, NULL, 1553827744, NULL, NULL, 1, 1);
INSERT INTO `dd_lottery_apply` VALUES (44, 27, 0, 0, NULL, 1554089086, NULL, NULL, 1, 1);
INSERT INTO `dd_lottery_apply` VALUES (45, 13, 0, 0, NULL, 1554120868, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_lottery_award
-- ----------------------------
DROP TABLE IF EXISTS `dd_lottery_award`;
CREATE TABLE `dd_lottery_award`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中奖者ID',
  `number` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每天抽奖轮数的第几轮',
  `award_id` int(10) NOT NULL DEFAULT 0 COMMENT '奖品ID，为0或空时为现金红包，为-3时为购物券',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '没有获得奖品时派发的红包、购物券',
  `address_id` int(10) NULL DEFAULT NULL COMMENT '实物奖品收货地址',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '奖品领取状态，-1=审核未通过，1=待领取，2=审核中，3=审核通过',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_lottery_award
-- ----------------------------
INSERT INTO `dd_lottery_award` VALUES (1, 2, 1, 1, 0.00, 1, 0, NULL, 1550561776, 1, 1554045272, 3, 1);
INSERT INTO `dd_lottery_award` VALUES (2, 2, 1, -3, 5.00, NULL, 0, NULL, 1550561888, NULL, NULL, 1, 1);
INSERT INTO `dd_lottery_award` VALUES (3, 2, 1, 0, 1.60, NULL, 0, NULL, 1550561999, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_manual_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `dd_manual_integral_record`;
CREATE TABLE `dd_manual_integral_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `manual_integral` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '手动分配的购物券',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dd_member_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `dd_member_upgrade`;
CREATE TABLE `dd_member_upgrade`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '售价',
  `original_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原价（只做显示用）',
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情，图文',
  `attr_id` int(11) NULL DEFAULT 0 COMMENT '商品属性',
  `cat_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '商品类别',
  `share_commission` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '分销佣金比例',
  `specification` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `stock` int(10) NULL DEFAULT 0 COMMENT '商品库存',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `freight` decimal(10, 0) NULL DEFAULT 0 COMMENT '运费',
  `sort` int(11) NULL DEFAULT 1000 COMMENT '排序  升序',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '上架状态：1=下架，2=上架，0=无效数据',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_member_upgrade
-- ----------------------------
INSERT INTO `dd_member_upgrade` VALUES (1, '测试1', NULL, 98.00, 234.00, '11ddafa', NULL, 1, 3.00, '250', 11, '', 0, 0, '', 0, NULL, 1, 1552984317, 1, 1554033049, 2, 1);
INSERT INTO `dd_member_upgrade` VALUES (2, '测试商品2', NULL, 34.00, 233.00, '灌灌灌灌', NULL, 2, 3.00, '2232', 3, '', 0, 0, '', 0, NULL, 1, 1553043958, 1, 1553043962, 2, 1);
INSERT INTO `dd_member_upgrade` VALUES (3, '测试商品3', NULL, 22.00, 33.00, '反反复复付付付付付付付付付付', NULL, 3, 1.00, '11111', 22, '', 0, 0, '', 0, NULL, 1, 1553043995, 1, 1553043999, 2, 1);

-- ----------------------------
-- Table structure for dd_member_upgrade1
-- ----------------------------
DROP TABLE IF EXISTS `dd_member_upgrade1`;
CREATE TABLE `dd_member_upgrade1`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `cat_id` int(11) NULL DEFAULT NULL,
  `cardurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页卡片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐说明',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `picture1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片1',
  `picture2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片2',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `sort` int(11) NOT NULL DEFAULT 1000 COMMENT '排序  升序',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_member_upgrade1
-- ----------------------------
INSERT INTO `dd_member_upgrade1` VALUES (1, '店主套餐', NULL, '5c79018e7e8fe.jpg', '98元购买一盒立即升级店主', 98.00, '5c8e28b4eb4a2.jpg', '5c8e28b4ebc91.jpg', '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190317/20190317185931_68867.jpg\" alt=\"\" />\r\n<p>\r\n	<br />\r\n</p>', 1, '123', 0, NULL, 1, 1551270891, 1, 1552820404, 1, 1);
INSERT INTO `dd_member_upgrade1` VALUES (2, '皇冠店主套餐', NULL, '5c8e27a0ac4ed.jpg', '390元购买四盒立即升级皇冠店主', 390.00, '5c8e27a0acce4.jpg', '5c8e27a0ad483.jpg', '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190317/20190317185520_21947.jpg\" alt=\"\" /><br />', 2, '', 0, NULL, 1, 1551335590, 1, 1552820183, 1, 1);
INSERT INTO `dd_member_upgrade1` VALUES (3, '联合创始人套餐', NULL, '5c8e28eb3fb87.jpg', '3900元购买四十盒立即升级联合创始人', 3900.00, '5c8e28eb409fa.jpg', NULL, '<p>\r\n	<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190317/20190317190056_65997.jpg\" alt=\"\" />\r\n</p>', 3, '', 0, NULL, 1, 1551335670, 1, 1552820459, 1, 1);

-- ----------------------------
-- Table structure for dd_member_upgrade_cat
-- ----------------------------
DROP TABLE IF EXISTS `dd_member_upgrade_cat`;
CREATE TABLE `dd_member_upgrade_cat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(10) NULL DEFAULT 1,
  `parent_id` int(10) NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_member_upgrade_cat
-- ----------------------------
INSERT INTO `dd_member_upgrade_cat` VALUES (1, '店主套餐', NULL, '5c909c5f888f7.jpg', 1, 0, 1, NULL, 0, NULL, NULL, NULL, '1', 1553738155, 0, 1);
INSERT INTO `dd_member_upgrade_cat` VALUES (2, '皇冠店主套餐', NULL, '5c919d4d7693a.jpg', 1, 0, 2, NULL, 0, NULL, '1', 1552980266, '1', 1553046861, 1, 1);
INSERT INTO `dd_member_upgrade_cat` VALUES (3, '联合创始人套餐', NULL, '5c919d57c2f87.jpg', 1, 0, 3, NULL, 0, NULL, '1', 1552980877, '1', 1553046871, 1, 1);

-- ----------------------------
-- Table structure for dd_member_upgrade_order
-- ----------------------------
DROP TABLE IF EXISTS `dd_member_upgrade_order`;
CREATE TABLE `dd_member_upgrade_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单编号',
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `address_id` int(10) NULL DEFAULT NULL COMMENT '收货地址',
  `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '会员升级套餐id',
  `is_pay` smallint(6) NULL DEFAULT 0 COMMENT '是否支付成功',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '订单状态，-1=已取消，1=待付款，2=待发货，3=待收货，4=已完成',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_member_upgrade_order
-- ----------------------------
INSERT INTO `dd_member_upgrade_order` VALUES (93, '201915540176964985', 2, 1, 3, 0, NULL, 0, NULL, 1554017696, NULL, NULL, 1, 1);
INSERT INTO `dd_member_upgrade_order` VALUES (94, '201915540230025463', 26, 0, 2, 0, NULL, 0, NULL, 1554023002, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_order
-- ----------------------------
DROP TABLE IF EXISTS `dd_order`;
CREATE TABLE `dd_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '订单编号',
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `address_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '收货地址ID',
  `product_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品总金额',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `commission_used` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '当次佣金',
  `dividend_used` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '当次积分',
  `manual_integral_used` int(10) NULL DEFAULT NULL COMMENT '当次手动添加的购物券',
  `freight` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '运费',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `paytime` int(10) NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '订单状态，-1=已取消，1=待付款，2=待发货，3=待收货，4=已完成',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_order
-- ----------------------------
INSERT INTO `dd_order` VALUES (52, '201915533868143409', 2, 1, 308.00, 308.00, 0.00, 0.00, 0, 0, '', NULL, 0, NULL, 1553386814, NULL, NULL, 1, 1);
INSERT INTO `dd_order` VALUES (53, '201915533883508752', 2, 1, 308.00, 308.00, 0.00, 0.00, 0, 0, '', NULL, 0, NULL, 1553388350, NULL, NULL, 1, 1);
INSERT INTO `dd_order` VALUES (59, '201915540363285939', 2, 1, 318.00, 318.00, 0.00, 0.00, 0, 0, '', NULL, 0, NULL, 1554036328, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `dd_orderdetail`;
CREATE TABLE `dd_orderdetail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '订单ID',
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '商品ID',
  `productNum` int(10) NOT NULL DEFAULT 0 COMMENT '商品数量',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_orderdetail
-- ----------------------------
INSERT INTO `dd_orderdetail` VALUES (46, 48, 4, 1, 0, NULL, 6, 1553381885, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (47, 49, 3, 1, 0, NULL, 6, 1553381985, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (48, 50, 22, 1, 0, NULL, 6, 1553382003, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (49, 51, 12, 1, 0, NULL, 6, 1553382231, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (50, 52, 4, 1, 0, NULL, 2, 1553386814, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (51, 53, 4, 1, 0, NULL, 2, 1553388350, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (52, 54, 12, 1, 0, NULL, 6, 1553474794, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (53, 55, 4, 1, 0, NULL, 6, 1553475183, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (54, 56, 22, 1, 0, NULL, 6, 1553475205, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (55, 57, 26, 1, 0, NULL, 6, 1553475385, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (56, 58, 8, 1, 0, NULL, 6, 1553502612, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (57, 59, 1, 1, 0, NULL, 2, 1554036328, NULL, NULL, 1, 1);
INSERT INTO `dd_orderdetail` VALUES (58, 59, 19, 1, 0, NULL, 2, 1554036328, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_other_parameter
-- ----------------------------
DROP TABLE IF EXISTS `dd_other_parameter`;
CREATE TABLE `dd_other_parameter`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` int(10) NULL DEFAULT NULL COMMENT '每天抽奖轮数',
  `humanNum` int(10) NULL DEFAULT NULL COMMENT '每轮抽奖人数',
  `withdraw_min` decimal(10, 2) NULL DEFAULT NULL COMMENT '提现最小金额',
  `withdraw_max` decimal(10, 2) NULL DEFAULT NULL COMMENT '提现最大金额',
  `withdraw_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '提现手续费',
  `withdraw_commission_initiation` decimal(10, 2) NULL DEFAULT NULL COMMENT '收取手续费的起始金额',
  `switch_withdraw` smallint(6) NULL DEFAULT 1 COMMENT '是否开启提现,默认：1=开启 ；0=关闭',
  `switch_jackpot` smallint(6) NULL DEFAULT 1 COMMENT '是否开启中奖公告,默认：1=开启 ；0=关闭',
  `switch_member` smallint(6) NULL DEFAULT 1 COMMENT '是否开启新会员公告,默认：1=开启 ；0=关闭',
  `award_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '奖品总数不足每轮人数发放的现金金额',
  `switch_freight` smallint(6) NULL DEFAULT 0 COMMENT '全商品包邮设置，0=不包邮，1=包邮',
  `card_number` int(10) NULL DEFAULT 0 COMMENT '奖品中派发的购物券数量',
  `card_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '奖品中派发的购物券单个价格',
  `mobile` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系我们的电话',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `user_id` int(10) NULL DEFAULT NULL,
  `createtime` int(10) NULL DEFAULT NULL,
  `updateuser_id` int(10) NULL DEFAULT NULL,
  `updatetime` int(10) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `version` int(10) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_other_parameter
-- ----------------------------
INSERT INTO `dd_other_parameter` VALUES (1, 1, 10, 100.00, 5000.00, 10.00, 0.00, 1, 0, 1, 1000.00, 0, 100, 5.00, '123456', 0, 1, 1550558576, 1, 1553827534, 1, 1);

-- ----------------------------
-- Table structure for dd_pictures
-- ----------------------------
DROP TABLE IF EXISTS `dd_pictures`;
CREATE TABLE `dd_pictures`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tablename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `objectprimarykey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pictureattr_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(10) NULL DEFAULT 1000,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_pictures
-- ----------------------------
INSERT INTO `dd_pictures` VALUES (1, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1550541445, 1, 1552818935, 1, 1);
INSERT INTO `dd_pictures` VALUES (2, 'product', '1', NULL, NULL, '5c8e219ebf505.jpg', 'picture1', 1000, 0, NULL, 1, 1550541445, 1, 1552818590, 1, 1);
INSERT INTO `dd_pictures` VALUES (3, 'product', '2', NULL, NULL, '5c8cb3d47d26d.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1550545882, 1, 1552724948, 1, 1);
INSERT INTO `dd_pictures` VALUES (4, 'product', '2', NULL, NULL, '5c8cb3d47d7fe.jpg', 'picture1', 1000, 0, NULL, 1, 1550545883, 1, 1552724948, 1, 1);
INSERT INTO `dd_pictures` VALUES (5, 'product', '2', NULL, NULL, '5c8cb3d47dcf2.jpg', 'picture2', 1000, 0, NULL, 1, 1550545883, 1, 1552724948, 1, 1);
INSERT INTO `dd_pictures` VALUES (6, 'product', '2', NULL, NULL, '5c8cb3d47e10f.jpg', 'picture3', 1000, 0, NULL, 1, 1550545883, 1, 1552724948, 1, 1);
INSERT INTO `dd_pictures` VALUES (7, 'carousel', NULL, '第一张1', '21', '5c96dd21c4071.jpg', 'carousel', 1, 0, NULL, 1, 1553390881, 1, 1553390183, 1, 1);
INSERT INTO `dd_pictures` VALUES (8, 'carousel', NULL, '第二张', '12', '5c6cc16f11cec.jpg', 'carousel', 2, 0, NULL, 1, 1550631279, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (9, 'product', '3', NULL, NULL, '5c8cb47ddcb6c.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1550649742, 1, 1552725117, 1, 1);
INSERT INTO `dd_pictures` VALUES (10, 'product', '3', NULL, NULL, '5c8cb47ddd136.jpg', 'picture1', 1000, 0, NULL, 1, 1550649742, 1, 1552725117, 1, 1);
INSERT INTO `dd_pictures` VALUES (11, 'product', '3', NULL, NULL, '5c8cb47ddd61f.jpg', 'picture3', 1000, 0, NULL, 1, 1550649742, 1, 1552725117, 1, 1);
INSERT INTO `dd_pictures` VALUES (12, 'product', '4', NULL, NULL, '5c91addb8c833.jpeg', 'thumbpicture', 1000, 0, NULL, 1, 1550651444, 1, 1553051099, 1, 1);
INSERT INTO `dd_pictures` VALUES (13, 'product', '4', NULL, NULL, '5c91addb8cbf9.jpg', 'picture1', 1000, 0, NULL, 1, 1550651444, 1, 1553051099, 1, 1);
INSERT INTO `dd_pictures` VALUES (14, 'product', '5', NULL, NULL, '5c6d1364797c3.png', 'thumbpicture', 1000, 0, NULL, 1, 1550652260, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (15, 'product', '6', NULL, NULL, '5c6d137a56e0d.png', 'thumbpicture', 1000, 0, NULL, 1, 1550652282, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (16, 'product', '7', NULL, NULL, '5c6d1fef7c54e.png', 'thumbpicture', 1000, 0, NULL, 1, 1550655471, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (17, 'product', '8', NULL, NULL, '5c989105e7601.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1550655497, 1, 1553502469, 1, 1);
INSERT INTO `dd_pictures` VALUES (18, 'product', '11', NULL, NULL, '5c8cb3195dfdf.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552014872, 1, 1552724761, 1, 1);
INSERT INTO `dd_pictures` VALUES (19, 'product', '11', NULL, NULL, '5c8cb3195e5a5.jpg', 'picture1', 1000, 0, NULL, 1, 1552014872, 1, 1552724761, 1, 1);
INSERT INTO `dd_pictures` VALUES (20, 'product', '11', NULL, NULL, '5c8cb3195eac6.jpg', 'picture2', 1000, 0, NULL, 1, 1552014872, 1, 1552724761, 1, 1);
INSERT INTO `dd_pictures` VALUES (21, 'product', '11', NULL, NULL, '5c8cb3195eee6.jpg', 'picture3', 1000, 0, NULL, 1, 1552016058, 1, 1552724761, 1, 1);
INSERT INTO `dd_pictures` VALUES (22, 'product', '12', NULL, NULL, '5c820ae86e305.png', 'thumbpicture', 1000, 0, NULL, 1, 1552026344, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (23, 'product', '12', NULL, NULL, '5c820ae86eebd.png', 'picture1', 1000, 0, NULL, 1, 1552026345, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (24, 'product', '1', NULL, NULL, '5c8e232d82186.jpg', 'picture4', 1000, 0, NULL, 1, 1552620038, 1, 1552818989, 1, 1);
INSERT INTO `dd_pictures` VALUES (25, 'product', '1', NULL, NULL, '5c8b3fba0066b.jpg', 'picture5', 1000, 0, NULL, 1, 1552620537, 1, 1552629690, 1, 1);
INSERT INTO `dd_pictures` VALUES (26, 'product', '1', NULL, NULL, '5c8b3fba00b35.jpg', 'picture6', 1000, 0, NULL, 1, 1552629690, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (27, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552630052, 1, 1552818935, 1, 1);
INSERT INTO `dd_pictures` VALUES (28, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552632723, 1, 1552818935, 1, 1);
INSERT INTO `dd_pictures` VALUES (29, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552633040, 1, 1552818935, 1, 1);
INSERT INTO `dd_pictures` VALUES (30, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552634234, 1, 1552818935, 1, 1);
INSERT INTO `dd_pictures` VALUES (31, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552634368, 1, 1552818935, 1, 1);
INSERT INTO `dd_pictures` VALUES (32, 'product', '16', NULL, NULL, '5c8b56203019c.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552635424, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (33, 'product', '16', NULL, NULL, '5c8b5620305a0.jpg', 'picture1', 1000, 0, NULL, 1, 1552635424, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (34, 'product', '16', NULL, NULL, '5c8b562030d1a.jpg', 'picture2', 1000, 0, NULL, 1, 1552635424, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (35, 'product', '16', NULL, NULL, '5c8b562032383.jpg', 'picture3', 1000, 0, NULL, 1, 1552635424, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (36, 'product', '16', NULL, NULL, '5c8b56203272b.jpg', 'picture4', 1000, 0, NULL, 1, 1552635424, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (37, 'product', '16', NULL, NULL, '5c8b562032a5b.jpg', 'picture5', 1000, 0, NULL, 1, 1552635424, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (38, 'product', '9', NULL, NULL, '5c8b5974c7d4e.jpg', 'picture5', 1000, 0, NULL, 1, 1552636200, 1, 1552636276, 1, 1);
INSERT INTO `dd_pictures` VALUES (39, 'product', '9', NULL, NULL, '5c8b60aaf2cb8.jpg', 'picture9', 1000, 0, NULL, 1, 1552636276, 1, 1552638123, 1, 1);
INSERT INTO `dd_pictures` VALUES (40, 'product', '10', NULL, NULL, '5c8b6359e55ff.jpg', 'picture4', 1000, 0, NULL, 1, 1552636566, 1, 1552638812, 1, 1);
INSERT INTO `dd_pictures` VALUES (41, 'product', '17', NULL, NULL, '5c8b5afb854d7.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552636669, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (42, 'product', '17', NULL, NULL, '5c8b5afb85841.jpg', 'picture1', 1000, 0, NULL, 1, 1552636669, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (43, 'product', '17', NULL, NULL, '5c8b5afb85fa1.jpg', 'picture2', 1000, 0, NULL, 1, 1552636669, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (44, 'product', '17', NULL, NULL, '5c8b5afb865d5.jpg', 'picture3', 1000, 0, NULL, 1, 1552636669, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (45, 'product', '17', NULL, NULL, '5c8b5afb86c79.jpg', 'picture4', 1000, 0, NULL, 1, 1552636669, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (46, 'product', '9', NULL, NULL, '5c8b60244bbb3.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552637988, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (47, 'product', '9', NULL, NULL, '5c8b60ab020d9.jpg', 'picture3', 1000, 0, NULL, 1, 1552638123, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (48, 'product', '18', NULL, NULL, '5c8b61c9375b5.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552638411, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (49, 'product', '18', NULL, NULL, '5c8b61c9379e9.jpg', 'picture1', 1000, 0, NULL, 1, 1552638411, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (50, 'product', '18', NULL, NULL, '5c8b61c93820f.jpg', 'picture2', 1000, 0, NULL, 1, 1552638411, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (51, 'product', '18', NULL, NULL, '5c8b61c938a4d.jpg', 'picture3', 1000, 0, NULL, 1, 1552638411, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (52, 'product', '18', NULL, NULL, '5c8b61c939d9d.jpg', 'picture4', 1000, 0, NULL, 1, 1552638411, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (53, 'product', '10', NULL, NULL, '5c8b6359e6ae2.jpg', 'picture7', 1000, 0, NULL, 1, 1552638812, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (54, 'product', '10', NULL, NULL, '5c8b6af818d17.jpg', 'picture8', 1000, 0, NULL, 1, 1552640760, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (55, 'product', '19', NULL, NULL, '5c8e2109ce3a2.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552719126, 1, 1552818441, 1, 1);
INSERT INTO `dd_pictures` VALUES (56, 'product', '19', NULL, NULL, '5c8e1eb8340c0.jpg', 'picture1', 1000, 0, NULL, 1, 1552719126, 1, 1552817848, 1, 1);
INSERT INTO `dd_pictures` VALUES (57, 'product', '19', NULL, NULL, '5c8c9d168c419.jpg', 'picture2', 1000, 0, NULL, 1, 1552719126, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (58, 'product', '19', NULL, NULL, '5c8c9d168c92a.jpg', 'picture3', 1000, 0, NULL, 1, 1552719126, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (59, 'product', '19', NULL, NULL, '5c8c9d168ce64.jpg', 'picture4', 1000, 0, NULL, 1, 1552719126, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (60, 'product', '20', NULL, NULL, '5c8cb1316819f.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552724274, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (61, 'product', '20', NULL, NULL, '5c8cb1316876b.jpg', 'picture1', 1000, 0, NULL, 1, 1552724274, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (62, 'product', '20', NULL, NULL, '5c8cb13168c7a.jpg', 'picture2', 1000, 0, NULL, 1, 1552724274, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (63, 'product', '20', NULL, NULL, '5c8cb131690b8.jpg', 'picture3', 1000, 0, NULL, 1, 1552724274, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (64, 'product', '20', NULL, NULL, '5c8cb13169511.jpg', 'picture4', 1000, 0, NULL, 1, 1552724274, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (65, 'product', '20', NULL, NULL, '5c8cb13169f02.jpg', 'picture5', 1000, 0, NULL, 1, 1552724274, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (66, 'product', '21', NULL, NULL, '5c8cb243259cd.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552724547, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (67, 'product', '21', NULL, NULL, '5c8cb24325f9e.jpg', 'picture1', 1000, 0, NULL, 1, 1552724547, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (68, 'product', '21', NULL, NULL, '5c8cb243264a6.jpg', 'picture2', 1000, 0, NULL, 1, 1552724547, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (69, 'product', '21', NULL, NULL, '5c8cb24326953.jpg', 'picture3', 1000, 0, NULL, 1, 1552724547, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (70, 'product', '21', NULL, NULL, '5c8cb24326cfb.jpg', 'picture4', 1000, 0, NULL, 1, 1552724547, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (71, 'product', '11', NULL, NULL, '5c8cb3195f2b0.jpg', 'picture4', 1000, 0, NULL, 1, 1552724761, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (72, 'product', '2', NULL, NULL, '5c8cb3d47e4b6.jpg', 'picture4', 1000, 0, NULL, 1, 1552724948, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (73, 'product', '3', NULL, NULL, '5c8cb47ddddb5.jpg', 'picture5', 1000, 0, NULL, 1, 1552725117, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (74, 'product', '22', NULL, NULL, '5c8cb5bc3033f.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (75, 'product', '22', NULL, NULL, '5c8cb5bc3092a.jpg', 'picture1', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (76, 'product', '22', NULL, NULL, '5c8cb5bc30e7b.jpg', 'picture2', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (77, 'product', '22', NULL, NULL, '5c8cb5bc31303.jpg', 'picture3', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (78, 'product', '22', NULL, NULL, '5c8cb5bc316ce.jpg', 'picture4', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (79, 'product', '22', NULL, NULL, '5c8cb5bc31abe.jpg', 'picture5', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (80, 'product', '22', NULL, NULL, '5c8cb5bc31e76.jpg', 'picture6', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (81, 'product', '22', NULL, NULL, '5c8cb5bc32580.jpg', 'picture7', 1000, 0, NULL, 1, 1552725436, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (82, 'product', '23', NULL, NULL, '5c8cb89ce8f27.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552726172, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (83, 'product', '23', NULL, NULL, '5c8cb89ce94ab.jpg', 'picture1', 1000, 0, NULL, 1, 1552726172, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (84, 'product', '23', NULL, NULL, '5c8cb89ce999a.jpg', 'picture2', 1000, 0, NULL, 1, 1552726172, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (85, 'product', '23', NULL, NULL, '5c8cb89ce9dec.jpg', 'picture3', 1000, 0, NULL, 1, 1552726172, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (86, 'product', '23', NULL, NULL, '5c8cb89cea22d.jpg', 'picture4', 1000, 0, NULL, 1, 1552726172, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (87, 'product', '23', NULL, NULL, '5c8cb89ceaacb.jpg', 'picture5', 1000, 0, NULL, 1, 1552726172, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (88, 'product', '24', NULL, NULL, '5c8cba2f54da3.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552726575, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (89, 'product', '24', NULL, NULL, '5c8cba2f5558c.jpg', 'picture1', 1000, 0, NULL, 1, 1552726575, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (90, 'product', '24', NULL, NULL, '5c8cba2f55ac9.jpg', 'picture2', 1000, 0, NULL, 1, 1552726575, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (91, 'product', '24', NULL, NULL, '5c8cba2f55e9f.jpg', 'picture3', 1000, 0, NULL, 1, 1552726575, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (92, 'product', '24', NULL, NULL, '5c8cba2f562cd.jpg', 'picture4', 1000, 0, NULL, 1, 1552726575, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (93, 'product', '24', NULL, NULL, '5c8cba2f567d3.jpg', 'picture5', 1000, 0, NULL, 1, 1552726575, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (94, 'product', '25', NULL, NULL, '5c8cbbee846c2.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (95, 'product', '25', NULL, NULL, '5c8cbbee84cd8.jpg', 'picture1', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (96, 'product', '25', NULL, NULL, '5c8cbbee8524c.jpg', 'picture2', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (97, 'product', '25', NULL, NULL, '5c8cbbee8571d.jpg', 'picture3', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (98, 'product', '25', NULL, NULL, '5c8cbbee85be8.jpg', 'picture4', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (99, 'product', '25', NULL, NULL, '5c8cbbee8605f.jpg', 'picture5', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (100, 'product', '25', NULL, NULL, '5c8cbbee86563.jpg', 'picture6', 1000, 0, NULL, 1, 1552727023, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (101, 'product', '26', NULL, NULL, '5c8cbfc90f98c.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (102, 'product', '26', NULL, NULL, '5c8cbfc90ff59.jpg', 'picture1', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (103, 'product', '26', NULL, NULL, '5c8cbfc9106f4.jpg', 'picture2', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (104, 'product', '26', NULL, NULL, '5c8cbfc910ecd.jpg', 'picture3', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (105, 'product', '26', NULL, NULL, '5c8cbfc91142b.jpg', 'picture4', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (106, 'product', '26', NULL, NULL, '5c8cbfc91192c.jpg', 'picture5', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (107, 'product', '26', NULL, NULL, '5c8cbfc911e48.jpg', 'picture6', 1000, 0, NULL, 1, 1552728009, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (108, 'product', '19', NULL, NULL, '5c8e2109ce3a2.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552817759, 1, 1552818441, 1, 1);
INSERT INTO `dd_pictures` VALUES (109, 'product', '19', NULL, NULL, '5c8e1eb8340c0.jpg', 'picture1', 1000, 0, NULL, 1, 1552817848, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (110, 'product', '19', NULL, NULL, '5c8e2109ce3a2.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552818441, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (111, 'product', '1', NULL, NULL, '5c8e219ebf505.jpg', 'picture1', 1000, 0, NULL, 1, 1552818590, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (112, 'product', '1', NULL, NULL, '5c8e22f7560af.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1552818935, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (113, 'product', '1', NULL, NULL, '5c8e232d82186.jpg', 'picture4', 1000, 0, NULL, 1, 1552818989, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (114, 'member_upgrade', '1', NULL, NULL, '5c918ce7a437c.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553042663, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (115, 'member_upgrade', '1', NULL, NULL, '5c9191c31318d.jpg', 'picture1', 1000, 0, NULL, 1, 1553043907, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (116, 'member_upgrade', '2', NULL, NULL, '5c9191f66c2c7.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553043958, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (117, 'member_upgrade', '2', NULL, NULL, '5c9191f66c60f.jpg', 'picture1', 1000, 0, NULL, 1, 1553043958, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (118, 'member_upgrade', '3', NULL, NULL, '5c91921b9a932.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553043995, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (119, 'member_upgrade', '3', NULL, NULL, '5c91921b9ad50.jpg', 'picture1', 1000, 0, NULL, 1, 1553043995, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (120, 'product', '27', NULL, NULL, '5c98911209495.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553044251, 1, 1553502482, 1, 1);
INSERT INTO `dd_pictures` VALUES (121, 'product', '27', NULL, NULL, '5c91931b80969.jpg', 'picture1', 1000, 0, NULL, 1, 1553044251, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (122, 'product', '27', NULL, NULL, '5c91931b80c61.jpg', 'picture2', 1000, 0, NULL, 1, 1553044251, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (123, 'product', '28', NULL, NULL, '5c9891264d920.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553044659, 1, 1553502502, 1, 1);
INSERT INTO `dd_pictures` VALUES (124, 'product', '28', NULL, NULL, '5c9194b3aa806.jpg', 'picture1', 1000, 0, NULL, 1, 1553044659, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (125, 'product', '4', NULL, NULL, '5c91addb8ef48.jpg', 'picture6', 1000, 0, NULL, 1, 1553051099, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (126, 'product', '8', NULL, NULL, '5c91ae9666594.jpg', 'picture6', 1000, 1, NULL, 1, 1553051286, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (127, 'product', '6', NULL, NULL, '5c972850d6112.jpg', 'picture1', 1000, 1, NULL, 1, 1553410128, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (128, 'product', '8', NULL, NULL, '5c988df2843cd.jpg', 'picture4', 1000, 0, NULL, 1, 1553501682, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (129, 'product', '8', NULL, NULL, '5c989105e7601.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553501718, 1, 1553502469, 1, 1);
INSERT INTO `dd_pictures` VALUES (130, 'product', '27', NULL, NULL, '5c98911209495.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553501821, 1, 1553502482, 1, 1);
INSERT INTO `dd_pictures` VALUES (131, 'product', '28', NULL, NULL, '5c9891264d920.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553501835, 1, 1553502502, 1, 1);
INSERT INTO `dd_pictures` VALUES (132, 'product', '29', NULL, NULL, '5c989141f3a61.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553501848, 1, 1553502530, 1, 1);
INSERT INTO `dd_pictures` VALUES (133, 'product', '8', NULL, NULL, '5c989105e7601.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502246, 1, 1553502469, 1, 1);
INSERT INTO `dd_pictures` VALUES (134, 'product', '8', NULL, NULL, '5c989105e7601.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502248, 1, 1553502469, 1, 1);
INSERT INTO `dd_pictures` VALUES (135, 'product', '27', NULL, NULL, '5c98911209495.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502279, 1, 1553502482, 1, 1);
INSERT INTO `dd_pictures` VALUES (136, 'product', '28', NULL, NULL, '5c9891264d920.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502297, 1, 1553502502, 1, 1);
INSERT INTO `dd_pictures` VALUES (137, 'product', '29', NULL, NULL, '5c989141f3a61.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502310, 1, 1553502530, 1, 1);
INSERT INTO `dd_pictures` VALUES (138, 'product', '8', NULL, NULL, '5c989105e7601.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502469, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (139, 'product', '27', NULL, NULL, '5c98911209495.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502482, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (140, 'product', '28', NULL, NULL, '5c9891264d920.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502502, NULL, NULL, 1, 1);
INSERT INTO `dd_pictures` VALUES (141, 'product', '29', NULL, NULL, '5c989141f3a61.jpg', 'thumbpicture', 1000, 0, NULL, 1, 1553502530, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_product
-- ----------------------------
DROP TABLE IF EXISTS `dd_product`;
CREATE TABLE `dd_product`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `thumbpicture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '售价',
  `original_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价（只做显示用）',
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情，图文',
  `attr_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品属性',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品类别',
  `share_commission` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分销佣金比例',
  `specification` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `stock` int(10) NULL DEFAULT 0 COMMENT '商品库存',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `freight` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '运费',
  `sort` int(11) NOT NULL DEFAULT 1000 COMMENT '排序  升序',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '上架状态：1=下架，2=上架，0=无效数据',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_product
-- ----------------------------
INSERT INTO `dd_product` VALUES (1, '澳洲进口 Ego QV baby婴儿儿童宝宝小老虎保湿霜滋润润肤膏面霜', NULL, NULL, 77.00, 86.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112331_84448.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112344_85717.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112358_19645.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112407_80636.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112419_66357.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112428_17039.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112459_54708.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112510_37844.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112519_99148.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315112804_20686.png\" alt=\"\" />', 0, 5, 7.70, '250g', 1000, '个', 0, 1, '', 0, NULL, 1, 1550541445, 1, 1552818989, 2, 1);
INSERT INTO `dd_product` VALUES (2, '芙知迹活力乳液面部化妆品 补水保湿提亮控油护肤品', NULL, NULL, 177.00, 258.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316162901_23010.jpg\" alt=\"\" />', 0, 6, 17.70, '120ml', 1000, '个', 0, 8, '12', 0, NULL, 1, 1550545882, 1, 1552725854, 2, 1);
INSERT INTO `dd_product` VALUES (3, '芙知迹活力柔肤液面部化妆品皮肤镇定控油保湿护理护肤品', NULL, NULL, 192.00, 298.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316163152_51193.jpg\" alt=\"\" /> \r\n<p>\r\n	<br />\r\n</p>', 0, 6, 19.20, '120ml', 1000, '个', 0, 1, '', 0, NULL, 1, 1550649742, 1, 1552725819, 2, 1);
INSERT INTO `dd_product` VALUES (4, '欧诗漫珍珠白套装美白补水淡斑祛黄保湿护肤品化妆品正品', '欧诗漫珍珠白套装美白补水淡斑祛黄保湿护肤品', NULL, 308.00, 440.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190320/20190320110450_57666.jpg\" alt=\"\" />\r\n<p>\r\n	<br />\r\n</p>', 1, 0, 30.80, '五件套', 1000, '套', 0, 1, '', 0, NULL, 1, 1550651444, 1, 1553051099, 2, 1);
INSERT INTO `dd_product` VALUES (5, '洗衣液', NULL, NULL, 12.00, 12.00, '<p><br></p>', 1, 0, 6.00, '', 0, '', 0, 2, '', 0, NULL, 1, 1550652260, 1, 1550716010, 2, 1);
INSERT INTO `dd_product` VALUES (6, '大衣', '12', NULL, 0.00, 0.00, '<p>\r\n	<br />\r\n</p>', 1, 0, 0.00, '', 0, '', 1, 3, '', 0, NULL, 1, 1550652282, 1, 1553410128, 2, 1);
INSERT INTO `dd_product` VALUES (7, '蓝月亮洗衣液', NULL, NULL, 123.00, 455.00, '<p><br></p>', 2, 0, 3.00, '', 0, '', 0, 1, '', 0, NULL, 1, 1550655471, 1, 1550717012, 2, 1);
INSERT INTO `dd_product` VALUES (8, '欧诗漫珍珠白精萃美白原液女淡斑补水保湿提亮肤色精华液官网正品', NULL, NULL, 308.00, 440.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190320/20190320110801_36040.jpg\" alt=\"\" /> \r\n<p>\r\n	<br />\r\n</p>', 3, 0, 30.80, '五件套', 1000, '套', 0, 0, '', 0, NULL, 1, 1550655497, 1, 1553502469, 2, 1);
INSERT INTO `dd_product` VALUES (9, '澳洲进口 Lucas Papaw Ointment木瓜膏75g多用膏润唇保湿滋润', NULL, NULL, 67.00, 74.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315154949_66414.jpg\" alt=\"\" />', 0, 5, 6.70, '75g', 1000, '个', 0, 1, '', 0, NULL, 1, 1551335159, 1, 1552638123, 2, 1);
INSERT INTO `dd_product` VALUES (11, '韩国 进口芙知迹发酵精华液面部化妆品 抗皱收缩毛孔修复控油保湿', NULL, NULL, 192.00, 298.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316162549_68057.jpg\" alt=\"\" />', 0, 6, 19.20, '50ml', 1000, '个', 0, 0, '', 0, NULL, 1, 1552014872, 1, 1552725765, 2, 1);
INSERT INTO `dd_product` VALUES (12, '测试热销', NULL, NULL, 33.00, 44.00, '1234', 2, 0, 8.00, '421', 12, '5', 0, 2, '', 0, NULL, 1, 1552026344, 1, 1552026426, 2, 1);
INSERT INTO `dd_product` VALUES (13, '微波炉2', '家居百货每日N波上新', NULL, 23.00, 123.00, '<p><br></p>', 1, 0, 2.00, '31', 0, '', 0, 1, '', 0, NULL, 1, 1550651444, 1, 1550715434, 2, 1);
INSERT INTO `dd_product` VALUES (16, '澳洲进口 Lucas Papaw Ointment木瓜膏25g多用膏润唇保湿滋润', NULL, NULL, 38.00, 42.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190315/20190315154459_37641.jpg\" alt=\"\" /><br />', 0, 5, 3.80, '25g', 1000, '个', 0, 2, '', 0, NULL, 1, 1552635424, 1, 1552635982, 2, 1);
INSERT INTO `dd_product` VALUES (19, '澳洲进口Freezeframe生物多胜肽眼部赋活精华 去黑眼圈FF眼霜15ml', NULL, NULL, 241.00, 268.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316145148_10736.jpg\" alt=\"\" />', 0, 5, 24.10, '15ml', 999, '个', 0, 1, '', 0, NULL, 1, 1552719126, 1, 1552818552, 2, 1);
INSERT INTO `dd_product` VALUES (20, '澳洲Cemoy面膜海藻安瓶南极冰川海藻向日葵面膜保湿补水5片装', NULL, NULL, 186.00, 278.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316161746_55749.jpg\" alt=\"\" /><br />', 0, 5, 18.60, '30g', 1000, '个', 0, 1, '', 0, NULL, 1, 1552724274, 1, 1552724338, 2, 1);
INSERT INTO `dd_product` VALUES (21, '韩国进口芙知迹日霜面部化妆品美白角鲨烷补水面霜护肤品', NULL, NULL, 186.00, 278.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316162219_62077.jpg\" alt=\"\" />', 0, 6, 18.60, '50g', 1000, '个', 0, 1, '', 0, NULL, 1, 1552724547, 1, 1552725797, 2, 1);
INSERT INTO `dd_product` VALUES (22, '哲可儿黑珍珠精华面膜芦荟补水保湿控油免洗美白面膜10片', NULL, NULL, 87.00, 158.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316163708_87431.jpg\" alt=\"\" />', 0, 6, 8.70, '10片', 999, '盒', 0, 6, '', 0, NULL, 1, 1552725436, 1, 1552725454, 2, 1);
INSERT INTO `dd_product` VALUES (23, '韩国进口芙知迹正品眼霜面部化妆品角鲨烷护肤品眼部护理', NULL, NULL, 186.00, 278.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316164931_81597.jpg\" alt=\"\" />', 0, 6, 18.60, '30g', 1000, '支', 0, 9, '', 0, NULL, 1, 1552726172, 1, 1552726190, 2, 1);
INSERT INTO `dd_product` VALUES (24, '韩国原装进口芙知迹润泽修保湿抗皱护马油霜细致毛孔紧致肌肤面霜', NULL, NULL, 172.00, 358.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316165613_59696.jpg\" alt=\"\" />', 0, 6, 17.20, '50g', 1000, '个', 0, 10, '', 0, NULL, 1, 1552726575, 1, 1552726594, 2, 1);
INSERT INTO `dd_product` VALUES (25, '芙知迹发酵护肤套装焕彩活力清洁控油修护美白韩国美容套盒', NULL, NULL, 930.00, 1360.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316170327_20846.jpg\" alt=\"\" /><img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316170328_84352.jpg\" alt=\"\" />', 0, 6, 93.00, '五件套', 1000, '盒', 0, 11, '', 0, NULL, 1, 1552727023, 1, 1552727044, 2, 1);
INSERT INTO `dd_product` VALUES (26, '藏祯龙3CR13不锈钢刀具七件套', NULL, NULL, 390.00, 590.00, '<img src=\"https://shop.changzhenlong.com/public/static/js/kindeditor/attached/image/20190316/20190316171951_28135.jpg\" alt=\"\" />', 0, 3, 39.00, '七件套', 1000, '套', 0, 15, '', 0, NULL, 1, 1552728009, 1, 1552728024, 2, 1);
INSERT INTO `dd_product` VALUES (27, '测试精选商品2', NULL, NULL, 222.00, 2222.00, '132131', 3, 0, 3.00, '123', 44, '', 0, 0, '', 0, NULL, 1, 1553044251, 1, 1553502482, 2, 1);
INSERT INTO `dd_product` VALUES (28, '测试精选商品3', NULL, NULL, 222.00, 333.00, '', 3, 0, 22.00, '21', 33, '', 0, 0, '', 0, NULL, 1, 1553044659, 1, 1553502502, 2, 1);
INSERT INTO `dd_product` VALUES (29, '', NULL, NULL, 0.00, 0.00, '', 3, 0, 0.00, '', 0, '', 0, 0, '', 0, NULL, 1, 1553501848, 1, 1553502530, 2, 1);

-- ----------------------------
-- Table structure for dd_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `dd_product_attr`;
CREATE TABLE `dd_product_attr`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) UNSIGNED NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_product_attr
-- ----------------------------
INSERT INTO `dd_product_attr` VALUES (1, '新品上架', 1, '', 0, NULL, '1', 1550651063, NULL, NULL, 1, 1);
INSERT INTO `dd_product_attr` VALUES (2, 'TOP热销', 2, '', 0, NULL, '1', 1550651075, NULL, NULL, 1, 1);
INSERT INTO `dd_product_attr` VALUES (3, '精选商品', 3, '', 0, NULL, '1', 1550651101, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_product_cat
-- ----------------------------
DROP TABLE IF EXISTS `dd_product_cat`;
CREATE TABLE `dd_product_cat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(10) NULL DEFAULT 1,
  `parent_id` int(10) NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_product_cat
-- ----------------------------
INSERT INTO `dd_product_cat` VALUES (3, '生活超市', '5c8f3a4588afc.png', 2, 3, 1, '123', 0, NULL, '1', 1550472226, '1', 1552890437, 2, 1);
INSERT INTO `dd_product_cat` VALUES (4, '潮流大牌', '5c6cd05ec8367.png', 1, 0, 2, '3', 0, NULL, '1', 1550472419, '1', 1550643971, 2, 1);
INSERT INTO `dd_product_cat` VALUES (5, '海外精选', '5c6cd04e1832a.png', 1, 0, 3, '', 0, NULL, '1', 1550472438, '1', 1550643986, 2, 1);
INSERT INTO `dd_product_cat` VALUES (6, '热门推荐', '5c6ccff0e476a.png', 1, 0, 4, '', 0, NULL, '1', 1550472452, '1', 1550643953, 2, 1);
INSERT INTO `dd_product_cat` VALUES (7, '123', NULL, 2, 3, 1, '', 0, NULL, '1', 1550646859, '1', 1550649395, 1, 1);
INSERT INTO `dd_product_cat` VALUES (8, '678', NULL, 2, 5, 2, '', 0, NULL, '1', 1550647752, NULL, NULL, 1, 1);
INSERT INTO `dd_product_cat` VALUES (9, '测试赛', '5c78feadc7c55.png', 1, 0, 12, '', 0, NULL, '1', 1551433389, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_product_enshrine
-- ----------------------------
DROP TABLE IF EXISTS `dd_product_enshrine`;
CREATE TABLE `dd_product_enshrine`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_product_enshrine
-- ----------------------------
INSERT INTO `dd_product_enshrine` VALUES (15, 21, 27, 0, NULL, 1554088975, NULL, NULL, 1, 1);
INSERT INTO `dd_product_enshrine` VALUES (14, 8, 27, 0, NULL, 1554088903, NULL, NULL, 1, 1);
INSERT INTO `dd_product_enshrine` VALUES (13, 12, 26, 0, NULL, 1554022964, NULL, NULL, 1, 1);
INSERT INTO `dd_product_enshrine` VALUES (12, 7, 26, 0, NULL, 1554022951, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `dd_shopcart`;
CREATE TABLE `dd_shopcart`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_shopcart
-- ----------------------------
INSERT INTO `dd_shopcart` VALUES (17, 26, 26, 1, 0, NULL, 1554022980, NULL, NULL, 1, 1);
INSERT INTO `dd_shopcart` VALUES (18, 1, 2, 1, 1, NULL, 1554036112, 2, 1554036328, 1, 1);
INSERT INTO `dd_shopcart` VALUES (19, 19, 2, 1, 1, NULL, 1554036127, 2, 1554036328, 1, 1);
INSERT INTO `dd_shopcart` VALUES (20, 28, 27, 2, 0, NULL, 1554088955, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_stock
-- ----------------------------
DROP TABLE IF EXISTS `dd_stock`;
CREATE TABLE `dd_stock`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '股票名称',
  `number` bigint(15) NULL DEFAULT NULL COMMENT '股票数量',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '单价',
  `stock_profit` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '分红比例',
  `used_number` bigint(15) NOT NULL DEFAULT 0 COMMENT '股票已派发数量',
  `switch_btn` smallint(6) NULL DEFAULT 0 COMMENT '是否使用 1-未使用，2-使用中',
  `sort` int(11) NOT NULL DEFAULT 1000 COMMENT '排序  升序',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_stock
-- ----------------------------
INSERT INTO `dd_stock` VALUES (1, 'A级龙蛋', 98000, 98.00, 5.00, 426, 2, 1, '', 0, NULL, 1, 1550547989, 22, 1553567753, 1, 1);
INSERT INTO `dd_stock` VALUES (2, 'B级龙蛋', 9800, 390.00, 7.00, 8, 2, 2, '', 0, NULL, 1, 1550548065, 22, 1553567753, 1, 1);
INSERT INTO `dd_stock` VALUES (3, 'C级龙蛋', 980, 3900.00, 10.00, 5, 2, 3, '', 0, NULL, 1, 1550548110, 23, 1553567753, 1, 1);
INSERT INTO `dd_stock` VALUES (4, 'D级龙蛋', 980000, 98.00, 5.00, 0, 1, 4, '', 0, NULL, 1, 1550548200, 1, 1553761371, 1, 1);

-- ----------------------------
-- Table structure for dd_stock_user
-- ----------------------------
DROP TABLE IF EXISTS `dd_stock_user`;
CREATE TABLE `dd_stock_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL DEFAULT 0 COMMENT '股票ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '股票数量',
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dd_stock_user
-- ----------------------------
INSERT INTO `dd_stock_user` VALUES (21, 1, 2, 100, 0, NULL, 1553501061, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (22, 2, 2, 1, 0, NULL, 1553501061, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (23, 3, 2, 1, 0, NULL, 1553501061, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (24, 1, 5, 1, 0, NULL, 1553501061, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (25, 1, 22, 116, 0, NULL, 1553567230, 22, 1553567753, 1, 1);
INSERT INTO `dd_stock_user` VALUES (26, 2, 22, 4, 0, NULL, 1553567255, 22, 1553567753, 1, 1);
INSERT INTO `dd_stock_user` VALUES (27, 3, 22, 1, 0, NULL, 1553567273, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (28, 1, 23, 100, 0, NULL, 1553567753, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (29, 2, 23, 1, 0, NULL, 1553567753, NULL, NULL, 1, 1);
INSERT INTO `dd_stock_user` VALUES (30, 3, 23, 1, 0, NULL, 1553567753, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_userlevel
-- ----------------------------
DROP TABLE IF EXISTS `dd_userlevel`;
CREATE TABLE `dd_userlevel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 1,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  `updateuser_id` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `updatereason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_userlevel
-- ----------------------------
INSERT INTO `dd_userlevel` VALUES (1, '会员', 1, '12', 0, 1, 1550556226, 1, 1553740540, NULL, 1, 1);
INSERT INTO `dd_userlevel` VALUES (2, '店主', 2, '', 0, 1, 1550556402, NULL, NULL, NULL, 1, 1);
INSERT INTO `dd_userlevel` VALUES (3, '皇冠店主', 3, '', 0, 1, 1550556494, NULL, NULL, NULL, 1, 1);
INSERT INTO `dd_userlevel` VALUES (4, '联合创始人', 4, '', 0, 1, 1550556522, 1, 1553740589, NULL, 1, 1);

-- ----------------------------
-- Table structure for dd_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `dd_withdraw`;
CREATE TABLE `dd_withdraw`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `withdraw_account_id` int(10) NULL DEFAULT 0 COMMENT '分红',
  `apply_user_id` int(10) NULL DEFAULT NULL,
  `apply_time` int(10) NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '提现金额',
  `actual_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际到账金额 -- 除去手续费部分金额',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0 COMMENT '提现状态 1-待审核中，2-审核中，3-审核通过，4审核失败',
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_withdraw
-- ----------------------------
INSERT INTO `dd_withdraw` VALUES (7, '审核通过', 2, 'dividend', 5, 1, 1554122759, 101.00, 90.90, NULL, 0, NULL, 1554122706, 1, 1554122759, 3, 1);
INSERT INTO `dd_withdraw` VALUES (8, '审核通过', 2, 'commission', 5, 1, 1554123950, 123.00, 110.70, NULL, 0, NULL, 1554123938, 1, 1554123950, 3, 1);
INSERT INTO `dd_withdraw` VALUES (6, '审核通过', 22, 'commission', 4, 1, 1553736078, 1200.00, 1080.00, NULL, 0, NULL, 1553568891, 1, 1553736078, 3, 1);

-- ----------------------------
-- Table structure for dd_withdraw_account
-- ----------------------------
DROP TABLE IF EXISTS `dd_withdraw_account`;
CREATE TABLE `dd_withdraw_account`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00',
  `mobile` bigint(14) NULL DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alipay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  `company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL,
  `updateuser_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `updatetime` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dd_withdraw_account
-- ----------------------------
INSERT INTO `dd_withdraw_account` VALUES (5, 2, '测试1', 1234, '2345', '', '', '', 0, NULL, 1554122698, NULL, NULL, 1, 1);
INSERT INTO `dd_withdraw_account` VALUES (4, 22, '刘小强', 15703012377, 'www20150122', '', '', '', 0, NULL, 1553568880, NULL, NULL, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;