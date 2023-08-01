import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_fr.dart';

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @api_error_bad_certificate.
  ///
  /// In en, this message translates to:
  /// **'Bad Certificate'**
  String get api_error_bad_certificate;

  /// No description provided for @api_error_bad_request.
  ///
  /// In en, this message translates to:
  /// **'Bad Request'**
  String get api_error_bad_request;

  /// No description provided for @api_error_connection_error.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get api_error_connection_error;

  /// No description provided for @api_error_connection_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection Timeout'**
  String get api_error_connection_timeout;

  /// No description provided for @api_error_default.
  ///
  /// In en, this message translates to:
  /// **'Oups... Something went wrong'**
  String get api_error_default;

  /// No description provided for @api_error_forbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get api_error_forbidden;

  /// No description provided for @api_error_not_found.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get api_error_not_found;

  /// No description provided for @api_error_receive_timeout.
  ///
  /// In en, this message translates to:
  /// **'Receive Timeout'**
  String get api_error_receive_timeout;

  /// No description provided for @api_error_request_canceled.
  ///
  /// In en, this message translates to:
  /// **'Request Cancelled'**
  String get api_error_request_canceled;

  /// No description provided for @api_error_send_timeout.
  ///
  /// In en, this message translates to:
  /// **'Send Timeout'**
  String get api_error_send_timeout;

  /// No description provided for @api_error_server_error.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get api_error_server_error;

  /// No description provided for @api_error_unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get api_error_unauthorized;

  /// No description provided for @api_error_unsupported_method.
  ///
  /// In en, this message translates to:
  /// **'Unsupported Method'**
  String get api_error_unsupported_method;

  /// No description provided for @api_login_error_no_record.
  ///
  /// In en, this message translates to:
  /// **'No record matches your request'**
  String get api_login_error_no_record;

  /// No description provided for @api_validation_avatar_image.
  ///
  /// In en, this message translates to:
  /// **'Avatar upload must be an image'**
  String get api_validation_avatar_image;

  /// No description provided for @api_validation_avatar_max.
  ///
  /// In en, this message translates to:
  /// **'Avatar upload file must be under 512 Ko'**
  String get api_validation_avatar_max;

  /// No description provided for @api_validation_avatar_required.
  ///
  /// In en, this message translates to:
  /// **'Avatar upload is required'**
  String get api_validation_avatar_required;

  /// No description provided for @api_validation_email_email.
  ///
  /// In en, this message translates to:
  /// **'Email should be a conform email address'**
  String get api_validation_email_email;

  /// No description provided for @api_validation_email_required.
  ///
  /// In en, this message translates to:
  /// **'Email field is required'**
  String get api_validation_email_required;

  /// No description provided for @api_validation_email_unique.
  ///
  /// In en, this message translates to:
  /// **'Email is registered already'**
  String get api_validation_email_unique;

  /// No description provided for @api_validation_errors.
  ///
  /// In en, this message translates to:
  /// **'Errors while validating the submitted form'**
  String get api_validation_errors;

  /// No description provided for @api_validation_name_min.
  ///
  /// In en, this message translates to:
  /// **'Username must be 3 characters long minimum'**
  String get api_validation_name_min;

  /// No description provided for @api_validation_name_required.
  ///
  /// In en, this message translates to:
  /// **'Username field is required'**
  String get api_validation_name_required;

  /// No description provided for @api_validation_password_min.
  ///
  /// In en, this message translates to:
  /// **'Password mut be 12 characters long minimum'**
  String get api_validation_password_min;

  /// No description provided for @api_validation_password_required.
  ///
  /// In en, this message translates to:
  /// **'Password field is required'**
  String get api_validation_password_required;

  /// No description provided for @page_home_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get page_home_title;

  /// No description provided for @snackbar_title_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get snackbar_title_error;

  /// No description provided for @snackbar_title_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get snackbar_title_success;

  /// No description provided for @snackbar_message_login_success.
  ///
  /// In en, this message translates to:
  /// **'You have logged in successfully.'**
  String get snackbar_message_login_success;

  /// No description provided for @snackbar_message_logout_success.
  ///
  /// In en, this message translates to:
  /// **'You have logged out successfully.'**
  String get snackbar_message_logout_success;

  /// No description provided for @form_label_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get form_label_username;

  /// No description provided for @form_label_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get form_label_email;

  /// No description provided for @form_label_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get form_label_password;

  /// No description provided for @form_label_password_repeat.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get form_label_password_repeat;

  /// No description provided for @form_button_register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get form_button_register;

  /// No description provided for @form_button_login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get form_button_login;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @button_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get button_edit;

  /// No description provided for @form_title_profile_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit your profile'**
  String get form_title_profile_edit;

  /// No description provided for @form_button_submit.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get form_button_submit;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_theme;

  /// No description provided for @profile_actions_logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profile_actions_logout;

  /// No description provided for @profile_actions_destroy.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get profile_actions_destroy;

  /// No description provided for @button_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get button_cancel;

  /// No description provided for @button_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get button_confirm;

  /// No description provided for @alert_title_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure...'**
  String get alert_title_confirm;

  /// No description provided for @profile_actions_destroy_confirm_message.
  ///
  /// In en, this message translates to:
  /// **'...you want to delete your account?'**
  String get profile_actions_destroy_confirm_message;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LEn();
    case 'fr': return LFr();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
