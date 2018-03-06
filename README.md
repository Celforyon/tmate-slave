# Documentation
## Environment variables
| Name             | Default |                                                     |
| ---------------- | ------- | --------------------------------------------------- |
| TMATE_KEYS_DIR   | "/keys" | the directory where keys are stored                 |
| TMATE_PORT       | 2222    | the port |
| TMATE_HOSTNAME   | ""    | the hostname |

# Launch
```
docker run --privileged --name tmate-slave -d -e TMATE_HOSTNAME=$(hostname -s) -v /keys:/keys:rw celforyon/tmate-slave
```
