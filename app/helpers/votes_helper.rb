# helper methods can be defined in any of the helper files within the module
# note that the helper method defined here are accessible in any view file and
# note just the view files for a particular controller
module VotesHelper

  def question_vote(user_vote, question)
    if !@user_vote
      link_1 = link_to fa_icon('chevron-up 2x'), question_votes_path(@question, { is_up: true }),
                             method: :post
      link_2 = link_to fa_icon('chevron-down 2x'), question_votes_path(@question, { is_up: false }),
                             method: :post
    elsif @user_vote.is_up?
      link_1 = link_to fa_icon('chevron-circle-up 2x'), vote_path(@user_vote),
                                                   method: :delete
      link_2 = link_to fa_icon('chevron-down 2x'), vote_path(@user_vote, { is_up: false}),
                                              method: :patch
    else
      link_1 = link_to fa_icon('chevron-up 2x'), vote_path(@user_vote, { is_up: true }),
                                            method: :patch
      link_2 = link_to fa_icon('chevron-circle-down 2x'), vote_path(@user_vote),
                                                     method: :delete
    end

    "#{link_1} (#{question.votes_result}) #{link_2}"

  end

end
