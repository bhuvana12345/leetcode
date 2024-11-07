class Solution:
    def maxDistToClosest(self, seats: List[int]) -> int:
        n = len(seats)
        max_distance = 0 # consider min as we add later
        last_occ = -1
        

        for i in range(n):
            if seats[i] == 1:
                if last_occ == -1: # if we have not found any occ seat
                    max_distance = i
                else:
                    max_distance = max(max_distance, (i - last_occ)//2)
                last_occ = i

        max_distance = max(max_distance, n - 1 - last_occ)

        return max_distance
         

                    