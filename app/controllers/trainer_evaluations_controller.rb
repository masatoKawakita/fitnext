class TrainerEvaluationsController < ApplicationController

  def new
    @trainer_evaluation = TrainerEvaluation.new
    @user = User.find(params[:user_id])
    @trainer = Trainer.find(params[:trainer_id])
    @trainer_evaluation.user = @user
    @trainer_evaluation.trainer = @trainer
  end

  def create
    @trainer_evaluation = TrainerEvaluation.new(trainer_evaluation_params)
    # @trainer_evaluation = current_user.trainer_evaluations.build(trainer_evaluation_params)
    if @trainer_evaluation.save
      redirect_to users_path , notice:"評価を送信しました。ご協力ありがとうございました。"
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  private

  def trainer_evaluation_params
    params.require(:trainer_evaluation).permit(
      :id,
      :fun_rate,
      :understandable_rate,
      :politeness_rate,
      :kindness_rate,
      :passion_rate,
      :content,
      :user_id,
      :trainer_id
    )
  end

end
