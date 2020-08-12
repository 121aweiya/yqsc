/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.0.27-community-nt : Database - yqscdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yqscdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yqscdb`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `aid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `sex` int(11) default NULL,
  `age` int(11) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adminuser` */

insert  into `adminuser`(`aid`,`username`,`password`,`name`,`tel`,`email`,`sex`,`age`,`status`) values (1,'admin','202cb962ac59075b964b07152d234b70','杨杨','10010','xxxxxxx@163.com',0,20,1),(2,'ads','47bce5c74f589f4867dbd57e9ca9f808','哈哈','10086','4334@qq.com',1,22,0),(4,'admindss','202cb962ac59075b964b07152d234b70','吕','22','as@q.com',1,11,0),(5,'admindss1','202cb962ac59075b964b07152d234b70','吕','22','as@q.com',1,11,1),(6,'admindss2','202cb962ac59075b964b07152d234b70','吕aa','22','as@q.com',1,11,1),(7,'admindss3','202cb962ac59075b964b07152d234b70','吕aa','22','as@q.com',1,11,0),(8,'dfd','2a46746763df4e41fd3068b175138d46','吕aa','110','as@q.com',1,11,1),(9,'arc','77963b7a931377ad4ab5ad6a9cd718aa','李李李','110001','aadd@aa.acom',0,33,0),(10,'taas','01ebebc3dbbc59ab503795e83dfdd88f','谈摊','4433434','aadd@aa.acom',0,44,0);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment COMMENT '类别ID',
  `categoryName` varchar(255) default NULL COMMENT '类别名字',
  `description` varchar(255) default NULL COMMENT '类别描述',
  `isDel` int(11) default '0' COMMENT '0否 1是',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`categoryName`,`description`,`isDel`) values (1,'弦乐器','描述1',0),(2,'木管乐器','描述2',0),(3,'铜管乐器','描述3',0),(4,'打击乐器','描述23',0),(5,'键盘乐器','描述666',0),(7,'在地','',1),(8,'在地','',1),(9,'在地','dd',1),(10,'ffffff','ss',1);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `contents` varchar(255) default NULL,
  `pid` int(11) default NULL COMMENT '商品Id',
  `mid` int(11) default NULL COMMENT '用户id',
  `isDel` int(11) default '0' COMMENT '是否删除 0否  1是',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`contents`,`pid`,`mid`,`isDel`) values (1,'评论内容1',2,1,0),(2,'评论内容12',3,2,0),(4,'评论内容13',3,3,0),(7,'asasasasassasa',3,27,1),(8,'asasasaddssd',3,27,0),(9,'sdsdds',3,27,0),(10,'asasasas',1,27,0),(11,'asasas',1,27,1),(12,'aaad',3,27,1),(13,'kaaa',3,27,0);

/*Table structure for table `fwm` */

DROP TABLE IF EXISTS `fwm`;

CREATE TABLE `fwm` (
  `id` int(11) NOT NULL auto_increment,
  `qname` varchar(255) default NULL COMMENT '乐器名称',
  `serialNum` varchar(255) default NULL COMMENT '防伪码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fwm` */

insert  into `fwm`(`id`,`qname`,`serialNum`) values (16,'XXX钢琴111','FW0491c02f7ba048b8ac26552e7e94bbbd'),(17,'红棉小提琴V3','FWb5d84e01fb4a4b09a1fc11259893c839'),(18,'红棉小提琴V1','FWfac323c4ec9d45f0999467caee69d140'),(19,'木笛子2222','FWcdaf090c1464492d83db892ff0e0c936'),(20,'红棉小提琴V2','FWd2c45b959aa34f829e311f0aa54abc9f'),(21,'XX小钢琴mmm','FW3c063d89707c4073b352e4f8805bfac4'),(22,'红棉小提琴V1','FWef58de3f77d34e3ab75e80eeeeeb3823'),(23,'木笛子1111','FW93ab92ce296142e1a4c14d1153a57c35'),(25,'木笛子1111','FWf856733c9d374c3283f4b16412e2340b'),(26,'木笛子1111','FW57a0c79f05ed44aeafb7e1a781ea8934'),(27,'木笛子1111','FWbe7c8a8615b34aa0ad705229ecc2db47');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `mid` int(11) NOT NULL auto_increment,
  `password` varchar(255) default NULL,
  `membername` varchar(255) character set utf8 collate utf8_bin default NULL,
  `nickname` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `sex` int(11) default '0',
  `money` double default '0',
  `paypassword` varchar(255) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`mid`,`password`,`membername`,`nickname`,`email`,`mobile`,`sex`,`money`,`paypassword`) values (1,'aa','杨杨杨','nick','ss@qq.com','2323',0,0,'322332'),(2,'bb','李李','jack','aa@qq.com',NULL,0,0,NULL),(3,'aa','要要','dd','dd@qq.com',NULL,1,0,NULL),(4,'a','dd',NULL,NULL,NULL,0,0,NULL),(5,'dd','ds','哈哈','dds@qq.cpm','10086',0,11,'112'),(6,'as','as',NULL,NULL,NULL,0,0,NULL),(7,'a','d','','','',1,0,'245'),(8,'d','dd',NULL,NULL,NULL,0,0,NULL),(10,'ff','ddddd',NULL,NULL,NULL,0,0,NULL),(11,'ffd','dddddd',NULL,NULL,NULL,0,0,NULL),(12,'gg','dds',NULL,NULL,NULL,0,0,NULL),(13,'tt','ddsa',NULL,NULL,NULL,0,0,NULL),(14,'fd','ds',NULL,NULL,NULL,0,0,NULL),(16,'fg','fdd',NULL,NULL,NULL,0,0,NULL),(17,'dd','ss',NULL,NULL,NULL,0,0,NULL),(18,'gg','fd',NULL,NULL,NULL,0,0,NULL),(19,'dd','fd',NULL,NULL,NULL,0,0,NULL),(20,'yy','sd',NULL,NULL,NULL,0,0,NULL),(21,'fd','ffr',NULL,NULL,NULL,0,0,NULL),(23,'dd','ew',NULL,NULL,NULL,0,0,NULL),(25,'123','fks','虎','','111',0,100,'23232'),(26,'aaa','ds','','','',0,110,'aadds'),(27,'123456','heihei','我是嘿嘿','aq21213@qq.com','15124527044',0,6012.33,'654321'),(28,'123456','heihei2','','','',0,0,'654321'),(29,'123','dadada','fdfddfd','223@qq.com','111111',0,33.02,'3223');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `newsTitle` varchar(255) default NULL,
  `newsContent` longtext,
  `deployName` varchar(255) default NULL COMMENT '发布人',
  `deployTime` datetime default NULL,
  `isDel` int(11) default '0' COMMENT '0否 1是',
  PRIMARY KEY  (`id`),
  KEY `fk_aid` (`deployName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`newsTitle`,`newsContent`,`deployName`,`deployTime`,`isDel`) values (1,'节日放假公告11','<p>各位同仁：<br>　　20xx年1月1日——元旦为国家法.定假日，放假一天。<br>　　为便于各部门及早合理地安排节假日生产等有关工作，现将元旦放假调休日期具体安排通知如下：<br>　　200xx年12月30日—200xx年1月1日放假，共3天。其中，1月1日(星期二)为法定节假日，12月30日(星期日)为公休日，12月29日(星期六)公休日调至12月31日(星期一)，12月29日(星期六)上班。<br>　　节假日期间，各部门要认真做好各项工作：<br>　　(1)加强节日期间安全生产和其它工作领导，强化监督管理，落实各项安全措施，确保节日期间的安全生产。<br>　　(2)要做好节日期间的值班和安全保卫工作，严格值班制度，并要有领导带班、值班制度，值班人员要恪尽职守，遇到重大问题和紧急突发事件，要在第一时间向上级请示报告，妥善处理，不得延误。在新的一年到来之际确保过上一个欢乐、祥和的节日。<br>　　请各部门将节日值班表于12月29日前报公司办公室。<br>**有限责任公司<br>XXXX年XX月XX日</p>','杨杨','2020-03-15 13:14:51',0),(3,'突发事件1','<p>雷锋网4月6日消息，特斯拉公司的工程师在该公司的YouTube频道上发布的一段视频中，展示了一款呼吸机的原型机。<br><br>在视频中，该工程师介绍说，呼吸机的设计大量使用了特斯拉汽车零件，这使得该公司能够重新部署现有库存，并快速生产设备。<br><br>但在这个介绍视频中，特斯拉团队并没有披露具体的生产时间表，“还有很多工作要做，”一名工程师说，“但我们正在尽最大努力。”<br><br>不久前，特斯拉CEO埃隆·马斯克（Elon Musk）宣布，其纽约工厂将很快重新开放来生产呼吸机，用于新冠肺炎病人治疗，也许就是视频中展示的呼吸机。<br><br>在新冠病毒感染日益增多的情况下，全球各国政府呼吁汽车制造商和飞机帮助采购或制造呼吸机和其他医疗设备。美国政府已经通过《国防生产法》，强制要求部分汽车公司生产呼吸机。<br><br>目前，全世界有100多万人被新冠病毒感染，超过65000人死亡。美国感染病毒的人数最多，超过30万。<br><br>除了特斯拉外，还有多家美国汽车制造商通过捐赠物资或提供资源来生产更多呼吸机。<br><br>比如美国知名的汽车制造商福特与3M和通用电气合作扩大呼吸机的生产，并同时使用自主资源来生产呼吸机、呼吸器以及防护面罩。<br><br>3月末，福特汽车宣布，继与通用医疗合作生产呼吸机之后，双方将就一款由Airon公司设计的更加简单的呼吸机的生产展开合作，并预计在未来的100天内能够生产5万台急需的医疗设备。随着生产线的进一步扩大，未来可以达到每月最高3万台的产量。<br><br>福特也与3M公司开展合作，联合设计并大规模生产电动空气净化呼吸防护面具，同时福特公司还与美国汽车工人联合会（UAW）携手合作，将在福特工厂每周生产超过10万个透明防护面罩为医护人员、工厂工人及销售人员提供保护。<br><br>福特工程师还通过利用两家公司的零件快速提高3M的电动空气呼吸机（PAPR）的生产能力。现成的零件包括福特F-150冷却座椅的风扇和便携式工具电池组，这些电池组可以为呼吸机供电长达8个小时。3M个人安全部门的全球技术总监Mike Kesti表示，我们的目标是将产量提高到目前水平的十倍。<br><br>福特企业产品和生产线管理副总裁吉姆·鲍姆比克（Jim Baumbick）在近期一次电话会议上对记者说：“我们可以利用各种设施来制造这些东西。我们正在扩大呼吸机的产能，并充分利用GE Healthcare和3M的实力。”</p>','杨杨','2020-03-15 16:24:46',0),(4,'测试11',NULL,'杨杨','2020-03-15 16:24:49',0),(5,'测试22',NULL,'杨杨','2020-03-15 16:24:54',0);

/*Table structure for table `yqorder` */

DROP TABLE IF EXISTS `yqorder`;

CREATE TABLE `yqorder` (
  `id` int(11) NOT NULL auto_increment,
  `recvName` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `buyNum` int(11) default NULL,
  `payfs` int(11) default '0',
  `addr` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `totalMoney` double default NULL,
  `kdName` varchar(255) default NULL,
  `kdNum` varchar(255) default NULL,
  `mid` int(11) default NULL,
  `yid` int(11) default NULL,
  `status` int(11) default '0',
  `isDel` int(11) default '0',
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `yqorder` */

insert  into `yqorder`(`id`,`recvName`,`phone`,`buyNum`,`payfs`,`addr`,`remark`,`totalMoney`,`kdName`,`kdNum`,`mid`,`yid`,`status`,`isDel`,`createTime`) values (1,'杨木','15124527041',12,1,'北京市海淀区花园路11号32栋','',5988,'顺丰快递','123333444555',27,3,4,0,'2020-04-27 20:16:25'),(2,'李李','15124527042',2,0,'北京市海淀区花园路11号33栋','hhhhhhs66',5518,'韵达快递','32322332232332',27,2,0,0,'2020-05-05 22:57:29');

/*Table structure for table `yueqi` */

DROP TABLE IF EXISTS `yueqi`;

CREATE TABLE `yueqi` (
  `id` int(11) NOT NULL auto_increment,
  `yqNum` varchar(255) default '' COMMENT '唯一标识码',
  `yqName` varchar(255) default NULL,
  `yqDescription` text,
  `newPrice` double(10,0) default NULL,
  `stock` int(255) default '0' COMMENT '库存',
  `oldPrice` double(10,2) default '0.00',
  `isHot` int(11) default '0' COMMENT '是否热卖 0否 1是',
  `isShow` int(11) default '0' COMMENT '是否上架 0否  1是',
  `imgurl` varchar(255) default NULL COMMENT '展示图片',
  `weight` float(10,0) default '0' COMMENT '重量 kg',
  `isDel` int(11) default '0' COMMENT '是否删除 0否  1是',
  `createTime` datetime default NULL COMMENT '添加时间',
  `categoryID` int(11) default NULL,
  `status` varchar(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `yueqi` */

insert  into `yueqi`(`id`,`yqNum`,`yqName`,`yqDescription`,`newPrice`,`stock`,`oldPrice`,`isHot`,`isShow`,`imgurl`,`weight`,`isDel`,`createTime`,`categoryID`,`status`) values (1,'6b813074991241e3b5saa8c53efde122','XX小钢琴mmm','asas',630,114,644.00,1,1,'http://localhost:8080/yqsc/uploads/87a7aa402b824bdca8cca4fc881bb646_hmst.jpg',3,0,'2020-03-03 12:44:03',1,NULL),(2,'4b813374991241e3352aa8c53efde131','XXX钢琴111','<p>在这添加描述</p><p><img src=\"http://localhost:8080/yqsc/uploads/9e43b4c609e94f978cbf6d752401852e_bg2.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:8080/yqsc/uploads/61e33b83b8094f2abd10ea719cfe0ffe_dd.jpg\" style=\"max-width: 100%;\"></p>',2759,63,2822.00,0,1,'http://localhost:8080/yqsc/uploads/21718e6b4824439898a9d53b617f1186_gq.png',260,0,'2020-03-19 12:44:05',5,NULL),(3,'6b813074991241e3b52aa8c53efde130','红棉小提琴V2','<p>小提琴是一种弦乐器。总共有四根弦。靠弦和弓摩擦发出声音。小提琴琴身（共鸣箱）长约35.5厘米，由具有弧度的面板、背板和侧板粘合而成。</p><p>面板常用云杉制作，质地较软；背板和侧板用枫木，红木，质地较硬。琴头、琴颈用整条枫木，指板用乌木。<br>小提琴广泛流传于世界各国，是现代管弦乐队弦乐组中最主要的乐器。它在器乐中占非常重要的地位，是现代交响乐队的支柱，也是具有高难度演奏技巧的独奏乐器，与钢琴、古典吉他并称为世界三大乐器。</p><p>哈哈：指一个人发出的笑声，高兴欢乐时的状态，抒发快乐的心情，表现一个人很开心的状态。也指人通常用来开玩笑。人的一种笑声，高兴，开心。</p><p><img src=\"http://localhost:8080/yqsc/uploads/b21fd1ee1f6740b5850492ac63be1096_desp.png\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/0a7db27832bf40a7878ad16641043ef3_des1.png\" style=\"max-width:100%;\"><img src=\"http://localhost:8080/yqsc/uploads/2a8b58f1b4b249128ed2c2d48c1199d6_des3.png\" style=\"max-width: 100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/ac274a0d617c4a2890d937a44612a3ae_des4.png\" style=\"max-width:100%;\"></p><p><br></p>',499,44,599.00,1,1,'http://localhost:8080/yqsc/uploads/7fa8020b06b24187acf7ecea5baf55ca_hmst.jpg',2,0,'2020-03-15 00:24:04',1,NULL),(4,'bb9541cd6c484b56b1ed562674439e5d','双簧管1111',NULL,599,58,622.00,0,1,'http://localhost:8080/yqsc/uploads/287d02b495e24f10b675e7f1173091b4_QQ截图20200414163005.png',2,0,'2020-03-15 00:26:51',3,NULL),(5,'2b676370178c410d820d708c57d60ba1','木笛子122222',NULL,323,44,521.00,0,1,'http://localhost:8080/yqsc/uploads/2527395fe00b4d578f82a8f826aab2ab_QQ截图20200414163754.png',1,0,'2020-03-15 00:32:15',2,NULL),(6,'d9a1b5ad14b3453d8cb0752180aa1075','木笛子1111',NULL,420,41,466.00,0,1,'http://localhost:8080/yqsc/uploads/678444cded844a66b84c4fc0dd7670dd_QQ截图20200414163754.png',2,0,'2020-03-15 00:33:24',2,NULL),(7,'f7b5488eca5a406b8b5cdce0aeda36f1','木笛子2222',NULL,289,125,299.00,0,1,'http://localhost:8080/yqsc/uploads/61960b30bffb49b993f0f6a827b878bb_QQ截图20200414163754.png',1,0,'2020-03-15 00:39:59',2,NULL),(8,'4f16638b8ce84c539ed6933d9fbc55ee','红棉3','<p>小提琴是一种弦乐器。总共有四根弦。靠弦和弓摩擦发出声音。小提琴琴身（共鸣箱）长约35.5厘米，由具有弧度的面板、背板和侧板粘合而成。</p><p>面板常用云杉制作，质地较软；背板和侧板用枫木，红木，质地较硬。琴头、琴颈用整条枫木，指板用乌木。<br>小提琴广泛流传于世界各国，是现代管弦乐队弦乐组中最主要的乐器。它在器乐中占非常重要的地位，是现代交响乐队的支柱，也是具有高难度演奏技巧的独奏乐器，与钢琴、古典吉他并称为世界三大乐器。</p><p>哈哈：指一个人发出的笑声，高兴欢乐时的状态，抒发快乐的心情，表现一个人很开心的状态。也指人通常用来开玩笑。人的一种笑声，高兴，开心。</p><p><img src=\"http://localhost:8080/yqsc/uploads/b21fd1ee1f6740b5850492ac63be1096_desp.png\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/0a7db27832bf40a7878ad16641043ef3_des1.png\" style=\"max-width:100%;\"><img src=\"http://localhost:8080/yqsc/uploads/2a8b58f1b4b249128ed2c2d48c1199d6_des3.png\" style=\"max-width: 100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/ac274a0d617c4a2890d937a44612a3ae_des4.png\" style=\"max-width:100%;\"></p><p><br></p>',4,88,3.00,0,1,'http://localhost:8080/yqsc/uploads/7fa8020b06b24187acf7ecea5baf55ca_hmst.jpg',1,0,'2020-03-15 00:40:49',1,NULL),(9,'088c79009fc64184835116521ea301c6','红棉小提琴V3','<p>小提琴是一种弦乐器。总共有四根弦。靠弦和弓摩擦发出声音。小提琴琴身（共鸣箱）长约35.5厘米，由具有弧度的面板、背板和侧板粘合而成。</p><p>面板常用云杉制作，质地较软；背板和侧板用枫木，红木，质地较硬。琴头、琴颈用整条枫木，指板用乌木。<br>小提琴广泛流传于世界各国，是现代管弦乐队弦乐组中最主要的乐器。它在器乐中占非常重要的地位，是现代交响乐队的支柱，也是具有高难度演奏技巧的独奏乐器，与钢琴、古典吉他并称为世界三大乐器。</p><p>哈哈：指一个人发出的笑声，高兴欢乐时的状态，抒发快乐的心情，表现一个人很开心的状态。也指人通常用来开玩笑。人的一种笑声，高兴，开心。</p><p><img src=\"http://localhost:8080/yqsc/uploads/b21fd1ee1f6740b5850492ac63be1096_desp.png\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/0a7db27832bf40a7878ad16641043ef3_des1.png\" style=\"max-width:100%;\"><img src=\"http://localhost:8080/yqsc/uploads/2a8b58f1b4b249128ed2c2d48c1199d6_des3.png\" style=\"max-width: 100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/ac274a0d617c4a2890d937a44612a3ae_des4.png\" style=\"max-width:100%;\"></p><p><br></p>',43,22,3.00,1,1,'http://localhost:8080/yqsc/uploads/7fa8020b06b24187acf7ecea5baf55ca_hmst.jpg',2,0,'2020-03-15 00:41:05',1,NULL),(10,'5ef2b46e989e4ff4a0ad091b8df53c00','仍有',NULL,3,10,2.00,0,1,'http://localhost:8080/yqsc/uploads/f7181f4051854762a2706bbf217e9282_dj.png',2,0,'2020-03-15 00:41:16',4,NULL),(11,'c4543dbd8b1546a0b27d626bad86bdf7','红棉小提琴V1','<p>小提琴是一种弦乐器。总共有四根弦。靠弦和弓摩擦发出声音。小提琴琴身（共鸣箱）长约35.5厘米，由具有弧度的面板、背板和侧板粘合而成。</p><p>面板常用云杉制作，质地较软；背板和侧板用枫木，红木，质地较硬。琴头、琴颈用整条枫木，指板用乌木。<br>小提琴广泛流传于世界各国，是现代管弦乐队弦乐组中最主要的乐器。它在器乐中占非常重要的地位，是现代交响乐队的支柱，也是具有高难度演奏技巧的独奏乐器，与钢琴、古典吉他并称为世界三大乐器。</p><p>哈哈：指一个人发出的笑声，高兴欢乐时的状态，抒发快乐的心情，表现一个人很开心的状态。也指人通常用来开玩笑。人的一种笑声，高兴，开心。</p><p><img src=\"http://localhost:8080/yqsc/uploads/b21fd1ee1f6740b5850492ac63be1096_desp.png\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/0a7db27832bf40a7878ad16641043ef3_des1.png\" style=\"max-width:100%;\"><img src=\"http://localhost:8080/yqsc/uploads/2a8b58f1b4b249128ed2c2d48c1199d6_des3.png\" style=\"max-width: 100%;\"></p><p><img src=\"http://localhost:8080/yqsc/uploads/ac274a0d617c4a2890d937a44612a3ae_des4.png\" style=\"max-width:100%;\"></p><p><br></p>',499,100,721.00,1,1,'http://localhost:8080/yqsc/uploads/7fa8020b06b24187acf7ecea5baf55ca_hmst.jpg',1,0,'2020-03-15 00:41:29',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
