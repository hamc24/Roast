import express from "express";
import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();

// SQL Server Config
const pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD, //! DONT HARDCODE THIS USE ENV VARS
    database: process.env.MYSQL_DATABASE,
  })
  .promise();

async function getUsers() {
  const result = await pool.query("SELECT * FROM users");
  const rows = result[0];
  return rows;
}

async function getUser(id) {
  const [rows] = await pool.query(
    `SELECT * 
    FROM users
    WHERE id = ?`,
    [id] //We use the question mark to prevent SQL Injection attacks
  );
  return rows[0];
}

async function insertUser(firstName, lastName, userName, passWord) {}

const note = await getUser(1);
console.log(note);

export { pool };
