build: npm konsens

RT=patch
RP=""

release:
	@echo "Making a '${RT}' release (change by setting RT=patch|minor|major)"
	@git  diff --quiet src || (echo "source directory not clean" && exit 1)
	@(npm run-script lint-fix && npm run-script lint-scss-fix) || (echo "fix your errors first" && exit 1)
	python3 .scripts/make_release.py ${RT} ${RP}

npm:
	npm ci
	npm install

konsens:
	npm run-script make

translate:
	python3 .scripts/update_translations.py $(TR)

publish:
	npm publish
