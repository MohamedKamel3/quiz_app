import 'package:flutter/material.dart';
import 'package:quiz_app/Quistion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

//Home Screen
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  int questionIndex = 0;
  List<Quistions> questionsList = getAnswerOptions();
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Simple Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Question ${questionIndex + 1} / ${questionsList.length}",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      questionsList[questionIndex].quistionText,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: -40,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: -40,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  top: -45,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.question_mark,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              spacing: 25,
              children: questionsList[questionIndex]
                  .answerOptions
                  .map((answer) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          backgroundColor: answer == selectedAnswer
                              ? Colors.orange
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedAnswer = answer;
                          });
                        },
                        child: Text(
                          answer.answer,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  if (selectedAnswer != null) {
                    if (selectedAnswer!.isCorrect) {
                      score++;
                    }
                    if (questionIndex < questionsList.length - 1) {
                      questionIndex++;
                    } else {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            title: Text("Quiz Completed!"),
                            content: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Your score is: ",
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                    text: "$score",
                                    style: TextStyle(
                                        color: score > questionsList.length / 2
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: " out of ${questionsList.length}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: score > questionsList.length / 2
                                        ? "\nCongratulations!"
                                        : "\nBetter luck next time!",
                                    style: TextStyle(
                                        color: score > questionsList.length / 2
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      score = 0;
                                      questionIndex = 0;
                                      selectedAnswer = null;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  child: Text(
                                    "Restart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    selectedAnswer = null;
                  }
                });
              },
              child: Text(
                questionIndex == questionsList.length - 1 ? "Finish" : "Next",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
