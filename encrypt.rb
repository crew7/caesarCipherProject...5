def encrypt(original_string, moved_characters)
    split_string = original_string.split("")
    cased_indexes = check_if_cased(split_string)
    downcased_split_string = make_downcased(split_string)
    final_string = change_letters(downcased_split_string, moved_characters)
    capitalize_final_string(final_string, cased_indexes)
    final_string
end

def capitalize_final_string(final_string, cased_indexes)
    cased_indexes.each {|index| final_string[index] = final_string[index].upcase}
end

def change_letters(downcased_split_string, moved_characters)
    reset_moved_characters_value = moved_characters
    new_characters = downcased_split_string.map do |character|
        if isLetter(character)
            alph_index = $alpha.find_index(character)
            if moved_characters.negative?
                while moved_characters != 0
                    alph_index -= 1
                    if alph_index == -1
                        alph_index = 25
                    end
                    moved_characters += 1
                end
            elsif moved_characters.positive?
                while moved_characters != 0
                    alph_index += 1
                    if alph_index == 26
                        alph_index = 0
                    end
                    moved_characters -= 1
                end
            end

            new_character = $alpha[alph_index]
            moved_characters = reset_moved_characters_value
            new_character

        else
            character
        end
    end

   new_characters
end

def make_downcased(split_string)
    split_string.map do |character|
        if isLetter(character)
            character = character.downcase
        else
            character
        end
    end
end


def check_if_cased(split_string)
    isCased = []

    split_string.each_with_index do |character,index|
        if isLetter(character)
            if character != character.downcase
                isCased.push(index)
            end
        end
        
    end

    isCased
end

def isLetter(character)
    character.index(/[A-Za-z]/) != nil
end























$alpha = ("a".."z").to_a


p encrypt("hEfLoZ!!22",25)