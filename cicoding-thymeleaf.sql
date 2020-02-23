-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2020 年 02 月 23 日 03:38
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cicoding-thymeleaf`
--

-- --------------------------------------------------------

--
-- 表的结构 `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `departments`
--

INSERT INTO `departments` (`dept_no`, `dept_name`) VALUES
('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Production'),
('d005', 'Development'),
('d006', 'Quality Management');

-- --------------------------------------------------------

--
-- 表的结构 `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dept`
--

INSERT INTO `dept` (`id`, `num`, `name`) VALUES
(1, 1, '未分配'),
(2, 2, '总公司'),
(3, 3, '开发部'),
(4, 4, '运营部'),
(5, 5, '人事部');

-- --------------------------------------------------------

--
-- 表的结构 `dept_emp`
--

CREATE TABLE IF NOT EXISTS `dept_emp` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dept_emp`
--

INSERT INTO `dept_emp` (`emp_no`, `dept_no`, `from_date`, `to_date`) VALUES
(10001, 'd001', '1986-06-26', '9999-01-01'),
(10002, 'd001', '1996-08-03', '9999-01-01'),
(10003, 'd004', '1995-12-03', '9999-01-01'),
(10004, 'd004', '1986-12-01', '9999-01-01'),
(10005, 'd003', '1989-09-12', '9999-01-01'),
(10006, 'd002', '1990-08-05', '9999-01-01'),
(10007, 'd005', '1989-02-10', '9999-01-01'),
(10008, 'd005', '1998-03-11', '2000-07-31'),
(10009, 'd006', '1985-02-18', '9999-01-01'),
(10010, 'd005', '1996-11-24', '2000-06-26'),
(10010, 'd006', '2000-06-26', '9999-01-01');

-- --------------------------------------------------------

--
-- 表的结构 `dept_manager`
--

CREATE TABLE IF NOT EXISTS `dept_manager` (
  `dept_no` char(4) NOT NULL,
  `emp_no` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dept_manager`
--

INSERT INTO `dept_manager` (`dept_no`, `emp_no`, `from_date`, `to_date`) VALUES
('d001', 10002, '1996-08-03', '9999-01-01'),
('d002', 10006, '1990-08-05', '9999-01-01'),
('d003', 10005, '1989-09-12', '9999-01-01'),
('d004', 10004, '1986-12-01', '9999-01-01'),
('d005', 10010, '1996-11-24', '2000-06-26'),
('d006', 10010, '2000-06-26', '9999-01-01');

-- --------------------------------------------------------

--
-- 表的结构 `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `employees`
--

INSERT INTO `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) VALUES
(10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'),
(10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21'),
(10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28'),
(10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01'),
(10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12'),
(10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02'),
(10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10'),
(10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', '1994-09-15'),
(10009, '1952-04-19', 'Sumant', 'Peac', 'F', '1985-02-18'),
(10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', '1989-08-24'),
(10011, '1953-11-07', 'Mary', 'Sluis', 'F', '1990-01-22');

-- --------------------------------------------------------

--
-- 表的结构 `leaves`
--

CREATE TABLE IF NOT EXISTS `leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `isfinish` int(11) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `leaves`
--

INSERT INTO `leaves` (`id`, `type`, `starttime`, `endtime`, `reason`, `userid`, `username`, `isfinish`, `createtime`) VALUES
(4, '事假', '2018-02-15 00:00:00', '2018-02-15 00:00:00', '事假', 2, 'ttt', 2, '2018-02-15 11:58:08');

-- --------------------------------------------------------

--
-- 表的结构 `login_log`
--

CREATE TABLE IF NOT EXISTS `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logname` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=108 ;

--
-- 转存表中的数据 `login_log`
--

INSERT INTO `login_log` (`id`, `logname`, `userid`, `createtime`, `state`, `message`, `ip`) VALUES
(63, '登陆', 2, '2017-11-28 18:33:08', '成功', 'ttt', '0:0:0:0:0:0:0:1'),
(64, '登陆', 4, '2018-02-15 11:53:46', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(65, '退出', 4, '2018-02-15 11:54:31', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(66, '登陆失败', NULL, '2018-02-15 11:54:37', '成功', '用户名：ttt,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(67, '登陆失败', NULL, '2018-02-15 11:55:38', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(68, '登陆', 4, '2018-02-15 11:55:47', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(69, '退出', 4, '2018-02-15 11:57:24', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(70, '登陆', 4, '2018-02-15 11:57:28', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(71, '退出', 4, '2018-02-15 11:57:47', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(72, '登陆', 2, '2018-02-15 11:57:52', '成功', 'ttt', '0:0:0:0:0:0:0:1'),
(73, '登陆', 4, '2018-02-16 10:43:14', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(74, '登陆', 4, '2018-02-16 11:18:46', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(75, '退出', 4, '2018-02-16 11:22:21', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(76, '登陆失败', NULL, '2018-05-18 22:43:14', '成功', '用户名：system,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(77, '登陆', 4, '2018-05-18 22:43:24', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(78, '登陆', 4, '2018-05-18 22:44:41', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(79, '登陆失败', NULL, '2018-05-18 22:51:20', '成功', '用户名：system,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(80, '登陆', 4, '2018-05-18 22:51:29', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(81, '登陆', 4, '2018-05-19 08:27:07', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(82, '登陆', 4, '2018-05-19 08:30:02', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(83, '登陆', 4, '2018-05-19 08:42:13', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(84, '退出', 4, '2018-05-19 08:44:16', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(85, '登陆失败', NULL, '2018-05-19 08:44:21', '成功', '用户名：tttt,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(86, '登陆失败', NULL, '2018-05-19 08:44:39', '成功', '用户名：ttt,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(87, '登陆', 4, '2018-05-19 08:44:43', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(88, '退出', 4, '2018-05-19 08:45:29', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(89, '登陆', 2, '2018-05-19 08:45:32', '成功', 'ttt', '0:0:0:0:0:0:0:1'),
(90, '退出', 2, '2018-05-19 08:45:35', '成功', 'ttt', '0:0:0:0:0:0:0:1'),
(91, '登陆', 4, '2018-05-19 08:45:36', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(92, '登陆', 4, '2018-05-19 08:49:26', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(93, '登陆', 4, '2018-05-19 08:52:01', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(94, '退出', 4, '2018-05-19 08:53:37', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(95, '登陆失败', NULL, '2018-05-19 08:53:40', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(96, '登陆失败', NULL, '2018-05-19 08:53:45', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(97, '登陆失败', NULL, '2018-05-19 08:53:49', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(98, '登陆失败', NULL, '2018-05-19 08:53:52', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(99, '登陆失败', NULL, '2018-05-19 08:53:55', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(100, '登陆失败', NULL, '2018-05-19 08:54:02', '成功', '用户名：admin,原因：账号与密码不匹配', '0:0:0:0:0:0:0:1'),
(101, '登陆', 4, '2018-05-19 08:54:37', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(102, '登陆', 4, '2018-05-19 09:10:34', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(103, '登陆', 4, '2018-05-19 09:11:41', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(104, '登陆', 4, '2018-05-19 09:31:37', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(105, '登陆', 4, '2019-03-05 17:24:40', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(106, '登陆', 4, '2019-03-05 19:15:28', '成功', 'admin', '0:0:0:0:0:0:0:1'),
(107, '登陆', 4, '2019-03-28 23:07:16', '成功', 'admin', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- 表的结构 `memo`
--

CREATE TABLE IF NOT EXISTS `memo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `memo`
--

INSERT INTO `memo` (`id`, `title`, `text`, `time`, `userid`) VALUES
(15, '明天要做的事', '1.早上骑行\n2.中午需要去公司拿材料', '2017/11/14 下午5:10:25', 2),
(16, '测试', '测试', '2018/2/15 上午11:58:53', 2),
(17, '测试', '测试', '2018/5/19 上午8:52:22', 4);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `parentid` int(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `levels` int(11) DEFAULT NULL,
  `tips` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `code`, `parentid`, `name`, `icon`, `url`, `num`, `levels`, `tips`) VALUES
(1, NULL, NULL, '用户管理', 'fa-columns', '/userpage', NULL, 1, NULL),
(2, NULL, NULL, '部门管理', 'fa-clone', '/deptpage', NULL, 1, NULL),
(3, '', NULL, '角色管理', 'fa-tags', '/rolepage', NULL, 1, ''),
(4, '', NULL, '我的便签', 'fa-sticky-note', '/memopage', NULL, 1, ''),
(5, NULL, NULL, '发送通知', 'fa-share', '/noticepage', NULL, 1, NULL),
(6, NULL, NULL, '登陆日志', 'fa-tags', '/loginlogpage', NULL, 2, NULL),
(8, NULL, NULL, '操作日志', 'fa-tags', '/operationlogpage', NULL, 2, NULL),
(9, NULL, NULL, '请假', 'fa-calendar-plus-o', '/leavepage', NULL, 1, ''),
(10, NULL, NULL, '请假审核', 'fa-calendar-plus-o', '/operationleavepage', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `senduserid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL,
  `recivedeptid` int(11) DEFAULT NULL,
  `reciveuserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `notice`
--

INSERT INTO `notice` (`id`, `title`, `body`, `message`, `senduserid`, `type`, `createtime`, `recivedeptid`, `reciveuserid`) VALUES
(10, NULL, '欢迎使用cicoding！                    (●''◡''●) ', NULL, 2, '系统通知', '2017-09-28 11:52:23', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `operation_leave_user`
--

CREATE TABLE IF NOT EXISTS `operation_leave_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leaveid` int(255) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `operation_log`
--

CREATE TABLE IF NOT EXISTS `operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logtype` varchar(255) DEFAULT NULL,
  `logname` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `operation_log`
--

INSERT INTO `operation_log` (`id`, `logtype`, `logname`, `userid`, `classname`, `method`, `createtime`, `state`, `message`) VALUES
(47, '业务日志', '清除日志', 4, 'com.cicoding.controller.LogController', 'clearLoginLog', '2018-05-19 09:38:38', '成功', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `roles` varchar(255) NOT NULL,
  `tips` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `roles`, `tips`) VALUES
(1, 'ROLE_ADMIN', '超级管理员'),
(2, 'ROLE_USER', '用户'),
(18, 'ROLE_BUZHANG', '部长');

-- --------------------------------------------------------

--
-- 表的结构 `role_menu_relation`
--

CREATE TABLE IF NOT EXISTS `role_menu_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- 转存表中的数据 `role_menu_relation`
--

INSERT INTO `role_menu_relation` (`id`, `roleid`, `menuid`) VALUES
(85, 2, 4),
(86, 2, 9),
(87, 18, 1),
(88, 18, 2),
(89, 18, 3),
(108, 1, 1),
(109, 1, 2),
(110, 1, 3),
(111, 1, 4),
(112, 1, 5),
(113, 1, 6),
(114, 1, 8),
(115, 1, 9),
(116, 1, 10);

-- --------------------------------------------------------

--
-- 表的结构 `salaries`
--

CREATE TABLE IF NOT EXISTS `salaries` (
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`from_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `salaries`
--

INSERT INTO `salaries` (`emp_no`, `salary`, `from_date`, `to_date`) VALUES
(10001, 60117, '1986-06-26', '1987-06-26'),
(10001, 62102, '1987-06-26', '1988-06-25'),
(10001, 66074, '1988-06-25', '1989-06-25'),
(10001, 66596, '1989-06-25', '1990-06-25'),
(10001, 66961, '1990-06-25', '1991-06-25'),
(10001, 71046, '1991-06-25', '1992-06-24'),
(10001, 74333, '1992-06-24', '1993-06-24'),
(10001, 75286, '1993-06-24', '1994-06-24'),
(10001, 75994, '1994-06-24', '1995-06-24'),
(10001, 76884, '1995-06-24', '1996-06-23'),
(10001, 80013, '1996-06-23', '1997-06-23'),
(10001, 81025, '1997-06-23', '1998-06-23'),
(10001, 81097, '1998-06-23', '1999-06-23'),
(10001, 84917, '1999-06-23', '2000-06-22'),
(10001, 85112, '2000-06-22', '2001-06-22'),
(10001, 85097, '2001-06-22', '2002-06-22'),
(10001, 88958, '2002-06-22', '9999-01-01'),
(10002, 72527, '1996-08-03', '1997-08-03'),
(10002, 72527, '1997-08-03', '1998-08-03'),
(10002, 72527, '1998-08-03', '1999-08-03'),
(10002, 72527, '1999-08-03', '2000-08-02'),
(10002, 72527, '2000-08-02', '2001-08-02'),
(10002, 72527, '2001-08-02', '9999-01-01'),
(10003, 40006, '1995-12-03', '1996-12-02'),
(10003, 43616, '1996-12-02', '1997-12-02'),
(10003, 43466, '1997-12-02', '1998-12-02'),
(10003, 43636, '1998-12-02', '1999-12-02'),
(10003, 43478, '1999-12-02', '2000-12-01'),
(10003, 43699, '2000-12-01', '2001-12-01'),
(10003, 43311, '2001-12-01', '9999-01-01'),
(10004, 40054, '1986-12-01', '1987-12-01'),
(10004, 42283, '1987-12-01', '1988-11-30'),
(10004, 42542, '1988-11-30', '1989-11-30'),
(10004, 46065, '1989-11-30', '1990-11-30'),
(10004, 48271, '1990-11-30', '1991-11-30'),
(10004, 50594, '1991-11-30', '1992-11-29'),
(10004, 52119, '1992-11-29', '1993-11-29'),
(10004, 54693, '1993-11-29', '1994-11-29'),
(10004, 58326, '1994-11-29', '1995-11-29'),
(10004, 60770, '1995-11-29', '1996-11-28'),
(10004, 62566, '1996-11-28', '1997-11-28'),
(10004, 64340, '1997-11-28', '1998-11-28'),
(10004, 67096, '1998-11-28', '1999-11-28'),
(10004, 69722, '1999-11-28', '2000-11-27'),
(10004, 70698, '2000-11-27', '2001-11-27'),
(10004, 74057, '2001-11-27', '9999-01-01'),
(10005, 78228, '1989-09-12', '1990-09-12'),
(10005, 82621, '1990-09-12', '1991-09-12'),
(10005, 83735, '1991-09-12', '1992-09-11'),
(10005, 85572, '1992-09-11', '1993-09-11'),
(10005, 85076, '1993-09-11', '1994-09-11'),
(10005, 86050, '1994-09-11', '1995-09-11'),
(10005, 88448, '1995-09-11', '1996-09-10'),
(10005, 88063, '1996-09-10', '1997-09-10'),
(10005, 89724, '1997-09-10', '1998-09-10'),
(10005, 90392, '1998-09-10', '1999-09-10'),
(10005, 90531, '1999-09-10', '2000-09-09'),
(10005, 91453, '2000-09-09', '2001-09-09'),
(10005, 94692, '2001-09-09', '9999-01-01'),
(10006, 43311, '1990-08-05', '1991-08-05'),
(10006, 43311, '1991-08-05', '1992-08-04'),
(10006, 43311, '1992-08-04', '1993-08-04'),
(10006, 43311, '1993-08-04', '1994-08-04'),
(10006, 43311, '1994-08-04', '1995-08-04'),
(10006, 43311, '1995-08-04', '1996-08-03'),
(10006, 43311, '1996-08-03', '1997-08-03'),
(10006, 43311, '1997-08-03', '1998-08-03'),
(10006, 43311, '1998-08-03', '1999-08-03'),
(10006, 43311, '1999-08-03', '2000-08-02'),
(10006, 43311, '2000-08-02', '2001-08-02'),
(10006, 43311, '2001-08-02', '9999-01-01'),
(10007, 56724, '1989-02-10', '1990-02-10'),
(10007, 60740, '1990-02-10', '1991-02-10'),
(10007, 62745, '1991-02-10', '1992-02-10'),
(10007, 63475, '1992-02-10', '1993-02-09'),
(10007, 63208, '1993-02-09', '1994-02-09'),
(10007, 64563, '1994-02-09', '1995-02-09'),
(10007, 68833, '1995-02-09', '1996-02-09'),
(10007, 70220, '1996-02-09', '1997-02-08'),
(10007, 73362, '1997-02-08', '1998-02-08'),
(10007, 75582, '1998-02-08', '1999-02-08'),
(10007, 79513, '1999-02-08', '2000-02-08'),
(10007, 80083, '2000-02-08', '2001-02-07'),
(10007, 84456, '2001-02-07', '2002-02-07'),
(10007, 88070, '2002-02-07', '9999-01-01'),
(10008, 46671, '1998-03-11', '1999-03-11'),
(10008, 48584, '1999-03-11', '2000-03-10'),
(10008, 52668, '2000-03-10', '2000-07-31'),
(10009, 60929, '1985-02-18', '1986-02-18'),
(10009, 64604, '1986-02-18', '1987-02-18'),
(10009, 64780, '1987-02-18', '1988-02-18'),
(10009, 66302, '1988-02-18', '1989-02-17'),
(10009, 69042, '1989-02-17', '1990-02-17'),
(10009, 70889, '1990-02-17', '1991-02-17'),
(10009, 71434, '1991-02-17', '1992-02-17'),
(10009, 74612, '1992-02-17', '1993-02-16'),
(10009, 76518, '1993-02-16', '1994-02-16'),
(10009, 78335, '1994-02-16', '1995-02-16'),
(10009, 80944, '1995-02-16', '1996-02-16');

-- --------------------------------------------------------

--
-- 表的结构 `thing`
--

CREATE TABLE IF NOT EXISTS `thing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `name2` varchar(255) DEFAULT NULL,
  `name3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `thing`
--

INSERT INTO `thing` (`id`, `name`, `text`, `state`, `name1`, `name2`, `name3`) VALUES
(1, '1', '1', '1', '1', '1', '1'),
(2, '2', '2', '2', '2', '2', '2'),
(3, '4', '3', '3', '3', '3', '3'),
(4, '4', '4', '4', '4', '4', '4'),
(5, '5', '5', '5', '5', '5', '5'),
(6, '6', '6', '6', '6', '6', '6'),
(7, '7', '7', '7', '7', '7', '7'),
(8, '8', '8', '8', '8', '8', '8'),
(9, '9', '9', '9', '9', '9', '9'),
(10, '10', '10', '10', '10', '10', '10'),
(11, 'aaa', 'fds', 'fds', 'fd', 'fds', 'fdas');

-- --------------------------------------------------------

--
-- 表的结构 `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
  `emp_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `titles`
--

INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES
(10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
(10002, 'Staff', '1996-08-03', '9999-01-01'),
(10003, 'Senior Engineer', '1995-12-03', '9999-01-01'),
(10004, 'Engineer', '1986-12-01', '1995-12-01'),
(10004, 'Senior Engineer', '1995-12-01', '9999-01-01'),
(10005, 'Senior Staff', '1996-09-12', '9999-01-01'),
(10005, 'Staff', '1989-09-12', '1996-09-12'),
(10006, 'Senior Engineer', '1990-08-05', '9999-01-01'),
(10007, 'Senior Staff', '1996-02-11', '9999-01-01'),
(10007, 'Staff', '1989-02-10', '1996-02-11'),
(10008, 'Assistant Engineer', '1998-03-11', '2000-07-31'),
(10009, 'Assistant Engineer', '1985-02-18', '1990-02-18'),
(10009, 'Engineer', '1990-02-18', '1995-02-18'),
(10009, 'Senior Engineer', '1995-02-18', '9999-01-01'),
(10010, 'Engineer', '1996-11-24', '9999-01-01'),
(10010, 'Engineer', '1996-11-24', '9999-01-01');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `avator` varchar(255) NOT NULL,
  `deptid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avator`, `deptid`, `roleid`) VALUES
(2, 'ttt', '96e79218965eb72c92a549dd5a330112', '2', '1', 1, 1),
(4, 'admin', '96e79218965eb72c92a549dd5a330112', '4', '0', 2, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
