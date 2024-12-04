from typing import List

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # Dictionary to store the number and its index
        hashmap = {}
        
        # Traverse through the list
        for i, num in enumerate(nums):
            # Calculate the complement
            complement = target - num
            
            # If complement is already in the hashmap, return indices
            if complement in hashmap:
                return [hashmap[complement], i]
            
            # Otherwise, add the current number to the hashmap
            hashmap[num] = i
