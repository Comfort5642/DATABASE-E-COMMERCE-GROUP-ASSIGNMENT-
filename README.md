# 📦 DATABASE-E-COMMERCE-GROUP-ASSIGNMENT

Welcome to our group project focused on building a fully functional **E-commerce Database** from scratch using SQL and sound relational design principles.

## 🎯 Objective

The goal of this assignment is to design a robust database schema for an e-commerce platform by:

- Designing a detailed **Entity-Relationship Diagram (ERD)**.
- Creating all necessary tables with proper constraints.
- Demonstrating collaborative planning and execution of a full-stack database solution.

---

## 🛠️ Instructions

### 1️⃣ Create an ERD ✍️

- Identify all entities (tables) and their respective attributes.
- Define relationships, primary keys, foreign keys, and constraints.
- Tools used: `Lucidchart`, `dbdiagram.io`, or `MySQL Workbench`.

### 2️⃣ Plan the Data Flow 🔄

- Map out how data flows between entities.
- Discuss and document structural decisions.
- Think like database architects!

### 3️⃣ Group Collaboration 🤝

- Collaboratively analyzed, designed, and built the schema.
- Used GitHub for version control and documentation.
- Maintained active communication and teamwork.

### 4️⃣ Submission 🚀

- Uploaded the following to the repository:
  - `ecommerce.sql` file containing all SQL table creation queries.
  - Final **ERD** diagram (image or PDF format).
- Ensured the repository is public and organized for easy review.

---

## 🗃️ Tables to Be Created

The database included the following tables:

| Table Name            | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| `product_image`       | Stores image URLs or references for products.                              |
| `color`               | Lists available color options.                                              |
| `product_category`    | Categorizes products (e.g., electronics, clothing).                         |
| `product`             | General product details (name, brand, base price).                         |
| `product_item`        | Purchasable product variants (with size/color combinations).               |
| `brand`               | Brand information associated with products.                                |
| `product_variation`   | Links products to variations like size and color.                          |
| `size_category`       | Groups sizes by type (e.g., clothing, shoes).                              |
| `size_option`         | Specific size values (e.g., S, M, 42).                                     |
| `product_attribute`   | Additional product attributes (e.g., material, weight).                    |
| `attribute_category`  | Groups attributes into categories (e.g., technical, physical).             |
| `attribute_type`      | Data types of attributes (e.g., text, number, boolean).                    |

---

## 🧑‍🤝‍🧑 Collaboration Guidelines

- We met regularly and divided tasks fairly.
- Pushed all updates to GitHub and used pull requests for review.
- Discussed issues and solutions as a team.
- Made sure all members understand the full design.

---

## 📁 Files in This Repository

```bash
DATABASE-E-COMMERCE-GROUP-ASSIGNMENT/
│
├── ecommerce.sql        # Contains all SQL queries for table creation
├── erd-diagram.png      # Final ERD
└── README.md            # Project description and instructions
```