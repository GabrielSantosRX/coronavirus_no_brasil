import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SourcesScreen extends StatelessWidget {
  static const String _markdownData = '''
# Fonte de Dados
---
Todos os dados apresentados são uma compilação de três fontes publicas e confiáveis:


### Covid19br
- Site: https://covid19br.wcota.me/
- Fonte: https://github.com/wcota/covid19br
- Twitter: [@wlcota](https://twitter.com/wlcota)
- Agradecimentos a **Wesley Cota** e demais colaboradores


### Brasil.io
- Site: https://brasil.io/dataset/covid19/caso
- Fonte: https://github.com/turicas/covid19-br
- Twitter: [@turicas](https://twitter.com/turicas)
- Agradecimentos a **Álvaro Justen** e demais colaboradores


### Ministério da Saúde
- Site: https://covid.saude.gov.br/
- Twitter: [@minsaude](https://twitter.com/minsaude)
- Agradecimentos a toda equipe responsável



---



## Sobre o Aplicativo

O código fonte de aplicativo tem o código aberto:
- Contribuído por **Gabriel Araujo dos Santos**
- Twitter: [@GabrielSantosRX](https://twitter.com/GabrielSantosRX)
- Repositório: 
https://github.com/GabrielSantosRX/coronavirus_no_brasil







''';

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Markdown(
          controller: controller,
          selectable: true,
          data: _markdownData,
        ),
      ),
    );
  }
}
