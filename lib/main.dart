/* Esta seção do código apresenta a importação da biblioteca
necessária para a utilização dos widgets material.dart.
*/
import 'package:flutter/material.dart';

/* Esta seção apresenta o método main(). Este executa o método
runApp(), cujo parâmetro é o objeto MyApp, que é a aplicação em sim.
*/

void main() => runApp(const MyApp());

/* Nessa seção do código, o objeto MyApp implemento a classe
StatelessWidget e especifica uma variável title, que ar-
mazena o título da aplicação. Em seguida o método build()
é sobrescrito. Como retorno, tem-se o objeto MaterialApp,
que inicialmente conta com duas propriedades (title, home).
A propriedade title especifica o texto da barra de título
e o home recebe o objeto Scafoold. Esse widget, Scaffold,
tem, basicamente, um barra de título AppBar (propriedade
appBar) e um corpo (propriedade body), em que sera montada
a interface do usuário. É usado para o desenvolvimento de 
layouts de teles.
*/

class MyApp extends StatelessWidget {
	const MyApp({Key? key})	: super(key: key);
	static const String _title = 'Interface do Usuário';

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: _title,
			home: Scaffold(
				appBar: AppBar(
					title: const Text(_title)
				),
				body: const MyStatefulWidget(),
			),
		);
	}
}

/* Como os widgets na interface a ser criada terão os seus
estados alterados, é necessário implementar um objeto que 
estenda a classe StatefulWidget. A classe MyStatefullWidget
returnará uma nova instância sempre que o estado for alte-
rado na aplicação. Em seguida, o método createState cria o 
objeto tipo State.
*/

class MyStatefulWidget extends StatefulWidget {
	const MyStatefulWidget({Key? key}) : super (key: key);
	
	@override
	State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/* Declaração de uma variável tipo enumeration (enum), composta
de três valores usados no Radio Widget.
*/

enum radioValue { carreto, retirada, correio }

/* Implementação do objeto tipo State.
*/

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

	/* Declaração das variáveis de controler que armazenarão 
	os valores de widget tipo Dropdown, Slider, TextField, 
	Checkbox e Radio. É importante notar que, para armazenar
	os valores do TextField, foi usados o widget TextEditing-
	Controller. Esse widget compreende a alteração no campo de
	texto editável, TextField, e aciona o listener. O listener, 
	por sua vez, consegue entender o que foi digitado e capturar
	a informação. Há uma avaliação para verificar se a variável
	radioValue não é nula e, então, é atribuído um valor inicial
	a entregaValue.
	*/

	var dropdownValue = "Centro";
	final textFiledValue = TextEditingController();
	double currentSliderValue = 1;
	bool isChecked = false;
	var checkboxValue;
	var valueRadio;
	radioValue? entregaValue = radioValue.correio;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Column (
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget> [
						Spacer(),

	/* Nesta seção, será montado o campo para o preenchimento do 
	nome do produto. Nota que há um widget Text somente para inse-
	rir um rótulo de orientação. No TextField temos a propriedade
	controller que armazena o que esta sendo digitado no campo,
	uma propriedade decoration, para estilização e hint para inse-
	rir uma informação inicial na caixa. Spacer() cria áreas de 
	espaçamento entre as seções.
	*/ 

						Text(
							"Preenche com o nome do Produto:",
							style: TextStyle(
								fontSize: 20.0,
							),
						),
						TextField(
							controller: textFiledValue,
							decoration: InputDecoration(
								hintText: "Produto",
								suffixIcon: Icon(
									Icons.portrait_rounded
								),
							),
						),
						Spacer(),
	/* Para a determinação da quantidade do produto, foi usado o
	Widget Slider com a propriedade value. Esta terá a variável
	currentSliderValue, que armazenará o valor atual do Slider,
	o tamanho, no mínimo nenhum produto(0) e no máximo 100. A divi-
	são do Slide foi em 100, pois, assim, os valores da barra são
	incrementados de 1 a 1. A propriedade label mostra informações
	na tela e a propriedade onChanged aciona o método setState() 
	sempre que houver alteração na barar de Slider e atribui o valor
	atual á variável currentSliderValue. Além disso, há o widget
	Text, de inserção de rótulo do objeto.
	*/
					Text(
						"Defina a quantidade:",
						style: TextStyle(
							fontSize: 20.0,
						),
					),
					Slider(
						value: currentSliderValue,
						min: 0,
						max: 100,
						divisions: 100,
						label: currentSliderValue.round().toString(),
						onChanged: (double value) {
							setState(() {
								 currentSliderValue = value; 
							}
							);
						},
					),
					Spacer(),	
	/* ListTile cria uma lista de informações, nesse caso a lista
	foi um widget tipo Radio. Note que a propriedade title do 
	ListeTile cria os textos do Radio e o objeto Radio é passado 
	com as seguintes propriedades: value, que determina o valor, 
	groupValue, que determina o agrupamento e onChanged que atribui
	valores ás variáveis para marcar a opção selecionada, e radio-
	Value que armazena o texto da opção.
	*/

					Text(
						"Escolha o tipo de entrega:",
						style: TextStyle(
							fontSize: 20.0,
						),
					),
					Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget> [
							ListTile(
								title: const Text('Carreto'),
								leading: Radio<radioValue>(
									value: radioValue.carreto,
									groupValue: entregaValue,
									onChanged: (radioValue? value) {
										setState(() {
											entregaValue = value;
											valueRadio = "Carreto";
										}
										);
									},
								),
							),
							ListTile(
                title: const Text('Retirada'),
                leading: Radio<radioValue>(
                  value: radioValue.retirada,
                  groupValue: entregaValue,
                  onChanged: (radioValue? value) {
                    setState(() {
                      entregaValue = value;
                      valueRadio = "Retirada";
                    }
                    );
                  },
                ),
              ),
							ListTile(
                title: const Text('Correio'),
                leading: Radio<radioValue>(
                  value: radioValue.correio,
                  groupValue: entregaValue,
                  onChanged: (radioValue? value) {
                    setState(() {
                      entregaValue = value;
                      valueRadio = "Correio";
                    }
                    );
                  },
                ),
              ),

						],
					),
					Spacer(),
/* No DropdownWidget foi usado as propriedade icon, para a 
	inserção de um ícone no objeto, e value, para armazenar o
	valor atual do objeto. Style foi usado para estilização do
	texto e o método onChanged foi usado para capturar o novo 
	valor da caixa sempre que houver uma interação do usuário.
	Em seguida foi criado uma lista de items e com map elas 
	foram mapeadas e aprensentadas. 
*/
		
					Text(
						"Escolha a região:",
						style: TextStyle(
							fontSize: 20.0,
						),
					),
					Spacer(),
					DropdownButton<String>(
						value: dropdownValue,
						icon: const Icon(
							Icons.arrow_downward
						),
						iconSize: 24,
						elevation: 16,
						style: const TextStyle(
							color: Colors.deepPurple,
						),
						underline: Container(
							height: 2,
							color: Colors.deepPurpleAccent,		
						),
						onChanged: (newValue) {
							setState(() {
								dropdownValue = newValue!;
							}
							);
						},
						items: <String>['Sul', 'Norte', 'Centro', 'Leste', 'Oeste']
							.map<DropdownMenuItem<String>>((String value) {
								return DropdownMenuItem<String>(
									value: value,
									child: Text(value),
							);
							}
						).toList(),
					),
					Spacer(),
	/* No Checkbox, not que foram usadas as propriedades checkColor, 
	para determinar a cor do objeto quando estiver selecionado, value
	que recebe a variável isChecked do tipo bool, e a propriedade 
	onChanged que determina o estado da caixa de verificação.
	*/

					Text(
						"Deseja receber promoções via e-mail?",
						style: TextStyle(
							fontSize: 20.0,
						),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget> [
							Checkbox(
								checkColor: Colors.black,
								value: isChecked,
								onChanged: (bool? value) {
									setState(() {
										isChecked = value!;
										if (isChecked == true) {
											checkboxValue = "Aceito";
										}
										else {
											checkboxValue = "Não Aceito";
										}
									}
									);
								},
							),
							Text(
								"Sim, eu aceito receber promoções via e-mail.",
							),
						],
					),
					Spacer(),
	/* Por fim um TextButton para testar a captura das informações.*/
					
					Divider(),
					Spacer(),
					TextButton(
						style: TextButton.styleFrom(
							backgroundColor: Colors.blueGrey,
							elevation: 15,
							shadowColor: Colors.grey
						),
						child: Text(
							"Cadastrar",
							style: TextStyle(
								color: Colors.white,
							),
						),
						onPressed: () {
							String produto = textFiledValue.text.toString();
							print(
								"O produto selecionado foi: " +
								produto + 
								", mas a quantidade de produtos escolhida foi " +
								currentSliderValue.toStringAsFixed(0) +
								". O pedido será entregue via " +
								valueRadio + 
								". Já a região para entrega será " +
								dropdownValue +
								". O cliente aceita o envio de promoções: " +
								checkboxValue
							);
						}
					),
					Spacer(),
					],
				),
			),
		);
	}	
}
