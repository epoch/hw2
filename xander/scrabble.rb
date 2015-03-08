
class Scrabble

	def score
		score = 0
		word.upcase.split('').each do |letter|
			score = score + lookup(letter)
	end

	

		letters = {}

		letters[A] = 1
		letters[E] = 1
		letters[I] = 1
		letters[O] = 1
		letters[U] = 1
		letters[L] = 1
		letters[N] = 1
		letters[R] = 1
		letters[S] = 1
		letters[T] = 1
		letters[D] = 2
		letters[G] = 2
		letters[B] = 3
		letters[C] = 3
		letters[M] = 3
		letters[P] = 3
		letters[F] = 4
		letters[H] = 4
		letters[V] = 4
		letters[W] = 4
		letters[Y] = 4
		letters[K] = 5
		letters[J] = 8
		letters[X] = 8
		letters[Q] = 10
		letters[Z] = 10

		for each do {|lett, value|}


		defaut value of score = 0
		for each letter in word
			find  that letter in hash, take value and sum to score

		return score


	end



end








score = Scrabble.new.score
