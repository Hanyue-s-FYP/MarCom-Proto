GENERATE_PKG_NAME=proto
GENERATE_DIR=../$(GENERATE_PKG_NAME)
export

compile_core_proto_python:
	mkdir -p $(GENERATE_DIR)
	python -m grpc_tools.protoc -I$(GENERATE_PKG_NAME)=. --python_out=..  --grpc_python_out=.. ./marcom_core.proto

compile_core_proto_go:
	mkdir -p $(GENERATE_DIR)
	protoc --go_out=$(GENERATE_DIR) \
    --go-grpc_out=$(GENERATE_DIR) --go-grpc_opt=paths=source_relative \
	--go_opt=paths=source_relative \
    ./marcom_core.proto
