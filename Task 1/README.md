# random-seq – Task 1

Pure Bash script that prints the numbers **1 through 10 in random order**, each appearing exactly once.  
Includes a Makefile and two portable test cases.

---

## Build / Installation

No compilation required. Clone the repo and make the script executable:

```bash
git clone 
cd random-seq
chmod +x random_numbers.sh

Usage

./random_numbers.sh

Run the tests and linter with:

make test   # executes both test scripts
make lint   # shellcheck (optional)

Description
	1.	Numbers 1–10 are placed in a Bash array.
	2.	A Fisher–Yates shuffle is applied in-place, using Bash’s built-in $RANDOM.
	3.	The array is printed, one value per line, guaranteeing the set {1…10} appears exactly once in random order.
	4.	Tests (tests/output.sh, tests/multiple_random.sh) verify correctness, uniqueness and basic randomness.

Known Limitations / Bugs
	•	Randomness is driven by Bash’s pseudo-random generator—not cryptographically secure.
	•	The range is hard-coded to 1 10; change the nums=( … ) array for other ranges.
	•	make lint requires ShellCheck; if not installed, it is skipped gracefully.
