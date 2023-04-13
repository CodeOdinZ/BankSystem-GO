CREATE TABLE accounts (
  id bigserial PRIMARY KEY,
  owner varchar NOT NULL,
  balance bigint NOT NULL,
  currency varchar NOT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  country_code int
);

CREATE TABLE entries (
  id bigserial PRIMARY KEY,
  account_id bigint,
  amount bigint NOT NULL,
  created_at timestamp DEFAULT now(),
  FOREIGN KEY account_id REFERENCES accounts(id),
  
);

CREATE TABLE transfers (
  id bigserial PRIMARY KEY,
  from_account_id bigint,
  to_account_id bigint,
  amount bigint,
  created_at timestamp DEFAULT now(),
  FOREIGN KEY from_account_id REFERENCES accounts(id),
  FOREIGN KEY to_account_id REFERENCES accounts(id)
);

CREATE INDEX own ON accounts (owner);

CREATE INDEX acid ON entries (account_id);

CREATE INDEX fromid ON transfers (from_account_id);

CREATE INDEX toid ON transfers (to_account_id);

CREATE INDEX fromto ON transfers (from_account_id, to_account_id);



-- COMMENT ON COLUMN "entries"."amount" IS 'can be negative or positve';

-- COMMENT ON COLUMN "transfers"."amount" IS 'it must be posotive';




