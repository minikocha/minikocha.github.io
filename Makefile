.PHONY: add
add:
	@d="$$(date +'%Y-%m-%d')"; \
	n=1; \
	while [ -d "content/post/$${d}-$${n}" ]; do \
	  n=$$(expr $${n} + 1); \
	done; \
	hugo new post/$${d}-$${n}/index.md

.PHONY: clean
clean:
	@for o in $$(ls public 2>/dev/null); do \
	  rm -rf ./public/$${o} >/dev/null; \
	done; \
	\
	for o in $$(ls resources 2>/dev/null); do \
	  rm -rf ./resources/$${o} >/dev/null; \
	done; \
	\
	if [ -f .hugo_build.lock ]; then \
	  rm -f .hugo_build.lock >/dev/null; \
	fi

.PHONY: preview
preview:
	@hugo server -D
