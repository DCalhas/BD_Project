delimiter //
CREATE PROCEDURE load_date_dim()
BEGIN
   DECLARE v_full_date DATETIME;
   DECLARE semester int(1);
   SET v_full_date = '2016-01-01 00:00:00';
   WHILE v_full_date < '2017-01-01 00:00:00' DO
       IF month(v_full_date) > 6 SET semester = 2 ELSE SET semester = 1;
       INSERT INTO data_dimensao(
          data_id,
          dia_do_ano,
   	      semana_do_ano,
          mes_do_ano,
          semestre_do_ano,
          ano
       ) VALUES (
           year(v_full_date) * 10000 + month(v_full_date)*100 + day(v_full_date) as data_id,
           day(v_full_date) as dia_do_ano,
           week(v_full_date) as semana_do_ano,
           month(v_full_date) as mes_do_ano,
           semester as semestre_do_ano,
           year(v_full_date) as ano
       );
       SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
   END WHILE;
END;
//