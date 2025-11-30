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

