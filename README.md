
# 🏭 Andon Dashboard - Flutter + CLP

Dashboard industrial estilo **Andon**, desenvolvido em **Flutter**, preparado para integração direta com **CLPs industriais** via bibliotecas externas.

---

## 🚀 Funcionalidades

- Exibição em tempo real de:
  - Turno atual
  - Hora do turno
  - Produção por setor
  - Indicadores triangulares de desempenho
- Dashboard Full HD (1920x1080)
- Arquitetura preparada para:
  - Integração direta com CLP
  - Modbus TCP / OPC-UA / bibliotecas proprietárias
- Gráficos dinâmicos com **FL Chart**

---

## 🏗 Arquitetura

```
lib/
 ├── main.dart          → Interface principal (Dashboard)
 └── models/
     └── clp.dart       → Camada de integração com CLP (simulação / real)
```

---

## 🔌 Integração com CLP

A classe `CLP` foi projetada para permitir:

- Substituição direta da simulação por:
  - Leituras reais do CLP
  - Bibliotecas industriais
  - Protocolos industriais

### Fluxo previsto:
```
CLP → Biblioteca → Flutter UI
```

---

## 🖥 Requisitos

- Flutter SDK >= 3.x
- Windows / Linux / Android

---

## ▶️ Execução

```bash
flutter pub get
flutter run -d windows
```

---

## 🧠 Autor

Projeto desenvolvido por **Pedro Michael**  
Área: Automação • IA • Dashboards industriais • Integrações complexas

---

## 📌 Status

✔ Interface finalizada  
✔ Arquitetura pronta para integração  
⏳ Aguardando biblioteca CLP
