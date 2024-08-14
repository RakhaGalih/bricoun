import 'package:bricoun/components/button.dart';
import 'package:bricoun/constant/constant.dart';
import 'package:bricoun/screens/pages/hasil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentIndex = 0;
  final List<String> _questions = [
    'Merasa gugup, cemas atau gelisah?',
    'Tidak mampu menghentikan atau mengendalikan kekhawatiran?',
    'Terlalu khawatir tentang berbagai hal?',
    'Kesulitan bersantai?',
    'Merasa begitu gelisah sehingga sulit untuk duduk diam?',
    'Menjadi mudah terganggu atau kesal?',
    'Merasa takut dengan kemungkinan buruk yang akan terjadi?',
  ];

  final List<List<String>> _answers = [
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
    [
      'Sama sekali tidak',
      'Beberapa hari',
      'Lebih dari setengah hari',
      'Hampir setiap hari'
    ],
  ];

  final List<int> _selectedAnswers = List<int>.filled(7, -1);

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _calculateScore();
    }
  }

  void _previousQuestion() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers[_currentIndex] = index;
    });
  }

  Future<void> _calculateScore() async {
    if (_selectedAnswers.contains(-1)) {
      _showReminderDialog();
    } else {
      int totalScore = _selectedAnswers.reduce((a, b) => a + b);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('totalScore', totalScore);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HasilPage(totalScore: totalScore,)));
    }
  }

  void _showReminderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tolong isi semua pertanyaan ya :)'),
          content:
              const Text('Masih ada pertanyaan yang belum terjawab nih :)'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Pre-Counseling',
          style: kSemiBoldTextStyle.copyWith(fontSize: 20, color: kDarkBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jawab pertanyaan berikut: (${_currentIndex + 1}/${_questions.length})',
                    style: kSemiBoldTextStyle.copyWith(
                        fontSize: 20, color: kDarkBlue),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Dalam satu minggu terakhir :',
                    style: kMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _questions[_currentIndex],
                    style: kSemiBoldTextStyle.copyWith(
                        fontSize: 20, color: kDarkBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(_answers[_currentIndex].length, (index) {
                return RadioListTile<int>(
                  hoverColor: kBlueButton,
                  fillColor: const MaterialStatePropertyAll(kDarkBlue),
                  title: Text(_answers[_currentIndex][index]),
                  value: index,
                  groupValue: _selectedAnswers[_currentIndex],
                  onChanged: (int? value) {
                    _selectAnswer(value!);
                  },
                );
              }),
            ),
            const Spacer(),
            SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: MyButton(
                        title: 'Previous',
                        color: (_currentIndex > 0) ? Colors.white : kGrey,
                        textColor: Colors.black,
                        onTap: _previousQuestion),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: MyButton(
                        title: _currentIndex < _questions.length - 1
                            ? 'Next'
                            : 'Submit',
                        color: kBlue,
                        textColor: Colors.white,
                        onTap: _nextQuestion),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
