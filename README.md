# 🚀 Virtusa Assessment – Project Usecases

This repository contains practice assignments submitted as part of the **Virtusa Assessment Program**.
It includes real-world mini-projects covering **Java**, **SQL**, and **Python** — demonstrating core programming concepts, problem-solving, and database handling.
---

## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| ☕ Java | OOP, Exception Handling, File I/O |
| 🗄️ SQL (MySQL) | Database design, Joins, Aggregation |
| 🐍 Python | Automation, String manipulation, File handling |
| 🐙 GitHub | Version control and collaboration |

---

## ☕ Java Use Case 1 – SafeLog: Password Validator

### 🧩 Business Case
A cybersecurity firm needs a tool for their **Employee Portal** that forces employees to create strong passwords using a modular, feedback-driven approach.

### 🎯 Problem Statement
Build a **Password Strength Checker** that validates a string against corporate security policies and provides specific failure feedback.

### ✨ Features
- Minimum 8 characters enforcement
- Uppercase letter and digit validation
- Specific feedback: `"Missing a digit"` / `"Too short"`
- Retry loop until a valid password is entered

### 📚 Concepts Used
`Encapsulation` · `String Manipulation` · `Loop Control` · `Character Methods`

### ▶️ How to Run
```bash
cd SafeLog
javac PasswordValidator.java
java PasswordValidator
```

---

## 🗄️ SQL Use Case 1 – SwiftShip: E-Commerce Logistics Tracker

### 🧩 Business Case
**SwiftShip** is a third-party logistics provider handling thousands of packages daily. The core challenge is identifying **"Lost in Transit"** items and spotting underperforming delivery partners.

### ✨ Features
- Schema design: `Partners`, `Shipments`, `DeliveryLogs`
- Delayed shipment detection (`ActualDeliveryDate > PromisedDate`)
- Partner performance ranking (Successful vs Returned)
- Popular destination city filter (last 30 days)

### 📚 Concepts Used
`Joins` · `GROUP BY` · `COUNT` · `Date Functions`

### 📄 Deliverable
`Sql_SwiftShip.sql` – Full SQL script outputting a **Partner Scorecard**.

---

## 🐍 Python Use Case – OpsBot: Log Automator

### 🧩 Business Case
An IT Operations team spends **2 hours daily** manually scanning 5,000 lines of server logs to find **"Failed Login"** attempts from potential hackers.

### ✨ Features
- Reads `server.log` line by line
- Detects `CRITICAL`, `ERROR`, `FAILED LOGIN` keywords
- Counts error frequency using a dictionary
- Generates `security_alert_[date].txt` report
- Prints file size using `os` module

### 📚 Concepts Used
`File Handling` · `String Methods` · `Dictionary` · `os Module`

### ▶️ How to Run
```bash
cd OpsBot
python ops_bot.py
```

### 📄 Output Files
- `server.log` – Raw log file *(Before)*
- `security_alert_2026-04-09.txt` – Filtered alert file *(After)*

---
## 👩‍💻 Authors

| Name | Contribution |
|------|-------------|
| **Byri Varshini** | SafeLog (Java), SwiftShip (SQL), OpsBot (Python) |

📅 Assessment Submission – Virtusa · April 2026

---

> *"Building real-world solutions through structured problem solving."*
