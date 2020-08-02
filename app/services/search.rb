class Search
  attr_reader :term

  def initialize(term:)
    @term = term
  end

  def run
    ShoutSearchQuery.new(term: @term.to_s).by_term
  end

  alias results run
end
