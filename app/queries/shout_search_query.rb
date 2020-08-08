class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def by_term
    shouts_for_text_shouts.or(shouts_for_photo_shouts)
  end

  private

  def shouts_for_text_shouts
    Shout.where(content_type: 'TextShout', content_id: matching_text_shouts)
  end

  def shouts_for_photo_shouts
    Shout.where(content_type: 'PhotoShout', content_id: matching_photo_shouts)
  end

  def matching_text_shouts
    TextShout.where("concat(text_shouts.body,' ') LIKE ?", "%#{@term} %")
  end

  def matching_photo_shouts
    PhotoShout.where('image_file_name LIKE ?', "%#{@term}%")
  end
end
