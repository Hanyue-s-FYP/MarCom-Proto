GENERATE_PKG_NAME=proto_simulation
GENERATE_DIR=../$(GENERATE_PKG_NAME)
GOIMPORT=github.com/Hanyue-s-FYP/Marcom-Backend/$(GENERATE_PKG_NAME)
export

compile_simulation_python:
	mkdir $(GENERATE_DIR)
	python -m grpc_tools.protoc -I. --python_out=$(GENERATE_DIR)  --grpc_python_out=$(GENERATE_DIR) ./simulation.proto

compile_simulation_go:
	mkdir $(GENERATE_DIR)
	protoc --go_out=$(GENERATE_DIR) --go_opt=paths=source_relative \
    --go-grpc_out=$(GENERATE_DIR) --go-grpc_opt=paths=source_relative \
	--go_opt=Msimulation.proto=$(GOIMPORT) \
    ./simulation.proto
