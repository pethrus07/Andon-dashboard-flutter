import 'dart:async';
import 'dart:math';

/// Classe responsável por simular o comportamento de um CLP industrial.
///
/// Esta classe abstrai completamente a camada de aquisição de dados,
/// permitindo no futuro substituir a simulação por comunicação real
/// com CLPs físicos via:
///  - Modbus TCP
///  - OPC UA
///  - MQTT
///  - APIs industriais
///
/// Toda a interface visual (dashboard ANDON) consome apenas esta classe,
/// garantindo desacoplamento entre frontend e hardware.
class CLP {
  /// Gerador de números aleatórios para simulação dos sinais
  static final Random _random = Random();

  /// Timer responsável por gerar ciclos periódicos de atualização
  static Timer? _timer;

  /// Turno atual da fábrica (1, 2 ou 3)
  static int turno = 1;

  /// Hora atual dentro do turno (1 a 8)
  static int horaTurno = 1;

  /// Valores exibidos nos triângulos do painel
  static int triangleTopLeft = 0;
  static int triangleBottomLeft = 0;
  static int triangleTopCenter = 0;
  static int triangleBottomCenter = 0;
  static int triangleTopRight = 0;
  static int triangleBottomRight = 0;

  /// Dados dos gráficos de barras (8 posições = 8 horas do turno)
  static List<double> leftPartData = List.filled(8, 0);
  static List<double> centerPartData = List.filled(8, 0);
  static List<double> rightPartData = List.filled(8, 0);

  /// Labels textuais dos gráficos (espelhando os valores)
  static List<String> chart1Labels = List.filled(8, '0');
  static List<String> chart2Labels = List.filled(8, '0');
  static List<String> chart3Labels = List.filled(8, '0');

  /// Inicia a simulação do CLP.
  ///
  /// Gera automaticamente novos dados a cada 3 segundos,
  /// simulando a leitura contínua de sensores industriais.
  static void iniciarSimulacao() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _gerarCiclo();
    });
  }

  /// Interrompe completamente a simulação.
  ///
  /// Utilizado principalmente em descarte de tela,
  /// desligamento da aplicação ou troca de modo operacional.
  static void pararSimulacao() {
    _timer?.cancel();
  }

  /// Executa um ciclo completo de atualização dos dados.
  ///
  /// Simula:
  ///  - Leitura de produção por hora
  ///  - Atualização dos indicadores visuais
  ///  - Mudança dinâmica de turno e hora ativa
  static void _gerarCiclo() {
    // Atualiza dados dos gráficos
    leftPartData = _gerarLista();
    centerPartData = _gerarLista();
    rightPartData = _gerarLista();

    // Atualiza os labels dos gráficos
    for (int i = 0; i < 8; i++) {
      chart1Labels[i] = leftPartData[i].toInt().toString();
      chart2Labels[i] = centerPartData[i].toInt().toString();
      chart3Labels[i] = rightPartData[i].toInt().toString();
    }

    // Atualiza indicadores dos triângulos
    triangleTopLeft = _random.nextInt(999);
    triangleBottomLeft = _random.nextInt(999);
    triangleTopCenter = _random.nextInt(999);
    triangleBottomCenter = _random.nextInt(999);
    triangleTopRight = _random.nextInt(999);
    triangleBottomRight = _random.nextInt(999);

    // Simula mudança de turno e hora ativa
    turno = _random.nextInt(3) + 1;
    horaTurno = _random.nextInt(8) + 1;
  }

  /// Gera uma lista simulada de produção por hora.
  ///
  /// Cada posição representa a produção de uma hora do turno.
  /// O valor máximo é limitado a 100 apenas para simulação visual.
  static List<double> _gerarLista() {
    return List.generate(8, (_) => _random.nextInt(100).toDouble());
  }
}
