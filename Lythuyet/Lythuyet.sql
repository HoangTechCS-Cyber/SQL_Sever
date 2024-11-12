/*
I. Nhập Dữ Liệu
    1. Nhập từ giá trị trực tiếp
        INSERT INTO (table_name) 
        VALUES (values...);

    2. Nhập từ một bảng khác
        INSERT INTO (table_name)(columns) 
        SELECT (columns_from_another_table)
        FROM (another_table_name) 
        WHERE /condition/;

II. Truy Xuất Dữ Liệu
    SELECT (.) FROM (table_name);
    1. (.) = * : Tất cả các cột
    2. (.) = (column_name),... : Các cột cụ thể

III. Tạo Bảng Mới
    1. Tạo bảng trống
        CREATE TABLE (table_name)
        (
            /code/
        );

    2. Tạo bảng từ một bảng khác
        CREATE TABLE (table_name) 
        AS SELECT (.) 
        FROM (another_table_name);

IV. Sửa Đổi Bảng
    1. Thêm cột
        ALTER TABLE (table_name) 
        ADD COLUMN (new_column_name) (datatype) 
        [DEFAULT (values)];

    2. Thay đổi kiểu dữ liệu
        ALTER TABLE (table_name) 
        ALTER COLUMN (column_name) TYPE (datatype);

    3. Đổi tên cột
        ALTER TABLE (table_name) 
        RENAME (column_name) TO (new_name);

    4. Thêm ràng buộc
        ALTER TABLE (table_name) 
        ADD CONSTRAINT 
            (constraint_name) (constraint_definition);

    5. Thiết lập NULL
        ALTER TABLE (table_name) 
        ALTER COLUMN (column_name) SET (type);

V. Ràng Buộc
    1. UNIQUE
        ALTER TABLE (table_name) 
        ADD CONSTRAINT 
            unique_(column) UNIQUE ((column));

    2. PRIMARY KEY
        ALTER TABLE (table_name) 	
        ADD CONSTRAINT 
            (column)_pk PRIMARY KEY((column));

    3. FOREIGN KEY
        - Tạo bảng con với khóa ngoại
            CREATE TABLE (child_table_name) (
                c1 datatype,
                c2 datatype REFERENCES (parent_table_name)(parent_column),
            );

        - Thêm khóa ngoại vào bảng con
            ALTER TABLE (child_table_name)
            ADD CONSTRAINT 
                (child_table_name)_fkey 
            FOREIGN KEY (child_column) REFERENCES (parent_table_name)(parent_column);

    4. CHECK
        - Tạo bảng với ràng buộc CHECK
            CREATE TABLE (table_name)
            (
                column_name datatype CHECK (condition)
            );

        - Thêm ràng buộc CHECK vào bảng
            ALTER TABLE (table_name) 
            ADD CONSTRAINT 
                (constraint_name) CHECK (condition);

    5. Xóa ràng buộc
        ALTER TABLE (table_name)		
        DROP CONSTRAINT (constraint_name);

VI. Cập Nhật Dữ Liệu
    1. Cập nhật bảng hiện tại
        UPDATE (table_name)
        SET column1 = value1,	
            column2 = value2
        WHERE (condition);

    2. Cập nhật từ một bảng khác
        UPDATE (table1_name)
        SET column_need_update = (table2_name).column_update
        FROM (table2_name)
        WHERE (condition);

    3. Xóa cột
        ALTER TABLE (table_name) 
        DROP COLUMN (column_name) [IF EXISTS] [CASCADE];

    4. Xóa bảng
        DROP TABLE IF EXISTS (table_name);

VII. Xóa Dữ Liệu
    1. Xóa tất cả dữ liệu của bảng
        DELETE FROM (table_name);
        TRUNCATE TABLE (table1_name), (table2_name); // Nhanh hơn DELETE và có thể thêm CASCADE để xóa các khóa ngoại liên quan.

    2. Xóa theo điều kiện
        DELETE FROM (table_name) 
        WHERE (condition);

VIII. Chuẩn Hóa Dữ Liệu (Data Normalization)
    - Các khái niệm: Dư thừa dữ liệu, chèn dị thường, cập nhật dị thường, xóa dị thường.

    1. 1NF (1st normal form): Giá trị phải là đơn nguyên (atomic), không chia nhỏ được.
    2. 2NF (2nd normal form): Đạt 1NF và các cột không khóa chỉ phụ thuộc vào khóa chính.
    3. 3NF (3rd normal form): Đạt 2NF, không có phụ thuộc bắc cầu (transitive dependency).

IX. Câu Lệnh SELECT
    1. Tên bí danh
        - Cho cột: SELECT (column_name) AS (alias_name) FROM (table_name);
        - Cho bảng: SELECT (columns) FROM (table_name) AS (alias_name);

    2. Chuyển đổi kiểu dữ liệu
        expression::data_type;

    3. Làm tròn
        ROUND(value, n);

    4. Sắp xếp
        ORDER BY (column_name) [ASC | DESC];

    5. SELECT DISTINCT: Lấy giá trị duy nhất
        SELECT DISTINCT (column_name) FROM (table_name);

X. Lọc Dữ Liệu
    1. Lọc với WHERE
        SELECT * FROM (table_name) 
        WHERE (condition);

    2. LIKE, NOT LIKE, SIMILAR TO, ILIKE
        - LIKE '%pattern%' hoặc NOT LIKE '%pattern%'
        - SIMILAR TO '(pattern1|pattern2)'
        - ILIKE '%pattern%' (không phân biệt hoa/thường)

    3. BETWEEN và NOT BETWEEN
        SELECT * FROM (table_name) 
        WHERE (column_name) BETWEEN (low_value) AND (high_value);

    4. LIMIT
        SELECT * FROM (table_name) 
        LIMIT (n);

    5. OFFSET
        SELECT * FROM (table_name) 
        LIMIT (n) OFFSET (m);

    6. Kiểm tra NULL
        (column_name) IS NULL hoặc (column_name) IS NOT NULL;

XI. Kết Hợp Bảng (JOIN)
    1. INNER JOIN
        SELECT A.(column_name), B.(column_name)
        FROM A INNER JOIN B ON (condition);

    2. LEFT JOIN
        SELECT A.(column_name), B.(column_name)
        FROM A LEFT JOIN B ON (condition);

    3. FULL OUTER JOIN
        SELECT * FROM A FULL OUTER JOIN B ON (condition);

    4. Tự liên kết (Self-Join)
        SELECT a1.(column_name), a2.(column_name)
        FROM A a1 INNER JOIN A a2 ON (condition);

XII. Toán Học
    1. CASE
        SELECT column, 
            CASE WHEN condition THEN result
            ELSE result END AS alias_name
        FROM table_name;

    2. SUM
        SUM(column_name);

    3. MAX/MIN
        MAX(column_name) hoặc MIN(column_name);

    4. AVG
        AVG(column_name);

XIII. Các Hàm Khác
    1. Rank
        ROW_NUMBER() hoặc DENSE_RANK() OVER (ORDER BY column_name);

    2. DATEDIFF
        DATEDIFF(date1, date2);

    3. CONCAT
        CONCAT(column1, column2) AS new_column;

    4. UNION ALL
        SELECT ... FROM table1_name UNION ALL SELECT ... FROM table2_name;

    5. IF
        IF(condition, true_result, false_result);

    6. Định dạng ngày
        DATE_FORMAT(date_column, '%d-%m-%Y');

    7. SUM với PARTITION
        SUM(column_name) OVER (PARTITION BY column_name);

    8. GROUP_CONCAT
        GROUP_CONCAT(DISTINCT column_name ORDER BY column_name ASC SEPARATOR ',');
*/
