# SQL Manager 2007 for MySQL 4.5.0.7
# ---------------------------------------
# Host     : miheschool.com
# Port     : 3306
# Database : mihexiaoyuan


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;



USE `nuoche`;

#
# Structure for the `lunbo_music` table : 
#

DROP TABLE IF EXISTS `lunbo_music`;

CREATE TABLE `lunbo_music` (
  `cimgId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图片ID',
  `cimgTitle` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `cimgDescribe` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片内容',
  `cimgTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `cimages` VARCHAR(100) COLLATE utf8_general_ci NOT NULL COMMENT '轮播图片路径',
  `cimgUrl` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url链接',
  `cimgStatus` INTEGER(11) NOT NULL COMMENT '图片状态0：禁用1：启用',
  `cimgType` INTEGER(11) NOT NULL COMMENT '图片类型0：内容1：url链接',
  PRIMARY KEY (`cimgId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; InnoDB free: 9216 kB; InnoDB free: 194' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `m_level` table : 
#

DROP TABLE IF EXISTS `m_level`;

CREATE TABLE `m_level` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `zhekou` FLOAT(9,3) DEFAULT NULL,
  `status` INTEGER(11) DEFAULT '0',
  PRIMARY KEY (`id`)

)ENGINE=InnoDB COMMENT='InnoDB free: 4096 kB; InnoDB free: 11264 kB' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `m_songs` table : 
#

DROP TABLE IF EXISTS `m_songs`;

CREATE TABLE `m_songs` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `filename` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL,
  `status` INTEGER(11) DEFAULT NULL,
  `denji_id` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_songs_fk` (`denji_id`),
  CONSTRAINT `m_songs_fk` FOREIGN KEY (`denji_id`) REFERENCES `m_level` (`id`)

)ENGINE=InnoDB COMMENT='InnoDB free: 4096 kB; (`denji_id`) REFER `mihexiaoyuan/m_lev' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `m_guess` table : 
#

DROP TABLE IF EXISTS `m_guess`;

CREATE TABLE `m_guess` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `goodsid` INTEGER(11) DEFAULT NULL,
  `userid` INTEGER(11) DEFAULT NULL,
  `songid` INTEGER(11) DEFAULT NULL,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastStatus` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_denji_id_fk` (`goodsid`),
  KEY `m_denji_id_fk1` (`userid`),
  KEY `m_denji_id_fk2` (`songid`),
  CONSTRAINT `m_denji_id_fk` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`gId`),
  CONSTRAINT `m_denji_id_fk1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`usersId`),
  CONSTRAINT `m_denji_id_fk2` FOREIGN KEY (`songid`) REFERENCES `m_songs` (`id`)

)ENGINE=InnoDB COMMENT='InnoDB free: 4096 kB; (`songid`) REFER `mihexiaoyuan/m_songs' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Data for the `m_level` table  (LIMIT 0,500)
#

INSERT INTO `m_level` (`id`, `name`, `zhekou`, `status`) VALUES 
  (1,'1级',0.900,1),
  (2,'2级',0.850,1),
  (3,'3级',0.800,1),
  (4,'4级',0.750,1),
  (5,'5级',0.700,1);
COMMIT;

#
# Data for the `m_songs` table  (LIMIT 0,500)
#

INSERT INTO `m_songs` (`id`, `name`, `filename`, `status`, `denji_id`) VALUES 
  (1,'爱的初体验','1523785055365.mp3',1,1),
  (2,'爱的双重魔力','1523785083473.mp3',1,1),
  (3,'暧昧','1523785102933.mp3',1,1),
  (4,'北极星的眼泪','1523785115553.mp3',1,1),
  (5,'贝加尔湖畔','1523785276998.mp3',1,1),
  (6,'背对背拥抱','1523785295062.mp3',1,1),
  (7,'残酷月光','1523785314017.mp3',1,1),
  (8,'成都','1523785334283.mp3',1,1),
  (9,'城府','1523785347187.mp3',1,1),
  (10,'椿','1523785360387.mp3',1,1),
  (11,'大海','1523785374762.mp3',1,1),
  (12,'倒带','1523785387342.mp3',1,1),
  (13,'倒带','1523785387342.mp3',0,1),
  (14,'到不了','1523785431488.mp3',1,1),
  (15,'董小姐','1523785446487.mp3',1,1),
  (16,'饿狼传说','1523785460474.mp3',1,1),
  (17,'放生','1523785474348.mp3',1,1),
  (18,'佛系少女','1523785489087.mp3',1,1),
  (19,'改变自己','1523785506202.mp3',1,1),
  (20,'寂寞寂寞就好','1523785532303.mp3',1,1),
  (21,'假如爱有天意','1523785549763.mp3',1,1),
  (22,'江南','1523785565213.mp3',1,1),
  (23,'老街','1523785579038.mp3',1,1),
  (24,'六月的雨','1523785590388.mp3',1,1),
  (25,'庐州月','1523785605772.mp3',1,1),
  (26,'绿光','1523785622093.mp3',1,1),
  (27,'那些年','1523785637288.mp3',1,1),
  (28,'你还要我怎样','1523785655033.mp3',1,1),
  (29,'逆流成河','1523785672283.mp3',1,1),
  (30,'泡沫','1523785688998.mp3',1,1),
  (31,'漂洋过海来看你','1523785702033.mp3',1,1),
  (32,'阿刁','1523785879019.mp3',1,2),
  (33,'爱如潮水','1523785920483.mp3',1,2),
  (34,'爱与诚','1523785936779.mp3',1,2),
  (35,'不说再见','1523785964738.mp3',1,2),
  (36,'不再见','1523785981647.mp3',1,2),
  (37,'拆东墙','1523785997327.mp3',1,2),
  (38,'痴心绝对','1523786010443.mp3',1,2),
  (39,'出卖','1523786023198.mp3',1,2),
  (40,'大城小爱','1523786037613.mp3',1,2),
  (41,'断点','1523786108518.mp3',1,2),
  (42,'多余的解释','1523786123008.mp3',1,2),
  (43,'光荣','1523786180212.mp3',1,2),
  (44,'还有我','1523786196363.mp3',1,2),
  (45,'好心分手','1523786227898.mp3',1,2),
  (46,'红尘客栈','1523786247598.mp3',1,2),
  (47,'红昭愿','1523786266838.mp3',1,2),
  (48,'惊鸿一面','1523786284088.mp3',1,2),
  (49,'开始懂了','1523786298063.mp3',1,2),
  (50,'蓝莲花','1523786317003.mp3',1,2),
  (51,'冷雨夜','1523786329468.mp3',1,2),
  (52,'离人愁','1523786349173.mp3',1,2),
  (53,'那一年','1523786364483.mp3',1,2),
  (54,'你不知道的事','1523786382233.mp3',1,2),
  (55,'七友','1523786410968.mp3',1,2),
  (56,'千年之恋','1523786424903.mp3',1,2),
  (57,'杀破狼','1523786445409.mp3',1,2),
  (58,'绅士','1523786456778.mp3',1,2),
  (59,'天黑黑','1523786474458.mp3',1,2),
  (60,'突然累了','1523786486568.mp3',1,2),
  (61,'遥远的他','1523786499268.mp3',1,2),
  (62,'因为一个人','1523786516108.mp3',1,2),
  (63,'有多少爱可以重来','1523786543988.mp3',1,2),
  (64,'只对你有感觉','1523786561748.mp3',1,2),
  (65,'钟无艳','1523786578198.mp3',1,2),
  (66,'爱我不爱我','1523786601898.mp3',1,3),
  (67,'不说','1523786614988.mp3',1,3),
  (68,'匆匆那年','1523786625283.mp3',1,3),
  (69,'过火','1523786644313.mp3',1,3),
  (70,'和平鸽','1523786657248.mp3',1,3),
  (71,'红豆','1523786673142.mp3',1,3),
  (72,'花田错','1523786686422.mp3',1,3),
  (73,'幻听','1523786703223.mp3',1,3),
  (74,'叩叩','1523786716642.mp3',1,3),
  (75,'老伴','1523786729022.mp3',1,3),
  (76,'你曾是少年','1523786741332.mp3',1,3),
  (77,'逆光','1523786784207.mp3',1,3),
  (78,'普通朋友','1523786805927.mp3',1,3),
  (79,'全城热恋','1523786820278.mp3',1,3),
  (80,'十年','1523786841273.mp3',1,3),
  (81,'手牵手','1523786855718.mp3',1,3),
  (82,'童画','1523786869863.mp3',1,3),
  (83,'我是不是你最疼爱的人','1523786885357.mp3',1,3),
  (84,'喜欢你','1523786906007.mp3',1,3),
  (85,'小情歌','1523786920267.mp3',1,3),
  (86,'信仰','1523786933737.mp3',1,3),
  (87,'洋葱','1523786948987.mp3',1,3),
  (88,'雨一直下','1523786961952.mp3',1,3),
  (89,'原点','1523786976327.mp3',1,3),
  (90,'原来你什么都不要','1523786992502.mp3',1,3),
  (91,'月半小夜曲','1523787009133.mp3',1,3),
  (92,'最熟悉的陌生人','1523787031868.mp3',1,3),
  (93,'爱丫爱丫','1523787062147.mp3',1,4),
  (94,'编号89757','1523787075263.mp3',1,4),
  (95,'不潮不用花钱','1523787093658.mp3',1,4),
  (96,'丑八怪','1523787107328.mp3',1,4),
  (97,'冻结','1523787118993.mp3',1,4),
  (98,'豆浆油条','1523787131898.mp3',1,4),
  (99,'方圆几里','1523787147518.mp3',1,4),
  (100,'海盗','1523787160013.mp3',1,4),
  (101,'护花使者','1523787172093.mp3',1,4),
  (102,'画心','1523787185608.mp3',1,4),
  (103,'剑心','1523787198158.mp3',1,4),
  (104,'精舞门','1523787214608.mp3',1,4),
  (105,'苦笑','1523787233145.mp3',1,4),
  (106,'李白','1523787245458.mp3',1,4),
  (107,'模特','1523787263238.mp3',1,4),
  (108,'倩女幽魂','1523787274913.mp3',1,4),
  (109,'三国杀','1523787287538.mp3',1,4),
  (110,'他不懂','1523787299213.mp3',1,4),
  (111,'天黑','1523787337812.mp3',1,4),
  (112,'吻的太逼真','1523787352863.mp3',1,4),
  (113,'无字碑','1523787371763.mp3',1,4),
  (114,'稀罕没理由','1523787382348.mp3',1,4),
  (115,'下个路口见','1523787398948.mp3',1,4),
  (116,'小城故事','1523787415198.mp3',1,4),
  (117,'雨樱花','1523787429442.mp3',1,4),
  (118,'原来','1523787443757.mp3',1,4),
  (119,'爱我还是他','1523787464098.mp3',1,5),
  (120,'爱转角','1523787478263.mp3',1,5),
  (121,'笨小孩','1523787495213.mp3',1,5),
  (122,'不负如来不负卿','1523787514268.mp3',1,5),
  (123,'不将就','1523787526818.mp3',1,5),
  (124,'趁早','1523787541528.mp3',1,5),
  (125,'刀马旦','1523787552768.mp3',1,5),
  (126,'第一次爱的人','1523787562303.mp3',1,5),
  (127,'够钟','1523787573948.mp3',1,5),
  (128,'很爱很爱你','1523787588208.mp3',1,5),
  (129,'会痛的石头','1523787599738.mp3',1,5),
  (130,'劲歌金曲','1523787626813.mp3',1,5),
  (131,'流着泪说分手','1523787641928.mp3',1,5),
  (132,'梦的光点','1523787659158.mp3',1,5),
  (133,'身骑白马','1523787679003.mp3',1,5),
  (134,'失落沙洲','1523787708468.mp3',1,5),
  (135,'是否我真的一无所有','1523787725328.mp3',1,5),
  (136,'他一定很爱你','1523787744503.mp3',1,5),
  (137,'听海','1523787764578.mp3',1,5),
  (138,'唯爱','1523787778033.mp3',1,5),
  (139,'我们都一样','1523787789838.mp3',1,5),
  (140,'我只在乎你','1523787804748.mp3',1,5),
  (141,'我最亲爱的','1523787819892.mp3',1,5),
  (142,'屋顶','1523787835792.mp3',1,5),
  (143,'下雨天','1523787854047.mp3',1,5),
  (144,'想太多','1523787873892.mp3',1,5),
  (145,'小白','1523787886792.mp3',1,5),
  (146,'小镇姑娘','1523787898428.mp3',1,5),
  (147,'笑忘书','1523787913777.mp3',1,5),
  (148,'秀才胡同','1523787926682.mp3',1,5),
  (149,'仰望心空','1523787941737.mp3',1,5),
  (150,'也无风雨也无月','1523787956316.mp3',1,5),
  (151,'夜夜夜夜','1523787980121.mp3',1,5),
  (152,'一个人失忆','1523787991952.mp3',1,5),
  (153,'一事无成','1523788008781.mp3',1,5),
  (154,'樱花树下','1523788020161.mp3',1,5),
  (155,'走狗','1523788034541.mp3',1,5),
  (156,'最浪漫的事','1523788046961.mp3',1,5);
COMMIT;

#
# Data for the `lunbo_music` table  (LIMIT 0,500)
#

INSERT INTO `lunbo_music` (`cimgId`, `cimgTitle`, `cimgDescribe`, `cimgTime`, `cimages`, `cimgUrl`, `cimgStatus`, `cimgType`) VALUES 
  (1,'测试','<p>测试</p>','2018-04-24 23:07:54','/admin/images/lunboimg/1524582458359.gif','',1,0),
  (2,'测试2','<p>测试</p>','2018-04-24 23:10:15','/admin/images/lunboimg/1524582578331.gif','',1,0),
  (3,'3','<p>3</p>','2018-04-24 23:12:34','/admin/images/lunboimg/1524582727934.gif','',1,0),
  (4,'4','<p>4</p>','2018-04-24 23:15:06','/admin/images/lunboimg/1524582878450.gif','',1,0),
  (5,'5','<p>5</p>','2018-04-25 00:53:22','/admin/images/lunboimg/1524588746722.gif','',1,0);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;