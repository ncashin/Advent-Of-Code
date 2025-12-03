input = File.read("input.txt")


initialDialPosition = 50

partOne = input.split("\n").map { |instruction| instruction[1..-1].to_i * (instruction[0] == "L" ? -1 : 1)}.reduce([initialDialPosition, 0]) do |valueArray, movement|
    position = valueArray[0]
    numberOfZeros = valueArray[1]
    updatedPosition = (movement + position).modulo(100)
    [updatedPosition, numberOfZeros + (updatedPosition == 0 ? 1 : 0)]
  end

  partTwo = input.split("\n").map { |instruction| instruction[1..-1].to_i * (instruction[0] == "L" ? -1 : 1)}.reduce([initialDialPosition, 0]) do |valueArray, movement|
    position = valueArray[0]
    numberOfZeros = valueArray[1]
    startPosition = position
    endPosition = position + movement
    if movement > 0
      zeroesCrossed = ((endPosition - 1) / 100).floor - ((startPosition - 1) / 100).floor
    else
      zeroesCrossed = (endPosition / 100).floor - (startPosition / 100).floor
    end
    zeroesCrossed = zeroesCrossed.abs

    [endPosition.modulo(100), numberOfZeros + zeroesCrossed]
  end


puts "Part 1: " + partOne[1].to_s + "\n"
puts "Part 2: " + partTwo[1].to_s + "\n"
