-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: jobdb
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apply_date` datetime NOT NULL,
  `cv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `apply_empl_idx` (`employee_id`),
  KEY `apply_post_idx` (`post_id`),
  CONSTRAINT `apply_empl` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `apply_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'2021-05-14 02:11:00','a.docx',8,6),(2,'2021-05-14 04:02:47','1751010185_VoHoangYen (1).pdf',7,1),(3,'2021-05-14 04:03:21','Sách TOEIC ETS 2020 RC.pdf',3,3),(4,'2021-05-14 04:04:08','English (1).docx',5,3),(5,'2021-05-14 17:10:19','English (4).docx',12,3),(6,'2021-05-14 17:10:41','2.1 Bai Tap Kmeans (1).docx',14,3);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Hà Nội'),(2,'TP. Hồ Chí Minh'),(3,'Đà Nẵng'),(4,'Cần Thơ'),(5,'Bình Dương');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cv` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `user_id` int NOT NULL,
  `major_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_userId_idx` (`user_id`),
  KEY `employee_majorId_idx` (`major_id`),
  KEY `employee_areaId_idx` (`area_id`),
  CONSTRAINT `employee_areaId` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_majorId` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_userId` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Yến','Võ Hoàng','1999-03-10 00:00:00','Nữ','Báo cáo đồ án ngành.docx','0978698765','vohoangyen@gmail.com','799 Nguyễn Kiệm, p3,gv','1 năm',9000000,11,2,2),(2,'Thảo','Lê Thị Thu','1999-06-01 00:00:00','Nữ','b.docx','0987654321','lettthao@gmail.com','875 Nguyễn Kiệm, p3,gv','no experience',8000000,21,1,2),(3,'Thanh','Văn','1999-03-03 00:00:00','Nam','a.docx','0912345678','nvt@gmail.com','123 Lê Lai, p6, Gò Vấp','2 năm',8000000,22,2,2),(4,'Huy','Nguyễn Văn','2000-09-01 00:00:00','Nam','English (4).docx','034568912','nvh@gmail.com','789 Hồ Hảo Hớn, Quận 1','Không có kinh nghiệm',12000000,23,3,2),(5,'Thái Nghiên','Kim','2021-05-03 00:00:00','Nữ','a.docx','0987654321','soshibond290399@gmail.com','371 Nguyễn Kiệm, p3, Quận Gò Vấp','2 năm',8000000,20,5,2),(6,'Lâm','Nguyễn Thanh','2000-02-14 00:00:00','Nam','English (4).docx','0912345678','nvt@gmail.com','123 Lê Lai, p6, Gò Vấp','Không có kinh nghiệm',8000000,31,6,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `employer_id` int NOT NULL AUTO_INCREMENT,
  `company_name` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `logo` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scale` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`employer_id`),
  KEY `employer_userId_idx` (`user_id`),
  KEY `employer_areaId_idx` (`area_id`),
  CONSTRAINT `employer_areaId` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employer_userId` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,'ITviec','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBNTk4REE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--346af267b763bf8e2debf8d511068b58a8b6a26c/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--0ee2142826455db8f2c2c0595c4fa369c30c09c8/itviec-logo.jpg','ITviec.com is where \"Ít nhưng mà chất\" developers go to find great new jobs.','50+','(+84) 977 460 519','love@itviec.com','60 Đường Nguyễn Văn Thủ, Đa Kao, Quận 1',1,2),(2,'FPT Software','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOEJwSFE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--61bb4901a74cef186408525de025b905e8ecf1ea/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/logo%20FSOFT%20d%E1%BB%8Dc.png','The leading provider of software outsourcing services in Vietnam','1000+','(+84) 981 448 474','love@fpt.com','FPT Software Đường D1 Phường Tân Phú',2,2),(3,'NetTrue Co','https://apusthemes.com/wp-demo/workup/wp-content/uploads/2019/06/c-6.png','Far much that one rank beheld bluebird after outside ignobly allegedly more when oh arrogantly vehement irresistibly fussy penguin insect additionally wow absolutely crud meretriciously hastily dalmatian a glowered inset one echidna cassowary some parrot and much as goodness some froze the sullen much connected bat wonderfully on instantaneously eel valiantly petted this along across highhandedly much.','200+','(+84) 981 448 474','love@nettrueco.com','739 Le Hong Phong, Ward 12, Dist.10',3,2),(4,'Dr.JOY','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBM3V2RXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--6ffb9bdf8d2284f7b347e249a55cc7dc64647f57/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/DrJOY_logo_sub_tate.png','Dr.JOY tự hào là đơn vị tiên phong trong việc tạo nên nền tảng liên lạc giao tiếp trong lĩnh vực y tế nhằm nâng cao hiệu quả và tính an toàn y tế từ các bệnh viện lớn cho tới các phòng khám nhỏ.','51-150','(+84) 981 448 474','drjoy-vietnam@drjoy.vn','Zone 3, Zone 4, Tầng 16, tòa nhà Văn phòng 789, số 147 đường Hoàng Quốc Việt, Nghĩa Đô, Cầu Giấy',4,1),(5,'LG Vehicle Component Solutions Development Center Vietnam (LG VS DCV)','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBM3d3REE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--80a5e94da84295f7b4d0feae6f2e6cb58eb1e369/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/lg-development-center-vietnam-logo.png','With the advent of the Smart Car era, LG hopes to become an innovative partner in vehicle electrification through development of advanced technology components. Vehicle Component Solutions Company (VS) is developing a wide variety of highly competitive products. Our products include In Vehicle Infotainment system such as Telematics, AV Navigation, Display Audio, Integrated Display System, and Advanced Driver Assistant System (ADAS) called ‘intelligent safe’, and other convenient devices. Our company is also focusing on vehicle engineering, to include Powertrain, electronic vehicle Battery Packs, etc. and is providing them to major customers in the world-wide vehicle industry.','301-500','(+84) 981 448 474','love@lg.com','Da Nang Office',5,3),(6,'Toshiba Software Development (Viet Nam) Co, Ltd','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBekpjRUE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--19cb4846995179b8088eafc3b35f1a0002e6973f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/toshiba-software-development-viet-nam-co-ltd-logo.png','A social infrastructure and digital products software company','301-500','(+84) 981 448 474','love@lg.com','16th Floor, 519 Kim Ma, Ba Dinh, Hanoi',6,1),(7,'HansenCX','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOTcwREE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--e138be026348f1c63ee1a116bf1b3aa627236eac/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/hansencx-logo.png','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOTcwREE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--e138be026348f1c63ee1a116bf1b3aa627236eac/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/hansencx-logo.png','51-150','(+84) 981 448 474	','love@hansencx.com','98 Xuan Thuy Street, Thao Dien Ward',7,2),(8,'Công Ty Cổ Phần Lê Dư Group','https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/ddcc4549c13e2a5f30678547fdca5cea.jpg','Công ty Cổ phần Lê Dư Group được thành lập vào năm 2014 - là công ty hàng đầu trong lĩnh vực cung cấp giải pháp về công nghệ thông tin cho các doanh nghiệp trong nước và quốc tế.','1000+','(+84) 981 448 474	','love@ldgroup.com','56 Nguyễn Đình Chiểu, Đa Kao, Quận 1, Thành phố Hồ Chí Minh',12,2),(9,'Vina Business Center','http://www.vinabusinesscenter.com/assets/images/vinalogo2-96x96.png','Vina Business Center là trung tâm hỗ trợ cho doanh nghiệp và các công ty khởi nghiệp với các dịch vụ đổi mới sáng tạo và giúp các startup tiết kiệm chi phí và mang lại hiệu quả kinh doanh cao nhất. Chúng tôi hỗ trợ các startup từ dịch vụ văn phòng cho đến các hoạt động nhân sự, tiếp thị, quảng cáo, marketing, kế hoạch và chiến lược kinh doanh... Ngoài ra chúng tôi còn có quỹ đầu tư cho các dự án startup có ý tưởng sáng tạo và hiệu quả kinh tế cao với mức đầu tư lên đến 100 triệu đồng / dự án. Và hỗ trợ các ý tưởng startup trong quá trình hình thành và phát triển...','200+','093 247 1800','admin@vinabusinesscenter.com','Tòa nhà Callary Event Center',13,2),(10,'Công ty tài chính Shinhan VN','https://cdn1.timviecnhanh.com/asset/home/img/employer/5e05856102fad_1577420129.jpg','Shinhan Finance là thành viên của Tổng công ty Shinhan Card, doanh nghiệp kinh doanh thẻ Tín dụng số 1 tại Hàn Quốc, thuộc Tập đoàn tài chính Shinhan Financial Group, xếp ở vị trí 44 trên tổng số 500 Thương hiệu Ngân hàng lớn toàn cầu. Với sự kết hợp vững chắc giữa nền tảng công nghệ và các sản phẩm tài chính vượt trội của Shinhan Card cùng di sản hơn 11 năm kinh nghiệm phát triển thị trường cho vay tiêu dùng của công ty, Shinhan Finance cam kết nỗ lực để trở thành Công ty tài chính hỗ trợ khách hàng tốt nhất Việt Nam. Với mạng lưới kinh doanh phát triển rộng khắp trên toàn quốc, Công ty luôn tích cực tiếp cận, tư vấn và hỗ trợ khách hàng với những giải pháp tài chính cá nhân linh hoạt, giúp khách hàng hiện thực hóa ước mơ, nâng cao chất lượng cuộc sống. Shinhan Finance tự hào đã và đang được phục vụ hàng trăm ngàn khách hàng và ngày càng có thêm nhiều khách hàng tín nhiệm lựa chọn các sản phẩm và dịch vụ của Công ty. Công ty sẽ tiếp tục phát huy lợi thế kinh doanh, nâng cao chất lượng dịch vụ, đảm bảo chất lượng quản trị tín dụng và quản trị rủi ro, cam kết trở thành công ty tài chính tiêu dùng minh bạch và uy tín trên thị trường Việt Nam.','200+','0886456021  ','pnvt08@gmail.com','Tầng trệt, tầng lửng, tầng 2,3,15 Tòa nhà Empress, số 138-142 Hai Bà Trưng, Phường Đa Kao, Quận 1',14,2),(11,'Công Ty TNHH MTV TM DV Hoàng Gia Lâm','https://cdn1.timviecnhanh.com/asset/home/img/employer/589837ca0cc37_1486370762.png','Công Ty TNHH MTV TM DV Hoàng Gia Lâm là một trong những công ty hàng đầu chuyên bán, cho thuê xe nâng đã qua sử dụng và mới 100% trên toàn quốc. Và là: Đại lý phân phối CHÍNH THỨC bình điện xe nâng HITACHI, Đại lý phân phối ĐỘC QUYỀN bình điện xe nâng CEIL (CHLORIDE, EXIDE), Đại lý phân phối ĐỘC QUYỀN máy lọc nước cất HydroPure (Philadelphia Scientific USA).','300+','(+84) 981 448 474	','admin@hoanggialam.com','465A QL13, Khu phố Nguyễn Trãi, P.Lái Thiêu, TX.Thuận An, Tỉnh Bình Dương',15,5),(12,'Floware VN','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBLzRvREE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--c49188f590ac90ccf1cdd48412c9c69353a3264b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/floware-logo.png','Floware is a leader in building innovative software to transform the way people live, play, work, and learn. Our mission is to create smart solutions that benefit everyone and solve their daily challenges. We were the first in Vietnam to develop an iOS app and our first OS X application SmartDay debuted on the Mac App Store at #5.','50+','(+84) 981 448 474	','love@fw.com','43 Hồ Văn Huê, Phú Nhuận',18,2),(13,'De Heus Asia','https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBLzR6REE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--6d3d6b6c5f689e8a153f3b30ab38b07eb689496e/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtCcWpBPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--623b1a923c4c6ecbacda77c459f93960558db010/de-heus-logo.png','Royal De Heus is an internationally operating family-owned company with a leading position in the animal feed industry and we are continuously expanding our borders. Royal De Heus headquarters is located in Ede, The Netherlands and has over 70 production locations worldwide. From these locations we deliver compound feed, concentrates, premixes and specialties to our customers in 75 countries. Worldwide over 6,000 employees contribute daily to the company’s objectives and ambition. For 10 years we are active in Asia, with at this moment production facilities in Vietnam, Myanmar, India and Indonesia. The Asia HQ is located in Ho Chi Minh City, Vietnam. ','1000+','0312192258','admin@deheus.com','Tầng 8, Cantavil Premier, Số 1 đường  Song Hành, Xa lộ Hà Nội,  Quận 2',19,2),(14,'Công Ty CP Dịch Thuật Chuyên Nghiệp Số 1','https://cdn1.timviecnhanh.com/asset/home/img/employer/59e844c1b732f_1508394177.png','Dịch Thuật Số 1 là thương hiệu của Công ty Cổ phần Dịch thuật Chuyên nghiệp Số 1, một công ty chuyên nghiên cứu, phát triển và cung cấp dịch vụ ngôn ngữ cho khách hàng trên toàn thế giới. Được thành lập chính thức vào năm 2008, Công ty CP Dịch thuật Chuyên nghiệp Số 1 đã trải qua hơn 8 năm hình thành và phát triển, với tập thể ban lãnh đạo đam mê đầy nhiệt huyết, đội ngũ chuyên viên tận tình và chuyên nghiệp, Dịch thuật Số 1 luôn khẳng định được mình là một trong những doanh nghiệp hàng đầu Việt Nam trong việc cung cấp các giải pháp về ngôn ngữ và trở thành đối tác thân thiết của nhiều doanh nghiệp, tổ chức trong và ngoài nước, các tập đoàn đa quốc gia…','100+','0987654321','admin@dichthuat.com','Tầng 4, Số 8 Cát Linh, Đống Đa',26,1),(15,'Công Ty TNHH Vhs Việt Nam','https://cdn1.timviecnhanh.com/asset/home/img/employer/5fd8631046c2c_1608016656.jpg','Công ty chuyên hoạt động trong lĩnh vực giáo dục.','150 -300','0942635239','admin@vhs.com','Số nhà 83, Phố Thanh Lân, Phường Thanh Trì, Quận Hoàng Mai',27,1),(16,'Ngân Hàng TMCP Tiên Phong','https://cdn1.timviecnhanh.com/images/employer_avatar/2021/05/06/images/162028200934.png','Ngân hàng Thương mại Cổ phần Tiên Phong (gọi tắt là “TPBank”) được thành lập từ ngày 05/05/2008. TPBank được kế thừa những thế mạnh về công nghệ hiện đại, kinh nghiệm thị trường cùng tiềm lực tài chính của các cổ đông chiến lược bao gồm:Tập đoàn Vàng bạc Đá quý DOJI, Tập đoàn Công nghệ FPT, Công ty Tài chính quốc tế ( IFC), Tổng công ty Tái bảo hiểm Việt Nam (Vinare) và Tập đoàn Tài chính SBI Ven Holding Pte. Ltd.,Singapore.','300+','(+84) 981 448 474	','admin@tpbank.com','44 Lê Ngọc Hân, Hai Bà Trưng',28,1),(17,'Công ty TNHH Xây dựng & trang trí nội thất','https://marketingworks.vn/storage/logo_company/1616215674.png','Katsun Decor là công ty chuyên thiết kế – thi công – hoàn thiện nội thất cho các công trình xây dựng: Cửa hàng kinh doanh (Showroom, Spa, Shop thời trang,…) , Cửa hàng ăn uống (Quán Cafe – Nhà Hàng), Văn phòng và Căn hộ – Biệt Thự. Với phương châm hoạt động UY TÍN – TẬN TÂM – THẤU HIỂU, Katsun Decor luôn luôn lắng nghe từng “hơi thở” trong nhu cầu kiến tạo một không gian hoàn hảo cho khách hàng ngay từ lần hợp tác đầu tiên.','10-15','0246.328.9326','cskh@marketingworks.vn','KDC Vạn Phúc, Hiệp Bình Phước, Thủ Đức, Quận Thủ Đức',29,2),(18,'Công ty CP Truyền thông & quảng cáo Đoàn Gia','https://cdn.applycv.com/logos/2021/04/20/mvx1618906241.jpg','Công Ty Cổ Phần Truyền Thông & Quảng Cáo Đoàn Gia đáp ứng đầy đủ điều kiện đăng ký kinh doanh theo những quy định của pháp luật hiện hành đã được Sở Kế hoạch và Đầu tư cấp giấy phép đăng ký kinh doanh với mã số thuế là 0312424526 kể từ ngày 20/08/2013 và bắt đầu hoạt động kể từ ngày 19/08/2013, tính đến nay Công Ty Cổ Phần Truyền Thông & Quảng Cáo Đoàn Gia đã thành lập được hơn 7 năm.','150 - 300','0905560600','ctcp@doangia.vn','Tầng 5 Tòa nhà Fimexco, Số 231-233 Lê Thánh Tôn, Phường Bến Thành, Quận 1',30,2),(19,'SM Entertainment ','/images/imgFile/e7.jpg','SM được biết đến là người đã dẫn dắt hiện tượng K-pop toàn cầu và khía cạnh âm nhạc của \"Hallyu\", còn được gọi là \"Làn sóng Hàn Quốc\". Đại diện của ngành công nghiệp giải trí ở châu Á, công ty điều hành kinh doanh giải trí toàn diện của riêng mình bao gồm phát triển nghệ sĩ, hãng thu âm, đào tạo năng khiếu nghệ thuật, sản xuất âm nhạc, xuất bản âm nhạc, quản lý sự kiện và tổ chức các buổi hòa nhạc.  Hiện nay, SM Entertaiment đã có mặt tại thị trường Việt Nam và dự kiến từ nay cho đến quý IV cửa hàng SM&Cafe và SM&Store sẽ chính thức khai trương trong đó có góp mặt của người sáng lập Lee Soo-man, và một số nghệ sĩ của SMTOWN. SM&Store tại quận 7, TpHCM là cửa hàng thứ hai và đầu tiên của SM tại nước ngoài ngoài cửa hàng tại Gangnam, Seoul, Hàn Quốc . Dù chưa chính thức công bố nhưng đã có một số hình ảnh của SMTOWN tại dự án Seoul Made Street (khu đô thị Times City) Hà Nội, có thể thấy ông lớn SM đang rất hứng thú với thị trường Việt Nam.','4000+','0934561234','smtown@sm.gmail.com','Tầng 4, Crescent Mall, 101 Tôn Dật Tiên, Quận 7',8,2),(20,'SM Culture & Contents','/images/imgFile/21.png','S.M. Culture & Contents  là một công ty con của S.M. Entertainment hoạt động trong lĩnh vực giải trí, du lịch và sản xuất phim và chương trình truyền hình. Được thành lập vào năm 1987 với tên gọi Intercontinental Travel Co., Ltd. Công ty sáp nhập với Volvik Inc  và trở thành BT&I Co., Ltd. vào năm 2006. Tháng 5 năm 2012, công ty được S.M. Entertainment Co., Ltd. mua lại và sau đó đổi tên thành S.M. Culture & Contents Co., Ltd.','1000+','0987123456','smc&c@sm.gmail.com','Tầng 4, Crescent Mall, 101 Tôn Dật Tiên, Quận 7',9,2),(22,'Công ty Phụ tùng Ô tô GAP','/images/imgFile/e22.gif','GAPINTER là Nhà cung cấp phụ tùng Nhật cho các khách hàng lớn trong lĩnh vực dịch vụ sửa chữa ô tô tại Việt Nam. Hiện GAPINTER đang phân phối các sản phẩm phụ tùng cao cấp của các hãng phụ tùng hàng đầu Nhật Bản như AKEBONO, PMC, AISAN và DENSO. Ngoài ra, GAPINTER còn cung cấp bộ dụng cụ sửa chữa cao cấp KTC Nhật Bản tại Việt Nam.','200-300','0567812345','gapinter@ap.gmail.com','TT5, N5, ô số 3, Bắc Linh Đàm,P.Hoàng Kim, Q. Hoàng Mai',10,1),(23,' EurolandAsia','/images/imgFile/e6.png','Mô tả ... :))))))','1000+','0987654321','EurolandAsia@gmail.com','371 Nguyễn Kiệm, p3, Quận Gò Vấp',24,2);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_types`
--

DROP TABLE IF EXISTS `job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_types`
--

LOCK TABLES `job_types` WRITE;
/*!40000 ALTER TABLE `job_types` DISABLE KEYS */;
INSERT INTO `job_types` VALUES (1,'Full time'),(2,'Part time'),(3,'Internship');
/*!40000 ALTER TABLE `job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Công nghệ thông tin'),(2,'Ngôn ngữ anh'),(3,'Quản trị kinh doanh'),(4,'Tài chính - Ngân hàng'),(5,'Văn học'),(6,'Công nghệ kỹ thuật ô tô'),(7,'Công nghệ sinh học'),(8,'Xây dựng'),(9,'Công nghệ Kỹ thuật cơ khí'),(10,'Công nghệ thực phẩm');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `major_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position_majorId_idx` (`major_id`),
  CONSTRAINT `position_majorId` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Senior Tester',1),(2,'FrontEnd Developer',1),(3,'Database Administrator',1),(4,'BackEnd Developer',1),(5,'Phiên dịch viên',2),(6,'Giáo viên tiếng Anh',2),(7,'Hướng dẫn viên du lịch',2),(8,'Nhân viên kinh doanh',3),(9,'Nhân viên marketing',3),(10,'Quản lý nhân sự',3),(11,'Nhân viên chăm sóc khách hàng',3),(12,'Chuyên viên phân tích tài chính doanh nghiệp',4),(13,'Chuyên viên tư vấn tín dụng ',4),(14,'Chuyên viên định giá sản phẩm',4),(15,'Nhà văn',5),(16,'Biên tập viên nội dung',5),(17,'Nhà báo',5),(18,'Kỹ thuật viên bảo dưỡng',6),(19,'Cố vấn viên dịch vụ ô tô',6),(20,'Nhân viên kỹ thuật ô tô',6),(21,'Nhân viên kinh doanh hóa chất',7),(22,'Chuyên viên quản lý Khoa học và công nghệ ',7),(23,'Giáo viên dạy môn sinh học',7),(24,'Chuyên viên thiết kế xây dựng',8),(25,'Chuyên viên quản lý dự án',8),(26,'Kỹ sư quản lý chất lượng',8),(27,'Kỹ sư vận hành, bảo trì',9),(28,'Chuyên viên thiết kế, lên bản vẽ',9),(29,'Nhân viên kiểm định chất lượng (QA)',10),(30,'Kỹ sư công nghệ thực phẩm ',10),(31,'Nhân viên kiểm soát chất lượng nguyên liệu (QC)',10),(32,'Senior Android Developer',1),(33,'Senior Java Developer',1),(34,'QA Engineer',1);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary` decimal(10,0) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `quantity` int NOT NULL,
  `create_post` datetime NOT NULL,
  `finish_post` datetime NOT NULL,
  `requirements` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `employer_id` int NOT NULL,
  `major_id` int NOT NULL,
  `position_id` int NOT NULL,
  `job_types_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_employerId_idx` (`employer_id`),
  KEY `post_majorId_idx` (`major_id`),
  KEY `post_positionId_idx` (`position_id`),
  KEY `post_jobtypesId_idx` (`job_types_id`),
  KEY `post_areaId_idx` (`area_id`),
  CONSTRAINT `post_areaId` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_employerId` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_jobtypesId` FOREIGN KEY (`job_types_id`) REFERENCES `job_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_majorId` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_positionId` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,20000000,'Design, code and test system or product\'s function after creating. Create plan, implement and monitor development progresses . Research new technology to apply into current projects',3,'2021-05-03 00:30:20','2021-05-20 00:00:00','Java (8 or more)：3 years or more. Experience in creating basic design. Experience in designing Database',1,1,1,1,2),(2,60000000,'FPT Software HCM is looking for Front End Developer engineering with at least 2 years’ experience. The customer is one of the big EU companies that focus on the holistic solution provider in the manufacturing environment.',10,'2021-05-03 00:00:00','2020-05-21 00:00:00','You work together with the entire team an innovative platform for digitizing production with the Target the entire value chain from incoming orders to Digitize delivery. As a member of one of our Scrum teams, you will develop products in the field of Industry 4.0 based on web technologies. You take responsibility for the specification and conception of backend solutions in a microservice-based System landscape. You live the values ​​of agile software development within the Company and drive it forwardUnderstand the user needs and focus on providing value for the user and for the client. Able to take initiative and contribute ideas.',2,1,2,2,1),(3,15000000,'The Senior Backend Engineer (SBE) designs complex backend technology solutions, develops code, and tests and maintains new and existing systems. As part of Floware’s Infrastructure & Security team, he partners closely with development teams to define scope and requirements for reusable services with integration services and APIs, and to use appropriate technology solutions for the business. The BE is a key member of the team responsible for delivering robust solutions while defining backend standards for all development teams at Floware VN. ',4,'2021-05-07 00:00:00','2021-05-31 00:00:00','3+ years of experience designing, developing, and managing RESTful APIs. 3+ years of experience developing in any of following core language: NodeJS/Ruby on Rails/JS or experience with relevant frameworks. Demonstrated design and programming skills using NodeJS, JSON, Web Services, XML, XSLT, etc. Excellent experience in designing and implementing database systems with integrity, scalability, performance, reliability, security in mind.',12,1,4,3,2),(4,10000000,'Support to develop and maintain MS SQL Databases and Data Warehouse within De Heus applications as well asSupport to manage and ensure that all databases are highly available, with proper backup & recovery strategy',2,'2021-05-07 00:00:00','2021-05-20 00:00:00','Bachelor degree or equivalent in related system database areas. Minimum 2 – 5 years experience in successfully supporting/managing database in a multinational organization. Strong understanding of database structures, theories, principles, and practices. Working technical experience with designing, building, installing, configuring, and supporting database servers, particularly Microsoft SQL Server. Familiarity with SQL query nomenclature and fundamentals. Experience with Visual Studio and/or SSIS is a plus. MCDBA certification is a plus. Self-motivated; Proven record for actively soliciting feedback, continuous learning and self-development.',13,1,3,3,2),(5,7000000,'Biên dịch các tài liệu từ tiếng Việt sang tiếng Anh và ngược lại. Có kinh nghiệm dịch các loại tài liệu như Kinh tế, Kỹ thuật, Tài chính, Môi trường, Giáo dục, Khoa học. Có thể lựa chọn làm việc tại các cơ sở của công ty ở Hà Nội, Đà Nẵng hoặc Hồ Chí Minh.',5,'2021-05-08 00:00:00','2021-05-25 00:00:00','Yêu thích và đam mê với công việc Biên dịch. Tốt nghiệp Đại học chuyên ngành tiếng Anh hoặc Du học sinh. Ưu tiên các ứng viên đã từng làm công việc biên dịch tài liệu. Sử dụng thành thạo Microsoft Office và Internet (Tìm kiếm thông tin, email). Khả năng diễn đạt văn phong tốt, trình bày văn bản đẹp. Kỹ năng quản lý thời gian hiệu quả. Nhiệt tình, trách nhiệm, chủ động trong công việc được giao.',14,2,5,2,1),(6,12000000,'Dạy các chương trình tiếng Anh. Tham gia giảng dạy các lớp theo ca dạy được phân công. 1 Nữ Giáo viên toàn thời gian 14h00 - 20h30 (T3- CN , thứ 2 nghỉ). Và 2 Nữ gv Giảng dạy các lớp tiếng Anh dành cho trẻ em, 3h/ ngày( 17h30-20h30).',5,'2021-05-05 00:00:00','2021-05-30 00:00:00','Tốt nghiệp Cao Đẳng trở lên. Phát âm chuẩn. Tâm huyết với nghề, yêu trẻ. Chuyên cần, chịu khó, có trách nhiệm với công việc.',15,2,6,2,1),(7,8000000,'Tìm kiếm và phát triển mạng lưới khách hàng. Giới thiệu, tư vấn khách hàng sử dụng sản phẩm và dịch vụ vay tiêu dùng. Hướng dẫn khách hàng hoàn tất thủ tục hồ sơ. Gặp trực tiếp khách hàng và làm thủ tục hồ sơ vay vốn. Chăm sóc khách hàng sau khi giải ngân.',5,'2021-05-07 00:00:00','2021-05-17 00:00:00','Nhanh nhẹn, chịu khó, biết marketing online là một lợi thế. Nam nữ tốt nghiệp THPT trở lên. Ưu tiên ứng viên có kinh nghiệm tài chính ngân hàng. Chưa có kinh nghiệm sẽ được đào tạo.',16,3,11,1,1),(8,20000000,'Setup environment for development. Study requirements, research technology related to project. Handle Application Features. Support & Maintenance (Testing & fixing Bugs). ',2,'2021-05-10 00:00:00','2021-05-19 00:00:00','Experience in Android native development via using Kotlin: 3 years or above. Experience in Reactive Programming（RxJava / RxAndroid). Experience with Firebase (FCM). Experience with MVP architecture. Experience using Realm. Experience with Dagger 2. Experience in Fabric/Crashlytics. Code review experience. Test code implementation and test execution experience. Experience with Cloud service environment (ex: GCP). ',4,1,32,1,1),(9,16000000,'Design, code and test system or product’s function after creating. Create plan, implement and monitor development progresses. Research new technology to apply into current projects.',1,'2021-05-10 00:00:00','2021-05-17 00:00:00','Java (8 or more)：3 years or more. Experience in creating basic design. Experience in designing Database. Ability to make highly maintainable code. Object-Oriented Programming. Spring boot / Spring framework. gRPC(Protocol Buffers). Docker. Kubernetes. MongoDB.',4,1,33,1,1),(11,9000000,'Tiến hành nghiên cứu thị trường , xây dựng ý tưởng, lập kế hoạch và triển khai các hoạt động marketing cho sản phẩm của công ty. Phối hợp với bộ phận kinh doanh xây dựng chính sách đặc thù của khách hàng để đáp ứng yêu cầu khách hàng. Lên ý tưởng, tổ chức, triển khai thực hiện các chương trình khuyến mãi, quảng cáo, PR, event, chăm sóc khách hàng nhằm nâng cao hình ảnh và phát triển thương hiệu. Quản lý và vận hành, tối ưu hóa các chiến dịch quảng cáo. Lập kế hoạch và triển khai các sáng kiến để tiếp cận khách hàng mục tiêu thông qua kênh truyền thông thích hợp như Youtube, website, Facebook, email. Phối hợp xây dựng các tài liệu marketing: catalogue, video, POSM, vật phẩm quảng cáo. Trao đổi cụ thể khi phỏng vấn.  ',6,'2021-05-13 00:00:00','2021-05-22 00:00:00','Có kỹ năng giao tiếp, làm việc nhóm. Có tinh thần trách nhiệm, cẩn thận và tỉ mỉ. Đam mê trong công việc, chịu khó học hỏi. Khả năng xử lý tình huống, tổ chức công việc cá nhân. Có thể sáng tạo nội dung & hình ảnh, dùng ngôn ngữ để thu hút người đọc. Có kiến thức về Content Marketing, Designer, Digital Marketing. Đã có kinh nghiệm trong lĩnh vực quảng cáo, truyền thông, marketing.',17,3,9,1,2),(12,8000000,'Quản lý nhân sự. Làm việc trực tiếp với đối tác của Công ty. Tìm kiếm, chọn lọc, phỏng vấn ứng viên. Thực hiện các công việc liên quan đến tuyển dụng. Quản lí trực tiếp đi thị trường kiểm tra nhân viên. ',1,'2021-05-14 00:00:00','2021-05-20 00:00:00','Kiến thức về hành chánh nhân sự, luật BHXH-BHYT,TNCN, các chính sách về phúc lợi người lao động. Tin học văn phòng (Word, Excel, Powerpoint). Anh văn giao tiếp. Ứng viên có ít nhất 2 năm kinh nghiệm. Độ tuổi : từ 25-30.',18,3,10,1,2),(13,7000000,'Tìm kiếm, tư vấn và chăm sóc khách hàng qua facebook, zalo, Gmail. Đàm phán, ký hợp đồng với khách hàng mới. Thử việc 15 ngày. Gia hạn hợp đồng cho khách hàng cũ. Truyền tải yêu cầu của khách hàng đến phòng kỹ thuật.',6,'2021-05-13 00:00:00','2021-05-24 00:00:00','Trình độ Cao đẳng trở lên( chấp nhận sinh viên đang đợi bằng). Có laptop. Giọng nói to, rõ ràng, dễ nghe. Làm việc đúng giờ, luôn cầu tiến. Năng động, nhiệt tình. Đi làm ngay sau khi có kết quả phỏng vấn. Trang phục gọn gàng, kín đáo.',8,3,8,1,2),(14,8000000,'Gặp gỡ khách hàng trực tiếp, trao đổi, tư vấn và giới thiệu cho Khách hàng sản phẩm cho vay Tín chấp và Thẻ tín dụng của Shinhan Bank. Chăm sóc khách hàng tiềm năng và mở rộng mạng lưới khách hàng từ danh sách khách hàng hiện hữu thông qua các hoạt động phát triển thị trường như Cold-Call, Roadshows…. Trực tiếp thiết lập cuộc hẹn với khách hàng nhằm tư vấn sản phẩm, dịch vụ và chăm sóc khách hàng theo đúng quy trình và quy định của Ngân hàng. Tham gia hoạt động phát triển kinh doanh với Trưởng nhóm nhằm tiếp cận khách hàng và giới thiệu sản phẩm, dịch vụ. Đảm bảo sự chuyên nghiệp và lịch thiệp từ quá trình tiếp cận đến dịch vụ hậu mãi nhằm nâng cao hình ảnh Shinhan Bank. Thực hiện các công việc khác theo sự phân công của Trưởng nhóm.',9,'2021-05-14 00:00:00','2021-05-24 00:00:00','Tốt nghiệp (hoặc đang chờ nhận bằng Tốt nghiệp) Đại học, Cao đẳng hoặc Trung cấp khối ngành Kinh tế, Tài chính Ngân hàng, Quản trị Kinh Doanh, Ngoại thương, Du lịch, Xuất nhập khẩu, Bất động sản, kinh doanh.  Có đam mê trong lĩnh vực Kinh doanh, Tài chính - Ngân hàng, Tư vấn Tài chính. Có kinh nghiệm trong cùng lĩnh vực là một lợi thế lớn, ưu tiên có kinh nghiệm bán sản phẩm Tín dụng và Thẻ Tín dụng ở Ngân hàng, Công ty Tài chính tương đương. Tốt nghiệp khác ngành hoặc chưa có kinh nghiệm tài chính - ngân hàng sẽ được Shinhan Bank đào tạo nghiệp vụ Ngân hàng trước khi nhận việc (Đào tạo có lương). ',10,4,13,3,2),(19,12000000,'abc',3,'2021-05-14 00:00:00','2021-05-27 00:00:00','abc',18,3,9,2,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `active` bit(1) NOT NULL,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'itviec','$2a$10$TDS3V2Btonym/55pXdTiXO7AMtZzbFWb1E.aRNgoJDQFnhBKhfMtq',_binary '','ROLE_EMPLOYER'),(2,'fpt','$2a$10$J9JunSqfJ284PBnPWiSAB.KHvmyYOodTcqIL7dxNGOzKZzsgkMXTa',_binary '','ROLE_EMPLOYER'),(3,'nettrueco','$2a$10$HpTugVWh7i6YA33kHSY5n.HZ.5ZzvfHGBK2yem26cT.JQ7uLYYOZq',_binary '','ROLE_EMPLOYER'),(4,'drjoy','$2a$10$mbRHAY3J7rQHJ8RU/GkugOV5bdN7oBUBS3fxolmODyu/zqLS40O3C',_binary '','ROLE_EMPLOYER'),(5,'lg','$2a$10$ujU9LXEzls8VyZz3gNlGWOWL3DyTI3jm57PgKSkXDrQ.BZiUYPmaa',_binary '','ROLE_EMPLOYER'),(6,'toshiba','$2a$10$s1yNUt5T2eCzjxIQdobiq.gKIbRD4jXtIUpFJCzxDWFWJoXHnQ1bG',_binary '','ROLE_EMPLOYER'),(7,'hansencx','$2a$10$.n1Tvj0YRiPPldnRhPPhYOVSDfaYzEY85TdeC2eawzZUre3gXbZae',_binary '','ROLE_EMPLOYER'),(8,'windeveloper','$2a$10$spc2GyryGE4V2zS52Bq5cuMDFnFMd55gZ1mlvbdQw/C0yte.VYSJi',_binary '','ROLE_EMPLOYER'),(9,'gotechnologies','$2a$10$fKWF9Bs7y8LQPl0g8I91W.wUN67kWvHnn69/jT5cIFhqUnBhbdoVu',_binary '','ROLE_EMPLOYER'),(10,'apinter','$2a$10$XPFgWTjMCiUQv77IOR2bKuQDi1Bw0hmhjmsqBXvDxkZbN6icBqd9i',_binary '','ROLE_EMPLOYER'),(11,'hoangyen','$2a$10$p5f34id0ZiAz2s5NsSJ92.USoxTCKElFsiVKn0ipSysQsFB7gj30y',_binary '','ROLE_EMPLOYEE'),(12,'ldgroup','$2a$10$w6CUviGJV0IWFnP9wUdKwekjHM09QbnRbRTUhpzDdZwvmBxSVQ0cS',_binary '','ROLE_EMPLOYER'),(13,'vinabusinesscenter','$2a$10$MSHSULPqrkoauPr0FLteSewrTbEOqCoWF7qX8I5qHolKmT6YVjwci',_binary '','ROLE_EMPLOYER'),(14,'shinhan','$2a$10$NzMj66FIqiLfRtewiyW8a.xTvkW7Y/6ZBSqEwkEbkJTfKpiQrLb8G',_binary '','ROLE_EMPLOYER'),(15,'hoanggialam','$2a$10$g2Dqff7LolKLT41e/gty3uWcNl8BE4bcZZtfRblkdP4MmTFvK0cha',_binary '','ROLE_EMPLOYER'),(18,'FlowareVN','$2a$10$xABlSjC2..8ygLnJH6L7xu7HUfzY2elpaMVVr5kolyfGHZG6daIRe',_binary '','ROLE_EMPLOYER'),(19,'DeHeusAsia','$2a$10$2AlBgziHNt6/SIC54//QVOn2BqQll19Zj/vnkfwnNHF6w7r64MhLS',_binary '','ROLE_EMPLOYER'),(20,'vohoangyen','$2a$10$YyaYP3sMWnC3nK8xgur.de/M7Aua3DziMNu49txTL7wCPjabnpQ9C',_binary '','ROLE_EMPLOYEE'),(21,'thuthao','$2a$10$N5eB4jNUhOnTVd5AwQ6I2eMFP9NzgVT7GwLB1MM/zXs2dfbCzGEZG',_binary '','ROLE_EMPLOYEE'),(22,'thanh','$2a$10$e/bLze3X9lffPaZjvQu1NuXbPiYCTWdXUL9JD4r4mDr7cN5K0AXue',_binary '','ROLE_EMPLOYEE'),(23,'nguyenhuy','$2a$10$pqI5IwWjs1A8HQWFt.CiVOQ6rrJtVshhNHNg3.T5MAMHI2ItQtHB6',_binary '','ROLE_EMPLOYEE'),(24,'EurolandAsia','$2a$10$9hwwPD/SajpAc5RDqGPy.uk/7oBFVP4MzJbi0.JaOqwm1Kc77VLXy',_binary '','ROLE_EMPLOYER'),(26,'cpdichthuat','$2a$10$aN3Q7H6.ZL6do7kdXz66.OhsdV2QpsFKfSB09f7C2iMQ9HKH4aryG',_binary '','ROLE_EMPLOYER'),(27,'vhs','$2a$10$qh7GyU.KTVxISLfyI87qj.SSo6bqQlDxrwzMz9AZk9smJi9PdjaAu',_binary '','ROLE_EMPLOYER'),(28,'tpbank','$2a$10$/6HRwavlVLEI3pvUOppwD.cDzcCDouE7X7dMnTB5MMvDDteDN2Aoq',_binary '','ROLE_EMPLOYER'),(29,'katsun','$2a$10$2t5HreqOTD1wBVx00ZdS2e1bP/D1UqrWDjPx7bM3ikBODbIKnMRty',_binary '','ROLE_EMPLOYER'),(30,'doangia','$2a$10$uVOyMh.cmyXRJnQ.g9jAJ.fvimdEa3rgGgMPnegEXdNzTLxrl6tQW',_binary '','ROLE_EMPLOYER'),(31,'thanhlam','$2a$10$BvXp4j4oDMwBhgLdVobabOlszNMTNAkAfrZWVF8tNSpBxDB.XId.2',_binary '','ROLE_EMPLOYEE'),(32,'admin','$2a$10$83XxyBrbGX0HJkqkCrD2y..AISoj/nrORqIEit2F4u1/5HhCSHDAO',_binary '','ROLE_ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jobdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 17:30:28
