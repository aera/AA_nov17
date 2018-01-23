class AnswerMailer < ApplicationMailer
  def notify_question_owner(answer)
    @answer = answer
    @question = answer.question
    @question_owner = answer.question.user
    mail(
      to: @question_owner.email,
      # cc: 'tam@codecore.ca',
      # bcc: 'bob@codecore.ca',
      subject: 'You got a new answer!'
    )
  end
end
