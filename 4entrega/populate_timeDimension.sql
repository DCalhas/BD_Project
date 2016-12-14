delimiter //
CREATE PROCEDURE load_time_dim()
BEGIN
   DECLARE v_full_time TIME;
   SET v_full_time = '00:00';
   WHILE v_full_time <= '23:59' DO
       INSERT INTO tempo_dimensao(
          tempo_id, 
          hora,
          minuto
       ) VALUES (
           hour(v_full_time) * 100 + minute(v_full_time) as tempo_id,
           hour(v_full_time) as hora,
           minute(v_full_time) as minuto
       );
       SET v_full_time = DATE_ADD(v_full_time, INTERVAL 1 MINUTE);
   END WHILE;
END;
//