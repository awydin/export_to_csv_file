create or replace PROCEDURE TEST AS 



OUTPUT_FILE   UTL_FILE.file_type;
TEMP_STRING NVARCHAR2(4000);

CURSOR FUEL_REPORT IS

  
SELECT X , Y , Z FROM SOME_TABLES T ;


BEGIN

OUTPUT_FILE := UTL_FILE.fopen('FOLDERNAME','FILE_NAME.CSV',  'w', 32767);
  


FOR i IN FUEL_REPORT LOOP
  
    TEMP_STRING :=  i.X || ',' || i.Y || ',' || i.Z  ;
    UTL_FILE.put_line(OUTPUT_FILE, TEMP_STRING);
END LOOP;
  
 

  UTL_FILE.fclose(OUTPUT_FILE);


EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(OUTPUT_FILE) THEN
      UTL_FILE.fclose(OUTPUT_FILE);
    END IF;
dbms_output.put_line('error is : ' || sqlerrm);


END TEST;
