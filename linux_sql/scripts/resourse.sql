CREATE TABLE PUBLIC.host_usage 
  ( 

     host_id        SERIAL NOT NULL, 
     memory_free    int NOT NULL,
     cpu_idle       VARCHAR NOT NULL,
     cpu_kernel     VARCHAR NOT NULL,
     disk_io        VARCHAR NOT NULL,
     disk_available VARCHAR NOT NULL,
     timestamp    VARCHAR NOT NULL
     -- add more columns
     -- add foreign key constraint
  ); 

-- DML
-- INSERT statementpsql -h localhost -U postgres -d host_agent -f sql/ddl.sql
INSERT INTO host_usage (timestamp,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available)
Values('2022-05-17 04:11:03','256','95','0','0','31220 ');


