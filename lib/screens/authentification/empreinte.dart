import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/consts/const.dart';

class EmpreinteDigitale extends StatefulWidget {
  const EmpreinteDigitale(
      {super.key, required this.number, required this.nextPage});
  final String number;
  final Widget nextPage;

  @override
  State<EmpreinteDigitale> createState() => _EmpreinteDigitaleState();
}

class _EmpreinteDigitaleState extends State<EmpreinteDigitale> {
  late Size mediaSize;
  late final LocalAuthentication auth;
  //  bool  _supportState = false;
  bool _isAuthenticating = false;
  bool _isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    player.stop();
    player.setAsset('assets/audios/Phrase_4.mp3');
    player.play();
    auth = LocalAuthentication();
    //  _authenticate();
    //auth.isDeviceSupported().then((bool isSupported) => setState(() {
    // _supportState = isSupported;
    //},));
  }

  Future<void> _authenticate() async {
    setState(() {
      _isAuthenticating = true;
    });

    try {
      bool isAuthenticated = await auth.authenticate(
          localizedReason:
              'Veuillez scanner votre empreinte pour vous authentifier',
          //useErrorDialogs: true,
          );

      setState(() {
        _isAuthenticated = isAuthenticated;
        _isAuthenticating = false;
        if (_isAuthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => widget.nextPage));
        }
      });
    } catch (e) {
      setState(() {
        _isAuthenticating = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: !_isAuthenticated ? _authenticate() : null,
      builder: (context, snapshot) => Container(
        decoration: BoxDecoration(
            color: AppColors.BackgroundColor,
            image: DecorationImage(
                image: const AssetImage("assets/images/mtn_momo.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    AppColors.BackgroundColor.withOpacity(0.1),
                    BlendMode.dstATop))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                  top: 50,
                  child: Container(
                    padding: const EdgeInsets.only(left: 24),
                    child: const Text(
                      "Empreinte digitale",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _isAuthenticating
                      ? const CircularProgressIndicator()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(_isAuthenticated
                                ? 'Authentification réussie'
                                : 'Authentification en cours'),
                          ],
                        ),
                ),
              ),
              Center(
                child: Container(
                  height: mediaSize.height * 0.5,
                  width: mediaSize.width * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/SimpliMoney1.png"))),
                ),
              ),
            ],
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () async {
              player.stop();
              player.setAsset('assets/audios/Phrase_4.mp3');
              player.play();
            },
            child: const Icon(Icons.volume_up),
          ),
        ),
      ),
    );
  }
}
