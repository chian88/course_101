sentence = "Humpty Dumpty sat on a wall."

word_only = sentence.split(/\W/)
# obj : wall a on sat Dumpty Humpty

word_only.reverse!()

new_sentence = word_only.join(' ') + '.'

p new_sentence
