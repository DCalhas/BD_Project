delimiter //
CREATE PROCEDURE load_date_dim()
BEGIN
   DECLARE v_full_date DATETIME;
   DECLARE semester int(1);
   SET v_full_date = '2016-01-01 00:00:00';
   WHILE v_full_date < '2017-01-01 00:00:00' DO
       IF month(v_full_date) > 6 
        THEN SET semester = 2; 
        ELSE SET semester = 1;
       INSERT INTO data_dimensao
       VALUES (
           year(v_full_date) * 10000 + month(v_full_date)*100 + day(v_full_date),
           day(v_full_date),
           week(v_full_date),
           month(v_full_date),
           semester,
           year(v_full_date)
       );
       SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
   END WHILE;
END;
//
call load_date_dim();