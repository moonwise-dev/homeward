PACKAGES := app common server tool
DART_PACKAGES := common server tool

.PHONY: help
help:
	@echo "Homeward workspace commands"
	@echo ""
	@echo "  make get           Resolve dependencies for the whole workspace"
	@echo "  make analyze       Analyze every package"
	@echo "  make format        Format every package"
	@echo "  make format-check  Fail if any package is not formatted"
	@echo "  make test          Run tests in pure Dart packages"
	@echo "  make check         format-check, analyze, test"
	@echo "  make app-web       Run the app in Chrome"
	@echo "  make app-macos     Run the app on macOS"
	@echo "  make clean         Remove build outputs and resolved packages"

.PHONY: get
get:
	@flutter pub get

.PHONY: analyze
analyze:
	@flutter analyze --fatal-infos

.PHONY: format
format:
	@dart format $(PACKAGES)

.PHONY: format-check
format-check:
	@dart format --output=none --set-exit-if-changed $(PACKAGES)

.PHONY: test
test:
	@set -e; for dir in $(DART_PACKAGES); do \
		if [ -d $$dir/test ]; then \
			echo "==> dart test $$dir"; \
			(cd $$dir && dart test); \
		fi; \
	done

.PHONY: check
check: format-check analyze test

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
