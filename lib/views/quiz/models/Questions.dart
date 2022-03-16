class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List covid_questions = [
  {
    "id": 1,
    "question": "What does the “19” in “COVID-19” refer to?",
    "options": ['19 variants', '19 symptoms', '19th coronavirus', '2019 year.'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question": "The “corona” in coronavirus means:",
    "options": ['Sun', 'Beer', 'Crown', 'Strong'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Which of these is not a common COVID-19 symptom?.",
    "options": ['Blurred vision.', 'Cough', 'Fever', 'Fatigue'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Corona Virus , any virus belonging to the family of _________",
    "options": [
      'Coronadae',
      'Coronaviridae',
      'Coronavidae',
      'Coronavirisdae'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "what Country has the most number of Case of COVID -19?",
    "options": ['China', 'INDIA', 'USA', 'BRAZIL'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "What is the original name of covid-19?",
    "options": ['SARS-covid2', 'NOVEL COVID', 'Corona', 'Coronavirus'],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "How is covid-19 transmitted? ",
    "options": ['air', 'food', 'physical contact', 'saliva droplets'],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question": "When was the first infection detected?",
    "options": ['February 2020', 'January 2020', 'December 2019', 'March 2020'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "How long is the incubation period of covid-19?",
    "options": ['14 days', '7 days', '22 days', '10 days'],
    "answer_index": 0,
  },

  {
    "id": 10,
    "question": "In which city in China did the Corona-virus start?",
    "options": ['Beijing', 'Wuhan', 'Shanghai', 'Hong Kong'],
    "answer_index": 1,
  },

  {
    "id": 11,
    "question": "In a study, which cells are found in COVID-19 patients 'bode well' for long-term immunity?",
    "options": [' P-cell', 'D-Cell', 'T-Cell', 'Endothelial Cells'],
    "answer_index": 2,
  },

  {
    "id": 12,
    "question": " Which of the following diseases are related to coronavirus?",
    "options": [' MERS', 'SARS', 'Neither A nor B', 'Both A and b'],
    "answer_index": 3,
  },

  {
    "id": 13,
    "question": "From where coronavirus got its name?",
    "options": ['Due to crown-like projections.', 'Due to  leaf-like projections.', 'Due to surface structure of bricks.', 'none of the above'],
    "answer_index": 0,
  },

  {
    "id": 14,
    "question": "Who’s at highest risk of developing severe Covid-19 disease?",
    "options": ['Children', 'Pregnant women', 'People over 60 years', 'people having medical conditons'],
    "answer_index": 2,
  },

  {
    "id": 15,
    "question": "How long does the novel coronavirus survive outside the body?",
    "options": ['A week in the air', 'Several hours to days', 'upto a week', 'upto a month'],
    "answer_index": 1,
  },
  

];








