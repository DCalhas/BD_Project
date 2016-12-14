delimiter //
CREATE PROCEDURE load_date_dim()
BEGIN
   DECLARE v_full_date DATETIME;
   SET v_full_date = '2016-01-01 00:00:00';
   WHILE v_full_date < '2017-01-01 00:00:00' DO
       INSERT INTO data_dimensao(
          data_id,
          dia_do_ano,
   	      semana_do_ano,
          mes_do_ano,
          semestre_do_ano,
          ano
       ) VALUES (
           YEAR(v_full_date) * 10000 + MONTH(v_full_date)*100 + DAY(v_full_date) as data_id,
           DAY(v_full_date) as dia_do_ano,
           MONTH(v_full_date) as mes_do_ano,
           YEAR(v_full_date) as ano,
       );
       SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
   END WHILE;
END;
//