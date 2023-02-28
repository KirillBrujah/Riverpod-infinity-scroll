import 'package:intl/intl.dart' show NumberFormat;

String formatCurrency(double price) {
  return NumberFormat.compactCurrency(
    locale: "en_US",
    symbol: r"$",
  ).format(price);
}
