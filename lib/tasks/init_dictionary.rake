namespace :init do
  desc 'Init dictionary on redis'
  task dictionary: :environment do
    LETTER_TO_NUMBER = HashWithIndifferentAccess.new({
      "a": "2", "b": "2", "c": "2", "d": "3", "e": "3", "f": "3", "g": "4", "h": "4", "i": "4", "j": "5", "k": "5",
      "l": "5", "m": "6", "n": "6", "o": "6", "p": "7", "q": "7", "r": "7", "s": "7", "t": "8", "u": "8", "v": "8",
      "w": "9", "x": "9", "y": "9", "z": "9"
    })

    redis = Redis.new
    redis.flushall
    File.foreach('lib/tasks/words_dictionary.txt') do |dictionary_word|
      dictionary_word.strip!
      if dictionary_word.length <= 10
        number_version = dictionary_word.gsub /\w/, LETTER_TO_NUMBER
        words = redis.smembers(number_version)
        words << dictionary_word
        redis.sadd(number_version, words)
      end
    end
  end
end