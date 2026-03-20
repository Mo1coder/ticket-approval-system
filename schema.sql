-- database schema for ticket approval system  

CREATE TABLE users (  
    id SERIAL PRIMARY KEY,  
    username VARCHAR(50) NOT NULL UNIQUE,  
    email VARCHAR(100) NOT NULL UNIQUE,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

CREATE TABLE tickets (  
    id SERIAL PRIMARY KEY,  
    user_id INT REFERENCES users(id),  
    title VARCHAR(255) NOT NULL,  
    description TEXT,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    status VARCHAR(50) NOT NULL DEFAULT 'pending'  
);  

CREATE TABLE approvals (  
    id SERIAL PRIMARY KEY,  
    ticket_id INT REFERENCES tickets(id),  
    user_id INT REFERENCES users(id),  
    approved BOOLEAN,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

CREATE TABLE audit_logs (  
    id SERIAL PRIMARY KEY,  
    action VARCHAR(255),  
    user_id INT REFERENCES users(id),  
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  
