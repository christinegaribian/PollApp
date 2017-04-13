class Response < ApplicationRecord
  validate :respondent_already_answered
  validate :respondent_answering_own_poll

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(
    user_id: self.user_id)
  end

  private
  def respondent_already_answered
    if self.sibling_responses.pluck(:user_id).include?(self.user_id)
      errors[:already_answered] << "can not answer the same question twice"
    end
  end

  def respondent_answering_own_poll
    if answer_choice.question.poll.user_id == self.user_id
      errors[:answering_own_poll] << "You cannot answer your own poll!"
    end

  end

end
