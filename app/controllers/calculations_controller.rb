class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================
    @character_count_with_spaces = @text.length

    num_spaces = @text.count(' ')

    @character_count_without_spaces = @character_count_with_spaces - num_spaces

    @word_count = @text.split(' ').length

    @occurrences = @text.scan(@special_word).length
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    npv = 0.0
    num_months = 12 * @years
    rate_per_month = @apr / (100.0 * 12.0)
    interest_per_month = rate_per_month * @principal

    for t in 1...num_months
      npv += interest_per_month / ((1.0 + rate_per_month) ** t)
    end

    npv += @principal / ((1.0 + rate_per_month) ** num_months)

    @monthly_payment = npv * rate_per_month / (1.0 - 1.0 / ((1 + rate_per_month) ** num_months))
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 60.0
    @hours = @minutes / 60.0
    @days = @hours / 24.0
    @weeks = @days / 7.0
    @years = @days / 365.25
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.length

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    if @count.odd?
      @median = @sorted_numbers[@count / 2]
    else
      @median = (@sorted_numbers[@count /2 - 1] + @sorted_numbers[@count / 2]) / 2.0
    end
    
    @sum = @numbers.sum

    @mean = @sum / @count

    sum_of_squares = @numbers.map{|x| (x - @mean) ** 2}.reduce(:+)

    @variance =  sum_of_squares / @count

    @standard_deviation =  Math.sqrt(@variance)
    max_count = 0
    for i in @numbers
      count = @numbers.count(i)
      if count > max_count
        max_count = count
        @mode = i
      end
    end

  end
end
