CREATE SCHEMA `shop_clothes` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
use shop_clothes;
CREATE TABLE role(
                     id integer auto_increment primary key,
                     name nvarchar(25)
);
create table staff(
                      id integer auto_increment primary key,
                      name nvarchar(250),
                      address nvarchar(250),
                      gender bit,
                      card_id nvarchar(15),
                      role_id integer,
                      email nvarchar(50),
                      username nvarchar(50),
                      password nvarchar(50),
                      constraint FK_role_staff foreign key (role_id) references role(id)
);
create table category(
                         id integer auto_increment primary key,
                         name nvarchar(50),
                         image_category nvarchar(50)
);
create table product(
                        id integer auto_increment primary key,
                        name nvarchar(50),
                        category_id integer,
                        price integer,
                        description text,
                        image_product text,
                        constraint FK_product_category foreign key (category_id) references category(id)
);
create table color(
                      id integer auto_increment primary key,
                      name nvarchar(25)
);
create table size(
                     id integer auto_increment primary key,
                     name nvarchar(10)
);
create table product_detail(
                               id integer auto_increment primary key,
                               product_id integer,
                               color_id integer,
                               size_id integer,
                               quatity integer,
                               date_imported varchar(25),
                               constraint FK_detail_product foreign key(product_id) references product(id),
                               constraint FK_detail_color foreign key(color_id) references color(id),
                               constraint FK_detail_size foreign key(size_id) references size(id)
);
create table voucher(
                        id integer auto_increment primary key,
                        name nvarchar(50),
                        date_started nvarchar(50),
                        date_end nvarchar(50),
                        description text,
                        image_voucher text,
                        reduce integer
);

create table bill(
                     id integer auto_increment primary key,
                     name_customer nvarchar(250),
                     phone_number nvarchar(12),
                     address nvarchar(250),
                     status_bill bit,
                     date_created nvarchar(50),
                     note text
);
create table bill_detail(
                            id integer auto_increment primary key,
                            bill_id integer,
                            product_detail_id integer,
                            quantity integer,
                            price integer,
                            constraint FK_bill_detail foreign key(bill_id) references bill(id),
                            constraint FK_bill_detail_product_detail foreign key(product_detail_id) references product_detail(id)
);

INSERT  INTO shop_clothes.role(name) VALUE ('USER');
INSERT  INTO shop_clothes.role(name) VALUE ('STAFF');
INSERT  INTO shop_clothes.role(name) VALUE ('ADMIN');

INSERT INTO shop_clothes.staff (name, address, gender, card_id, role_id, email, username, password) VALUES ('Nguyen Chi Huan', 'HaNoi', true, '001203031127', 3, 'nchuan03@gmail.com', 'nchuan03', '123456');
INSERT INTO shop_clothes.staff (name, address, gender, card_id, role_id, email, username, password) VALUES ('User', 'HaNoi', true, '012345678910', 1, 'user03@gmail.com', 'user03', '123456');
INSERT INTO shop_clothes.staff (name, address, gender, card_id, role_id, email, username, password) VALUES ('Staff', 'HaNoi', false, '012345678911', 2, 'staff03@gamil.com', 'staff03', '123456');

INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Áo Sơ Mi ');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Áo phông ');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Áo khoác gió ');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Quần âu ');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Quần jean');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Thắt lưng');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Túi xách nam');
INSERT INTO `shop_clothes`.`category` (`name`) VALUES ('Ví Da ');

INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Xanh');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Đỏ');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Tím');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Vàng');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Nâu ');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Đen');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Trắng');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Hồng');
INSERT INTO `shop_clothes`.`color` (`name`) VALUES ('Be');

INSERT INTO `shop_clothes`.`size` (`name`) VALUES ('M');
INSERT INTO `shop_clothes`.`size` (`name`) VALUES ('L');
INSERT INTO `shop_clothes`.`size` (`name`) VALUES ('XL');
INSERT INTO `shop_clothes`.`size` (`name`) VALUES ('XXL');
INSERT INTO `shop_clothes`.`size` (`id`, `name`) VALUES ('5', '0');


INSERT INTO `shop_clothes`.`voucher` (`name`, `date_started`, `date_end`, `description`, `reduce`) VALUES ('Giáng Sinh', '2023/23/12', '2023/25/12', 'Giảm giá giáng sinh', '20');
INSERT INTO `shop_clothes`.`voucher` (`name`, `date_started`, `date_end`, `description`, `reduce`) VALUES ('Tết Nguyên Đán', '2023/07/02', '2023/13/02', 'Giảm giá dịp tết', '20');
INSERT INTO `shop_clothes`.`voucher` (`name`, `date_started`, `date_end`, `description`, `reduce`) VALUES ('Ngày lễ tình nhân', '2023/13/02', '2023/14/02', 'Giảm giá cặp đôi', '25');

INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo handle', '1', '199', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo Bông Manstore', '3', '299', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo phông Manstore', '2', '199', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo phông Manstore 2', '2', '199', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo khoác gió Manstore', '3', '289', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo khoác gió Manstore v2', '3', '399', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo sơ mi Manstore', '1', '259', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo sơ mi Manstore v2', '1', '235', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Áo phông Manstore x Handle', '2', '159', 'Áo đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Quần âu Manstore', '4', '299', 'Quần đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Quần Âu Mansotre v2', '4', '155', 'Quần đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Quần jean Manstore', '5', '235', 'Quần đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Quần jean v2', '5', '499', 'Quần đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Thắt lưng da', '6', '300', 'Thắt lưng đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Túi Manstore', '7', '599', 'Túi đẹp mê li luông');
INSERT INTO `shop_clothes`.`product` (`name`, `category_id`, `price`, `description`) VALUES ('Ví da Manstore', '8', '259', 'Ví đẹp mê li luông ');

INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('1', '5', '1', '12', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('1', '6', '2', '23', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('1', '7', '3', '12', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('2', '5', '4', '24', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('2', '6', '1', '23', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('2', '7', '2', '45', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('3', '1', '4', '56', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('3', '2', '3', '23', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('4', '4', '2', '18', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('4', '5', '3', '12', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('5', '3', '4', '32', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('6', '6', '1', '45', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('7', '5', '3', '56', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('8', '3', '2', '34', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('8', '2', '4', '32', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('9', '8', '3', '56', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('10', '4', '2', '76', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('11', '6', '4', '87', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('13', '7', '2', '32', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('12', '5', '3', '12', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('14', '3', '5', '23', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('15', '5', '5', '32', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('16', '8', '5', '45', '2023/11/11');
INSERT INTO `shop_clothes`.`product_detail` (`product_id`, `color_id`, `size_id`, `quatity`, `date_imported`) VALUES ('16', '5', '5', '10', '2023/11/11');

INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A ', '0987654321', 'Hà nội', 1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van AB', '0987654322', 'Hà nội',1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van AC', '0987654323', 'Hà nội',0, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A D','0987654324', 'Hà nội',1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A E', '0987654325', 'Hà nội',0, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A F', '0987654326', 'Hà nội',1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A G','0987654327', 'Hồ chí minh', 1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A H','0987654328', 'Hồ chí minh', 0, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A I', '0987654329', 'Hồ chí minh', 1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A K','0987654311', 'Hồ chí minh', 1, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A L', '0987657812', 'Hồ chí minh', 0, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A M','0987542334', 'Đà năng', 0, '2023/12/12');
INSERT INTO `shop_clothes`.`bill` (`name_customer`, `phone_number`, `address`, `status_bill`, `date_created`) VALUES ('Nguyen Van A O','0987654314', 'Đà năng', 1, '2023/12/12');

INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('2', '15', '1', '299');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('3', '6', '1', '299');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('4', '15', '2', '299');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('5', '12', '1', '299');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('6', '8', '3', '245');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('7', '8', '1', '489');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('8', '7', '2', '565');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('9', '13', '4', '484');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('10', '10', '2', '456');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('11', '6', '5', '354');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('12', '9', '1', '86');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('13', '5', '6', '456');
INSERT INTO `shop_clothes`.`bill_detail` (`bill_id`, `product_detail_id`, `quantity`, `price`) VALUES ('1', '4', '5', '98');

