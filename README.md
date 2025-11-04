# 🏏 T20 World Cup SQL Analysis

This project contains SQL queries for analyzing the **ICC T20 World Cup 2024** match dataset.

---

## 📁 Files Included

- **T20WC-MYSQL.sql** → Contains all analysis queries.
- **README.md** → Project documentation.

---

## 🧠 About the Project

Using MySQL, this dataset helps explore:
- Match results and team performance
- Toss analysis and outcomes
- Highest scores, winning margins, and more

---

## ⚙️ How to Use

1. Open **MySQL Workbench** (or any SQL IDE).
2. Create a database:
   ```sql
   CREATE DATABASE t20wc_db;
   USE t20wc_db;
Import your dataset (CSV or table).

Run queries from T20WC-MYSQL.sql.

📊 Example Queries
sql
Copy code
-- 1. Find total matches won by each team
SELECT Winners, COUNT(*) AS Wins
FROM t20wc
GROUP BY Winners
ORDER BY Wins DESC;

-- 2. List top 5 highest first innings scores
SELECT `1st Team`, `2nd Team`, `First Innings Score`
FROM t20wc
ORDER BY `First Innings Score` DESC
LIMIT 5;
🧩 Tools Used
MySQL Workbench 8.0

Git & GitHub

✨ Author
Manoj Kumar Amrutha

