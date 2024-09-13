from typing import List
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        def dfs(i: int, s: int):#s is the target over here 
            if s == 0:
                ans.append(t[:])
                return
            if s < candidates[i]:
                return
            for j in range(i, len(candidates)):
                t.append(candidates[j])
                dfs(j, s - candidates[j])
                t.pop()

        candidates.sort()
        t = []
        ans = [] #'''this is the solution list'''
        dfs(0, target)
        return ans



'''
Copy code r = range(1, 11) 11 is excluded so leftinclusive and right exclusive
'''
sol = Solution()
print(sol.combinationSum([2,3,6,7], 18))