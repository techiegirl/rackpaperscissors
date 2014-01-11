class GameController < ApplicationController

  def index

  end

  def get_result
    user_choice = params[:value]
    server_choice = get_server_choice

    result = get_winner(user_choice, server_choice)
    render :text => result
  end

  private

  def get_server_choice
    choice = rand(3)
    return SIGNS[choice]
  end

  def get_winner(user_choice, server_choice)
    result = "Error!"

    if user_choice == server_choice
        result = "Its A Tie :)"
    else
        rule_key = user_choice + '_' + server_choice
        winner = RULES[rule_key.to_s]

        if winner == user_choice
          result = "You Won!! Yayyy!!!"
        elsif winner == server_choice
          result = "Sorry! You Lost!! Better Luck Next Time!!"
        end
      end

    return result
  end

end