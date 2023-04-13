dockpg:
	docker run -d --name bank_DB -e POSTGRES_PASSWORD=pass -p 5432:5432 -it postgres
dockpgaccess:
	docker exec -it bank_DB /bin/bash

migrateup:
	migrate -path db/migration -database "postgresql://postgres:pass@localhost:5432/bankdb3?sslmode=disable" -verbose up 

migratedown:
	migrate -path db/migration -database "postgresql://root:pass@localhost:5432/bankDB?sslmode=disable" -verbose down 

