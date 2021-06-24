CREATE TABLE user (
	id			VARCHAR(36) PRIMARY KEY,
	username	VARCHAR(50) NOT NULL UNIQUE,
	password	VARCHAR(50) NOT NULL,
	email		VARCHAR(50) NOT NULL
);

CREATE TABLE stored_item (
	id			VARCHAR(36) PRIMARY KEY,
	name		VARCHAR(50) NOT NULL,
	description	VARCHAR(100) NOT NULL,
	created		DATETIME DEFAULT NOW NOT NULL,
	modified	DATETIME DEFAULT NOW NOT NULL,
	item_type	CHAR(2) NOT NULL CHECK (item_type IN ('NO', 'PA', 'PR')),
	user_id		VARCHAR(36) NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE note (
	item_id		VARCHAR(36) PRIMARY KEY,
	contents	LONGVARCHAR NOT NULL,
	
	FOREIGN KEY(item_id) REFERENCES stored_item(id)
);

CREATE TABLE password (
	item_id		VARCHAR(36) PRIMARY KEY,
	website		VARCHAR(100) NOT NULL,
	password	VARCHAR(50)	NOT NULL,
	
	FOREIGN KEY(item_id) REFERENCES stored_item(id)
);

CREATE TABLE profile (
	item_id		VARCHAR(36) PRIMARY KEY,
	firstname	VARCHAR(50) NOT NULL,
	lastname	VARCHAR(50)	NOT NULL,
	address		VARCHAR(100) NOT NULL,
	city		VARCHAR(50) NOT NULL,
	
	FOREIGN KEY(item_id) REFERENCES stored_item(id)
);