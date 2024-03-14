class RecommendationsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    similar_users = RecommendationSystem.find_similar_users(user_id)
    @recommendations = RecommendationSystem.generate_recommendations(user_id, similar_users)
  end
  def send_mail
    
  end
end
