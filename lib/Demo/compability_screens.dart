import 'package:flutter/material.dart';
import 'package:h2o/screens/auth/login_screen.dart';

class CompatibilityScreen extends StatefulWidget {
  const CompatibilityScreen({Key? key}) : super(key: key);

  @override
  _CompatibilityScreenState createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  String selectedSign1 = 'Aries';
  String selectedSign2 = 'Taurus';
  String compatibilityResult = '';
  double compatibilityScore = 0.0;

  // Define your compatibility data here
  List<List<int>> compatibilityValues = [
    [50, 38, 83, 42, 97, 63, 85, 50, 93, 47, 78, 67],
    [38, 65, 33, 97, 73, 90, 65, 88, 30, 98, 58, 85],
    [83, 33, 60, 65, 88, 68, 93, 28, 60, 68, 85, 53],
    [42, 97, 65, 75, 35, 90, 43, 94, 53, 83, 27, 98],
    [97, 73, 88, 35, 45, 35, 97, 58, 93, 35, 68, 38],
    [63, 90, 68, 90, 35, 65, 68, 88, 48, 95, 30, 88],
    [85, 65, 93, 43, 97, 68, 75, 35, 73, 55, 90, 88],
    [50, 88, 28, 94, 58, 88, 35, 80, 28, 95, 73, 97],
    [93, 30, 60, 53, 93, 48, 73, 28, 45, 60, 90, 63],
    [47, 98, 68, 83, 35, 95, 55, 95, 60, 75, 68, 88],
    [78, 58, 85, 27, 68, 30, 90, 73, 90, 68, 45, 45],
    [67, 85, 53, 98, 38, 88, 88, 97, 63, 88, 45, 60],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiac Compatibility'),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedSign1,
              items: _zodiacSigns.map((String sign) {
                return DropdownMenuItem<String>(
                  value: sign,
                  child: Text(sign),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSign1 = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedSign2,
              items: _zodiacSigns.map((String sign) {
                return DropdownMenuItem<String>(
                  value: sign,
                  child: Text(sign),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSign2 = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Calculate compatibility
                compatibilityScore =
                    calculateCompatibility(selectedSign1, selectedSign2);

                // Update compatibility result based on the calculated score
                setState(() {
                  compatibilityResult =
                      interpretCompatibility(compatibilityScore);
                });
              },
              child: Text('Calculate Compatibility'),
            ),
            SizedBox(height: 20),
            Text(
              'Compatibility Result: $compatibilityResult',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              'Compatibility Score: ${compatibilityScore.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  double calculateCompatibility(String sign1, String sign2) {
    int index1 = _zodiacSigns.indexOf(sign1);
    int index2 = _zodiacSigns.indexOf(sign2);

    return compatibilityValues[index1][index2].toDouble();
  }

  String interpretCompatibility(double score) {
    if (score >= 81) {
      return 'Very High Compatibility';
    } else if (score >= 61) {
      return 'High Compatibility';
    } else if (score >= 46) {
      return 'Medium Compatibility';
    } else if (score >= 36) {
      return 'Low Compatibility';
    } else {
      return 'Very Low Compatibility';
    }
  }
}

List<String> _zodiacSigns = [
  'Aries',
  'Taurus',
  'Gemini',
  'Cancer',
  'Leo',
  'Virgo',
  'Libra',
  'Scorpio',
  'Sagittarius',
  'Capricorn',
  'Aquarius',
  'Pisces',
];

// import 'package:flutter/material.dart';
//
//
// class CompatibilityScreen extends StatefulWidget {
//   const CompatibilityScreen({super.key});
//
//   @override
//   _CompatibilityScreenState createState() => _CompatibilityScreenState();
// }
//
// class _CompatibilityScreenState extends State<CompatibilityScreen> {
//   String selectedSign1 = 'Aries';
//   String selectedSign2 = 'Taurus';
//   String compatibilityResult = '';
//   double compatibilityScore = 0.0;
//
//   // Define your compatibility data here
//   List<List<int>> compatibilityValues = [
//     [50, 38, 83, 42, 97, 63, 85, 50, 93, 47, 78, 67],
//     [38, 65, 33, 97, 73, 90, 65, 88, 30, 98, 58, 85],
//     [83, 33, 60, 65, 88, 68, 93, 28, 60, 68, 85, 53],
//     [42, 97, 65, 75, 35, 90, 43, 94, 53, 83, 27, 98],
//     [97, 73, 88, 35, 45, 35, 97, 58, 93, 35, 68, 38],
//     [63, 90, 68, 90, 35, 65, 68, 88, 48, 95, 30, 88],
//     [85, 65, 93, 43, 97, 68, 75, 35, 73, 55, 90, 88],
//     [50, 88, 28, 94, 58, 88, 35, 80, 28, 95, 73, 97],
//     [93, 30, 60, 53, 93, 48, 73, 28, 45, 60, 90, 63],
//     [47, 98, 68, 83, 35, 95, 55, 95, 60, 75, 68, 88],
//     [78, 58, 85, 27, 68, 30, 90, 73, 90, 68, 45, 45],
//     [67, 85, 53, 98, 38, 88, 88, 97, 63, 88, 45, 60],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Zodiac Compatibility'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButton<String>(
//               value: selectedSign1,
//               items: _zodiacSigns.map((String sign) {
//                 return DropdownMenuItem<String>(
//                   value: sign,
//                   child: Text(sign),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedSign1 = newValue!;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             DropdownButton<String>(
//               value: selectedSign2,
//               items: _zodiacSigns.map((String sign) {
//                 return DropdownMenuItem<String>(
//                   value: sign,
//                   child: Text(sign),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedSign2 = newValue!;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Calculate compatibility
//                 compatibilityScore = calculateCompatibility(selectedSign1, selectedSign2);
//
//                 // Update compatibility result based on the calculated score
//                 setState(() {
//                   compatibilityResult = interpretCompatibility(compatibilityScore);
//                 });
//               },
//               child: Text('Calculate Compatibility'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Compatibility Result: $compatibilityResult',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               'Compatibility Score: ${compatibilityScore.toStringAsFixed(2)}%',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   double calculateCompatibility(String sign1, String sign2) {
//     int index1 = _zodiacSigns.indexOf(sign1);
//     int index2 = _zodiacSigns.indexOf(sign2);
//
//     return compatibilityValues[index1][index2].toDouble();
//   }
//
//   String interpretCompatibility(double score) {
//     if (score >= 70) {
//       return 'High Compatibility';
//     } else if (score >= 40) {
//       return 'Medium Compatibility';
//     } else {
//       return 'Low Compatibility';
//     }
//   }
// }
//
// List<String> _zodiacSigns = [
//   'Aries',
//   'Taurus',
//   'Gemini',
//   'Cancer',
//   'Leo',
//   'Virgo',
//   'Libra',
//   'Scorpio',
//   'Sagittarius',
//   'Capricorn',
//   'Aquarius',
//   'Pisces',
// ];
