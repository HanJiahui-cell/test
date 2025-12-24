package test

import std.collection.*

func find_longest_substring_length(s: String): Int64 {
    if (s.size == 0) {
        return 0
    }

    var char_index = HashMap<Int64, Int64>()
    var max_length: Int64 = 0
    var left: Int64 = 0

    for (right in 0..(s.size)) {
        let c: Int64 = Int64(s[right])

        // 如果字符已存在且索引在左指针右侧
        if (char_index.contains(c) && char_index[c] >= left) {
            left = char_index[c] + 1
        }

        char_index[c] = right
        max_length = max(max_length, right - left + 1)
    }

    return max_length
}

main() {
    let input = readln()
    let result = find_longest_substring_length(input)
    println("${result}")
}