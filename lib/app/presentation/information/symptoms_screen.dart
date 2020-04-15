import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SymptomsScreen extends StatelessWidget {
  static const String _markdownData = '''
# Sobre a doença
---


## O que é coronavírus?



Coronavírus (CID10) é uma família de vírus que causam infecções respiratórias. O novo agente do coronavírus foi descoberto em 31/12/19 após casos registrados na China. Provoca a doença chamada COVID-19. Como nunca tivemos contato com o vírus antes, não temos imunidade.Ela causa uma infecção pulmonar. Nos casos mais leves, porém, parece um resfriado comum ou uma gripe leve. 

Os primeiros coronavírus humanos foram isolados pela primeira vez em 1937. No entanto, foi em 1965 que o vírus foi descrito como coronavírus, em decorrência do perfil na microscopia, parecendo uma coroa.

A maioria das pessoas se infecta com os coronavírus comuns ao longo da vida, sendo as crianças pequenas mais propensas a se infectarem com o tipo mais comum do vírus. Os coronavírus mais comuns que infectam humanos são o alpha coronavírus 229E e NL63 e beta coronavírus OC43, HKU1.



| **Período de incubação do coronavírus**                      |
| ------------------------------------------------------------ |
| Período de incubação é o tempo que leva para os primeiros sintomas aparecerem desde a infecção por coronavírus, que pode ser de **2 a 14 dias.** |
| **Como o coronavírus é transmitido?**                        |
| A transmissão acontece de uma pessoa doente para outra ou por contato próximo por meio de: |
| - O toque do aperto de mão é a principal forma de contágio; |
| - Gotículas de saliva; |
| - Espirro; |
| - Tosse; |
| - Catarro; |
| - Objetos ou superfícies contaminadas como celulares, mesas, maçanetas, brinquedos e teclados de computador etc. |
| **Quais são os sintomas do coronavírus?**                    |
| Os sintomas mais comuns são: Febre **E** Tosse **OU** Dificuldade para respirar; Entre outros sintomas gripais; **Se aparecerem os sintomas ligue para 136 ou procure um posto de saúde.** |
| **Como se proteger**                                         |
| Lave com frequência as mãos até a altura dos punhos, com água e sabão ou então higienize com álcool em gel 70%. Ao tossir ou espirrar, cubra nariz e boca com lenço ou com o braço, e não com as mãos.Evite tocar olhos, nariz e boca com as mãos não lavadas. Ao tocar, lave sempre as mãos como já indicado. Mantenha uma distância mínima cerca de 2 metros de qualquer pessoa tossindo ou espirrando. Evite abraços, beijos e apertos de mãos. Adote uma onda amigável sem contato físico, mas sempre com sorriso no rosto. Higienize com frequência o celular e brinquedos das crianças. Não compartilhe objetos de uso pessoal, como talheres, toalhas, pratos e copos. Evite aglomerações e mantenha os ambientes limpos e bem ventilados. Se estiver doente, evite contato físico com outras pessoas, principalmente, idosos e doentes crônicos e fique em casa até melhorar. Durma bem, tenha uma alimentação saudável e faça atividade física. |
| **Adianta tomar vacina contra a gripe?**                     |
| Não, mas evita que a pessoa tenha outros tipos de doenças respiratórias. Busque orientação de como vacinar em segurança. Em caso de fila, mantenha uma distância de, pelo menos, 2 metros dos demais, principalmente os idosos.Informe-se se na sua cidade haverá uma estratégia de vacinação diferenciada. **Ligue 136 ou entre em contato com a Secretaria de Saúde da sua cidade.** |
| **Quem corre mais risco?**                                   |
| Pessoas acima dos 60 anos e aquelas com doenças crônicas, como diabetes e doenças cardiovasculares. Esse público não deve viajar nem frequentar cinemas, shopping, shows e outros locais com aglomerações. A orientação é **FICAR EM CASA.** Caso utilize medicamento de uso contínuo, entre em contato com seu médico ou peça para algum familiar ir até o posto de saúde para buscar uma receita com validade ampliada, principalmente no período de outono e inverno. Isso reduz o trânsito desnecessário nos postos de saúde e farmácias. |
| **Já existe tratamento contra o coronavírus (COVID-19)?**    |
| Não. Os médicos tratam os sintomas para evitar o agravamento da doença e reduzir o desconforto. |

Fonte: https://coronavirus.saude.gov.br/




.
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
