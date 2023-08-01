import 'l10n.dart';

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String get api_error_bad_certificate => 'Bad Certificate';

  @override
  String get api_error_bad_request => 'Bad Request';

  @override
  String get api_error_connection_error => 'Connection Error';

  @override
  String get api_error_connection_timeout => 'Connection Timeout';

  @override
  String get api_error_default => 'Oups... Something went wrong';

  @override
  String get api_error_forbidden => 'Forbidden';

  @override
  String get api_error_not_found => 'Not Found';

  @override
  String get api_error_receive_timeout => 'Receive Timeout';

  @override
  String get api_error_request_canceled => 'Request Cancelled';

  @override
  String get api_error_send_timeout => 'Send Timeout';

  @override
  String get api_error_server_error => 'Server Error';

  @override
  String get api_error_unauthorized => 'Unauthorized';

  @override
  String get api_error_unsupported_method => 'Unsupported Method';

  @override
  String get api_login_error_no_record => 'No record matches your request';

  @override
  String get api_validation_avatar_image => 'Avatar upload must be an image';

  @override
  String get api_validation_avatar_max => 'Avatar upload file must be under 512 Ko';

  @override
  String get api_validation_avatar_required => 'Avatar upload is required';

  @override
  String get api_validation_email_email => 'Email should be a conform email address';

  @override
  String get api_validation_email_required => 'Email field is required';

  @override
  String get api_validation_email_unique => 'Email is registered already';

  @override
  String get api_validation_errors => 'Errors while validating the submitted form';

  @override
  String get api_validation_name_min => 'Username must be 3 characters long minimum';

  @override
  String get api_validation_name_required => 'Username field is required';

  @override
  String get api_validation_password_min => 'Password mut be 12 characters long minimum';

  @override
  String get api_validation_password_required => 'Password field is required';

  @override
  String get page_home_title => 'Welcome!';

  @override
  String get snackbar_title_error => 'Error';

  @override
  String get snackbar_title_success => 'Success';

  @override
  String get snackbar_message_login_success => 'You have logged in successfully.';

  @override
  String get form_label_username => 'Username';

  @override
  String get form_label_email => 'Email';

  @override
  String get form_label_password => 'Password';

  @override
  String get form_label_password_repeat => 'Confirm Password';

  @override
  String get form_button_register => 'Register';

  @override
  String get form_button_login => 'Log In';
}
