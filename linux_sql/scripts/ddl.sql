

CREATE TABLE PUBLIC.host_info
  (
     id               SERIAL NOT NULL,
     hostname         VARCHAR NOT NULL,
     cpu_number       int NOT NULL,
     cpu_architecture VARCHAR NOT NULL,
     cpu_model        VARCHAR NOT NULL,
     cpu_mhz          VARCHAR NOT NULL,
     L2_cache         VARCHAR NOT NULL,
     total_mem        int NOT NULL,
     timestamp        VARCHAR NOT NULL
     -- add more columns
     -- primary key constraint
     -- unique hostname constraint
  );
-- DML
-- INSERT statement
INSERT INTO host_info (hostname, cpu_number,cpu_architecture,cpu_model,cpu_mhz,L2_cache,total_mem,timestamp)
VALUES('localhost',2,'x86_64','63','2299.98','256',7489612,'2022-05-17 04:11:03');

