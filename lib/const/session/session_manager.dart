// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/const/utilities/constants.dart';
import 'package:intl/intl.dart';

import '../../features/login/login.dart';


class SessionManager {
  Future<bool> createSession( userdata) async {
    try {
      var appID =
          Platform.isIOS ? Constants.APP_ID_IOS : Constants.APP_ID_ANDROID;
      final df = DateFormat('yyyy-MM-dd');
      String loginEntryDay = df.format(DateTime.now()).toString();

      setIsLoggedIn = true;
      setLoginEntryDate = loginEntryDay;
      setCompanyID = userdata.compnayID;
      setSecretCode = userdata.secretCode;
      setComUsrAcc = userdata.comusrAcc;
      setAdminUsrType = userdata.adminUserType;
      setCRDT = userdata.crdt;
      setNewDesign = userdata.newdesign;
      setContactPerson = userdata.contactperson;
      setCompanyName = userdata.compnayname;
      setEmail = userdata.email;
      setUserName = userdata.userName!;
      setBillingContact = userdata.billingcontact!;
      setContactPersonCountry = userdata.contactperson!;
      setLoginID = userdata.loginid!;
      setCPCITY = userdata.cPCity!;
      setComCode = userdata.comCODE!;
      setComIDDecode = userdata.comIDDecode!;
      setsPName = userdata.salesPerson?.sPName ?? "";
      setsPContactPhone = userdata.salesPerson?.sPContactPhone ?? "";
      setsPDesignation = userdata.salesPerson?.sPDesignation ?? "";
      setsPContactEmail = userdata.salesPerson?.sPContactEmail ?? "";
      setsPImage = userdata.salesPerson?.sPImage ?? "";
      setplatformWiseAppId = appID;
      setUserAuth = userdata.userauth!;
      return true;
    } catch (e) {
      return false;
    }
  }

  final PrefManager _prefManager;

  SessionManager(this._prefManager);

  String? get loginEntryDate =>
      _prefManager.getStringValue(Constants.SESSION_KEY_LAST_LOGIN_TIME);

  set setLoginEntryDate(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_LAST_LOGIN_TIME, value ?? "");

  String? get companyID =>
      _prefManager.getStringValue(Constants.SESSION_KEY_COMPANY_ID);

  set setCompanyID(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_COMPANY_ID, value ?? "");

  String? get secretCode =>
      _prefManager.getStringValue(Constants.SESSION_KEY_SECRET_CODE);

  set setSecretCode(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_SECRET_CODE, value ?? "");

  String? get comUsrAcc =>
      _prefManager.getStringValue(Constants.SESSION_KEY_COMUSRACC);

  set setComUsrAcc(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_COMUSRACC, value ?? "");

  String? get adminUsrType =>
      _prefManager.getStringValue(Constants.SESSION_KEY_ADMINUSERTYPE);

  set setAdminUsrType(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_ADMINUSERTYPE, value ?? "");

  String? get CRDT => _prefManager.getStringValue(Constants.SESSION_KEY_CRDT);

  set setCRDT(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_CRDT, value ?? "");

  String? get newDesign =>
      _prefManager.getStringValue(Constants.SESSION_KEY_NEWDESIGN);

  set setNewDesign(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_NEWDESIGN, value ?? "");

  String? get contactPerson =>
      _prefManager.getStringValue(Constants.SESSION_KEY_CONTACT_PERSON);

  set setContactPerson(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_CONTACT_PERSON, value ?? "");

  String? get companyName =>
      _prefManager.getStringValue(Constants.SESSION_KEY_COMPANY_NAME);

  set setCompanyName(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_COMPANY_NAME, value ?? "");

  String? get email => _prefManager.getStringValue(Constants.SESSION_KEY_EMAIL);

  set setEmail(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_EMAIL, value ?? "");

  String? get userName =>
      _prefManager.getStringValue(Constants.SESSION_KEY_USER_NAME);

  set setUserName(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_USER_NAME, value);

  String? get billingContact =>
      _prefManager.getStringValue(Constants.SESSION_KEY_BILLING_CONTACT);

  set setBillingContact(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_BILLING_CONTACT, value);

  String? get contactPersonCountry => _prefManager
      .getStringValue(Constants.SESSION_KEY_CONTRACT_PERSON_COUNTRY);

  set setContactPersonCountry(String value) => _prefManager.saveString(
      Constants.SESSION_KEY_CONTRACT_PERSON_COUNTRY, value);

  String? get loginID =>
      _prefManager.getStringValue(Constants.SESSION_KEY_LOGIN_ID);

  set setLoginID(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_LOGIN_ID, value);

  String? get CPCITY =>
      _prefManager.getStringValue(Constants.SESSION_KEY_CPCITY);

  set setCPCITY(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_CPCITY, value);

  String? get comCode =>
      _prefManager.getStringValue(Constants.SESSION_KEY_COM_CODE);

  set setComCode(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_COM_CODE, value);

  String? get comIDDecode =>
      _prefManager.getStringValue(Constants.SESSION_KEY_COMID_DECODE);

  set setComIDDecode(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_COMID_DECODE, value);

  bool? get isLoggedIn =>
      _prefManager.getBoolValue(Constants.SESSION_KEY_ISLOGGEDIN);

  set setIsLoggedIn(bool value) =>
      _prefManager.saveBoolean(Constants.SESSION_KEY_ISLOGGEDIN, value);

  String? get sPName =>
      _prefManager.getStringValue(Constants.SESSION_KEY_SP_NAME);

  set setsPName(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_SP_NAME, value);

  String? get sPDesignation =>
      _prefManager.getStringValue(Constants.SESSION_KEY_SP_Designation);

  set setsPDesignation(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_SP_Designation, value);

  String? get sPContactPhone =>
      _prefManager.getStringValue(Constants.SESSION_KEY_SP_ContactPhone);

  set setsPContactPhone(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_SP_ContactPhone, value);

  String? get sPContactEmail =>
      _prefManager.getStringValue(Constants.SESSION_KEY_SP_ContactEmail);

  set setsPContactEmail(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_SP_ContactEmail, value);

  String? get sPImage =>
      _prefManager.getStringValue(Constants.SESSION_KEY_SP_Image);

  set setsPImage(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_SP_Image, value);

  String? get platformWiseAppId =>
      _prefManager.getStringValue(Constants.SESSION_KEY_APP_ID);

  set setplatformWiseAppId(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_APP_ID, value);

  set setUserAuth(String value) =>
      _prefManager.saveString(Constants.SESSION_KEY_USER_AUTH, value);

  String? get userAuth =>
      _prefManager.getStringValue(Constants.SESSION_KEY_USER_AUTH);

  String? get firebaseID =>
      _prefManager.getStringValue(Constants.SESSION_KEY_FCMTOKEN);

  set setFirebaseID(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_FCMTOKEN, value ?? "");

  bool? get isVideoHaveSeen =>
      _prefManager.getBoolValue(Constants.SESSION_FOR_VIDEO_SEEN);

  clearSession() async {}

  Future<bool> logout() async {
    bool response = false;
    await _prefManager.logOut().whenComplete(() {
      response = true;
    });
    return response;
  }
}
