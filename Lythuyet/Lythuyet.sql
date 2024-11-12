/*
I. Nhập Dữ Liệu
    1. Nhập từ giá trị trực tiếp
        INSERT INTO (ten_bang) 
        VALUES (cac_gia_tri...);

    2. Nhập từ một bảng khác
        INSERT INTO (ten_bang)(cac_cot) 
        SELECT (cac_cot_tu_bang_khac)
        FROM (ten_bang_khac) 
        WHERE /dieu_kien/;

II. Truy Xuất Dữ Liệu
    SELECT (.) FROM (ten_bang);
    1. (.) = * : Tất cả các cột
    2. (.) = (ten_cot),... : Các cột cụ thể

III. Tạo Bảng Mới
    1. Tạo bảng trống
        CREATE TABLE (ten_bang)
        (
            /ma_lenh/
        );

    2. Tạo bảng từ một bảng khác
        CREATE TABLE (ten_bang) 
        AS SELECT (.) 
        FROM (ten_bang_khac);

IV. Sửa Đổi Bảng
    1. Thêm cột
        ALTER TABLE (ten_bang) 
        ADD COLUMN (ten_cot_moi) (kieu_du_lieu) 
        [DEFAULT (gia_tri)];

    2. Thay đổi kiểu dữ liệu
        ALTER TABLE (ten_bang) 
        ALTER COLUMN (ten_cot) TYPE (kieu_du_lieu);

    3. Đổi tên cột
        ALTER TABLE (ten_bang) 
        RENAME (ten_cot) TO (ten_moi);

    4. Thêm ràng buộc
        ALTER TABLE (ten_bang) 
        ADD CONSTRAINT 
            (ten_rang_buoc) (dinh_nghia_rang_buoc);

    5. Thiết lập NULL
        ALTER TABLE (ten_bang) 
        ALTER COLUMN (ten_cot) SET (kieu_du_lieu);

V. Ràng Buộc
    1. UNIQUE
        ALTER TABLE (ten_bang) 
        ADD CONSTRAINT 
            unique_(ten_cot) UNIQUE ((ten_cot));

    2. PRIMARY KEY
        ALTER TABLE (ten_bang) 	
        ADD CONSTRAINT 
            (ten_cot)_pk PRIMARY KEY((ten_cot));

    3. FOREIGN KEY
        - Tạo bảng con với khóa ngoại
            CREATE TABLE (ten_bang_con) (
                cot1 kieu_du_lieu,
                cot2 kieu_du_lieu REFERENCES (ten_bang_cha)(ten_cot_cha),
            );

        - Thêm khóa ngoại vào bảng con
            ALTER TABLE (ten_bang_con)
            ADD CONSTRAINT 
                (ten_bang_con)_fkey 
            FOREIGN KEY (ten_cot_con) REFERENCES (ten_bang_cha)(ten_cot_cha);

    4. CHECK
        - Tạo bảng với ràng buộc CHECK
            CREATE TABLE (ten_bang)
            (
                ten_cot kieu_du_lieu CHECK (dieu_kien)
            );

        - Thêm ràng buộc CHECK vào bảng
            ALTER TABLE (ten_bang) 
            ADD CONSTRAINT 
                (ten_rang_buoc) CHECK (dieu_kien);

    5. Xóa ràng buộc
        ALTER TABLE (ten_bang)		
        DROP CONSTRAINT (ten_rang_buoc);

VI. Cập Nhật Dữ Liệu
    1. Cập nhật bảng hiện tại
        UPDATE (ten_bang)
        SET cot1 = gia_tri1,	
            cot2 = gia_tri2
        WHERE (dieu_kien);

    2. Cập nhật từ một bảng khác
        UPDATE (ten_bang1)
        SET cot_can_cap_nhat = (ten_bang2).cot_duoc_cap_nhat
        FROM (ten_bang2)
        WHERE (dieu_kien);

    3. Xóa cột
        ALTER TABLE (ten_bang) 
        DROP COLUMN (ten_cot) [IF EXISTS] [CASCADE];

    4. Xóa bảng
        DROP TABLE IF EXISTS (ten_bang);

VII. Xóa Dữ Liệu
    1. Xóa tất cả dữ liệu của bảng
        DELETE FROM (ten_bang);
        TRUNCATE TABLE (ten_bang1), (ten_bang2); // Nhanh hơn DELETE và có thể thêm CASCADE để xóa các khóa ngoại liên quan.

    2. Xóa theo điều kiện
        DELETE FROM (ten_bang) 
        WHERE (dieu_kien);

VIII. Chuẩn Hóa Dữ Liệu (Data Normalization)
    - Các khái niệm: Dư thừa dữ liệu, chèn dị thường, cập nhật dị thường, xóa dị thường.

    1. 1NF (1st normal form): Giá trị phải là đơn nguyên (atomic), không chia nhỏ được.
    2. 2NF (2nd normal form): Đạt 1NF và các cột không khóa chỉ phụ thuộc vào khóa chính.
    3. 3NF (3rd normal form): Đạt 2NF, không có phụ thuộc bắc cầu (transitive dependency).

IX. Câu Lệnh SELECT
    1. Tên bí danh
        - Cho cột: SELECT (ten_cot) AS (ten_bi_danh) FROM (ten_bang);
        - Cho bảng: SELECT (cac_cot) FROM (ten_bang) AS (ten_bi_danh);

    2. Chuyển đổi kiểu dữ liệu
        bieu_thuc::kieu_du_lieu;

    3. Làm tròn
        ROUND(gia_tri, so_chu_so);

    4. Sắp xếp
        ORDER BY (ten_cot) [ASC | DESC];

    5. SELECT DISTINCT: Lấy giá trị duy nhất
        SELECT DISTINCT (ten_cot) FROM (ten_bang);

X. Lọc Dữ Liệu
    1. Lọc với WHERE
        SELECT * FROM (ten_bang) 
        WHERE (dieu_kien);

    2. LIKE, NOT LIKE, SIMILAR TO, ILIKE
        - LIKE '%mau%' hoặc NOT LIKE '%mau%'
        - SIMILAR TO '(mau1|mau2)'
        - ILIKE '%mau%' (không phân biệt hoa/thường)

    3. BETWEEN và NOT BETWEEN
        SELECT * FROM (ten_bang) 
        WHERE (ten_cot) BETWEEN (gia_tri_thap) AND (gia_tri_cao);

    4. LIMIT
        SELECT * FROM (ten_bang) 
        LIMIT (n);

    5. OFFSET
        SELECT * FROM (ten_bang) 
        LIMIT (n) OFFSET (m);

    6. Kiểm tra NULL
        (ten_cot) IS NULL hoặc (ten_cot) IS NOT NULL;

XI. Kết Hợp Bảng (JOIN)
    1. INNER JOIN
        SELECT A.(ten_cot), B.(ten_cot)
        FROM A INNER JOIN B ON (dieu_kien);

    2. LEFT JOIN
        SELECT A.(ten_cot), B.(ten_cot)
        FROM A LEFT JOIN B ON (dieu_kien);

    3. FULL OUTER JOIN
        SELECT * FROM A FULL OUTER JOIN B ON (dieu_kien);

    4. Tự liên kết (Self-Join)
        SELECT a1.(ten_cot), a2.(ten_cot)
        FROM A a1 INNER JOIN A a2 ON (dieu_kien);

XII. Toán Học
    1. CASE
        SELECT cot, 
            CASE WHEN dieu_kien THEN ket_qua
            ELSE ket_qua END AS ten_bi_danh
        FROM ten_bang;

    2. SUM
        SUM(ten_cot);

    3. MAX/MIN
        MAX(ten_cot) hoặc MIN(ten_cot);

    4. AVG
        AVG(ten_cot);

XIII. Các Hàm Khác
    1. Rank
        ROW_NUMBER() hoặc DENSE_RANK() OVER (ORDER BY ten_cot);

    2. DATEDIFF
        DATEDIFF(ngay1, ngay2);

    3. CONCAT
        CONCAT(cot1, cot2) AS cot_moi;

    4. UNION ALL
        SELECT ... FROM ten_bang1 UNION ALL SELECT ... FROM ten_bang2;

    5. IF
        IF(dieu_kien, ket_qua_dung, ket_qua_sai);

    6. Định dạng ngày
        DATE_FORMAT(ten_cot_ngay, '%d-%m-%Y');

    7. SUM với PARTITION
        SUM(ten_cot) OVER (PARTITION BY ten_cot);

    8. GROUP_CONCAT
        GROUP_CONCAT(DISTINCT ten_cot ORDER BY ten_cot ASC SEPARATOR ',');
*/
