-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
-- C1: Làm 2 câu truy vấn
select count(sv.MaSV) as 'TongSV'
from dmsv sv;
select count(sv.MaSV)
from dmsv sv
where sv.Phai like 'Nữ';
-- C2: Làm trên 1 câu truy vấn
select count(sv.MaSV) as 'TongSV',sum(case sv.Phai when 'Nữ' then 1 else 0 end) as 'TongNu'
from dmsv sv;
-- 42.Cho biết khoa nào có đông sinh viên nhất
-- 2. Lấy các khoa có số sinh viên >= all số sv các khoa
select k.TenKhoa
from dmsv sv2 join dmkhoa k on sv2.makhoa = k.makhoa
group by sv2.makhoa
having count(sv2.masv) >= all(
	-- 1. Thống kê số sinh viên của từng khoa
	select count(sv1.MaSV)
	from dmsv sv1
	group by sv1.makhoa
);
-- 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
-- 2. Lấy thông tin sinh viên mà có điểm = điểm cao nhất
select *
from dmsv sv join ketqua kq2 on sv.MaSV = kq2.MaSV join 
-- 1. Lấy điểm cao nhất của mỗi môn học
( select max(kq.Diem) as 'DiemMax',kq.MaMH
from ketqua kq
group by kq.mamh) a on kq2.maMH = a.maMH
where a.diemmax = kq2.diem
order by kq2.mamh


