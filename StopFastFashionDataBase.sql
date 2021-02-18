
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `photo` varchar(1000),
  `phone` varchar(10) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  UNIQUE KEY `USERNAME` (`username`),
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `purchasers` (
  `purchaser_id` int NOT NULL AUTO_INCREMENT,
  `age` varchar(50) NOT NULL,
  `purchaser_username` varchar(45) NOT NULL,
  UNIQUE KEY `purchaserid` (`purchaser_id`),
  FOREIGN KEY (purchaser_username) REFERENCES `users`(username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `NGO` (
  `ngo_name` varchar(20),
  `ngo_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) NOT NULL,
  `afm` varchar(9) NOT NULL,
  `address` varchar(50) NOT NULL,
  `link` blob(21845) NOT NULL,
  `NGO_username` varchar(45) NOT NULL,
  UNIQUE KEY `afm_UNIQUE` (`afm`),
  UNIQUE KEY `ngoid` (`ngo_id`),
  FOREIGN KEY (NGO_username) REFERENCES `users`(username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `Ad`(
	`ad_id` int AUTO_INCREMENT,
    `product_type` varchar(80) NOT NULL,
    `price` double NOT NULL,
    `photo` varchar(1000) NOT NULL,
	`product_description` varchar(250) NOT NULL,
    `purchaser_id` int NOT NULL ,
     PRIMARY KEY (`ad_id`),
     UNIQUE KEY `adid` (`ad_id`),
     FOREIGN KEY (purchaser_id) REFERENCES `purchasers`(purchaser_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    

CREATE TABLE `Message`(
	`message_id` int auto_increment,
    `sender` int NOT NULL,
    `receiver` int NOT NULL,
    `description` varchar(9000) NOT NULL,
    `photo` varchar(9000),
    PRIMARY KEY (`message_id`),
    UNIQUE KEY `messageid` (`message_id`),
    FOREIGN KEY (receiver) REFERENCES `purchasers`(purchaser_id),
    FOREIGN KEY (sender) REFERENCES `NGO`(ngo_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    CREATE TABLE `MessagePurchaser`(
	`message_id` int auto_increment,
    `sender` int NOT NULL,
    `receiver` int NOT NULL,
    `description` varchar(9000) NOT NULL,
    `photo` varchar(9000),
    PRIMARY KEY (`message_id`),
    UNIQUE KEY `messageid` (`message_id`),
    FOREIGN KEY (receiver) REFERENCES `purchasers`(purchaser_id),
    FOREIGN KEY (sender) REFERENCES `purchasers`(purchaser_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    

    

CREATE TABLE `Request`(
	`request_id` int  AUTO_INCREMENT,
    `purchaser_id` int NOT NULL,
    `ngo_id` int NOT NULL,
    `category` varchar(20) NOT NULL,
    `photos` varchar(1000) NOT NULL,
    `description` varchar(250) NOT NULL,
    `selectedNGO` varchar(50) NOT NULL,
    PRIMARY KEY (`request_id`),
    UNIQUE KEY `requestid` (`request_id`),
    FOREIGN KEY (purchaser_id) REFERENCES `purchasers`(purchaser_id),
    FOREIGN KEY (ngo_id) REFERENCES `NGO`(ngo_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Wishlist`(
	`wishlist_id` int AUTO_INCREMENT,
	`purchaser_id` int NOT NULL,
    `ad_id` int NOT NULL,
     UNIQUE KEY `wishlistid` (`wishlist_id`),
    FOREIGN KEY (purchaser_id) REFERENCES `purchasers`(purchaser_id),
    FOREIGN KEY (ad_id) REFERENCES `Ad`(ad_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
   DROP TABLE IF EXISTS `Wishlist`;
   DROP TABLE IF EXISTS `Request`;
   DROP TABLE IF EXISTS `Message`;
   DROP TABLE IF EXISTS `MessagePurchaser`;
   DROP TABLE IF EXISTS `Ad`;
   DROP TABLE IF EXISTS `NGO`;
   DROP TABLE IF EXISTS `purchasers`;
   DROP TABLE IF EXISTS `users`;
   
delete from `users` where `username`="mitsaras";
select * from `users`;
delete  from `users` where `username`="akiri";
select * from `Wishlist`;
select `purchaser_id` from `Ad`;