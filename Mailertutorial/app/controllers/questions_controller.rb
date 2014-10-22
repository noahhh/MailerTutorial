class QuestionsController < ApplicationController
	before_action :authenticate
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	# before_action :ensure_user_owns_post


	def index
		@questions = Question.order(created_at: :desc).page params[:page]
	end

	def new
		@question = Question.new
	end

	def show
		@answer = @question.answers.build
	end

	def create
		@question = current_user.questions.build(question_params)

		if @question.save
			redirect_to @question, success: "Your question has been created."
		else
			render :new
		end
	end

	def show
		@answer = @question.answers.build
	end

	def vote
		@vote = @question.votes.build(user: current_user, value: params[:vote][:value])
		if @vote.save
			redirect_to @question, success: "Your vote was recorded."
		else
			redirect_to @question, error: "There was a problem saving your vote."
		end
	end

	private
	def set_question
		@question = Question.find(params[:id])
	end

	def question_params
		params.require(:question).permit(:title, :text, :user_id, :question_id)
	end
end
