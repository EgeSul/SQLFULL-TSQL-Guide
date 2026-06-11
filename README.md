# T-SQL Syntax Guide & Dictionary (SQLFULL) 🚀

[TR] Bu repo, T-SQL (Microsoft SQL Server) dilinin temel ve orta düzey konseptlerini içeren, kod üzerinde açıklamalı bir rehber ve sözlük çalışmasıdır. Okulda ve kişisel gelişim sürecimde öğrendiğim SQL pratiklerini kalıcı hale getirmek amacıyla iki dilde dökümante edilmiştir.

[EN] This repository is an annotated guide and dictionary containing beginner to intermediate concepts of T-SQL (Microsoft SQL Server). It has been documented in two languages to solidify my SQL knowledge during my academic studies and personal growth.

---

## 📌 İçerik / Features

### 🔹 1. DDL (Data Definition Language)
* Veritabanı oluşturma ve silme işlemleri (`CREATE`, `DROP`).
* Veri bütünlüğünü korumak için `PRIMARY KEY`, `IDENTITY(1,1)` ve `NOT NULL` kısıtlamaları.
* Tablo yapısını dinamik olarak güncelleme (`ALTER TABLE`, `ADD CONSTRAINT`).
* `CHECK` kısıtlamaları ile veri kalitesini (Email, Telefon formatı vb.) sağlama.

### 🔹 2. DML (Data Manipulation Language)
* Tabloya doğru syntax ile veri besleme (`INSERT INTO`).
* `WHERE` koşulu ile güvenli veri güncelleme ve silme pratikleri (`UPDATE`, `DELETE`).

### 🔹 3. Veri Sorgulama ve Filtreleme (DQL)
* Mantıksal operatörler ve aralık filtreleme (`AND`, `OR`, `BETWEEN`).
* Joker karakterler ile dinamik metin arama (`LIKE`, `%`, `_`).
* Verileri artan ve azalan düzende sıralama (`ORDER BY ASC/DESC`).
* Agrega fonksiyonları ile uç değer analizi (`MAX`, `MIN`).

### 🔹 4. İleri Seviye Konseptler
* **Self-Join Yapısı:** Bir tablonun kendi içerisindeki hiyerarşiyi (Personel-Yönetici ilişkisi) çözmek için kendisiyle birleştirilmesi.
* **Sözlük Kısmı:** `WHERE` ve `HAVING` parametrelerinin çalışma mantığı ve aralarındaki farklar.

---

## 🎯 Teknik Sözlük / Technical Dictionary

| Terim (TR) | Term (EN) | Açıklama / Description |
| :--- | :--- | :--- |
| **Kısıtlama** | Constraint | Verinin doğruluğunu koruyan kurallar bütünü (CHECK, Foreign Key vb.) |
| **Otomatik Artan** | Identity | Yeni kayıt eklendikte otomatik artan benzersiz sayı değeri. |
| **Satır Filtreleme** | WHERE | Gruplama yapılmadan önce ham veriyi satır bazlı eler. |
| **Grup Filtreleme** | HAVING | `GROUP BY` işleminden sonra oluşan kümeleri filtreler. |
| **Kendiyle Birleşme** | Self-Join | Tablonun hiyerarşik bağları çözmek için kendi verisiyle eşleşmesi. |

---

## 🛠️ Nasıl Çalıştırılır? / How to Run?

1. Kodları bilgisayarınıza indirin veya kopyalayın.
2. **Microsoft SQL Server Management Studio (SSMS)** uygulamasını açın.
3. Sorguyu bir query penceresine yapıştırıp `Execute` (F5) butonuna basın.

---
*Bu çalışma Ege Sül tarafından bir geliştirici rehberi olarak tasarlanmıştır.*
