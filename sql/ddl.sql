-- 创建库
create database if not exists friend_match;

-- 切换库
use friend_match;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
                       `rec_id` BIGINT(20) AUTO_INCREMENT COMMENT 'id',
                        `user_name` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '昵称',
                       `user_account` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '账号',
                       `avatar_url` VARCHAR(1024) NOT NULL DEFAULT '' COMMENT '头像地址',
                       `gender` TINYINT NOT NULL DEFAULT 0 COMMENT '性别',
                       `password` VARCHAR(512) NOT NULL COMMENT '密码',
                       `phone` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '电话',
                       `email` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '邮箱',
                       `status` INT(11) NOT NULL DEFAULT 0 COMMENT '状态',
                       `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                       `modify_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                       `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
                       `user_role` INT(11) NOT NULL DEFAULT 0 COMMENT '用户角色',
                       `tags` VARCHAR(1024) NOT NULL DEFAULT '' COMMENT '标签',
                       PRIMARY KEY (`rec_id`),
                       UNIQUE KEY `UX_USER_ACCOUNT`(`user_account`)
)ENGINE = INNODB DEFAULT CHARSET=utf8  COMMENT '用户表';


DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`(
                      `rec_id` BIGINT(20) AUTO_INCREMENT COMMENT 'id',
                      `tag_name` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '标签名称',
                      `user_id` BIGINT(20) NOT NULL COMMENT '创建的用户id',
                      `parent_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '父标签id',
                      `is_parent` TINYINT NOT NULL DEFAULT 0 COMMENT '是否父标签 0-否 1-是',
                      `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                      `modify_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                      `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
                      PRIMARY KEY (`rec_id`),
                      UNIQUE KEY `UX_TAG_NAME`(`tag_name`),
                      KEY `IX_USER_ID`(`user_id`)
)ENGINE = INNODB DEFAULT CHARSET=utf8  COMMENT '标签表';