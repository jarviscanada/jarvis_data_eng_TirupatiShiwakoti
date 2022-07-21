

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
     UNIQUE(hostname),
	   PRIMARY KEY(id)
  );

-- INSERT statement
INSERT INTO host_info (hostname, cpu_number,cpu_architecture,cpu_model,cpu_mhz,L2_cache,total_mem,timestamp)
VALUES('localhost',2,'x86_64','63','2299.98','256',7489612,'2022-05-17 04:11:03');



CREATE TABLE PUBLIC.host_usage 
  ( 

     host_id        SERIAL NOT NULL, 
     memory_free    int NOT NULL,
     cpu_idle       VARCHAR NOT NULL,
     cpu_kernel     VARCHAR NOT NULL,
     disk_io        VARCHAR NOT NULL,
     disk_available VARCHAR NOT NULL,
     timestamp    VARCHAR NOT NULL
     FOREIGN KEY(host_id)
     REFERENCES host_info(id)
  ); 

-- INSERT statementpsql -h localhost -U postgres -d host_agent -f sql/ddl.sql
INSERT INTO host_usage (timestamp,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available)
Values('2022-05-17 04:11:03','256','95','0','0','31220 ');


