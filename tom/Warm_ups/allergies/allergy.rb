class Allergies
  def initialize(user_score)
    @user_score = user_score
  end

  $scores = {
    "cats" => 128,
    "pollen" => 64,
    "chocolate" => 32,
    "tomatoes" => 16,
    "strawberries" => 8,
    "shellfish" => 4,
    "peanuts" => 2,
    "eggs" => 1
  }

  def allergic_to?(allergen)
    if @user_score / $scores[allergen] > 0
      return true
    else
      return false
    end
  end

  def list
    allergen_list = []

    @user_score = @user_score % 256

    $scores.each do |k, v|
      if @user_score / $scores[k] > 0 && allergen_list.include?(k) == false
        @user_score -= $scores[k]
        allergen_list << k
      end
    end

    allergen_list.reverse
  end
end
