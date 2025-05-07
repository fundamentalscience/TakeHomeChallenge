# monitoring-bash

Light-weight, “pure Bash” monitoring bundle designed for a high-throughput
TLS off-load proxy (~25 k RPS).  
No agents, no daemons—only GNU coreutils, curl, and OpenSSL.

## 1 – Features

* Traffic metrics (RPS, active connections)
* TLS handshake rate and p95 handshake time
* End-to-end p95 latency
* System resource usage (CPU, RAM, network)
* CSV output ready for mail alerts, InfluxDB line-protocol, Prometheus
  Pushgateway, etc.
* Cron-friendly and Systemd-friendly
* Log rotation out of the box

## 2 – Directory Layout

monitoring-bash/
├── bin/
│   ├── gather_rps.sh
│   ├── gather_tls.sh
│   ├── gather_latency.sh
│   ├── gather_sys.sh
│   └── push_metrics.sh         
├── config/
│   └── targets.conf            # list of URLs to probe
├── logs/                       # rolling *.csv files
├── monitor.sh                  # orchestration wrapper
├── cron.sample                 # drop into /etc/cron.d/
└── logrotate.sample            # drop into /etc/logrotate.d/

## 3 – Quick Start

```bash
git clone <your-repo> monitoring-bash
cd monitoring-bash
chmod +x monitor.sh bin/*.sh
# run once for a smoke test
./monitor.sh
sudo cp monitoring-bash.service /etc/systemd/system/
sudo systemctl enable --now monitoring-bash.service
