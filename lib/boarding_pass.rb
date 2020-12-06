class BoardingPass
  def highest_seat_id(boarding_passes)
    max_seat_id = 0
    boarding_passes.each do |boarding_pass|
      row = find_position(boarding_pass[0..-4], 128)
      column = find_position(boarding_pass[-3..-1], 8)
      seat_id = 8 * row + column
      max_seat_id = seat_id > max_seat_id ? seat_id : max_seat_id
    end

    max_seat_id
  end

  def find_position(halves, max)
    min = 0
    halves.each_char do |half|
      diff = (max - min) / 2
      half == 'F' || half == 'L' ? max -= diff : min += diff
    end

    min
  end

  def my_seat(boarding_passes)
    occupied_seats = {}
    boarding_passes.each do |boarding_pass|
      row = find_position(boarding_pass[0..-4], 128)
      column = find_position(boarding_pass[-3..-1], 8)
      occupied_seats[row] ? occupied_seats[row].push(column) : occupied_seats[row] = [column]
    end

    rows_with_unoccupied_seats = (occupied_seats.select {|row, seats| seats.length < 8}).keys
    rows_with_unoccupied_seats.delete_if {|row| !occupied_seats[row-1] || !occupied_seats[row+1] }
    my_row = rows_with_unoccupied_seats[0]
    occupied_seats[my_row].sort!.each_with_index do |seat, index|
      unless seat == index
        return 8 * my_row + index
      end
    end
  end
end