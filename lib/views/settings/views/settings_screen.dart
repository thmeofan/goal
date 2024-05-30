import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal/consts/app_colors.dart';
import 'package:goal/views/settings/widgets/feedback_banner.dart';

import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../app/views/my_in_app_web_view.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isSwitched = false;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        title: const Text(
          'Settings',
          style: SettingsTextStyle.back,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
            width: size.width * 0.08,
            height: size.width * 0.08,

          ),
        ),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Container(
                    width: size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: FeedbackBanner(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Container(
                    width: size.width * 0.95,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SettingsTile(
                              text: 'Terms & Condidtions',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyScreenForVIew(
                                        url: 'https://google.com/'),
                                  ),
                                );
                              },
                              action:
                                  SvgPicture.asset('assets/icons/arrow.svg'),
                              assetName: 'assets/icons/terms.svg',
                            ),
                            const Divider(
                              indent: 16,
                              endIndent: 10,
                              height: 1.0,
                              thickness: 0.2,
                              color: Colors.grey,
                            ),
                            SettingsTile(
                              text: 'Privacy Policy',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyScreenForVIew(
                                        url: 'https://google.com/'),
                                  ),
                                );
                              },
                              action:
                                  SvgPicture.asset('assets/icons/arrow.svg'),
                              assetName: 'assets/icons/privacy.svg',
                            ),
                            const Divider(
                              indent: 16,
                              endIndent: 10,
                              height: 1.0,
                              thickness: 0.2,
                              color: Colors.grey,
                            ),
                            SettingsTile(
                              text: 'Support page',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyScreenForVIew(
                                        url: 'https://google.com/'),
                                  ),
                                );
                              },
                              action:
                                  SvgPicture.asset('assets/icons/arrow.svg'),
                              assetName: 'assets/icons/support.svg',
                            ),
                            const Divider(
                              indent: 16,
                              endIndent: 10,
                              height: 1.0,
                              thickness: 0.2,
                              color: Colors.grey,
                            ),
                            SettingsTile(
                              text: 'Share with friends',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyScreenForVIew(
                                        url: 'https://google.com/'),
                                  ),
                                );
                              },
                              action:
                                  SvgPicture.asset('assets/icons/arrow.svg'),
                              assetName: 'assets/icons/share.svg',
                            ),
                            const Divider(
                              indent: 16,
                              endIndent: 10,
                              height: 1.0,
                              thickness: 0.2,
                              color: Colors.grey,
                            ),
                            SettingsTile(
                              text: 'Subscription info',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyScreenForVIew(
                                        url: 'https://google.com/'),
                                  ),
                                );
                              },
                              action:
                                  SvgPicture.asset('assets/icons/arrow.svg'),
                              assetName: 'assets/icons/subscription.svg',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
