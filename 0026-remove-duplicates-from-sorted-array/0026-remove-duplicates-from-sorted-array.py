class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        if not nums:  # Handle edge case where nums is empty
            return 0
    
    # Initialize the index for unique elements
        k = 0

    # Iterate over the array
        for i in range(1, len(nums)):
            if nums[i] != nums[k]:  # If the current eleme
                k += 1             # Move the unique index forward
                nums[k] = nums[i]  # Update the next unique position 

        return k + 1  # Return the count of unique elements
