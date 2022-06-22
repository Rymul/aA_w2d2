# PHASE 2

class CoffeeError < StandardError
  def message
    "I LOVE COFFEE! ...but not right now. Give me something else!"
  end
end

def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise "This is not fruit!" 
  end 
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"

  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
      retry
  rescue
    puts "\n\nThis is not fruit!\n\n"
    retry
  end
end  

# PHASE 4
class YearsError < StandardError
  def message
    "We've known eachother longer than 1 year right? How many years has it been?"
  end
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
  begin
    
    
    @yrs_known = yrs_known
    raise YearsError if yrs_known < 5
    rescue YearsError => e
      puts e.message
      yrs_known = gets.chomp.to_i
    retry
  end
    puts "What's your name again?"
    @name = gets.chomp
    puts "What do we like to do again?"
    @fav_pastime = gets.chomp
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


