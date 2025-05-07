| Layer   | Metric                       | Why it matters                 |
|---------|-----------------------------|--------------------------------|
| Traffic | Requests per second (RPS)   | Capacity / back-pressure       |
| Traffic | Active connections          | Concurrency limits             |
| TLS     | Handshakes per second       | CPU cost of off-load           |
| TLS     | p95 handshake time (ms)     | Latency-spike indicator        |
| Latency | End-to-end p95 (ms)         | User experience                |
| CPU     | usr/sys/irq (%)             | Saturation / IRQ storms        |
| Memory  | Used (MB)                   | Leaks / cache pressure         |
| NIC     | Rx / Tx packets per second  | Near line-rate saturation      |
