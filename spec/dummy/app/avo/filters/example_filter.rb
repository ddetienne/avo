class ExampleFilter < Avo::Filters::MultipleSelectFilter
  self.name = 'example_filter'

  def apply(request, query, value)
    query.joins(:user).where(users: {team_id: value})
  end

  def options
    Team.all.map { |team| [team.id, team.name] }.to_h
  end
end
