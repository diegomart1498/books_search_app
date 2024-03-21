part of '../package.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormKey = GlobalKey<FormBuilderState>();
  final requiredField = FormValidatorsUtility.requiredField;

  Future<void> _onLoginToAccount() async {
    final GlobalKey<FormBuilderState> key = loginFormKey;
    final bool isValid = key.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final String email = key.getStringTrimmed('email');
    final String password = key.getStringTrimmed('password');

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    await loginProvider.onLogin(email: email, password: password);
    if (mounted) context.go(HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: FormBuilder(
        key: loginFormKey,
        child: _scrollView(),
      ),
    );
  }

  Widget _scrollView() {
    return SingleChildScrollView(
      child: Padding(
        padding: paddingH24,
        child: _bodyConstrained(),
      ),
    );
  }

  Widget _bodyConstrained() {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: Breakpoint.tablet),
        child: _itemList(),
      ),
    );
  }

  Widget _itemList() {
    return Column(
      children: [
        gapH28,
        _userInfoText(),
        gapH20,
        _emailTextField(),
        gapH20,
        _passwordTextField(),
        gapH20,
        _loginButton(),
        gapH28,
      ],
    );
  }

  Widget _userInfoText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Información de usuario',
        style: context.textStyles.bodyText1.bold.grey,
      ),
    );
  }

  Widget _emailTextField() {
    return CustomFormBuilderTextField(
      formName: 'email',
      label: 'Correo electrónico',
      inputFormatter: InputFormatter.email,
      keyboardType: TextInputType.emailAddress,
      validator: FormValidatorsUtility.emailRequired,
    );
  }

  Widget _passwordTextField() {
    return CustomFormBuilderTextField(
      formName: 'password',
      label: 'Contraseña',
      validator: FormValidatorsUtility.passwordRequired,
    );
  }

  Widget _loginButton() {
    return Align(
      child: FilledButton(
        onPressed: _onLoginToAccount,
        child: const Text('Ingresar'),
      ),
    );
  }
}
