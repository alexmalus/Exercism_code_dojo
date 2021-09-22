class Tournament
  POINTS_FOR_WIN = 3
  POINTS_FOR_DRAW = 1
  HEADER = %w[Team MP W D L P].freeze
  MATCH_FORMAT = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze

  def self.tally(input)
    new.tally(input)
  end

  def tally(input)
    @board = [header]
    @team_results = Hash.new { |hash, key| hash[key] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }

    compute_matches(input)
    expanded_board
  end

  private

  def compute_matches(input)
    matches = input.split("\n")
    assign_team_results(matches)
  end

  def assign_team_results(matches)
    matches.each do |match|
      team1, team2, result = match.split(';')
      @team_results[team1][:mp] += 1
      @team_results[team2][:mp] += 1

      case result
      when 'win'
        @team_results[team1][:w] += 1
        @team_results[team1][:p] += POINTS_FOR_WIN
        @team_results[team2][:l] += 1
      when 'draw'
        @team_results[team1][:d] += 1
        @team_results[team2][:d] += 1
        @team_results[team1][:p] += POINTS_FOR_DRAW
        @team_results[team2][:p] += POINTS_FOR_DRAW
      else # 'loss'
        @team_results[team1][:l] += 1
        @team_results[team2][:p] += POINTS_FOR_WIN
        @team_results[team2][:w] += 1
      end
    end
  end

  def expanded_board
    ranked_teams.each do |name, result|
      arr = [name, result[:mp], result[:w], result[:d], result[:l], result[:p]]
      @board << format(arr)
    end

    @board.join
  end

  def ranked_teams
    @team_results.sort_by { |k, v| [-v[:p], k] }
  end

  def header
    format(HEADER)
  end

  def format(array)
    MATCH_FORMAT % array
  end
end
