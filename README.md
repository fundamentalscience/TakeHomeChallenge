# 🛠️ TakeHomeChallenge

Two self-contained solutions for an interview take-home:

| Task | Topic | Short Pitch | Folder |
|------|-------|------------|--------|
| **1** | Bash scripting, testing | Print numbers **1-10** in random order, *no* repeats, 100 % Bash, with Makefile + tests | [`Task 1`](Task%201/) |
| **2** | Systems / SRE | **High-throughput TLS off-load proxy monitoring**<br>  • *Solution A* – full Zabbix dashboard<br>  • *Solution B* – pure-Bash collectors + cron/systemd | [`Task 2`](Task%202/) |

---

## ✨ Quick Start

```bash
# clone
git clone https://github.com/fundamentalscience/TakeHomeChallenge.git
cd TakeHomeChallenge

# Task 1: run & test
cd "Task 1"
make run   # prints random 1-10
make test  # green = all good

# Task 2: smoke-test Bash collectors
cd "../Task 2/Solution 2 With Scripts/monitoring-bash"
./monitor.sh   # creates logs/*.csv locally
