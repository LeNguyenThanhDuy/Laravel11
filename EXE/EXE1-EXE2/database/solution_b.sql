use bke;


-- Truy vấn 1: Liệt kê tất cả thông tin khách hàng đã đặt hàng
select u.user_id, u.user_name, ue.email_address, p.product_id
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id;

-- Truy vấn 2: Liệt kê tất cả sản phẩm được mua bởi một khách hàng cụ thể
declare @user_id int = 1;  -- Thay 1 bằng ID thực tế
select u.user_id, u.user_name, ue.email_address, p.product_id, od.quantity
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where u.user_id = @user_id;

-- Truy vấn 3: Liệt kê tổng số sản phẩm được mua bởi mỗi khách hàng
select u.user_id, u.user_name, ue.email_address, p.product_id, sum(od.quantity) as total_quantity
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
group by u.user_id, u.user_name, ue.email_address, p.product_id;

-- Truy vấn 4: Liệt kê 7 danh mục sản phẩm có tổng doanh thu cao nhất
select top 7 p.category, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_revenue
from products p
join order_details od on p.product_id = od.product_id
group by p.category
order by total_revenue desc;

-- Truy vấn 5: Liệt kê 7 người dùng mua nhiều sản phẩm nhất theo số lượng và doanh thu
select top 7 u.user_id, u.user_name, ue.email_address, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_revenue
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
group by u.user_id, u.user_name, ue.email_address
order by total_revenue desc;

-- Truy vấn 6: Liệt kê 7 người dùng mua sản phẩm từ thương hiệu Samsung hoặc Apple
select top 7 u.user_id, u.user_name, ue.email_address, p.product_id, p.brand, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_revenue
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where p.brand in ('Samsung', 'Apple')
group by u.user_id, u.user_name, ue.email_address, p.product_id, p.brand
order by total_revenue desc;

-- Truy vấn 7: Liệt kê sản phẩm được mua bởi một người dùng cụ thể
declare @user_id2 int = 1;  -- Thay 1 bằng ID thực tế
select u.user_id, u.user_name, ue.email_address, p.product_id, p.product_name, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_revenue
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where u.user_id = @user_id2
group by p.product_id, p.product_name, u.user_id, u.user_name, ue.email_address;

-- Truy vấn 8: Liệt kê sản phẩm được mua bởi một người dùng cụ thể, bao gồm giá và tổng chi phí
declare @user_id3 int = 1;  -- Thay 1 bằng ID thực tế
select u.user_id, u.user_name, ue.email_address, p.product_id, p.product_name, p.product_price, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_cost
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where u.user_id = @user_id3
group by p.product_id, p.product_name, p.product_price, u.user_id, u.user_name, ue.email_address;

-- Truy vấn 9: Liệt kê sản phẩm được mua bởi một người dùng cụ thể, bao gồm tổng số sản phẩm
declare @user_id4 int = 1;  -- Thay 1 bằng ID thực tế
select u.user_id, u.user_name, ue.email_address, p.product_id, p.product_name, p.product_price, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_cost,
       (select count(distinct product_id) from order_details od2 join orders o2 on od2.order_id = o2.order_id where o2.user_id = u.user_id) as total_products
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where u.user_id = @user_id4
group by p.product_id, p.product_name, p.product_price, u.user_id, u.user_name, ue.email_address;

-- Truy vấn 10: Tương tự truy vấn 9
declare @user_id5 int = 1;  -- Thay 1 bằng ID thực tế
select u.user_id, u.user_name, ue.email_address, p.product_id, p.product_name, p.product_price, sum(od.quantity) as total_quantity, sum(od.quantity * p.product_price) as total_cost,
       (select count(distinct product_id) from order_details od2 join orders o2 on od2.order_id = o2.order_id where o2.user_id = u.user_id) as total_products
from users u
join user_emails ue on u.user_id = ue.user_id and ue.is_primary = 1
join orders o on u.user_id = o.user_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where u.user_id = @user_id5
group by p.product_id, p.product_name, p.product_price, u.user_id, u.user_name, ue.email_address;
