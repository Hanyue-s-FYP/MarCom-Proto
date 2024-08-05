compile_simulation_python:
	mkdir ../proto_simulation
	python -m grpc_tools.protoc -I. --python_out=../proto_simulation  --grpc_python_out=../proto_simulation ./simulation.proto

GOIMPORT=github.com/Marcom-Backend/proto_simulation
compile_simulation_go:
	mkdir ../proto_simulation
	protoc --go_out=../proto_simulation --go_opt=paths=source_relative \
    --go-grpc_out=../proto_simulation --go-grpc_opt=paths=source_relative \
	--go-opt=Msimulation.proto=$(GOIMPORT) \
    ./simulation.proto
