-- comments schema
CREATE TABLE comment (
  id SERIAL PRIMARY KEY,
  Text TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE
);
--user schema
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  Name VARCHAR(255) UNIQUE NOT NULL,
  Photo VARCHAR(255) NOT NULL,
  Bio TEXT NOT NULL,
  PostsCounter INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  foreign key (id) references posts(user_id) on delete cascade,
    foreign key (id) references comment(user_id) on delete cascade, 
    foreign key (id) references likes(user_id) on delete cascade
);
--post schema
CREATE TABLE posts (
  iAuthorId SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  Text TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  commentsCounter INTEGER NOT NULL DEFAULT 0,
    likesCounter INTEGER NOT NULL DEFAULT 0,
    foreign key (id) references comment(post_id) on delete cascade,
    foreign key (id) references likes(post_id) on delete cascade
);
--like shema
CREATE TABLE likes (
  post_id SERIAL PRIMARY KEY,
  user_id SERIAL PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);
