use bke;

-- truy vấn 1: lấy ra danh sách người dùng theo thứ tự tên theo alphabet (a->z)
select * from users order by user_name asc;

-- truy vấn 2: lấy ra 07 người dùng theo thứ tự tên theo alphabet (a->z)
select * from users order by user_name asc offset 0 rows fetch next 7 rows only;

-- truy vấn 3: lấy ra danh sách người dùng theo thứ tự tên theo alphabet (a->z), trong đó tên người dùng có chữ 'a'
select * from users where user_name like '%a%' order by user_name asc;

-- truy vấn 4: lấy ra danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ 'm'
select * from users where user_name like 'm%';

-- truy vấn 5: lấy ra danh sách người dùng trong đó tên người dùng kết thúc bằng chữ 'i'
select * from users where user_name like '%i';

-- truy vấn 6: lấy ra danh sách người dùng trong đó email người dùng là gmail (ví dụ: example@gmail.com)
select u.* from users u
join user_emails ue on u.user_id = ue.user_id
where ue.is_primary = 1 and ue.email_address like '%@gmail.com';

-- truy vấn 7: lấy ra danh sách người dùng trong đó email người dùng là gmail, tên người dùng bắt đầu bằng chữ 'm'
select u.* from users u
join user_emails ue on u.user_id = ue.user_id
where ue.is_primary = 1 and ue.email_address like '%@gmail.com' and u.user_name like 'm%';

-- truy vấn 8: lấy ra danh sách người dùng có ít nhất một địa chỉ email là gmail
select distinct u.* from users u
join user_emails ue on u.user_id = ue.user_id
where ue.email_address like '%@gmail.com';

-- truy vấn 9: lấy ra danh sách người dùng có từ 1 đến 5 địa chỉ email, và tất cả đều là gmail
select u.* from users u
join user_emails ue on u.user_id = ue.user_id
group by u.user_id, u.user_name, u.user_pass, u.updated_at, u.created_at
having count(ue.email_id) between 1 and 5
and sum(case when ue.email_address like '%@gmail.com' then 0 else 1 end) = 0;

-- truy vấn 10: lấy ra danh sách người dùng có từ 1 đến 5 địa chỉ email, và tất cả đều là yahoo
select u.* from users u
join user_emails ue on u.user_id = ue.user_id
group by u.user_id, u.user_name, u.user_pass, u.updated_at, u.created_at
having count(ue.email_id) between 1 and 5
and sum(case when ue.email_address like '%@yahoo.com' then 0 else 1 end) = 0;
