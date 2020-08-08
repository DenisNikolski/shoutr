class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def by_term
    Shout.joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id")
         .where("concat(text_shouts.body,' ') LIKE ?", "%#{@term} %")
  end
end
