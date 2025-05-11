.PHONY: superlinter
superlinter:
	docker run --rm \
		--platform linux/amd64 \
		-e RUN_LOCAL=true \
		-e SHELL=/bin/bash \
		--env-file ".github/super-linter.env" \
		-w /tmp/lint -v "$(CURDIR):/tmp/lint" \
		ghcr.io/super-linter/super-linter:v7

.PHONY: shellcheck
shellcheck:
	docker run --rm -v "$(CURDIR):/mnt" koalaman/shellcheck:v0.10.0 action.sh
