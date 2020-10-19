
/****** Script FOR: MYSQL SERVER DB ******/
/****** Script Date: 16-10-2020 15:00:00 ******/

/**CREATE CUSTOMER TABLE**/


CREATE TABLE `customer` (
  `customer_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ;
    
ALTER TABLE customer AUTO_INCREMENT = 1001;
/** =====================================================================**/   

/**CREATE ADDRESS TABLE**/

CREATE TABLE `address` (
  `address_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `customer_id` int(6) unsigned zerofill NOT NULL,
   PRIMARY KEY (`address_id`),
   CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ;

ALTER TABLE address AUTO_INCREMENT = 101;  
/** =====================================================================**/   
     
/** =====================================================================**/    
/** hibernate_sequence TABLE**/

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(1) DEFAULT NULL
)

    
/** =====================================================================**/   

   
