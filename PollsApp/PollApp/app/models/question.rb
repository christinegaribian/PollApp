class Question < ApplicationRecord

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :responses,
    through: :answer_choices,
    source: :responses


  # def results
  #   choices = answer_choices.includes(:responses)
  #   results = {}
  #
  #   choices.each do |choice|
  #     results[choice.text] = choice.responses.length
  #   end
  #   results
  # end

  def results
    self.answer_choices
      .select("answer_choices.text, COUNT(answer_choices.id) AS answer_count")
      .from("answer_choices")
      .joins("LEFT JOIN responses ON responses.answer_choice_id = answer_choices.id")
      .where("answer_choices.question_id = ?", self.id)
      .group("answer_choices.id")

  end
end
