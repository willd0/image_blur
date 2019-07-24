  class Image
  
    def initialize(array)
      @image = array
    end
  
    def output_image
      @image.each do |output|
          puts "#{output.join}"
      end
    end
    
  def blur
  values_to_change = []
  @image.each_with_index do |row, row_index|
    row.each_with_index do |value, value_index|
      if value == 1
      # above
        if row_index != 0
        values_to_change << [row_index - 1, value_index]
        end
      # below
        if row_index != @image.length - 1
        values_to_change << [row_index + 1, value_index]
        end
      # right
        if value_index != row.length - 1
        values_to_change << [row_index, value_index + 1]
        end
      # left
        if value_index != 0
        values_to_change << [row_index, value_index - 1]
        end
      end 
    end
  end
  # after looping through all rows and columns
  values_to_change.each do |stored_values|
    # [row_index, column_index] of coordinate to change to 1
    # row: stored_values[0]
    # column: stored_values[1]
    @image[stored_values[0]][stored_values[1]] = 1
  end
  end
end
  
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts ""
image.blur
image.output_image