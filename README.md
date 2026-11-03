# Andon Dashboard

English · [Português](README.pt-BR.md)

## Status

Archived (November 2026). Read-only. A study that never got a real PLC connection. Nothing here is maintained.

## What it does

A Full HD (1920x1080) Andon style dashboard in Flutter (January 2026): current shift, hour of the shift, production per sector in bar charts (fl_chart) and six triangle indicators. A `CLP` class simulates the PLC every 3 seconds; the plan was to replace it with a real reading (Modbus TCP, OPC UA or a vendor library), which never happened.

## What I learned

- Keeping the screen reading only from one data class made the simulator easy to swap, even if the swap never came.
- A wall dashboard is designed for one fixed resolution first; the layout here only targets 1920x1080.
- The data class uses static state and its own timer. A later project (Machine Monitor, then Ware IoT) moved to an injected data source interface, which is easier to test.

## Run locally

```bash
flutter pub get
flutter run -d windows
```

## Tests

```bash
flutter test        # 1 smoke test: the dashboard builds at 1920x1080 without errors
```

## Architecture

Diagrams (use cases, process and containers) in [docs/arquitetura/](docs/arquitetura/).

## License

MIT. See [LICENSE](LICENSE).
