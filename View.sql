select * from catalog;
select * from product;
-- Tạo view gồm các thông tin mã sp, tên sp, giá >=10, tên danh mục
create view vw_Catalog_Product
as
	select p.productid,p.productname,p.price,c.catalogname
    from Product p join catalog c on p.catalogid = c.catalogid
    where p.price>=10;
drop view vw_catalog_product;