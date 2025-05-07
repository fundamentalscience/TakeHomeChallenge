.PHONY: run test lint

run:          ## Execute the script
	@bash random_numbers.sh

test:         ## Run all tests
	@bash tests/output.sh
	@bash tests/multiple_random.sh

lint:         ## Optional shell-lint pass
	@shellcheck random_numbers.sh tests/*.sh || true
