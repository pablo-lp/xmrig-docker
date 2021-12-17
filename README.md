Docker image builder for XMRIG without donations on latest Ubuntu

*Config*

Edit run.sh file

*Install*

docker build -t xmrig .

*Start container*

docker run -v /dev/hugepages:/dev/hugepages -it xmrig

*Usage: xmrig [OPTIONS]*

    Network:
      -o, --url=URL                 URL of mining server
      -a, --algo=ALGO               mining algorithm https://xmrig.com/docs/algorithms
          --coin=COIN               specify coin instead of algorithm
      -u, --user=USERNAME           username for mining server
      -p, --pass=PASSWORD           password for mining server
      -O, --userpass=U:P            username:password pair for mining server
      -x, --proxy=HOST:PORT         connect through a SOCKS5 proxy
      -k, --keepalive               send keepalived packet for prevent timeout (needs pool support)
          --nicehash                enable nicehash.com support
          --rig-id=ID               rig identifier for pool-side statistics (needs pool support)
          --tls                     enable SSL/TLS support (needs pool support)
          --tls-fingerprint=HEX     pool TLS certificate fingerprint for strict certificate pinning
          --dns-ipv6                prefer IPv6 records from DNS responses
          --dns-ttl=N               N seconds (default: 30) TTL for internal DNS cache
          --daemon                  use daemon RPC instead of pool for solo mining
          --daemon-poll-interval=N  daemon poll interval in milliseconds (default: 1000)
          --self-select=URL         self-select block templates from URL
          --submit-to-origin        also submit solution back to self-select URL
      -r, --retries=N               number of times to retry before switch to backup server (default: 5)
      -R, --retry-pause=N           time to pause between retries (default: 5)
          --user-agent              set custom user-agent string for pool
          --donate-level=N          donate level, default 1%% (1 minute in 100 minutes)
          --donate-over-proxy=N     control donate over xmrig-proxy feature

    CPU backend:
          --no-cpu                  disable CPU mining backend
      -t, --threads=N               number of CPU threads, proper CPU affinity required for some optimizations.
          --cpu-affinity=N          set process affinity to CPU core(s), mask 0x3 for cores 0 and 1
      -v, --av=N                    algorithm variation, 0 auto select
          --cpu-priority=N          set process priority (0 idle, 2 normal to 5 highest)
          --cpu-max-threads-hint=N  maximum CPU threads count (in percentage) hint for autoconfig
          --cpu-memory-pool=N       number of 2 MB pages for persistent memory pool, -1 (auto), 0 (disable)
          --cpu-no-yield            prefer maximum hashrate rather than system response/stability
          --no-huge-pages           disable huge pages support
          --hugepage-size=N         custom hugepage size in kB
          --huge-pages-jit          enable huge pages support for RandomX JIT code
          --asm=ASM                 ASM optimizations, possible values: auto, none, intel, ryzen, bulldozer
          --argon2-impl=IMPL        argon2 implementation: x86_64, SSE2, SSSE3, XOP, AVX2, AVX-512F
          --randomx-init=N          threads count to initialize RandomX dataset
          --randomx-no-numa         disable NUMA support for RandomX
          --randomx-mode=MODE       RandomX mode: auto, fast, light
          --randomx-1gb-pages       use 1GB hugepages for RandomX dataset (Linux only)
          --randomx-wrmsr=N         write custom value(s) to MSR registers or disable MSR mod (-1)
          --randomx-no-rdmsr        disable reverting initial MSR values on exit
          --randomx-cache-qos       enable Cache QoS
          --astrobwt-max-size=N     skip hashes with large stage 2 size, default: 550, min: 400, max: 1200
          --astrobwt-avx2           enable AVX2 optimizations for AstroBWT algorithm
    API:
          --api-worker-id=ID        custom worker-id for API
          --api-id=ID               custom instance ID for API
          --http-host=HOST          bind host for HTTP API (default: 127.0.0.1)
          --http-port=N             bind port for HTTP API
          --http-access-token=T     access token for HTTP API
          --http-no-restricted      enable full remote access to HTTP API (only if access token set)

    TLS:
          --tls-gen=HOSTNAME        generate TLS certificate for specific hostname
          --tls-cert=FILE           load TLS certificate chain from a file in the PEM format
          --tls-cert-key=FILE       load TLS certificate private key from a file in the PEM format
          --tls-dhparam=FILE        load DH parameters for DHE ciphers from a file in the PEM format
          --tls-protocols=N         enable specified TLS protocols, example: "TLSv1 TLSv1.1 TLSv1.2 TLSv1.3"
          --tls-ciphers=S           set list of available ciphers (TLSv1.2 and below)
          --tls-ciphersuites=S      set list of available TLSv1.3 ciphersuites

    Logging:
      -S, --syslog                  use system log for output messages
      -l, --log-file=FILE           log all output to a file
          --print-time=N            print hashrate report every N seconds
          --no-color                disable colored output
          --verbose                 verbose output

    Misc:
      -c, --config=FILE             load a JSON-format configuration file
      -B, --background              run the miner in the background
      -V, --version                 output version information and exit
      -h, --help                    display this help and exit
          --dry-run                 test configuration and exit
          --export-topology         export hwloc topology to a XML file and exit
          --pause-on-battery        pause mine on battery power
          --pause-on-active=N       pause mine when the user is active (resume after N seconds of last activity)
          --stress                  run continuous stress test to check system stability
          --bench=N                 run benchmark, N can be between 1M and 10M
          --submit                  perform an online benchmark and submit result for sharing
          --verify=ID               verify submitted benchmark by ID
          --seed=SEED               custom RandomX seed for benchmark
          --hash=HASH               compare benchmark result with specified hash
          --no-dmi                  disable DMI/SMBIOS reader
