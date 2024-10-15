USE optics;
INSERT INTO address (
`street`,
`street_nr`,
`floor`,
`door`,
`city`,
`zip_code`,
`country`) VALUES
('Aigua', 86, 'Bxs', null, 'Vilanova i la Geltrú', '08800', 'Espanya'),
('Diputació', 35, '3', '2', 'Barcelona', '08007', 'Espanya'),
('Prat de la Riba', 57, 'Bxs', '3', 'Girona', '17001', 'Espanya'),
('Parellades', 7, '5', '3', 'Sitges', '08870', 'Espanya'),
('Ramon i Cajal', 'S/N', null, null, 'Lleida', '25002', 'Espanya');

INSERT INTO `optics`.`customer`
(`name`,`surname`,`phone`,`email_address`,`address_id`,`mgm_id`)
VALUES
('Joan','Garriga','666666666','joangarriga@example.com',1,null);

INSERT INTO `optics`.`customer`
(`name`,`surname`,`phone`,`email_address`,`address_id`,`mgm_id`)
VALUES
('Maria','Álvarez','677777777','malvarez@example.com',2,1),
('Pere','Ramírez','688888888','pramirez@example.com',3,null);

INSERT INTO `optics`.`supplier`
(`nif`,`name`,`phone`,`fax`,`address`)
VALUES
('A12345678', 'Bona Vista', '933333333', null, 4),
('A23456789', 'LentsForU', '933444444', '932222222', 5),
('A34567890', 'OjoDeLince', '91111111', null, 5);

INSERT INTO `optics`.`glasses_procurement`
(`glasses_brand`,`supplier_nif`)
VALUES
('Camel', 'A12345678'),
('GoodView', 'A23456789'),
('ModernEye', 'A23456789');

INSERT INTO `optics`.`glasses`
(`brand`,`left_graduation`,`right_graduation`,`frame_type`,`frame_color`,`leftglass_color`,
`rightglass_color`,`price`)
VALUES
('Camel',2.0,2.0,'Flotant','blau','transparent','transparent',99.90),
('Camel',3.5,3.25,'Flotant','blau','transparent','transparent',99.90),
('GoodView',1.5,1.25,'Pasta','negre','groc','groc',1099.90),
('ModernEye',4.5,4.5,'Metàl·lica','verd','blau','blau',499.90);

INSERT INTO `optics`.`salesperson`
(`name`)
VALUES
('Ana Ochoa'),
('Albert Vila');

INSERT INTO `optics`.`sale`
(`customer_id`, `glasses_id`, `seller_id`)
VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 4, 2);