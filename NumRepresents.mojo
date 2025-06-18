#!/bin/mojo

fn string_null_safe(value: String) raises -> String:
    return value.split("\0")[0]

fn sum_squares(nums: List[Int]) -> Int:
    var result = 0
    for num_pos in range(len(nums)):
        result += nums[num_pos] ** 2
    return result

fn print_sum_squares(nums: List[Int]):
    print(sum_squares(nums), end = " = ")
    for i in range(len(nums)):
        print(String(nums[i]) + '²', end = (' + ' if i < 3 else '\n'))

fn index_max_elem(nums: List[Int]) -> Int:
    var result = 0
    var max_val = 0
    for i in range(len(nums)):
        if nums[i] > max_val:
            max_val = nums[i]
            result = i
    return result

fn solve_sum_four_squares(value: Int) -> List[Int]:
    var nums: List[Int] = List[Int]()
    for _ in range(4):
        nums.append(0)
    var starting = 0
    while sum_squares(nums) < value:
        for i in range(starting, 4):
            while sum_squares(nums) < value:
                nums[i] += 1
                if sum_squares(nums) == value:
                    return nums
            nums[i] -= 1
        starting = index_max_elem(nums) + 1
        nums[starting - 1] -= 1
    return nums

fn main() raises:
    var values_wrong: List[Int] = List[Int]()
    var collection = range(10000, 200000)

    for value in collection:
        var nums = solve_sum_four_squares(value)
        if sum_squares(nums) != value:
            values_wrong.append(value)
            for num_pos in range(len(nums)):
                if nums[num_pos] < 0:
                    values_wrong.append(value)
        print_sum_squares(nums)
    print("mistakes: ", len(values_wrong))
