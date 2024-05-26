import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {

    bool checkAnswerCorrectness(Map<String, Object> data){
      return data["user_answer"] == data["correct_answer"];
    }

    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: checkAnswerCorrectness(data) ? const Color.fromARGB(255, 136, 225, 133) : const Color.fromARGB(255, 247, 131, 144),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold,),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        data["user_answer"].toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 204, 102, 245),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        data["correct_answer"].toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 98, 175, 243),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
