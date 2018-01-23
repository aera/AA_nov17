class QuestionReminderJob < ApplicationJob
  queue_as :default

  # Jobs are queued with perform_later are not run by your rails
  # server. A seperate ruby process is responsible for that. It must
  # run otherwise jobs will just accumulate in the database queue.
  # To run the ruby process, a job worker, open a new tab and run
  # the command: `rails jobs:work`

  def perform(question_id)
    question = Question.find question_id

    # send email reminder to owner of question
    if false
      # To run a recurring job, you call the job again inside
      # its perform like this. Kind of a recursive job.
      QuestionReminderJob.set(wait: 5.days).perform_later(question_id)
    end
  end
end
