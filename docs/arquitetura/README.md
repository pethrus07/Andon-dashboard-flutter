# Arquitetura

Diagramas gerados a partir do Sinapse (o segundo cérebro do Pedro). Cada projeto tem três vistas,
cada uma numa notação padrão:

1. **Quem usa e para quê**: UML, diagrama de casos de uso.
2. **O processo principal**: BPMN 2.0, com raias por quem executa.
3. **A arquitetura**: modelo C4, nível 2 (containers).

## Andon Dashboard · painel de chão de fábrica

Painel Andon em Flutter, Full HD, que mostra turno, hora do turno, produção por setor e indicadores. A fonte dos dados fica isolada dentro do app: hoje gera sinais simulados, e está pronta para trocar pelo CLP real.

### Quem usa e para quê (UML)

![Casos de uso · Andon Dashboard · painel de chão de fábrica](./andon-dashboard-flutter-1-casos-de-uso.svg)

### Um ciclo de atualização do painel (BPMN 2.0)

![Processo · Andon Dashboard · painel de chão de fábrica](./andon-dashboard-flutter-2-processo.svg)

### Arquitetura (C4, containers)

![Arquitetura · Andon Dashboard · painel de chão de fábrica](./andon-dashboard-flutter-3-arquitetura.svg)

Editável: [`andon-dashboard-flutter.excalidraw`](./andon-dashboard-flutter.excalidraw), abre em [excalidraw.com](https://excalidraw.com) ou no VS Code com a extensão Excalidraw.

A fonte destes arquivos é o vault do Sinapse (`09-DESENHOS/`); alterações feitas aqui são sobrescritas na próxima publicação.
