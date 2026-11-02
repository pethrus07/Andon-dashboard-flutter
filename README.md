[Português](README.pt-BR.md)

# Andon Dashboard

> **Archived (2026-11).** Read-only. A study that never got a real PLC connection. Nothing here is maintained.

## What it was

A Full HD (1920x1080) Andon style dashboard in Flutter (January 2026): current shift, hour of the shift, production per sector in bar charts (fl_chart) and six triangle indicators. A `CLP` class simulates the PLC every 3 seconds; the plan was to replace it with a real reading (Modbus TCP, OPC UA or a vendor library), which never happened.

## What I learned

- Keeping the screen reading only from one data class made the simulator easy to swap, even if the swap never came.
- A wall dashboard is designed for one fixed resolution first; the layout here only targets 1920x1080.
- The data class uses static state and its own timer. A later project (Machine Monitor, then Ware IoT) moved to an injected data source interface, which is easier to test.

## Run and test

```bash
flutter pub get
flutter run -d windows
flutter test        # 1 smoke test: the dashboard builds at 1920x1080 without errors
```

## License

All rights reserved.
