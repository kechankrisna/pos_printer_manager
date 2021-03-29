class ConnectionResponse {
  const ConnectionResponse._internal(this.value);
  final int value;
  static const success = ConnectionResponse._internal(1);
  static const timeout = ConnectionResponse._internal(2);
  static const printerNotSelected = ConnectionResponse._internal(3);
  static const ticketEmpty = ConnectionResponse._internal(4);
  static const printInProgress = ConnectionResponse._internal(5);
  static const scanInProgress = ConnectionResponse._internal(6);

  String get msg {
    if (value == ConnectionResponse.success.value) {
      return 'Success';
    } else if (value == ConnectionResponse.timeout.value) {
      return 'Error. Printer connection timeout';
    } else if (value == ConnectionResponse.printerNotSelected.value) {
      return 'Error. Printer not selected';
    } else if (value == ConnectionResponse.ticketEmpty.value) {
      return 'Error. Ticket is empty';
    } else if (value == ConnectionResponse.printInProgress.value) {
      return 'Error. Another print in progress';
    } else if (value == ConnectionResponse.scanInProgress.value) {
      return 'Error. Printer scanning in progress';
    } else {
      return 'Unknown error';
    }
  }
}