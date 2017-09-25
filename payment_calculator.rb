def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def not_string?(num)
  num.to_s == num
end

loop do # main
  prompt('Welcome to the mortgage calculator!')

  loan = ''
  loop do
    prompt('Enter your loan amount:')
    loan = gets.chomp

    if valid_number?(loan)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  prompt('Enter your APR: (example: 5 or 3.5)')

  apr = gets.chomp.to_f * 0.01
  apr_m = apr / 12

  duration = ''
  duration_m = ''

  loop do
    prompt('Enter your loan duration in years:')
    duration = gets.chomp
    duration_m = duration.to_i * 12

    if valid_number?(duration)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  payment_m = loan.to_i * (apr_m / (1 - (1 + apr_m)**-duration_m))
  puts "Your monthly payment with be $#{payment_m.round(2)}"

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Calculator. Good-bye")
