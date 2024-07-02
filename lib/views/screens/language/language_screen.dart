import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/models/language_model.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/screens/language/provider/language_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final languages = [
  const LanguageModel(name: 'العربية', code: 'ar'),
  const LanguageModel(name: 'English', code: 'en'),
  const LanguageModel(name: 'Español', code: 'es'),
  const LanguageModel(name: 'हिंदी', code: 'hi'),
  const LanguageModel(name: '日本語', code: 'ja'),
  const LanguageModel(name: '한국어', code: 'ko'),
  const LanguageModel(name: 'Русский', code: 'ru'),
];

class MyLanguageScreen extends StatelessWidget {
  const MyLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.selectLanguage,
      ),
      body: Consumer<LanguageProvider>(
        builder: (context, provider, child) {
          return BodyWidget(
            child: ListView.separated(
              itemCount: languages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final language = languages[index];
                final selectedColor = provider.language == language.code
                    ? context.colorScheme.primary
                    : null;

                return ListTile(
                  onTap: () => provider.updateLanguage(language.code),
                  tileColor: selectedColor?.withOpacity(.2),
                  title: Text(
                    language.name,
                    style: context.titleMedium?.copyWith(
                      color: selectedColor,
                    ),
                  ),
                  trailing: provider.language == language.code
                      ? Icon(Icons.check, color: selectedColor)
                      : null,
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 0),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: horizontalPadding16 + topPadding12 + bottomPadding16,
          child: CustomElevatedButton(
            label: context.lang.next,
            onPressed: () => context.pushReplacement(MyRoutes.onboardingScreen),
          ),
        ),
      ),
    );
  }
}
