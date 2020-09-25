set @Country_name="India";
set @zone_name="India Zone";
set @zone_description="India Tax Zone";

set @country_id=(SELECT country_id FROM `country` WHERE name=@Country_name LIMIT 1);

INSERT INTO `geo_zone` (`geo_zone_id`,`name`,`description`,`date_added`,`date_modified`) VALUES(NULL,@zone_name,@zone_description,now(),now());
set @country_zone_id=(SELECT LAST_INSERT_ID());
INSERT INTO `zone_to_geo_zone` (`country_id`, `zone_id`, `geo_zone_id`,`date_added`,`date_modified`) VALUES (@country_id, 0,@country_zone_id, now(),now());


set @current_date=now();

INSERT INTO `geo_zone` (`geo_zone_id`,`name`,`description`,`date_added`,`date_modified`) VALUES(NULL,'Other Countries','Other Zones',now(),now());
set @other_geozone_id=(SELECT LAST_INSERT_ID());
INSERT INTO `zone_to_geo_zone` (`country_id`, `zone_id`, `geo_zone_id`,`date_added`,`date_modified`) SELECT country_id, 0, @other_geozone_id,now(),now() FROM country WHERE country_id!=@country_id;
