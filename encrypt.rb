def encrypt(original_string, moved_characters)
    split_string = original_string.split("")
    cased_indexes = check_if_cased(split_string)
    downcased_split_string = make_downcased(split_string)
    downcased_split_string
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























alpha = ("a".."z").to_a




p encrypt("hElLo!!22",5)