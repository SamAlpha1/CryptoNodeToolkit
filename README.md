# CryptoNodeToolkit

Small operational toolkit for inspecting and validating Web3/node hosts on Ubuntu.

## Included checks
- CPU, memory and disk summary
- Docker availability and running containers
- systemd services matching a configurable pattern
- TCP reachability for a configurable RPC endpoint
- optional JSON-like compact output for automation

## Usage
```bash
chmod +x node-toolkit.sh
./node-toolkit.sh

SERVICE_PATTERN=node RPC_HOST=127.0.0.1 RPC_PORT=8545 ./node-toolkit.sh
```

The toolkit is read-only by default and does not alter node configuration.

---

## More from SamAlpha1

Before running unfamiliar GitHub or Web3 code, scan the account and its public repositories with **[GitHub Trust Auditor](https://samalpha1.github.io/GitHubTrustAuditor/)**.

Maintained by **[SamAlpha1](https://github.com/SamAlpha1)** · Follow **[@samalpha_ on X](https://x.com/samalpha_)**
