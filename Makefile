TAG := 18618cad563bf65848b64375b295421e014d4ae7

schema-update:
	curl https://raw.githubusercontent.com/tdlib/td/${TAG}/td/generate/scheme/td_api.tl 2>/dev/null > ./data/td_api.tl

generate-json:
	go run ./cmd/generate-json.go \
		-version "${TAG}" \
		-output "./data/td_api.json"

generate-code:
	go run ./cmd/generate-code.go \
		-version "${TAG}" \
		-outputDir "./client" \
		-package client \
		-functionFile function.go \
		-typeFile type.go \
		-unmarshalerFile unmarshaler.go
	go fmt ./...
