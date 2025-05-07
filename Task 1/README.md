# random-seq – Task 1

Pure Bash script that prints the numbers **1 through 10 in random order**, each appearing exactly once.  
Includes a Makefile and two portable test cases.

---

## Build
```bash
git clone https://github.com/<your-user>/random-seq.git
cd random-seq
chmod +x random_numbers.sh ```

--- 

## Usage

./random_numbers.sh

Run the tests and the optional linter:

make test   # executes both test scripts
make lint   # shellcheck (optional)

--- 

## Description
	1.	Numbers 1–10 are stored in a Bash array.
	2.	An in-place Fisher–Yates shuffle is applied using Bash’s built-in $RANDOM.
	3.	The array is printed, one value per line, guaranteeing each number appears exactly once.
	4.	Tests (tests/output.sh, tests/multiple_random.sh) verify correctness, uniqueness and basic randomness.

---

##  Known Limitations / Bugs
	•	Randomness is driven by Bash’s pseudo-random generator — not cryptographically secure.
	•	The range is hard-coded to 1-10; edit nums=( … ) for other ranges.
	•	make lint requires ShellCheck; if it is not installed, the target is skipped gracefully.
