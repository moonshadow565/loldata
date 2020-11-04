local L0, L1
L0 = 140
baseKillGold = L0
L0 = 2
minimumKillsForKillStreak = L0
L0 = 0.3
percentBonusPerKill = L0
L0 = 4
maxPercentKillStreakBonus = L0
L0 = 2
minimumDeathsForDeathStreak = L0
L0 = 0.21
percentReductionPerDeath = L0
L0 = 0.05
minPercentDeathStreakPenalty = L0
L0 = 80
firstBloodBonus = L0
L0 = 90
assistMinTime = L0
L0 = 210
assistMaxTime = L0
L0 = 0.25
assistMinPercentage = L0
L0 = 0.5
assistMaxPercentage = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9
  L3 = baseKillGold
  L4 = A1 + 1
  L5 = 1
  L6 = minimumKillsForKillStreak
  if A0 >= L6 then
    L6 = math
    L6 = L6.pow
    L7 = percentBonusPerKill
    L7 = 1 + L7
    L8 = 1 + A0
    L9 = minimumKillsForKillStreak
    L8 = L8 - L9
    L6 = L6(L7, L8)
    L7 = math
    L7 = L7.min
    L8 = L6
    L9 = maxPercentKillStreakBonus
    L7 = L7(L8, L9)
    L5 = L5 * L7
  else
    L6 = minimumDeathsForDeathStreak
    if L4 >= L6 then
      L6 = math
      L6 = L6.pow
      L7 = percentReductionPerDeath
      L7 = 1 - L7
      L8 = 0.4 + L4
      L9 = minimumDeathsForDeathStreak
      L8 = L8 - L9
      L6 = L6(L7, L8)
      L7 = math
      L7 = L7.max
      L8 = L6
      L9 = minPercentDeathStreakPenalty
      L7 = L7(L8, L9)
      L5 = L5 * L7
    end
  end
  L3 = L3 * L5
  if A2 then
    L6 = firstBloodBonus
    L3 = L3 + L6
  end
  return L3
end
GetBounty = L0
function L0(A0)
  local L1, L2, L3
  L1 = assistMinTime
  if A0 < L1 then
    L1 = assistMinPercentage
    return L1
  else
    L1 = assistMaxTime
    if A0 > L1 then
      L1 = assistMaxPercentage
      return L1
    end
  end
  L1 = assistMinTime
  L1 = A0 - L1
  L2 = assistMaxTime
  L3 = assistMinTime
  L2 = L2 - L3
  L1 = L1 / L2
  ratio = L1
  L1 = ratio
  L2 = assistMaxPercentage
  L3 = assistMinPercentage
  L2 = L2 - L3
  L1 = L1 * L2
  L2 = assistMinPercentage
  L1 = L1 + L2
  return L1
end
GetAssistPercentageShare = L0
