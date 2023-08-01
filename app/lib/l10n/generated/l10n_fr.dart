import 'l10n.dart';

/// The translations for French (`fr`).
class LFr extends L {
  LFr([String locale = 'fr']) : super(locale);

  @override
  String get api_error_bad_certificate => 'Mauvais certificat';

  @override
  String get api_error_bad_request => 'Mauvaise requête';

  @override
  String get api_error_connection_error => 'Erreur de connexion';

  @override
  String get api_error_connection_timeout => 'Connection Timeout';

  @override
  String get api_error_default => 'Oups... Quelque chose s\'est mal passé :-/';

  @override
  String get api_error_forbidden => 'Interdit';

  @override
  String get api_error_not_found => 'Ressource introuvable';

  @override
  String get api_error_receive_timeout => 'Receive Timeout';

  @override
  String get api_error_request_canceled => 'Requête annulée';

  @override
  String get api_error_send_timeout => 'Send Timeout';

  @override
  String get api_error_server_error => 'Erreur serveur';

  @override
  String get api_error_unauthorized => 'Non authorisé';

  @override
  String get api_error_unsupported_method => 'Méthode non supportée';

  @override
  String get api_login_error_no_record => 'Aucun enregistrement ne correspond à votre requête';

  @override
  String get api_validation_avatar_image => 'Le fichier téléversé doit être une image';

  @override
  String get api_validation_avatar_max => 'L\'image téléversé doit faire moins de 512 Ko';

  @override
  String get api_validation_avatar_required => 'Le téléversement d\'une image est obligatoire';

  @override
  String get api_validation_email_email => 'L\'email saisi doit être valide';

  @override
  String get api_validation_email_required => 'Le champ Email est requis';

  @override
  String get api_validation_email_unique => 'L\'email est déjà enregistré';

  @override
  String get api_validation_errors => 'Erreurs lors de la validation du formulaire';

  @override
  String get api_validation_name_min => 'Le nom doit être long de 3 caractères minimum';

  @override
  String get api_validation_name_required => 'Le champ Nom est obligatoire';

  @override
  String get api_validation_password_min => 'Le mot de passe doit compter au moins 12 caractères';

  @override
  String get api_validation_password_required => 'Le champ Mot de passe est requis';

  @override
  String get page_home_title => 'Bienvenue !';

  @override
  String get snackbar_title_error => 'Erreur';

  @override
  String get snackbar_title_success => 'Succès';

  @override
  String get snackbar_message_login_success => 'Vous vous êtes connecté avec succès.';

  @override
  String get snackbar_message_logout_success => 'Vous vous êtes déconnecté avec succès.';

  @override
  String get form_label_username => 'Nom';

  @override
  String get form_label_email => 'Email';

  @override
  String get form_label_password => 'Mot de passe';

  @override
  String get form_label_password_repeat => 'Confirmation du mot de passe';

  @override
  String get form_button_register => 'Créer un compte';

  @override
  String get form_button_login => 'Se connecter';

  @override
  String get error => 'Erreur';

  @override
  String get button_edit => 'Modifier';

  @override
  String get form_title_profile_edit => 'Modifiez votre profil';

  @override
  String get form_button_submit => 'Enregistrer';

  @override
  String get settings => 'Paramètres';

  @override
  String get settings_language => 'Langue';

  @override
  String get settings_theme => 'Thème';

  @override
  String get profile_actions_logout => 'Se déconnecter';

  @override
  String get profile_actions_destroy => 'Supprimer mon compte';

  @override
  String get button_cancel => 'Annuler';

  @override
  String get button_confirm => 'Confirmer';

  @override
  String get alert_title_confirm => 'Êtes-vous sûr·e...';

  @override
  String get profile_actions_destroy_confirm_message => '...de vouloir supprimer votre compte ?';
}
