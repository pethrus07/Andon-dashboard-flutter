# Andon Dashboard

[English](README.md) · Português

## Status

Arquivado (novembro de 2026). Somente leitura. Um estudo que nunca chegou a ler um CLP real. Nada aqui é mantido.

## O que faz

Um painel estilo Andon em Flutter, em Full HD (1920x1080), de janeiro de 2026: turno atual, hora do turno, produção por setor em gráfico de barras (fl_chart) e seis indicadores triangulares. Uma classe `CLP` simula o CLP a cada 3 segundos; o plano era trocar por leitura real (Modbus TCP, OPC UA ou biblioteca do fabricante), o que não aconteceu.

## O que ficou de aprendizado

- Manter a tela lendo de uma única classe de dados deixou o simulador fácil de trocar, mesmo que a troca nunca tenha vindo.
- Painel de parede se desenha primeiro para uma resolução fixa; o layout aqui só mira 1920x1080.
- A classe de dados usa estado estático e timer próprio. Um projeto seguinte (Machine Monitor, depois Ware IoT) passou para uma interface de fonte de dados injetada, mais fácil de testar.

## Rodar localmente

```bash
flutter pub get
flutter run -d windows
```

## Testes

```bash
flutter test        # 1 teste de fumaça: o painel monta em 1920x1080 sem erro
```

## Arquitetura

Diagramas (casos de uso, processo e containers) em [docs/arquitetura/](docs/arquitetura/).

## Licença

MIT. Veja [LICENSE](LICENSE).
