def encrypt(original_string, moved_characters)
    split_string = original_string.split("")
    cased_indexes = check_if_cased(split_string)
    cased_indexes
end


def check_if_cased(split_string)
    isCased = []

    split_string.each_with_index do |character,index|
        if character.index(/[A-Za-z]/) != nil
            if character != character.downcase
                isCased.push(index)
            end
        end
        
    end

    isCased
end


























alpha = ("a".."z").to_a




p encrypt("hElLo!!22",5)