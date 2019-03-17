/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : blog_db

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-21 01:00:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES ('1', 'zdd', '123');

-- ----------------------------
-- Table structure for `tbl_article`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` text,
  `favor_num` int(11) DEFAULT NULL,
  `pageview_num` int(11) DEFAULT NULL,
  `post_time` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_article
-- ----------------------------
INSERT INTO `tbl_article` VALUES ('1', '冬至', 'zdd', '吃汤圆还是吃<span style=\"font-weight: bold;\">饺子</span><p><br></p>', '4', '528', '2018-12-15 10:26:09', '1', '冬至，又到了白色相簿的季节', 'http://whiteAlbum,jpg');
INSERT INTO `tbl_article` VALUES ('2', '春分', 'zdd', '哈哈哈', '4', '30', '2018-12-15 10:27:15', '6', '春分，又到了生命的季节', 'http://chunfen.jpg');
INSERT INTO `tbl_article` VALUES ('3', '夏至', 'zdd', '呵呵呵', '4', '55', '2018-12-15 10:28:29', '24', '夏至，感谢father of Air Conditioner威利斯·开利', 'http://xiazhi.jpg');
INSERT INTO `tbl_article` VALUES ('4', '秋分', 'zdd', '帅<p><br></p>', '4', '45', '2018-12-15 10:34:21', '1', '金九银十，大家找到工作和对象了吗', 'http://qiufen.jpg');
INSERT INTO `tbl_article` VALUES ('28', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输<span style=\"font-weight: bold;\">入内容...</span></p><p><br></p>', '0', '0', '2018-12-17 08:50:28', '1', '', '');
INSERT INTO `tbl_article` VALUES ('29', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:50:35', '24', '', '');
INSERT INTO `tbl_article` VALUES ('30', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:50:40', '1', '', '');
INSERT INTO `tbl_article` VALUES ('31', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:50:44', '1', '', '');
INSERT INTO `tbl_article` VALUES ('32', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:50:47', '1', '', '');
INSERT INTO `tbl_article` VALUES ('33', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:50:51', '1', '', '');
INSERT INTO `tbl_article` VALUES ('34', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:50:55', '1', '', '');
INSERT INTO `tbl_article` VALUES ('35', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:51:03', '1', '', '');
INSERT INTO `tbl_article` VALUES ('36', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '0', '2018-12-17 08:51:07', '1', '', '');
INSERT INTO `tbl_article` VALUES ('37', 'a', '', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '1', '9', '2018-12-17 08:51:11', '1', '', '<img src=\"https://i0.nicepik.com/files/660/288/955/blur-colorful-colourful-drops-of-water-thumb.jpg\" class=\"desc_img\"/>');
INSERT INTO `tbl_article` VALUES ('40', 'testDraft', 'zdd', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '2', '2018-12-17 13:31:08', '1', 'gdsadasgsadfasdfawergdasdfasdfsdfasdfThis blog post shows a few different types of content that\'s supported and styled with Bootstrap. Basic typography, images, and code are all supported.This blog post shows a few different types of content that\'', '<img src=\"https://i0.nicepik.com/files/66/471/592/abstract-astrology-astronomy-background-image-thumb.jpg\" class=\"desc_img\"/>');
INSERT INTO `tbl_article` VALUES ('43', 'testDraft4', 'zdddd', '<p>欢迎使用<b>wangEditor 富文本编辑器</b>，请输入内容...</p><p><br></p>', '0', '2', '2018-12-17 11:35:31', '13', 'asdfasf', '<img src=\"https://i2.nicepik.com/files/695/902/543/bridge-city-cityscape-building-thumb.jpg\" class=\"desc_img\"/>');
INSERT INTO `tbl_article` VALUES ('44', 'testDraft5', 'zddddd', '<p>This blog post shows a few different types of content that\'s supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p><hr><p>Cum sociis natoque penatibus et magnis&nbsp;<a href=\"https://v3.bootcss.com/examples/blog/#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p><blockquote><p>Curabitur blandit tempus porttitor.&nbsp;<strong>Nullam quis risus eget urna mollis</strong>&nbsp;ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p></blockquote><p>Etiam porta&nbsp;<em>sem malesuada magna</em>&nbsp;mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p><h2>Heading</h2><p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p><h3>Sub-heading</h3><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><pre><code>Example code block</code></pre><p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p><h3>Sub-heading</h3><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p><ul><li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li><li>Donec id elit non mi porta gravida at eget metus.</li><li>Nulla vitae elit libero, a pharetra augue.</li></ul><p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p><ol><li>Vestibulum id ligula porta felis euismod semper.</li><li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li><li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li></ol><p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', '22', '108', '2018-12-17 13:32:19', '1', 'test', '<img src=\"https://i2.nicepik.com/files/810/55/705/earth-space-night-environment-thumb.jpg\" class=\"desc_img\"/>');
INSERT INTO `tbl_article` VALUES ('45', 'testrecycle', 'zdd', '<p>不是回<span style=\"font-weight: bold; font-size: x-large;\">收</span>站</p><p>是</p>', '0', '2', '2018-12-17 13:28:07', '24', '嘎嘎', '<img src=\"https://i2.nicepik.com/files/241/595/615/desktop-wallpapers-desktop-background-desktop-backgrounds-wallpapers-thumb.jpg\" class=\"desc_img\"/>');
INSERT INTO `tbl_article` VALUES ('49', '测试编辑', 'zdd', '<h1 id=\"download\">下载</h1><div><div><h3 id=\"download-bootstrap\">用于生产环境的 Bootstrap</h3><p>编译并压缩后的 CSS、JavaScript 和字体文件。不包含文档和源码文件。</p><p><a href=\"https://github.com/twbs/bootstrap/releases/download/v3.3.7/bootstrap-3.3.7-dist.zip\">下载 Bootstrap</a></p></div><div><h3 id=\"download-source\">Bootstrap 源码</h3><p><a href=\"https://github.com/twbs/bootstrap/archive/v3.3.7.zip\">下载源码</a></p></div><div><h3 id=\"download-sass\">哈哈哈</h3><p><a href=\"https://github.com/twbs/bootstrap-sass\">这是 Bootstrap 从 Less 到 Sass 的源码移植项目</a>，用于快速地在 Rails、Compass 或 只针对 Sass 的项目中引入。</p><p><a href=\"https://github.com/twbs/bootstrap-sass/archive/v3.3.7.tar.gz\">下载 Sass 项目</a></p></div></div><h2 id=\"download-cdn\"><a href=\"https://v3.bootcss.com/getting-started/#download-cdn\" aria-label=\"Anchor link for: download cdn\"></a>使用 BootCDN 提供的免费 CDN 加速服务（同时支持 http 和 https 协议）</h2><p><br></p>', '1', '7', '2018-12-20 23:53:17', '13', '编辑\r\n用于生产环境的 Bootstrap\r\n编译并压缩后的 CSS、JavaScript 和字体文件。不包含文档和源码文件。', '<img src=\"https://i2.nicepik.com/files/54/648/833/arctic-aurora-aurora-borealis-beautiful-thumb.jpg\" class=\"desc_img\"/>');

-- ----------------------------
-- Table structure for `tbl_category`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', '其他');
INSERT INTO `tbl_category` VALUES ('2', '草稿');
INSERT INTO `tbl_category` VALUES ('3', '回收站');
INSERT INTO `tbl_category` VALUES ('4', 'CPP');
INSERT INTO `tbl_category` VALUES ('6', '高级软件工程');
INSERT INTO `tbl_category` VALUES ('7', '软件体系结构');
INSERT INTO `tbl_category` VALUES ('8', '算法导论');
INSERT INTO `tbl_category` VALUES ('11', '机器学习');
INSERT INTO `tbl_category` VALUES ('12', '人工智能');
INSERT INTO `tbl_category` VALUES ('13', 'springMvc');
INSERT INTO `tbl_category` VALUES ('23', 'ssh');
INSERT INTO `tbl_category` VALUES ('24', '散文');
INSERT INTO `tbl_category` VALUES ('25', '新增的类');

-- ----------------------------
-- Table structure for `tbl_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_name` varchar(255) DEFAULT NULL,
  `content` text,
  `post_time` date DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('1', 'zdd', '哈哈', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('2', 'zdd', '', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('3', 'zdd', 'hahah', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('4', 'zdd', '', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('5', 'zdd', 'gasadasdf', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('6', 'zdd2', '可以', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('7', 'zdd3', '不可以', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('8', 'zdd5', 'hahahah', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('9', 'zdd4', 'hahahah', '2018-12-20', '44');
INSERT INTO `tbl_comment` VALUES ('10', 'zdd1111', '测试评论', '2018-12-21', '44');

-- ----------------------------
-- Table structure for `tbl_visitor_record`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_visitor_record`;
CREATE TABLE `tbl_visitor_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_visitor_record
-- ----------------------------
