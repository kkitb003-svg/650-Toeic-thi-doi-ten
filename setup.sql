-- =====================================================
-- Token Ring Distributed System - Database Setup
-- For phpMyAdmin Manual Import
-- =====================================================

-- Create Database 1 (for Server/Node 1)
CREATE DATABASE IF NOT EXISTS db1 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db1;

CREATE TABLE IF NOT EXISTS server1 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation VARCHAR(50) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  value TEXT,
  timestamp BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create Database 2 (for Server/Node 2)
CREATE DATABASE IF NOT EXISTS db2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db2;

CREATE TABLE IF NOT EXISTS server2 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation VARCHAR(50) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  value TEXT,
  timestamp BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create Database 3 (for Server/Node 3)
CREATE DATABASE IF NOT EXISTS db3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db3;

CREATE TABLE IF NOT EXISTS server3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation VARCHAR(50) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  value TEXT,
  timestamp BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create Database 4 (for Server/Node 4)
CREATE DATABASE IF NOT EXISTS db4 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db4;

CREATE TABLE IF NOT EXISTS server4 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation VARCHAR(50) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  value TEXT,
  timestamp BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create Database 5 (for Server/Node 5)
CREATE DATABASE IF NOT EXISTS db5 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db5;

CREATE TABLE IF NOT EXISTS server5 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation VARCHAR(50) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  value TEXT,
  timestamp BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create Database 6 (for Server/Node 6)
CREATE DATABASE IF NOT EXISTS db6 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db6;

CREATE TABLE IF NOT EXISTS server6 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation VARCHAR(50) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  value TEXT,
  timestamp BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- Setup Complete
-- =====================================================
-- All 6 databases and tables are ready for token ring system
-- Databases: db1-db6
-- Tables: server1-server6 (one per database)
-- Supports: INSERT, DELETE, QUERY operations