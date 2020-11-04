local L0, L1
L0 = 100
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
L0 = 0.3
minPercentDeathStreakPenalty = L0
L0 = 0
firstBloodBonus = L0
L0 = 90
assistMinTime = L0
L0 = 210
assistMaxTime = L0
L0 = 0.25
assistMinPercentage = L0
L0 = 0.5
assistMaxPercentage = L0
function L0(A0, A1, A2, A3)
  local L4, L5, L6, L7, L8, L9, L10
  L4 = baseKillGold
  L5 = A1 + 1
  L6 = 1
  L7 = minimumKillsForKillStreak
  if A0 >= L7 then
    L7 = math
    L7 = L7.pow
    L8 = percentBonusPerKill
    L8 = 1 + L8
    L9 = 1 + A0
    L10 = minimumKillsForKillStreak
    L9 = L9 - L10
    L7 = L7(L8, L9)
    L8 = math
    L8 = L8.min
    L9 = L7
    L10 = maxPercentKillStreakBonus
    L8 = L8(L9, L10)
    L6 = L6 * L8
  else
    L7 = minimumDeathsForDeathStreak
    if L5 >= L7 then
      L7 = math
      L7 = L7.pow
      L8 = percentReductionPerDeath
      L8 = 1 - L8
      L9 = 0.4 + L5
      L10 = minimumDeathsForDeathStreak
      L9 = L9 - L10
      L7 = L7(L8, L9)
      L8 = math
      L8 = L8.max
      L9 = L7
      L10 = minPercentDeathStreakPenalty
      L8 = L8(L9, L10)
      L6 = L6 * L8
    end
  end
  L4 = L4 * L6
  if A2 then
    L7 = firstBloodBonus
    L4 = L4 + L7
  end
  return L4
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
function L0(A0, A1)
  local L2
  L2 = minimumKillsForKillStreak
  if A0 < L2 then
    L2 = 0
    return L2
  end
  L2 = 0
  return L2
end
GetGlobalShutdownPool = L0
