.PHONY: superlinter
superlinter:
	docker run --rm \
		-e RUN_LOCAL=true \
		--env-file ".github/super-linter.env" \
		-w /tmp/lint -v "$(CURDIR):/tmp/lint" \
		github/super-linter:v5

.PHONY: shellcheck
shellcheck:
	docker run --rm -v "$(CURDIR):/mnt" koalaman/shellcheck:v0.9.0 action.sh
