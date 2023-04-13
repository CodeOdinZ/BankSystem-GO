package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

var test_queries *Queries

const (
	dbDriver = "postgres"
	dbSource = "postgresql://postgres:pass@localhost:5432/bankdb3?sslmode=disable"
)

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db: ", err)
	}
	test_queries = New(conn)
	os.Exit(m.Run())
}
