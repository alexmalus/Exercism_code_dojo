class Matrix
  def initialize(matrix)
    compute_matrix(matrix)
  end

  attr_reader :rows, :columns

  private

  attr_writer :rows, :columns

  def compute_matrix(matrix)
    @rows = []
    matrix.each_line(chomp: true) { |line| @rows << line.split.map(&:to_i) }
    @columns = @rows.transpose
  end
end

matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n 8 7 6")
print(matrix.columns[0] == [1, 4, 7, 8])
