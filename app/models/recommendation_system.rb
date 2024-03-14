class RecommendationSystem
  def self.cosine_similarity(vec1, vec2)
    dot_product = vec1.inner_product(vec2)
    magnitude = vec1.magnitude * vec2.magnitude
    return 0 if magnitude.zero?
    dot_product / magnitude
  end

  def self.calculate_user_similarity(user1, user2)
    interactions1 = UserItemInteraction.where(user: user1).pluck(:rating)
    interactions2 = UserItemInteraction.where(user: user2).pluck(:rating)
    
    vec1 = Vector[*interactions1]
    vec2 = Vector[*interactions2]
    
    cosine_similarity(vec1, vec2)
  end

  def self.generate_recommendations(target_user, similar_users, num_recommendations = 3)
    target_user_interactions = UserItemInteraction.where(user: target_user)
    recommendations = Hash.new(0)
    
    similar_users.each do |user, similarity|
      user_interactions = UserItemInteraction.where(user: user)
      user_interactions.each do |interaction|
        next if target_user_interactions.exists?(item: interaction.item)
        
        recommendations[interaction.item] += similarity
      end
    end
    
    recommendations.sort_by { |_item, score| -score }.first(num_recommendations).to_h
  end
end
