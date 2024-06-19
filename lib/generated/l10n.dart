// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Infosas HR`
  String get appName {
    return Intl.message(
      'Infosas HR',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email or UserName`
  String get emailHint {
    return Intl.message(
      'Enter your Email or UserName',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get passwordHint {
    return Intl.message(
      'Enter your Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Lost your password ?`
  String get forgetPassword {
    return Intl.message(
      'Lost your password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `date`
  String get date {
    return Intl.message(
      'date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Have a Good day ☀️`
  String get haveAGoodDay {
    return Intl.message(
      'Have a Good day ☀️',
      name: 'haveAGoodDay',
      desc: '',
      args: [],
    );
  }

  /// `Month Stats`
  String get monthStats {
    return Intl.message(
      'Month Stats',
      name: 'monthStats',
      desc: '',
      args: [],
    );
  }

  /// `Hours of delay`
  String get hoursDelay {
    return Intl.message(
      'Hours of delay',
      name: 'hoursDelay',
      desc: '',
      args: [],
    );
  }

  /// `Days of absence`
  String get daysAbsence {
    return Intl.message(
      'Days of absence',
      name: 'daysAbsence',
      desc: '',
      args: [],
    );
  }

  /// `Attendance Count`
  String get attendanceCount {
    return Intl.message(
      'Attendance Count',
      name: 'attendanceCount',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint Registration`
  String get attendance {
    return Intl.message(
      'Fingerprint Registration',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning ☀️`
  String get goodMorning {
    return Intl.message(
      'Good Morning ☀️',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon ☀️`
  String get goodAfternoon {
    return Intl.message(
      'Good Afternoon ☀️',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening ☀️`
  String get goodEvening {
    return Intl.message(
      'Good Evening ☀️',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Choose Report`
  String get chooseReport {
    return Intl.message(
      'Choose Report',
      name: 'chooseReport',
      desc: '',
      args: [],
    );
  }

  /// `Permissions History`
  String get permissionsHistory {
    return Intl.message(
      'Permissions History',
      name: 'permissionsHistory',
      desc: '',
      args: [],
    );
  }

  /// `Loans Request Sent`
  String get loansRequestSent {
    return Intl.message(
      'Loans Request Sent',
      name: 'loansRequestSent',
      desc: '',
      args: [],
    );
  }

  /// `Vacation History`
  String get vacationHistory {
    return Intl.message(
      'Vacation History',
      name: 'vacationHistory',
      desc: '',
      args: [],
    );
  }

  /// `Over Time`
  String get overTime {
    return Intl.message(
      'Over Time',
      name: 'overTime',
      desc: '',
      args: [],
    );
  }

  /// `Salary Report`
  String get salaryReport {
    return Intl.message(
      'Salary Report',
      name: 'salaryReport',
      desc: '',
      args: [],
    );
  }

  /// `Penalties`
  String get penalties {
    return Intl.message(
      'Penalties',
      name: 'penalties',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get insurance {
    return Intl.message(
      'Insurance',
      name: 'insurance',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get info {
    return Intl.message(
      'Personal Information',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Show your information`
  String get infoDec {
    return Intl.message(
      'Show your information',
      name: 'infoDec',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get privacyDec {
    return Intl.message(
      'Change your password',
      name: 'privacyDec',
      desc: '',
      args: [],
    );
  }

  /// `Attendance History`
  String get attendanceHistory {
    return Intl.message(
      'Attendance History',
      name: 'attendanceHistory',
      desc: '',
      args: [],
    );
  }

  /// `Show your attendance history`
  String get attendanceHistoryDec {
    return Intl.message(
      'Show your attendance history',
      name: 'attendanceHistoryDec',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change language to`
  String get languageDec {
    return Intl.message(
      'Change language to',
      name: 'languageDec',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `About Infosas`
  String get aboutDec {
    return Intl.message(
      'About Infosas',
      name: 'aboutDec',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Permissions Count`
  String get permissionsCount {
    return Intl.message(
      'Permissions Count',
      name: 'permissionsCount',
      desc: '',
      args: [],
    );
  }

  /// `Month Details`
  String get monthDetails {
    return Intl.message(
      'Month Details',
      name: 'monthDetails',
      desc: '',
      args: [],
    );
  }

  /// `Loans Number`
  String get loansNumber {
    return Intl.message(
      'Loans Number',
      name: 'loansNumber',
      desc: '',
      args: [],
    );
  }

  /// `Loans Total`
  String get loansTotal {
    return Intl.message(
      'Loans Total',
      name: 'loansTotal',
      desc: '',
      args: [],
    );
  }

  /// `Custody Count`
  String get custodyCount {
    return Intl.message(
      'Custody Count',
      name: 'custodyCount',
      desc: '',
      args: [],
    );
  }

  /// `Custody Total`
  String get custodyTotal {
    return Intl.message(
      'Custody Total',
      name: 'custodyTotal',
      desc: '',
      args: [],
    );
  }

  /// `Available Vacations`
  String get availableVacations {
    return Intl.message(
      'Available Vacations',
      name: 'availableVacations',
      desc: '',
      args: [],
    );
  }

  /// `Taken Vacations`
  String get takenVacations {
    return Intl.message(
      'Taken Vacations',
      name: 'takenVacations',
      desc: '',
      args: [],
    );
  }

  /// `Over time Rate`
  String get overTimeRate {
    return Intl.message(
      'Over time Rate',
      name: 'overTimeRate',
      desc: '',
      args: [],
    );
  }

  /// `Over Time Net Salary`
  String get overTimeNetSalary {
    return Intl.message(
      'Over Time Net Salary',
      name: 'overTimeNetSalary',
      desc: '',
      args: [],
    );
  }

  /// `Total Over Time Hours`
  String get totalOverTimeHours {
    return Intl.message(
      'Total Over Time Hours',
      name: 'totalOverTimeHours',
      desc: '',
      args: [],
    );
  }

  /// `Decision date : `
  String get decisionDate {
    return Intl.message(
      'Decision date : ',
      name: 'decisionDate',
      desc: '',
      args: [],
    );
  }

  /// `Penalty type : `
  String get penaltiesDscAr {
    return Intl.message(
      'Penalty type : ',
      name: 'penaltiesDscAr',
      desc: '',
      args: [],
    );
  }

  /// `Penalty description : `
  String get penaltiesDetailsDscAr {
    return Intl.message(
      'Penalty description : ',
      name: 'penaltiesDetailsDscAr',
      desc: '',
      args: [],
    );
  }

  /// `Gross salary : `
  String get grossSalary {
    return Intl.message(
      'Gross salary : ',
      name: 'grossSalary',
      desc: '',
      args: [],
    );
  }

  /// `Discount value : `
  String get discountValue {
    return Intl.message(
      'Discount value : ',
      name: 'discountValue',
      desc: '',
      args: [],
    );
  }

  /// `Net salary : `
  String get netSalary {
    return Intl.message(
      'Net salary : ',
      name: 'netSalary',
      desc: '',
      args: [],
    );
  }

  /// `Review case : `
  String get reviewCase {
    return Intl.message(
      'Review case : ',
      name: 'reviewCase',
      desc: '',
      args: [],
    );
  }

  /// `Grievance reason`
  String get rejectReason {
    return Intl.message(
      'Grievance reason',
      name: 'rejectReason',
      desc: '',
      args: [],
    );
  }

  /// `Penalty`
  String get penalty {
    return Intl.message(
      'Penalty',
      name: 'penalty',
      desc: '',
      args: [],
    );
  }

  /// `Grievance`
  String get grievance {
    return Intl.message(
      'Grievance',
      name: 'grievance',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get companyName {
    return Intl.message(
      'Company name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Position Title`
  String get positionTitle {
    return Intl.message(
      'Position Title',
      name: 'positionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Work Hours`
  String get workHours {
    return Intl.message(
      'Work Hours',
      name: 'workHours',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your current password`
  String get currentPasswordHint {
    return Intl.message(
      'Enter your current password',
      name: 'currentPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get newPasswordHint {
    return Intl.message(
      'Enter your new password',
      name: 'newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get passwordConfirmation {
    return Intl.message(
      'Password Confirmation',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get passwordConfirmationHint {
    return Intl.message(
      'Confirm your password',
      name: 'passwordConfirmationHint',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Working Hours`
  String get workingHours {
    return Intl.message(
      'Working Hours',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Early Exit`
  String get earlyExit {
    return Intl.message(
      'Early Exit',
      name: 'earlyExit',
      desc: '',
      args: [],
    );
  }

  /// `Early Arrival`
  String get earlyArrival {
    return Intl.message(
      'Early Arrival',
      name: 'earlyArrival',
      desc: '',
      args: [],
    );
  }

  /// `Attendance Date`
  String get attendanceDate {
    return Intl.message(
      'Attendance Date',
      name: 'attendanceDate',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `No Schedule`
  String get noSchedule {
    return Intl.message(
      'No Schedule',
      name: 'noSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Ask For Permissions`
  String get askForPermissions {
    return Intl.message(
      'Ask For Permissions',
      name: 'askForPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Permission type`
  String get permType {
    return Intl.message(
      'Permission type',
      name: 'permType',
      desc: '',
      args: [],
    );
  }

  /// `Permission type`
  String get permTypeHint {
    return Intl.message(
      'Permission type',
      name: 'permTypeHint',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get dateFrom {
    return Intl.message(
      'Start date',
      name: 'dateFrom',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get dateTo {
    return Intl.message(
      'End date',
      name: 'dateTo',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get chooseDate {
    return Intl.message(
      'Choose Date',
      name: 'chooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get startTime {
    return Intl.message(
      'Start time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get endTime {
    return Intl.message(
      'End time',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `Loans`
  String get loans {
    return Intl.message(
      'Loans',
      name: 'loans',
      desc: '',
      args: [],
    );
  }

  /// `Custody`
  String get custody {
    return Intl.message(
      'Custody',
      name: 'custody',
      desc: '',
      args: [],
    );
  }

  /// `Loan`
  String get loan {
    return Intl.message(
      'Loan',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Vacation`
  String get vacationRequest {
    return Intl.message(
      'Vacation',
      name: 'vacationRequest',
      desc: '',
      args: [],
    );
  }

  /// `Choose Vacation Type`
  String get vacationType {
    return Intl.message(
      'Choose Vacation Type',
      name: 'vacationType',
      desc: '',
      args: [],
    );
  }

  /// `Vacation Start`
  String get vacationStart {
    return Intl.message(
      'Vacation Start',
      name: 'vacationStart',
      desc: '',
      args: [],
    );
  }

  /// `Vacation End`
  String get vacationEnd {
    return Intl.message(
      'Vacation End',
      name: 'vacationEnd',
      desc: '',
      args: [],
    );
  }

  /// `Vacation Duration`
  String get vacationDuration {
    return Intl.message(
      'Vacation Duration',
      name: 'vacationDuration',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Late Attendance`
  String get lateAttendance {
    return Intl.message(
      'Late Attendance',
      name: 'lateAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Choose Attendance Type`
  String get AttendanceType {
    return Intl.message(
      'Choose Attendance Type',
      name: 'AttendanceType',
      desc: '',
      args: [],
    );
  }

  /// `Choose a date`
  String get chooseADate {
    return Intl.message(
      'Choose a date',
      name: 'chooseADate',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get StartTime {
    return Intl.message(
      'Start time',
      name: 'StartTime',
      desc: '',
      args: [],
    );
  }

  /// `Choose employee`
  String get chooseEmp {
    return Intl.message(
      'Choose employee',
      name: 'chooseEmp',
      desc: '',
      args: [],
    );
  }

  /// `Violation List`
  String get violationList {
    return Intl.message(
      'Violation List',
      name: 'violationList',
      desc: '',
      args: [],
    );
  }

  /// `Penalties type`
  String get penaltiesType {
    return Intl.message(
      'Penalties type',
      name: 'penaltiesType',
      desc: '',
      args: [],
    );
  }

  /// `Choose repeat`
  String get chooseRepeat {
    return Intl.message(
      'Choose repeat',
      name: 'chooseRepeat',
      desc: '',
      args: [],
    );
  }

  /// `Violation Statement`
  String get violationStatement {
    return Intl.message(
      'Violation Statement',
      name: 'violationStatement',
      desc: '',
      args: [],
    );
  }

  /// `Violation Amount`
  String get violationAmount {
    return Intl.message(
      'Violation Amount',
      name: 'violationAmount',
      desc: '',
      args: [],
    );
  }

  /// `Warning Message`
  String get warningMessage {
    return Intl.message(
      'Warning Message',
      name: 'warningMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `There is no data`
  String get noOverTime {
    return Intl.message(
      'There is no data',
      name: 'noOverTime',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Sending data`
  String get sendingData {
    return Intl.message(
      'Sending data',
      name: 'sendingData',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get askPerm {
    return Intl.message(
      'Permissions',
      name: 'askPerm',
      desc: '',
      args: [],
    );
  }

  /// `Loans`
  String get askLoan {
    return Intl.message(
      'Loans',
      name: 'askLoan',
      desc: '',
      args: [],
    );
  }

  /// `Vacation`
  String get askVacation {
    return Intl.message(
      'Vacation',
      name: 'askVacation',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get askAttendance {
    return Intl.message(
      'Attendance',
      name: 'askAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Penalties`
  String get askPenalties {
    return Intl.message(
      'Penalties',
      name: 'askPenalties',
      desc: '',
      args: [],
    );
  }

  /// `Attending the first period`
  String get attendingFirstPeriod {
    return Intl.message(
      'Attending the first period',
      name: 'attendingFirstPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Leaving the first period`
  String get leavingFirstPeriod {
    return Intl.message(
      'Leaving the first period',
      name: 'leavingFirstPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Attending the second period`
  String get attendingSecondPeriod {
    return Intl.message(
      'Attending the second period',
      name: 'attendingSecondPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Leaving the second period`
  String get leavingSecondPeriod {
    return Intl.message(
      'Leaving the second period',
      name: 'leavingSecondPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Deduction from salary`
  String get deductionFromSalary {
    return Intl.message(
      'Deduction from salary',
      name: 'deductionFromSalary',
      desc: '',
      args: [],
    );
  }

  /// `Verbal warning`
  String get verbalWarning {
    return Intl.message(
      'Verbal warning',
      name: 'verbalWarning',
      desc: '',
      args: [],
    );
  }

  /// `Written warning`
  String get writtenWarning {
    return Intl.message(
      'Written warning',
      name: 'writtenWarning',
      desc: '',
      args: [],
    );
  }

  /// `Deprivation of the up coming annual bonus`
  String get deprivationOfTheUpComingAnnualBonus {
    return Intl.message(
      'Deprivation of the up coming annual bonus',
      name: 'deprivationOfTheUpComingAnnualBonus',
      desc: '',
      args: [],
    );
  }

  /// `Notice of termination and termination of service`
  String get noticeOfTerminationAndTerminationOfService {
    return Intl.message(
      'Notice of termination and termination of service',
      name: 'noticeOfTerminationAndTerminationOfService',
      desc: '',
      args: [],
    );
  }

  /// `First time`
  String get firstTime {
    return Intl.message(
      'First time',
      name: 'firstTime',
      desc: '',
      args: [],
    );
  }

  /// `Second time`
  String get secondTime {
    return Intl.message(
      'Second time',
      name: 'secondTime',
      desc: '',
      args: [],
    );
  }

  /// `Third time`
  String get thirdTime {
    return Intl.message(
      'Third time',
      name: 'thirdTime',
      desc: '',
      args: [],
    );
  }

  /// `Forth time`
  String get forthTime {
    return Intl.message(
      'Forth time',
      name: 'forthTime',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Attendance the first period`
  String get attendingTheFirstPeriod {
    return Intl.message(
      'Attendance the first period',
      name: 'attendingTheFirstPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Leaving the first period`
  String get leavingTheFirstPeriod {
    return Intl.message(
      'Leaving the first period',
      name: 'leavingTheFirstPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Attendance the second period`
  String get attendingTheSecondPeriod {
    return Intl.message(
      'Attendance the second period',
      name: 'attendingTheSecondPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Leaving the second period`
  String get leavingTheSecondPeriod {
    return Intl.message(
      'Leaving the second period',
      name: 'leavingTheSecondPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `About Infosas Financial`
  String get aboutInfosas {
    return Intl.message(
      'About Infosas Financial',
      name: 'aboutInfosas',
      desc: '',
      args: [],
    );
  }

  /// `Infosas Capital is one of the leading software companies in the Middle East, headquartered in Cairo - Egypt. Infosas is the best in the industry and the development of highly efficient and easy-to-use applications supporting databases since the company was established in 2013, and it is the leading software development company. Infosas has developed a series of commercial and industrial applications as well as development tools. Infosas software for managing financial and human resources, which is known regionally, is among the software used by many clients, not only in the Egypt, but in the entire Arab region.`
  String get aboutMainText {
    return Intl.message(
      'Infosas Capital is one of the leading software companies in the Middle East, headquartered in Cairo - Egypt. Infosas is the best in the industry and the development of highly efficient and easy-to-use applications supporting databases since the company was established in 2013, and it is the leading software development company. Infosas has developed a series of commercial and industrial applications as well as development tools. Infosas software for managing financial and human resources, which is known regionally, is among the software used by many clients, not only in the Egypt, but in the entire Arab region.',
      name: 'aboutMainText',
      desc: '',
      args: [],
    );
  }

  /// `Our vision`
  String get aboutVisionText {
    return Intl.message(
      'Our vision',
      name: 'aboutVisionText',
      desc: '',
      args: [],
    );
  }

  /// `To become the number one source of software in the region and provide business solutions in the Middle East through continuous research and customer service.`
  String get aboutVisionDescText {
    return Intl.message(
      'To become the number one source of software in the region and provide business solutions in the Middle East through continuous research and customer service.',
      name: 'aboutVisionDescText',
      desc: '',
      args: [],
    );
  }

  /// `Our goal`
  String get aboutGoalText {
    return Intl.message(
      'Our goal',
      name: 'aboutGoalText',
      desc: '',
      args: [],
    );
  }

  /// `Our first and highest goal is to gain the trust of customers by providing global software technology that regulates business processes, increases productivity and maintains customer satisfaction, as well as by providing a technical support team with a high level of training and competence to deal with any problem faced by the customer when using software in ASAP.`
  String get aboutGoalDescText {
    return Intl.message(
      'Our first and highest goal is to gain the trust of customers by providing global software technology that regulates business processes, increases productivity and maintains customer satisfaction, as well as by providing a technical support team with a high level of training and competence to deal with any problem faced by the customer when using software in ASAP.',
      name: 'aboutGoalDescText',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure of your data`
  String get validDataErrorMessage {
    return Intl.message(
      'Please make sure of your data',
      name: 'validDataErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Late attendance`
  String get lateAttendanceItem {
    return Intl.message(
      'Late attendance',
      name: 'lateAttendanceItem',
      desc: '',
      args: [],
    );
  }

  /// `Early exit`
  String get earlyExitItem {
    return Intl.message(
      'Early exit',
      name: 'earlyExitItem',
      desc: '',
      args: [],
    );
  }

  /// `Work errand`
  String get workErrandItem {
    return Intl.message(
      'Work errand',
      name: 'workErrandItem',
      desc: '',
      args: [],
    );
  }

  /// `Exit and return during working hours`
  String get exitAndReturnDuringWorkingHoursItem {
    return Intl.message(
      'Exit and return during working hours',
      name: 'exitAndReturnDuringWorkingHoursItem',
      desc: '',
      args: [],
    );
  }

  /// `Absense`
  String get absenseItem {
    return Intl.message(
      'Absense',
      name: 'absenseItem',
      desc: '',
      args: [],
    );
  }

  /// `Annual`
  String get annualItem {
    return Intl.message(
      'Annual',
      name: 'annualItem',
      desc: '',
      args: [],
    );
  }

  /// `Urgent`
  String get urgentItem {
    return Intl.message(
      'Urgent',
      name: 'urgentItem',
      desc: '',
      args: [],
    );
  }

  /// `Sick leave`
  String get sickLeaveItem {
    return Intl.message(
      'Sick leave',
      name: 'sickLeaveItem',
      desc: '',
      args: [],
    );
  }

  /// `Exceptional`
  String get exceptionalItem {
    return Intl.message(
      'Exceptional',
      name: 'exceptionalItem',
      desc: '',
      args: [],
    );
  }

  /// `Without salary`
  String get withoutSalaryItem {
    return Intl.message(
      'Without salary',
      name: 'withoutSalaryItem',
      desc: '',
      args: [],
    );
  }

  /// `Maternity leave`
  String get maternityLeaveItem {
    return Intl.message(
      'Maternity leave',
      name: 'maternityLeaveItem',
      desc: '',
      args: [],
    );
  }

  /// `Vacation births`
  String get vacationBirthsItem {
    return Intl.message(
      'Vacation births',
      name: 'vacationBirthsItem',
      desc: '',
      args: [],
    );
  }

  /// `Death leave`
  String get deathLeaveItem {
    return Intl.message(
      'Death leave',
      name: 'deathLeaveItem',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image From`
  String get chooseImageFrom {
    return Intl.message(
      'Choose Image From',
      name: 'chooseImageFrom',
      desc: '',
      args: [],
    );
  }

  /// `Please Close Developer Options`
  String get developerOptionsMessage {
    return Intl.message(
      'Please Close Developer Options',
      name: 'developerOptionsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Oops there was an error ,please try again later`
  String get oopsMessage {
    return Intl.message(
      'Oops there was an error ,please try again later',
      name: 'oopsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Select image has been canceled`
  String get cancelImage {
    return Intl.message(
      'Select image has been canceled',
      name: 'cancelImage',
      desc: '',
      args: [],
    );
  }

  /// `Something Went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something Went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint registration has been canceled`
  String get fingerprintCanceled {
    return Intl.message(
      'Fingerprint registration has been canceled',
      name: 'fingerprintCanceled',
      desc: '',
      args: [],
    );
  }

  /// `This device not supported`
  String get notSupported {
    return Intl.message(
      'This device not supported',
      name: 'notSupported',
      desc: '',
      args: [],
    );
  }

  /// `you are logged out`
  String get loggedOut {
    return Intl.message(
      'you are logged out',
      name: 'loggedOut',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
