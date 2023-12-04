#! /bin/awk -f

match($0, /.*: ([ *[0-9]+ *]*) \| ([ *[0-9]+ *]*)/, sides) {
    number_of_copies[++current_card]++
    split(sides[2], player_numbers, " ")
    split(sides[1], winning_dictionary, " ")
    for (i in winning_dictionary)
        winning_numbers[winning_dictionary[i]] = ""
}
{
    for (i in player_numbers) {
        if (player_numbers[i] in winning_numbers) {
            number_of_matches++
        }
    }
    for (i = 1; i <= number_of_matches; i++) {
        number_of_copies[current_card + i] += number_of_copies[current_card]
    }
}
{
    delete player_numbers
    delete winning_dictionary
    delete winning_numbers
    number_of_matches = 0
}
END {
    for (i in number_of_copies) {
        result += number_of_copies[i]
    }
    print result
}