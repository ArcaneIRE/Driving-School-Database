-- Create Procedure
create or replace procedure add_timeslot(
p_id bookingtimeslot.id%type,
p_starttime bookingtimeslot.starttime%type,
p_endtime bookingtimeslot.endtime%type,
p_booking_id booking.id%type,
p_staff_id staff.id%type
)
language plpgsql
as $$
begin
-- Check prerequisites
if p_starttime > p_endtime then
raise exception 'Start time before end time';
end if;
if (select count(id) from staff where id = p_staff_id) != 1 then
raise exception 'Staff ID does not exist';
end if;
-- Insert slot
insert into "D22126022".bookingtimeslot
values(DEFAULT,
p_starttime,
p_endtime,
p_booking_id,
p_staff_id
);
exception when others then
raise INFO 'Error Name: %', SQLERRM;
raise INFO 'Error Code: %', SQLSTATE;
end;
$$;

-- Usage
select * from bookingtimeslot b;
-- Tests
-- Test 1: Working
call add_timeslot(7, '13:30', '14:30', NULL, 4);
-- Test 2:  End time before start time
call add_timeslot(7, '14:30', '13:30', NULL, 4);
-- Test 3: Staff does not exist
call add_timeslot(7, '13:30', '14:30', NULL, 999);
