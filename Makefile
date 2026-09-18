PACKAGES := app common server tool
DART_PACKAGES := common server tool
CODEGEN_PACKAGES := app common server
SOURCE_DIRS := $(wildcard $(foreach package,$(PACKAGES),$(package)/lib $(package)/bin $(package)/test $(package)/tool))
SERVER_BINARY := server/build/server
SERVER_IMAGE := homeward-server
FIREBASE_PROJECT := homeward-genui
REGION := europe-north1
SERVER_SERVICE := homeward-server
SERVER_ACCOUNT := $(SERVER_SERVICE)@$(FIREBASE_PROJECT).iam.gserviceaccount.com
SERVER_URL := https://homeward-server-1065509330520.europe-north1.run.app
SERVER_REGISTRY_IMAGE := $(REGION)-docker.pkg.dev/$(FIREBASE_PROJECT)/homeward/server:$(shell git rev-parse --short HEAD)

.PHONY: help
help:
	@echo "Homeward workspace commands"
	@echo ""
	@echo "  make get           Resolve dependencies for the whole workspace"
	@echo "  make hooks         Run make check before every git push"
	@echo "  make analyze       Analyze every package"
	@echo "  make format        Format every package"
	@echo "  make format-check  Fail if any package is not formatted"
	@echo "  make test          Run tests in pure Dart packages"
	@echo "  make check         format-check, analyze, test, markets-check, catalog-check"
	@echo "  make markets-check Check rule packs, rate snapshots, and living costs"
	@echo "  make catalog       Regenerate the catalog document, model skill, and reference"
	@echo "  make catalog-check Fail if catalog outputs are stale or an example is invalid"
	@echo "  make codegen       Run build_runner in common and server"
	@echo "  make iso-4217      Regenerate the ISO 4217 currency table from SIX"
	@echo "  make a2ui-schemas  Vendor the pinned A2UI v0.9 basic catalog and common types"
	@echo "  make territories   Regenerate country and subdivision names from CLDR"
	@echo "  make emulator      Run the Firestore emulator on port 8081"
	@echo "  make server-dev    Run the server locally with hot reload"
	@echo "  make probe         Send MESSAGE as a live turn to SERVER with the key from ~/.config/homeward/gemini_key"
	@echo "  make server-build  Cross-compile the server for linux/x64"
	@echo "  make server-image  Build the server container image"
	@echo "  make server-image-run  Run the server container image on port 8080"
	@echo "  make deploy-server  Push the image tagged with the commit and deploy Cloud Run"
	@echo "  make deploy-web     Build the Wasm web app and deploy Firebase Hosting"
	@echo "  make app-web       Run the app in Chrome"
	@echo "  make app-macos     Run the app on macOS"
	@echo "  make clean         Remove build outputs and resolved packages"

.PHONY: get
get:
	@flutter pub get

.PHONY: hooks
hooks:
	@git config core.hooksPath tool/githooks

.PHONY: analyze
analyze:
	@flutter analyze --fatal-infos

.PHONY: format
format:
	@dart format $(SOURCE_DIRS)

.PHONY: format-check
format-check:
	@dart format --output=none --set-exit-if-changed $(SOURCE_DIRS)

.PHONY: test
test:
	@set -e; for dir in $(DART_PACKAGES); do \
		if [ -d $$dir/test ]; then \
			echo "==> dart test $$dir"; \
			(cd $$dir && dart test); \
		fi; \
	done
	@echo "==> flutter test app"
	@cd app && flutter test

.PHONY: check
check: format-check analyze test markets-check catalog-check

.PHONY: markets-check
markets-check:
	@dart run tool/bin/markets_check.dart markets

.PHONY: catalog
catalog:
	@dart run tool/bin/generate_catalog.dart .

.PHONY: catalog-check
catalog-check:
	@dart run tool/bin/catalog_check.dart .

.PHONY: codegen
codegen:
	@set -e; for dir in $(CODEGEN_PACKAGES); do \
		echo "==> build_runner $$dir"; \
		(cd $$dir && dart run build_runner build --delete-conflicting-outputs); \
	done

.PHONY: iso-4217
iso-4217:
	@dart run tool/bin/generate_iso_4217.dart common/lib/money/generated/iso_4217.dart
	@dart format common/lib/money/generated/iso_4217.dart

.PHONY: a2ui-schemas
a2ui-schemas:
	@dart run tool/bin/vendor_a2ui_schemas.dart common/lib/a2ui/generated/a2ui_v09_schemas.dart
	@dart format common/lib/a2ui/generated/a2ui_v09_schemas.dart

.PHONY: territories
territories:
	@dart run tool/bin/generate_territories.dart common/lib/geo/generated/country_names.dart server/lib/markets/generated/subdivision_names.dart
	@dart format common/lib/geo/generated/country_names.dart server/lib/markets/generated/subdivision_names.dart

.PHONY: emulator
emulator:
	@firebase emulators:start --only firestore --project $(FIREBASE_PROJECT)

.PHONY: server-dev
server-dev:
	@HOMEWARD_APP_CHECK_ENFORCED=false GOOGLE_CLOUD_PROJECT=$(FIREBASE_PROJECT) dart run --enable-vm-service server/tool/dev.dart

.PHONY: probe
probe:
	@dart run tool/bin/probe_turn.dart $(or $(SERVER),http://localhost:8080) "$(or $(MESSAGE),We are a couple in Stockholm looking at a 3-room flat in Södermalm for about 4.5 million kronor)"

.PHONY: server-build
server-build:
	@mkdir -p $(dir $(SERVER_BINARY))
	@dart compile exe server/bin/server.dart --target-os linux --target-arch x64 -o $(SERVER_BINARY)

.PHONY: server-image
server-image: server-build
	@docker build --platform linux/amd64 -f server/Dockerfile -t $(SERVER_IMAGE) .

.PHONY: server-image-run
server-image-run: server-image
	@docker run --rm --platform linux/amd64 -p 8080:8080 -e HOMEWARD_APP_CHECK_ENFORCED=false -e GOOGLE_CLOUD_PROJECT=$(FIREBASE_PROJECT) $(SERVER_IMAGE)

.PHONY: clean-tree
clean-tree:
	@test -z "$$(git status --porcelain)" || (echo "Commit or stash changes first: images are tagged with the commit" && exit 1)

.PHONY: deploy-server
deploy-server: clean-tree server-image
	@docker tag $(SERVER_IMAGE) $(SERVER_REGISTRY_IMAGE)
	@docker push $(SERVER_REGISTRY_IMAGE)
	@gcloud run deploy $(SERVER_SERVICE) --project $(FIREBASE_PROJECT) --region $(REGION) \
		--image $(SERVER_REGISTRY_IMAGE) --service-account $(SERVER_ACCOUNT) --no-invoker-iam-check \
		--min-instances 0 --max-instances 1 --concurrency 40 --timeout 300 \
		--set-env-vars GOOGLE_CLOUD_PROJECT=$(FIREBASE_PROJECT),HOMEWARD_PUBLIC_URL=$(SERVER_URL) --quiet

.PHONY: deploy-web
deploy-web:
	@cd app && flutter build web --wasm
	@firebase deploy --only hosting --project $(FIREBASE_PROJECT)

.PHONY: app-web
app-web:
	@cd app && flutter run -d chrome

.PHONY: app-macos
app-macos:
	@cd app && flutter run -d macos

.PHONY: clean
clean:
	@cd app && flutter clean
	@rm -rf .dart_tool $(addsuffix /.dart_tool,$(DART_PACKAGES))
