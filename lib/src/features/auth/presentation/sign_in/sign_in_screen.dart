import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:zog_ui/zog_ui.dart' show ZeroText;
import 'package:zot_starter/gen/assets.gen.dart';
import 'package:zot_starter/src/app/config/config.dart';
import 'package:zot_starter/src/components/button.dart';
import 'package:zot_starter/src/components/textfield.dart';
import 'package:zot_starter/src/features/auth/presentation/sign_in/sign_in_controller.dart';
import 'package:zot_starter/src/localization/locale_keys.g.dart';
import 'package:zot_starter/src/utils/extensions/widget_extension.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signInNotifierProvider).email;
    final password = ref.watch(signInNotifierProvider).password;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.authentication
              .svg(height: MediaQuery.of(context).size.height / 3),
          ZeroText.heading5(
            AppConfig.appName.value,
          ),
          CommonTextfield(
            label: LocaleKeys.email.tr(),
            hintText: tr(LocaleKeys.hintEmail),
            onChanged: (value) =>
                ref.read(signInNotifierProvider.notifier).updateEmail(value),
            inputType: TextInputType.name,
            validator: (value) => email.error?.getMessage(),
          ),
          CommonTextfield(
            label: LocaleKeys.password.tr(),
            hintText: tr(LocaleKeys.hintPassword),
            onChanged: (value) =>
                ref.read(signInNotifierProvider.notifier).updatePassword(value),
            inputType: TextInputType.visiblePassword,
            validator: (value) => password.error?.getMessage(),
          ),
          CommonButton(
            LocaleKeys.login,
            isLoading: ref.watch(signInNotifierProvider).value.isLoading,
            isDisabled:
                ref.watch(signInNotifierProvider).status != FormzStatus.valid,
            onPressed: () {
              ref.read(signInNotifierProvider.notifier).submit(
                    ref.watch(signInNotifierProvider).email.value,
                    ref.watch(signInNotifierProvider).password.value,
                  );
            },
          ),
        ],
      ).withDefaultPadding,
    );
  }
}
