
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `${tabletop}${objectNameUpper}`
-- ----------------------------
DROP TABLE IF EXISTS `${tabletop}${objectNameUpper}`;
CREATE TABLE `${tabletop}${objectNameUpper}` (
 		`ID` int(11) NOT NULL AUTO_INCREMENT,
	<#list fieldList as var>
		<#if var[1] == 'Integer'>
		`${var[0]}` int(${var[5]}) NOT NULL COMMENT '${var[2]}',
		<#elseif var[1] == 'Double'>
		`${var[0]}` double(${var[5]},${var[6]}) DEFAULT NULL COMMENT '${var[2]}',
		<#else>
		`${var[0]}` varchar(${var[5]}) DEFAULT NULL COMMENT '${var[2]}',
		</#if>
	</#list>
  		PRIMARY KEY (`$ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
