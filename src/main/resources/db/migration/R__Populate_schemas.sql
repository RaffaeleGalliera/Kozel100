SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;
SET time_zone = "+00:00";

INSERT INTO `user` (`user_id`, `email`, `password`, `first_name`, `last_name`, `recruitment_date`, `end_working`, `phone_number`, `position_id`, `work_field_id`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'cewug@mailinator.net', 'Pa$$w0rd!', 'Ahmed', 'Guzman', NULL, NULL, NULL, 1, 1, 0, '2018-10-03 13:47:32', '2018-10-03 13:47:32'),
(2, 'silepifoqe@mailinator.com', 'Pa$$w0rd!', 'Abra', 'Rodriguez', NULL, NULL, NULL, 1, 1, 0, '2018-10-03 13:47:42', '2018-10-03 13:47:42'),
(3, 'tija@mailinator.com', 'Pa$$w0rd!', 'Jayme', 'Ryan', NULL, NULL, NULL, 5, 5, 0, '2018-10-03 13:48:15', '2018-10-03 13:48:15'),
(4, 'tija@mailinator.com', 'Pa$$w0rd!', 'Jayme', 'Ryan', NULL, NULL, NULL, 5, 5, 0, '2018-10-03 13:50:39', '2018-10-03 13:50:39'),
(5, 'micobaga@mailinator.com', 'Pa$$w0rd!', 'Lev', 'Ayala', NULL, NULL, NULL, 1, 1, 0, '2018-10-03 13:55:44', '2018-10-03 13:55:44'),
(6, 'rafforx@gmail.com', 'mW/OE3Yu+KcHvJoVCh0Gpw==', 'Raffae;e', 'Galliera', NULL, NULL, NULL, 1, 1, 0, '2018-10-07 20:17:49', '2018-10-07 20:17:49'),
(10, 'wumazajy@mailinator.net', '6RjA0YeAQRaiZANru36n0Q==', 'Veda', 'Waters', NULL, NULL, NULL, 17, 5, 0, '2018-10-10 11:56:00', '2018-10-10 11:56:00'),
(11, 'cappun@me.com', 'egXzw2hDiTqHGeIXHQkcpQ==', 'Matteo', 'Cappon', NULL, NULL, NULL, 1, 1, 0, '2018-10-11 15:58:47', '2018-10-11 15:58:47'),
(12, 'muigi@gov.5s', 'IyDBZt1kNEmzKp51YWKYSQ==', 'Luigi', 'Di Maio', NULL, NULL, NULL, 22, 6, 0, '2018-10-12 07:13:04', '2018-10-12 07:13:04'),
(13, 'cappun@me.com', '2IUr3i1lOo8KDJZ+ytmUlA==', 'awef', 'awef', NULL, NULL, NULL, 1, 1, 0, '2018-10-15 10:29:48', '2018-10-15 10:29:48');

INSERT INTO `client_type` (`client_type_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Lunga Data', '2018-09-27 16:06:14', '0000-00-00 00:00:00'),
(2, 'Pirlone', '2018-10-07 10:09:27', '0000-00-00 00:00:00'),
(3, 'Nuovo', '2018-10-07 13:53:37', '0000-00-00 00:00:00'),
(4, 'Buffone', '2018-10-15 13:42:48', '0000-00-00 00:00:00');

INSERT INTO `company` (`company_id`, `name`, `client_type_id`, `vat`, `address`, `city`, `email`, `created_at`, `updated_at`, `active_fl`, `user_id`) VALUES
(1, 'Allegra Garcia', 4, '3323231', 'agagaa', 'sassa', 'ruzyvidufab@mailinator.com', '2018-10-04 07:05:19', '2018-10-19 08:14:03', 1, 11),
(2, 'Martena Savage', 1, '343434', 'sdfsdf', 'fsdfsdf', 'rityluvo@mailinator.com', '2018-10-04 07:05:48', '2018-10-19 08:15:14', 0, NULL),
(3, 'Hamilton Goodman', 1, '343434', 'sadaddd', 'asdsada', 'rixujymir@mailinator.net', '2018-10-04 07:06:07', '2018-10-07 10:42:53', 1, NULL),
(4, 'Sydnee Cannon', 1, '32424', 'ddd', 'ddddd', 'zyzyxukem@mailinator.net', '2018-10-07 10:26:13', '2018-10-07 10:43:06', 1, NULL),
(5, 'Abra Petersa', 3, '1111', 'ddd', 'dddd', 'binelofumo@mailinator.com', '2018-10-07 10:29:00', '2018-10-18 14:18:04', 1, NULL),
(6, 'Adele Hancock', 1, '2222222', 'dfsddsd', 'sdfsdfsd', 'pelipyryze@mailinator.net', '2018-10-07 10:35:01', '2018-10-18 14:17:49', 0, NULL),
(7, 'ZXsxszczd', 1, 'cxczcxxc', 'aaaaa', 'aaaaaa', 'pelipyryze@mailinator.net', '2018-10-07 10:41:19', '2018-10-17 09:41:18', 0, NULL),
(8, 'Prova', 3, '2222', 'Nuoivo', 'fdlk', 'raf@gkjg.com', '2018-10-07 13:54:23', '2018-10-17 09:39:23', 0, NULL),
(9, 'DeMaio', 4, '3333', '33333', 'dfdsfds', 'mykif@mailinator.com', '2018-10-09 10:19:54', '2018-10-17 09:21:49', 0, 11),
(10, 'Leah Marks', 4, '2132132', 'fddsd', 'sfsdfsd', 'sywas@mailinator.com', '2018-10-19 09:49:26', '2018-10-19 09:49:26', 1, NULL),
(11, 'Giorgionapo', 1, '3333', 'lkjjlkj', 'lkjklj', 'rrr@ddd.com', '2018-10-19 09:55:42', '2018-10-19 09:55:42', 1, NULL),
(12, 'Garrison Baird', 3, '3333', 'sdsasda', 'sddsdsd', 'qafesibony@mailinator.net', '2018-10-19 09:57:45', '2018-10-19 09:57:45', 1, NULL);

INSERT INTO `consulting_service` (`consulting_service_id`, `name`, `active_fl`, `created_at`, `updated_at`) VALUES
(1, 'Ciao', 1, '2018-10-19 13:53:28', '2018-10-19 13:53:28'),
(2, 'Pippo', 1, '2018-10-19 13:57:33', '2018-10-19 13:57:33');

INSERT INTO `contact_person` (`contact_person_id`, `first_name`, `last_name`, `email`, `phone_number`, `company_id`, `created_at`, `updated_at`, `active_fl`) VALUES
(15, 'Iona', 'Daugherty', 'hudyte@mailinator.net', '8168486', 1, '2018-10-04 07:05:19', '2018-10-04 07:05:19', 1),
(16, 'Hayes', 'Ray', 'fovagiduh@mailinator.net', '1939057', 2, '2018-10-04 07:05:48', '2018-10-19 08:15:14', 0),
(17, 'Jack', 'Sweet', 'hepe@mailinator.com', '8953734', 3, '2018-10-04 07:06:07', '2018-10-04 07:06:07', 1),
(18, 'Lilah', 'Oconnor', 'xugamynek@mailinator.com', '7932496', 4, '2018-10-07 10:26:13', '2018-10-07 10:26:13', 1),
(19, 'Dara', 'Jimenez', 'hohizylu@mailinator.com', '555555', 5, '2018-10-07 10:29:00', '2018-10-07 10:29:00', 1),
(20, 'Samuel', 'Norton', 'mysas@mailinator.com', '222222', 6, '2018-10-07 10:35:01', '2018-10-18 14:17:49', 0),
(21, 'cccc', 'fdfd', 'fuck@gmail.com', '3333', 7, '2018-10-07 10:41:19', '2018-10-17 09:41:18', 0),
(22, 'ddfsfs', 'sdffsdf', 'rafffff@raff.it', '3333333', 8, '2018-10-07 13:54:23', '2018-10-17 09:39:23', 0),
(23, 'Dominic', 'Fowler', 'tose@mailinator.net', '4444444', 9, '2018-10-09 10:19:54', '2018-10-17 09:21:49', 0),
(24, 'Lisandra', 'Padilla', 'nizaky@mailinator.com', '1476444', 1, '2018-10-19 08:23:37', '2018-10-19 08:23:37', 1),
(25, 'Gwendolyn', 'Christian', 'rekefukan@mailinator.net', '5699243', 10, '2018-10-19 09:49:26', '2018-10-19 09:49:26', 1),
(26, 'asdsad', 'sddd', 'eddd@re.er', '33333', 11, '2018-10-19 09:55:42', '2018-10-19 09:55:42', 1),
(27, 'Nicole', 'Simpson', 'zuhi@mailinator.com', '197375', 12, '2018-10-19 09:57:45', '2018-10-19 09:57:45', 1),
(28, 'Balto', 'Cappon', 'matssd@gmail.cazzo', '3345678', 13, '2018-10-19 12:50:46', '2018-10-19 12:50:46', 1);

INSERT INTO `product_category` (`product_category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'GGGGGG', '2018-10-04 09:52:36', '2018-10-04 09:52:36'),
(2, 'Cazzi di Gomma', '2018-10-15 10:59:42', '2018-10-15 10:59:42');

INSERT INTO `work_field` (`work_field_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'dddd', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(2, 'gggg', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(3, 'ggggg', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(4, 'vcvxcvxc', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(5, 'vcvxcvxchhhhccccccccc', '2018-10-05 10:55:33', '2018-10-05 10:55:33'),
(6, 'Satana', '2018-10-12 07:12:18', '2018-10-12 07:12:18');

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;