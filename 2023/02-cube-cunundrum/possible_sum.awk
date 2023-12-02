#! /bin/awk -f

BEGIN {
    max_red = 12
    max_green = 13
    max_blue = 14

    result = 0
}
match($0, /Game ([0-9]+): (.*)/, game) {
    split(game[2], rounds, "; ")
    for (i in rounds) if (!is_possible(rounds[i])) next
    result += game[1]
}
END { print result }

function is_possible(round) {
    split(round ", ", groups, ", ")
    for (j = 1; j < length(groups); j++) {
        split(groups[j], parts, " ")
        switch (parts[2]) {
            case "red":
                if (parts[1] > max_red) return 0
                break
            case "green":
                if (parts[1] > max_green) return 0
                break
            case "blue":
                if (parts[1] > max_blue) return 0
                break
            default:
                print "error in game " id " round " i ": " round
                return 0
        }
    }
    return 1
}