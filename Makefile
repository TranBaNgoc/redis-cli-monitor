################################################################################

# This Makefile generated by GoMakeGen 1.3.0 using next command:
# gomakegen .
#
# More info: https://kaos.sh/gomakegen

################################################################################

.DEFAULT_GOAL := help
.PHONY = fmt vet all clean git-config deps help

################################################################################

all: redis-cli-monitor ## Build all binaries

redis-cli-monitor: ## Build redis-cli-monitor binary
	go build redis-cli-monitor.go

install: ## Install all binaries
	cp redis-cli-monitor /usr/bin/redis-cli-monitor

uninstall: ## Uninstall all binaries
	rm -f /usr/bin/redis-cli-monitor

git-config: ## Configure git redirects for stable import path services
	git config --global http.https://pkg.re.followRedirects true

deps: git-config ## Download dependencies
	go get -d -v pkg.re/essentialkaos/ek.v11

fmt: ## Format source code with gofmt
	find . -name "*.go" -exec gofmt -s -w {} \;

vet: ## Runs go vet over sources
	go vet -composites=false -printfuncs=LPrintf,TLPrintf,TPrintf,log.Debug,log.Info,log.Warn,log.Error,log.Critical,log.Print ./...

clean: ## Remove generated files
	rm -f redis-cli-monitor

help: ## Show this info
	@echo -e '\n\033[1mSupported targets:\033[0m\n'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[33m%-19s\033[0m %s\n", $$1, $$2}'
	@echo -e ''
	@echo -e '\033[90mGenerated by GoMakeGen 1.3.0\033[0m\n'

################################################################################
