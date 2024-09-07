String convertNumberToWords(int number) {
  if (number == 0) return 'zero';

  final Map<int, String> units = {
    0: "",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
    10: "Ten",
    11: "Eleven",
    12: "Twelve",
    13: "Thirteen",
    14: "Fourteen",
    15: "Fifteen",
    16: "Sixteen",
    17: "Seventeen",
    18: "Eighteen",
    19: "Nineteen",
  };

  final Map<int, String> tens = {
    20: "Twenty",
    30: "Thirty",
    40: "Forty",
    50: "Fifty",
    60: "Sixty",
    70: "Seventy",
    80: "Eighty",
    90: "Ninety",
  };

  final Map<int, String> scales = {
    1: "",
    1000: "Thousand",
    1000000: "Million",
    1000000000: "Billion",
    1000000000000: "Trillion"
  };

  String convertBelowThousand(int num) {
    if (num == 0) return "";
    if (num < 20) return units[num]!;
    if (num < 100) {
      return tens[(num ~/ 10) * 10]! +
          (num % 10 != 0 ? " ${units[num % 10]!}" : "");
    }
    return "${units[num ~/ 100]!} hundred${num % 100 != 0 ? " and ${convertBelowThousand(num % 100)}" : ""}";
  }

  String convertNumberToWords(int num) {
    if (num == 0) return "";

    int scale = 1;
    String words = "";

    for (int key in scales.keys.toList().reversed) {
      int scaleValue = (num ~/ key);
      if (scaleValue > 0) {
        words += "${convertBelowThousand(scaleValue)} ${scales[key]!} ";
        num %= key;
      }
    }

    return words.trim();
  }

  return convertNumberToWords(number);
}
