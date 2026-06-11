-- ==============================================================================
-- TR: T-SQL BAŞLANGIÇ VE ORTA SEVİYE REHBERİ (SQLFULL)
-- EN: T-SQL BEGINNER TO INTERMEDIATE GUIDE (SQLFULL)
-- ==============================================================================

-- TR: 1. VERİTABANI YÖNETİMİ
-- EN: 1. DATABASE MANAGEMENT

-- CREATE DATABASE SQLFULL;  -- TR: Yeni veritabanı oluşturur / EN: Creates a new database
-- GO
-- DROP DATABASE SQLFULL;    -- TR: Veritabanını tamamen siler / EN: Deletes the database completely

USE SQLFULL; -- TR: Bu veritabanını kullanacağımızı belirtir / EN: Specifies the database to use
GO

-- ==============================================================================
-- TR: 2. TABLO OLUŞTURMA VE VERİ TİPLERİ
-- EN: 2. TABLE CREATION AND DATA TYPES

IF OBJECT_ID('Personel', 'U') IS NOT NULL
    DROP TABLE Personel;
GO

CREATE TABLE Personel (
    -- TR: identity(1,1) otomatik artan id sağlar. PRIMARY KEY benzersiz kilit alandır.
    -- EN: identity(1,1) provides auto-incrementing id. PRIMARY KEY is the unique identifier.
    PersonelID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    Personelİsim NVARCHAR(40) NOT NULL,
    PersonelSoyisim NVARCHAR(40) NULL,
    EmailAdres NVARCHAR(60) NULL,
    TelefonNumarasi NVARCHAR(20) NULL,
    YoneticiID INT NULL -- TR: Self-Join örneği için eklendi / EN: Added for Self-Join example
);
GO

-- ==============================================================================
-- TR: 3. VERİ EKLEME (DML - INSERT)
-- EN: 3. DATA INSERTION (DML - INSERT)

-- TR: IDENTITY sütununa elle veri eklenmez, bu yüzden PersonelID listeye yazılmaz.
-- EN: Manually inserting into IDENTITY column is restricted, so PersonelID is omitted.
INSERT INTO Personel (Personelİsim, PersonelSoyisim, EmailAdres, TelefonNumarasi, YoneticiID)  
VALUES  
('Ege', 'Sül', 'ege@gmail.com', '00000000001', NULL),        
('Azra', 'Şahin', 'azra@gmail.com', '00000000002', 1),       
('Romeo', 'Kaplan', 'Romeo@hotmail.com', '00000000003', 1),
('Eylül', 'Arslan', 'elool@gmail.com', '00000000004', 2),
('Yusuf', 'Özdemir', 'yusuf@hotmail.com', '00000000005', 2),
('Aziz', 'Güngör', 'aziz@gmail.com', '00000000006', 3),
('Simay', 'Arslan', 'Simay@gmail.com', '00000000007', NULL);
GO

-- ==============================================================================
-- TR: 4. TABLO YAPISINI DEĞİŞTİRME (DDL - ALTER) & KISITLAMALAR (CONSTRAINTS)
-- EN: 4. ALTERING TABLE STRUCTURE (DDL - ALTER) & CONSTRAINTS

-- TR: Yeni kolon ekleme / EN: Adding a new column
ALTER TABLE Personel ADD Cinsiyet NVARCHAR(10); 

-- TR: Kolon kısıtlaması (CHECK) - Sadece belirli değerleri kabul eder
-- EN: Column constraint (CHECK) - Only accepts specific values
ALTER TABLE Personel ADD CONSTRAINT CK_Cinsiyet CHECK (Cinsiyet IN ('Erkek', 'Kadın', 'Diğer')); 

-- TR: Telefon ve Email format kontrolü
-- EN: Phone and Email format check
ALTER TABLE Personel ADD CONSTRAINT CK_TelefonFormat CHECK (TelefonNumarasi LIKE '0%');
ALTER TABLE Personel ADD CONSTRAINT CK_EmailFormat CHECK (EmailAdres LIKE '%@%.com' OR EmailAdres LIKE '%@%.co%');

-- TR: Kolon silme / EN: Dropping a column
-- ALTER TABLE Personel DROP COLUMN Cinsiyet;

-- ==============================================================================
-- TR: 5. VERİ GÜNCELLEME VE SİLME (UPDATE & DELETE)
-- EN: 5. DATA UPDATE AND DELETE

-- TR: WHERE koşulu olmadan UPDATE veya DELETE kullanılırsa TÜM TABLO etkilenir!
-- EN: Without a WHERE clause, UPDATE or DELETE affects the ENTIRE TABLE!

-- TR: Tekil güncelleme / EN: Single record update
UPDATE Personel 
SET TelefonNumarasi = '05555555555' 
WHERE PersonelID = 2;

-- TR: Belirli aralıktaki verileri silme / EN: Deleting records in a specific range
-- DELETE FROM Personel WHERE PersonelID BETWEEN 6 AND 7;

-- ==============================================================================
-- TR: 6. VERİ SORGULAMA VE FİLTRELEME (SELECT & WHERE)
-- EN: 6. DATA QUERYING AND FILTERING (SELECT & WHERE)

-- TR: Temel listeleme / EN: Basic selection
SELECT * FROM Personel;

-- TR: Mantıksal Operatörler (AND, OR, BETWEEN) / EN: Logical Operators
SELECT * FROM Personel WHERE PersonelSoyisim = 'Arslan' AND Personelİsim = 'Eylül';
SELECT * FROM Personel WHERE PersonelID BETWEEN 2 AND 5;

-- TR: Joker Karakterler (LIKE / NOT LIKE) / EN: Wildcards (LIKE / NOT LIKE)
-- TR: % sıfır veya daha fazla karakteri, _ ise tek bir karakteri temsil eder.
-- EN: % represents zero or more characters, _ represents a single character.
SELECT * FROM Personel WHERE EmailAdres LIKE '%@gmail.com';
SELECT * FROM Personel WHERE Personelİsim LIKE 'A%';

-- TR: Sıralama (ORDER BY - ASC/DESC) / EN: Sorting (ORDER BY - ASC/DESC)
SELECT * FROM Personel ORDER BY Personelİsim ASC; -- A-Z
SELECT * FROM Personel ORDER BY PersonelSoyisim DESC; -- Z-A

-- TR: Agrega Fonksiyonları (MAX, MIN) / EN: Aggregate Functions (MAX, MIN)
SELECT MAX(TelefonNumarasi) AS EnBuyukTelefon FROM Personel;
SELECT MIN(TelefonNumarasi) AS EnKucukTelefon FROM Personel;

-- ==============================================================================
-- TR: 7. İLERİ SEVİYE: JOIN (TABLOLARI BİRLEŞTİRME)
-- EN: 7. ADVANCED: JOIN (COMBINING TABLES)

-- TR: SELF JOIN: Bir tablonun hiyerarşik yapıları göstermek için kendisiyle birleşmesidir.
-- EN: SELF JOIN: A table joining with itself to display hierarchical structures.
-- Soru: Personelleri bağlı oldukları yöneticilerin isimleriyle birlikte listele.
SELECT 
    p.PersonelID AS Personel_ID,
    CONCAT(p.Personelİsim, ' ', p.PersonelSoyisim) AS Personel_Ad_Soyad,
    CONCAT(y.Personelİsim, ' ', y.PersonelSoyisim) AS Yonetici_Ad_Soyad
FROM Personel p
INNER JOIN Personel y ON p.YoneticiID = y.PersonelID;
GO

-- ==============================================================================
-- TR: 8. SÖZLÜK: WHERE VS HAVING
-- EN: 8. DICTIONARY: WHERE VS HAVING
-- ==============================================================================
/*
   TR:
   - WHERE: Gruplama (GROUP BY) yapılmadan önce satırları filtreler. Agrega fonksiyonları (SUM, AVG, COUNT) ile doğrudan kullanılamaz.
   - HAVING: Gruplama yapıldıktan sonra oluşan grupları filtreler. Agrega fonksiyonları ile birlikte kullanılır.

   EN:
   - WHERE: Filters rows BEFORE grouping (GROUP BY) is applied. Cannot be used with aggregate functions directly.
   - HAVING: Filters groups AFTER grouping is applied. Used together with aggregate functions.
*/