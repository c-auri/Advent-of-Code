{
    # thanks Mao
    gsub("one", "o1e")
    gsub("two", "t2o")
    gsub("three", "t3e")
    gsub("four", "f4r")
    gsub("five", "f5e")
    gsub("six", "s6x")
    gsub("seven", "s7n")
    gsub("eight", "e8t")
    gsub("nine", "n9e")
    gsub(/[^0-9]/, "")
    result += substr($0, 1, 1) substr($0, length($0))
}
END { print result }
