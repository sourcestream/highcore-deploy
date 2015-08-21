This is a proxy role to provide abstraction layer between the app and it's monitoring server.
The app only needs to know it's monitoring host and standalone_checks it wants to execute, the rest is up to the monitoring-client role.
```yaml
  - role: ../roles/monitoring-client
    tags: monitoring-client
    monitoring_hostname: '127.0.0.1'
    standalone_checks:
       test_check:
        handler   : default
        command   : "/bin/bash -c 'echo Hello World'"
        interval  : 60
        standalone: true
    system_profile: true
    client_settings:
      system_profile:
        interval: 10
        handler: 'relay'
```