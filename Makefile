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
	@if [ -d public ]; then \
	  for o in $$(ls public); do \
	    rm -rf ./public/$${o} >/dev/null; \
	  done; \
	fi; \
	\
	if [ -d resources ]; then \
	  for o in $$(ls resources); do \
	    rm -rf ./resources/$${o} >/dev/null; \
	  done; \
	fi; \
	\
	if [ -f .hugo_build.lock ]; then \
	  rm -f .hugo_build.lock >/dev/null; \
	fi

.PHONY: preview
preview:
	@hugo server -D
