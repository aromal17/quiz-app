class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;

    // Here, we could have done return List.of(answers).shuffle(); 
    //But shuffle() would always return a void and hence chaining it here to get back a list will not work
  }
}
