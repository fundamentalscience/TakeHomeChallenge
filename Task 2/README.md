# Task 2 – TLS Off-load Proxy Monitoring @ ≈ 25 k RPS  

This task designs and documents **two alternative monitoring solutions** for a high-throughput TLS off-load proxy (~23 000 requests / second):

| Variant | Directory | Stack | When to prefer |
|---------|-----------|-------|----------------|
| **Solution 1 – Zabbix** | `Solution 1 With Zabbix/` | Zabbix 7 LTS agent + server, ready-made template | Already run Zabbix and want deep, UI-driven dashboards & alerting |
| **Solution 2 – Scripts** | `Solution 2 With Scripts/` | Pure Bash scripts + cron + `mail` / `slack-cli` | Lightweight hosts or edge nodes where Zabbix agent/server are not available |

---

## Build / Installation
```
git clone https://github.com/<your-user>/TakeHomeChallenge.git
cd "../Task 2/Solution 2 With Scripts/monitoring-bash
chmod +x monitor.sh bin/*.sh
# run once for a smoke test
./monitor.sh
sudo cp monitoring-bash.service /etc/systemd/system/
sudo systemctl enable --now monitoring-bash.service
```
## Description

Metrics Collected
```
Alerting Strategy
	•	Warning at 90 % SLA, High at 100 % SLA breach.
	•	Multi-stage: soft trigger (5 min), hard trigger (15 min) to reduce flapping.
	•	Notifies on-call via e-mail + Slack webhook; escalates to phone after 30 min.
```
Architecture and flow diagrams are included as PNGs inside each solution folder.

## Known Limitations
```
Zabbix Requires Zabbix 7 agent; older 5.0 LTS lacks tls.* item keys.
Scripts Relies on /proc and ss; will need tweaks on FreeBSD/Alpine.
Both $RANDOM used in demo traffic generator is not production grade randomness.
```
