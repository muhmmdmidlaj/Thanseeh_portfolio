import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInTouchScreen extends StatefulWidget {
  const GetInTouchScreen({Key? key}) : super(key: key);

  @override
  _GetInTouchScreenState createState() => _GetInTouchScreenState();
}

class _GetInTouchScreenState extends State<GetInTouchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'thanseehabi3@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Get In Touch Form Submission',
          'body': 'First Name: ${_firstNameController.text}\n'
              'Second Name: ${_secondNameController.text}\n'
              'Email: ${_emailController.text}\n'
              'Phone: ${_phoneController.text}\n'
              'Message: ${_messageController.text}',
        }),
      );

      try {
        await launchUrl(Uri.parse(emailLaunchUri.toString()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email client opened successfully!')),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to open email client: $error')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSizeTitle = constraints.maxWidth < 600 ? 20 : 25;
        double padding = constraints.maxWidth < 600 ? 10 : 20;
        double buttonHeight = constraints.maxWidth < 600 ? 40 : 50;
        double buttonFontSize = constraints.maxWidth < 600 ? 14 : 16;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 38, 2, 61),
                    Color.fromARGB(255, 150, 8, 207),
                  ],
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Get In Touch',
                        style: GoogleFonts.merriweather(
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: TextFormField(
                        controller: _firstNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintText: 'First Name',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(168, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: TextFormField(
                        controller: _secondNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintText: 'Second Name',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(168, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your second name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintText: 'Email Address',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(168, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: TextFormField(
                        controller: _phoneController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintText: 'Phone No.',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(168, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.white),
                        ),
                        height: 250,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _messageController,
                            style: const TextStyle(color: Colors.white),
                            maxLines: null,
                            decoration: const InputDecoration(
                              hintText: 'Message',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(168, 255, 255, 255),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: padding),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                  vertical: buttonHeight / 4,
                                  horizontal: buttonHeight / 2,
                                )),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: buttonFontSize,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                              onPressed: _sendEmail,
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _firstNameController.clear();
                              _secondNameController.clear();
                              _emailController.clear();
                              _phoneController.clear();
                              _messageController.clear();
                            },
                            icon: Icon(
                              Icons.refresh_rounded,
                              color: Colors.white,
                              size: buttonHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
