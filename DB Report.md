## **1. Comparison Assignment**

## **Create a comparison between Flat File Systems and Relational Databases?**



1\. Structure

Flat File Systems



A flat file system stores data in one-level files such as TXT, CSV, or simple spreadsheets.



Information is placed in a plain table-like format without strict rules about data types or constraints.



There is no schema that defines how the data should look; the structure depends on how the programmer formats the file.



Each file functions separately, meaning the system has no built-in support for combining or linking information across multiple files.



Relational Databases



A relational database organizes data into multiple interconnected tables.



The design is based on a schema, which defines table names, columns, data types, and rules.



Data in different tables is connected using primary keys and foreign keys, which maintain logical links.



The structure is enforced by a DBMS (Database Management System), ensuring organized, consistent, and scalable storage.



2\. Data Redundancy

Flat File Systems



These systems often contain repeated data because each file holds information independently.



Example: Storing the same customer information in multiple files (orders, invoices, payments).



This repetition leads to:



Larger file sizes



Inconsistencies when data is updated in one file but not the others



More maintenance work



Relational Databases



Designed to minimize redundancy through the process of normalization.



Data is stored once in a specific table and referenced everywhere else.



Example: A customer’s details exist only in the “Customer” table and other tables simply reference that ID.



This improves:



Data accuracy



Consistency across the system



Storage efficiency



3\. Relationships

Flat File Systems



Usually lack the capability to represent or enforce relationships between datasets.



Any relationship must be manually created (e.g., copying a customer name into another file).



No automatic checks are available to prevent invalid or conflicting data.



This makes it difficult to maintain complex systems that depend on multiple linked datasets.



Relational Databases



Built specifically to handle relationships between tables.



Support multiple relationship models such as:



1-to-1



1-to-Many



Many-to-Many



These connections are maintained using:



Foreign key constraints



Referential integrity rules



The DBMS ensures that data remains valid and linked correctly.



4\. Example Usage

Flat File Systems



Best used when:



Data volumes are small



The application is simple



Relationships are not required



Examples:



Log files



Small configuration files



Single-user applications



Basic Excel/CSV datasets



Relational Databases



Used in systems that require:



Large-scale data handling



Multiple users accessing data at once



Complex queries



Strong data integrity



Examples:



Financial systems



ERP systems



E-commerce platforms



School and hospital management systems



5\. Drawbacks

Flat File Systems



Limited scalability: Performance decreases as files grow.



No relational capabilities: Cannot link data across multiple files automatically.



High chance of errors due to repeated data.



Weak security: Often lack role-based access control or permission systems.



Complex updates: Changing one piece of information may require editing several files.



Relational Databases



More expensive and complex to set up.



Require a DBMS, proper server configuration, and trained individuals.



Query processing can be slower for unstructured or large multimedia data.



Schema rigidity: Changing table structures requires careful planning and may affect existing applications.





&nbsp;-----------------------------------------------------------

|                 FLAT FILE SYSTEMS                         |

&nbsp;-----------------------------------------------------------

|                                                           |

|   File 1 (customers.csv)                                  |

|   --------------------------                               |

|   ID | Name | Email                                       |

|   1  | Ali  | ali@mail.com                                |

|   2  | Sara | sara@mail.com                               |

|                                                           |

|   File 2 (orders.csv)                                     |

|   --------------------------                               |

|   OrderID | CustomerName | Product                        |

|   101     | Ali          | Laptop                         |

|   102     | Sara         | Phone                          |

|                                                           |

|   - No direct link between files                          |

|   - Repeated data (customer name stored again)            |

|   - Hard to enforce accuracy                              |

&nbsp;-----------------------------------------------------------



&nbsp;                      VS

&nbsp;-----------------------------------------------------------

|                 RELATIONAL DATABASES                      |

&nbsp;-----------------------------------------------------------

|                                                           |

|   Table: Customers                                        |

|   -----------------------------                           |

|   CustomerID | Name | Email                               |

|   1          | Ali  | ali@mail.com                        |

|   2          | Sara | sara@mail.com                       |

|                                                           |

|   Table: Orders                                           |

|   -----------------------------                           |

|   OrderID | CustomerID | Product                          |

|   101     | 1          | Laptop                           |

|   102     | 2          | Phone                            |

|                                                           |

|   Relationship:                                           |

|   Customers.CustomerID  <---->  Orders.CustomerID         |

|                                                           |

|   - No data repetition (ID used instead of name)          |

|   - Strong connections using keys                         |

|   - Ensures accuracy and consistency                      |

&nbsp;-----------------------------------------------------------





-----------------------------------------------------------------------------------------------------------------------------------------------------...





**3-Roles in a Database System**



**Role                     | Responsibility**

**-------------------------|-------------------------------------------**

**System Analyst           | Understands business needs and defines database requirements.**

**Database Designer        | Plans the database structure, tables, and relationships for efficiency and accuracy.**

**Database Developer       | Builds and codes the database: queries, procedures, and triggers.**

**Database Administrator   | Maintains, secures, and tunes the database; manages backups and access.**

**Application Developer    | Creates applications that interact with the database to process and display data.**

**BI Developer             | Develops reports, dashboards, and analytics for decision-making using database data.**









**----------------------------------------------------------------------------------------------------------------------------------------------------------**

**4-Types of Databases**



**1. Relational vs Non-Relational Databases**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**



**Relational Database (RDBMS)**



**Stores data in tables (rows and columns) with relationships between them.**



**Uses SQL for queries.**



**Ensures data integrity through constraints and ACID compliance.**



**Examples: MySQL, PostgreSQL, Oracle.**



**Use case: Banking systems, inventory management, ERP.**



**Non-Relational Database (NoSQL)**



**Stores data in flexible formats like document, key-value, column, or graph.**



**Can scale easily for large amounts of unstructured or semi-structured data.**



**Examples: MongoDB (document), Cassandra (column), Redis (key-value), Neo4j (graph).**



**Use case: Social media feeds, real-time analytics, IoT data.**



**2. Centralized vs Distributed vs Cloud Databases**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**



**Centralized Database**



**Stored on a single server or location.**



**Easy to manage but limited by server capacity.**



**Use case: Small businesses or internal applications with limited users.**



**Distributed Database**



**Data is spread across multiple servers or locations, but appears as a single database.**



**Improves reliability, availability, and performance.**



**Use case: Global e-commerce platforms, banking systems with multiple branches.**



**Cloud Database**



**Hosted on cloud providers (AWS, Azure, Google Cloud).**



**Scalable, flexible, and managed as a service.**



**Use case: SaaS applications, mobile apps, big data platforms.**



**-------------------------------------------------------------------------------------------------------------------------------------------------------------**

**5-Cloud Storage and Databases**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**



**1. What is Cloud Storage and its relation to databases?**



**Cloud Storage: A service that allows you to store data on remote servers hosted on the internet, instead of local computers or on-premise servers.**



**Relation to Databases: Cloud databases store and manage structured or unstructured data on cloud infrastructure. They provide the same functionalities as traditional databases (querying, transactions, backups) but are accessible via the internet and managed by cloud providers.**



**Examples of cloud databases: Azure SQL, Amazon RDS, Google Cloud Spanner.**



**2. Advantages of Cloud-Based Databases**



**Scalability 📈 – Easily increase storage or computing power as your needs grow.**



**Cost-Effective 💰 – Pay-as-you-go pricing avoids large upfront hardware costs.**



**Accessibility 🌐 – Access data from anywhere with an internet connection.**



**Automatic Maintenance ⚙️ – Backups, updates, and security patches handled by provider.**



**High Availability ☁️ – Redundancy across multiple data centers reduces downtime.**



**3. Disadvantages of Cloud-Based Databases**



**Dependency on Internet 🌐 – Cannot access database offline.**



**Ongoing Costs 💵 – Long-term subscription fees may add up.**



**Data Security \& Privacy Risks 🔒 – Sensitive data stored on third-party servers.**



**Limited Control ⚠️ – Less control over infrastructure and configurations compared to on-premises setups.**



**Latency Issues ⏱️ – Performance may be affected if servers are far from users.**

**------------------------------------------------------------------------------------------------------------------------------------------------------------------------**

**6-Database Engines and Languages**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**

**1. What is a Database Engine?**



**A database engine (or DBMS engine) is the core software component of a Database Management System (DBMS) that stores, retrieves, and manages data in databases. It handles tasks like:**



**Query processing**



**Data storage and retrieval**



**Transaction management (ACID properties: Atomicity, Consistency, Isolation, Durability)**



**Security and access control**



**In simple terms, the engine is the “brain” of the database that makes data operations work.**



**2. Examples of Database Engines**

**Database Engine	Type	Notes**

**SQL Server	Relational	Developed by Microsoft, commonly uses T-SQL.**

**MySQL	Relational	Open-source, widely used in web applications, uses ANSI SQL with some extensions.**

**Oracle Database	Relational	Enterprise-grade, uses PL/SQL (Procedural Language for SQL).**

**PostgreSQL	Relational	Open-source, supports ANSI SQL and PL/pgSQL for procedural tasks.**

**3. Languages Used**



**Databases are generally queried and managed using SQL (Structured Query Language), but each engine may have its own extensions or procedural languages:**



**Engine	Language**

**SQL Server	T-SQL (Transact-SQL)**

**Oracle	PL/SQL (Procedural Language/SQL)**

**MySQL	Standard SQL, with some MySQL-specific functions**

**PostgreSQL	Standard SQL, PL/pgSQL for procedural programming**



**Key point: The procedural extensions allow writing complex scripts, triggers, and stored procedures that standard SQL alone cannot handle.**



**4. Relationship Between Engine and Language**



**Each database engine supports specific dialects of SQL.**



**Standard SQL is a common base, but engines add custom functions, commands, and procedural capabilities.**



**This means a query written for one engine may need adjustment to run on another engine.**



**For example:**



**T-SQL is specific to SQL Server.**



**PL/SQL is specific to Oracle.**



**PostgreSQL and MySQL mostly follow ANSI SQL, but have engine-specific functions.**



**5. Can One Language Work Across Different Engines?**



**Standard SQL works across most engines for basic queries like SELECT, INSERT, UPDATE, DELETE.**



**Advanced features (stored procedures, triggers, specific functions) are often engine-specific.**



**There are database abstraction tools or ORMs (Object-Relational Mappers) that allow code to work with multiple engines by translating SQL differences behind the scenes.**



**Summary: Standard SQL = portable; procedural extensions = mostly engine-specific.**

**--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------**



**7- Can We Transfer a Database Between Engines?**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**



**1. Is it Possible to Migrate Between Engines?**



**Yes, it is possible to migrate a database from one engine to another (e.g., SQL Server → MySQL, Oracle → PostgreSQL), but it is not always straightforward.**



**Methods for migration include:**



**Export/Import: Export data in a common format (like CSV or SQL dump) and import it into the new engine.**



**Database Migration Tools: Tools like AWS Database Migration Service, Microsoft SSMA (SQL Server Migration Assistant), or Ora2PG (Oracle → PostgreSQL).**



**Manual Conversion: Rewrite schema, queries, and procedural code manually if automation is not fully compatible.**



**2. Challenges of Engine-to-Engine Migration**



**Migrating a database between engines involves several challenges:**



**Challenge	Explanation**

**Data types differences	Each engine has slightly different types. For example, DATETIME in SQL Server vs TIMESTAMP in PostgreSQL, or NUMBER in Oracle.**

**SQL dialect differences	Queries or stored procedures in T-SQL or PL/SQL may not run in MySQL/PostgreSQL without modification.**

**Procedural code	Triggers, functions, and stored procedures often require rewriting in the new engine’s procedural language (e.g., T-SQL → PL/pgSQL).**

**Constraints and indexes	Primary/foreign keys, unique constraints, and indexes may behave differently. Some features may not exist in the target engine.**

**Transaction handling	Differences in transaction isolation levels and locking mechanisms may require adjustments.**

**Performance tuning	Query optimization and indexing strategies may need to be adapted to the new engine.**

**3. Considerations Before Transferring**



**Before migrating, you should carefully analyze the database:**



**Schema Mapping**



**Compare table structures, columns, and data types.**



**Map incompatible types to suitable equivalents in the target engine.**



**Procedural Code**



**Identify stored procedures, triggers, and functions.**



**Rewrite them in the target engine’s language if necessary.**



**Constraints and Keys**



**Check primary keys, foreign keys, and unique constraints for compatibility.**



**Data Integrity \& Testing**



**Ensure data consistency after migration.**



**Run queries to verify that relationships and calculations remain correct.**



**Application Layer Adjustments**



**Applications using the database may need SQL query adjustments or changes to connection drivers.**



**Backup and Rollback Plan**



**Always keep a full backup of the original database.**



**Test migration in a staging environment before production transfer.**



