-- Trigger File
-- Create log table
DROP TABLE timeslot_log;
CREATE TABLE timeslot_log (
  id SERIAL,
  username char(50) not NULL,
  staff_id VARCHAR(40) not NULL,
  date_added DATE,
  primary key(id)
);

-- Create function
CREATE OR REPLACE FUNCTION log_timeslot()
RETURNS trigger AS $log_timeslot$
declare
username varchar(80);
cdate date;
begin
select user into strict username;
select now() into strict cdate;
insert into "Drive856A".timeslot_log
values (default, username, new.staff_id, cdate);
RETURN new;
exception
when others then
RAISE INFO 'Error Name:%',SQLERRM;
RAISE INFO 'Error State:%', SQLSTATE;
return null;
END;
$log_timeslot$ LANGUAGE plpgsql;


-- Create trigger
create or replace trigger log_timeslot
before insert or update on bookingtimeslot 
for each row execute function log_timeslot();