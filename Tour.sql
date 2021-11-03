CREATE DATABASE `TOURISM`;

CREATE TABLE `cities`
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO `cities`
VALUES ('Huế'),
       ('Đà Lạt'),
       ('Ninh Bình'),
       ('Hội An'),
       ('Đà Nẵng');

CREATE TABLE `destination`
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    price       FLOAT,
    city_id     INT,
    FOREIGN KEY (city_id) REFERENCES cities (id)
);
INSERT INTO `destination`(`name`, `description`, `price`, `city_id`)
VALUES ('Lăng tẩm vua Nguyễn', 'Nơi có những cung điện, đền đài mang hơi thở cổ xưa', '1000000', '1'),
       ('Thung lũng tình yêu', 'Mùa nào cũng thơ mộng và tình tứ', '2000000', '2'),
       ('Vườn quốc gia Cúc Phương', 'Vùng đất kim cương của nhiều bộ phim nổi tiếng', '500000', '3'),
       ('Phố cổ Hội An', 'Bức tranh mộc mạc, nên thơ', '1000000', '4'),
       ('Bãi biển Mỹ Khê', 'Thành phố ven biển', '3000000', '5');


    CREATE TABLE `customers`(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    identity_card_number INT(12),
    birth_of_year INT,
    city_id INT
);
ALTER TABLE `customers` ADD FOREIGN KEY(city_id) REFERENCES cities(id);

INSERT INTO `customers`(`name`,`identity_card_number`,`birth_of_year`,`city_id`)
VALUES ('Xuan Anh', '11','1999','1'),
       ('Wang Yi Bo', '12','1997','1'),
       ('Matsumoto Jun', '13','1983','2'),
       ('Yamazaki Kento', '14','1994','2'),
       ('Suda Masaki', '15','1993','3'),
       ('Xuan Anh1', '16','1998','3'),
       ('Xuan Anh2', '17','1997','4'),
       ('Xuan Anh3', '18','1996','4'),
       ('Xuan Anh4', '19','1999','5'),
       ('Xuan Anh5', '20','1991','5');



CREATE TABLE `tour_categories`
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
INSERT INTO `tour_categories`(`name`)
VALUES ('2 ngày 1 đêm'), ('1 ngày');

CREATE TABLE `tour`
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES tour_categories (id),
    price       FLOAT,
    start_date  DATE,
    finish_date DATE
);
INSERT INTO `tour`(`category_id`,`price`,`start_date`,`finish_date`) VALUES
('1', 1000000, '2020/02/01','2020/02/03'),
('2', 1000000, '2020/04/30','2020/04/30'),
('1', 1000000, '2020/04/06','2020/04/08'),
('1', 1000000, '2020/02/13','2020/02/15'),
('1', 1000000, '2020/06/09','2020/06/11');



CREATE TABLE `order`
(
    id_tour INT,FOREIGN KEY (id_tour) REFERENCES tour(id),
    id_customer INT,FOREIGN KEY (id_customer) REFERENCES customers(id),
    status VARCHAR(100)
);
INSERT INTO `order`(`id_tour`,`id_customer`,`status`) VALUES
('1','1',' done 50% '),
('2','2',' done 80% '),
('1','3',' done 90% '),
('1','4',' done 40% '),
('1','5',' done 80% ');

SELECT COUNT(id) FROM tour WHERE start_date BETWEEN '2020/03/01' AND '2020/03/31';
SELECT COUNT(id) FROM tour WHERE finish_date BETWEEN '2020/04/01' AND '2020/04/30';