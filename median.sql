/* LAT_N : param to get median of, STATION : table name*/
SET @n := 0;
SELECT COUNT(*) FROM STATION INTO @total;
SELECT 
    ROUND(AVG(S.LAT_N),4)
FROM (SELECT @n := @n+1 AS row_index, LAT_N FROM STATION ORDER BY LAT_N) S
WHERE
    CASE 
        WHEN MOD(@total, 2) = 0 
            THEN S.row_index IN (@total/2, @total/2+1)
            ELSE S.row_index = (@total+1)/2
    END
;
