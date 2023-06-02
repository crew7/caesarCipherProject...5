def encrypt(original_string, moved_characters)
    split_string = original_string.split("")
    cased_indexes = check_if_cased(split_string)
    downcased_split_string = make_downcased(split_string)
    altered_string = change_letters(downcased_split_string, moved_characters)
    altered_string
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


p encrypt("hElLoz!!22",1)