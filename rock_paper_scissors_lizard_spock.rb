VALID_CHOICES = %w(r p s l sp)

def prompt(message)
  Kernel.puts(">> #{message}")
end

def win?(first, second)
  (first == 's' && second == 'p') ||
    (first == 'p' && second == 'r') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 's') ||
    (first == 's' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sp' && second == 'r') ||
    (first == 'r' && second == 's')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("Your point!")
  elsif win?(computer, player)
    prompt("Computer point!")
  else
    prompt("It's a tie!")
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''

  loop do
    prompt("Options: (r)rock (p)paper (s)scissors (l)lizard (sp)spock")
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = ['r', 'p', 's', 'l', 'sp'].sample

  prompt("You choose: #{choice}; Computer choose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  prompt("First to 5 wins! You: #{player_score} - Computer: #{computer_score}")
  break if player_score == 5 || computer_score == 5

end

prompt("Final Score: You #{player_score} - Computer #{computer_score}")
prompt("Thank you for playing. Good bye!")
