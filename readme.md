For creating (DATABASE) follow these commands


mysql -u root -p
//you have to enter your password

CREATE DATABASE carnaticdb;
EXIT;
//it creates a database 

mysql -u root -p carnaticdb < database/carnaticdb.sql
//change the name according to name written in index.js code


(FRONTEND)

cd frontend

npm install
npm start

(BACKEND)

cd backend

npm install
npm run dev