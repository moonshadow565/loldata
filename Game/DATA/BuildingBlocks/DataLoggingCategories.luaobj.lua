local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16, L17, L18
L0 = require
L1 = "os"
L0(L1)
L0 = {}
L1 = {}
L1.Creator = "bill.clark"
L2 = os
L2 = L2.time
L3 = {}
L3.month = 9
L3.day = 30
L3.year = 2014
L2 = L2(L3)
L1.Expiration = L2
L2 = {}
L3 = "SpearThrows"
L4 = "SpearChampHits"
L2[1] = L3
L2[2] = L4
L1.AccumulateVariables = L2
L2 = {}
L3 = "SpearAngle"
L4 = "SpearHit"
L5 = "SpearHitChampion"
L2[1] = L3
L2[2] = L4
L2[3] = L5
L1.SampleVariables = L2
L0.NidaleeSpear = L1
L1 = {}
L1.Creator = "bill.clark"
L2 = os
L2 = L2.time
L3 = {}
L3.month = 8
L3.day = 30
L3.year = 2014
L2 = L2(L3)
L1.Expiration = L2
L2 = {}
L3 = "TowerDamage"
L4 = "TowerHits"
L5 = "ChampDamage"
L6 = "ChampHits"
L2[1] = L3
L2[2] = L4
L2[3] = L5
L2[4] = L6
L1.AccumulateVariables = L2
L0.LichBane = L1
L1 = {}
L1.Creator = "bfeeney"
L2 = os
L2 = L2.time
L3 = {}
L3.month = 11
L3.day = 30
L3.year = 2014
L2 = L2(L3)
L1.Expiration = L2
L2 = {}
L3 = "AatroxWHealPerc"
L4 = "AatroxWHealPercChamps"
L5 = "AatroxWCastNumber"
L6 = "AatroxWCastEver"
L2[1] = L3
L2[2] = L4
L2[3] = L5
L2[4] = L6
L1.AccumulateVariables = L2
L0.AatroxWHit = L1
L1 = {}
L1.Creator = "jbulock"
L2 = os
L2 = L2.time
L3 = {}
L3.month = 4
L3.day = 1
L3.year = 2015
L2 = L2(L3)
L1.Expiration = L2
L2 = {}
L3 = "KrugsTaken"
L4 = "KrugsSmited"
L5 = "WolvesTaken"
L6 = "WolvesSmited"
L7 = "RazorbeaksTaken"
L8 = "RazorbeaksSmited"
L9 = "GrompTaken"
L10 = "GrompSmited"
L11 = "BlueBuffTaken"
L12 = "BlueBuffSmited"
L13 = "RedBuffTaken"
L14 = "RedBuffSmited"
L15 = "BotEelTaken"
L16 = "BotEelSmited"
L17 = "TopEelTaken"
L18 = "TopEelSmited"
L2[1] = L3
L2[2] = L4
L2[3] = L5
L2[4] = L6
L2[5] = L7
L2[6] = L8
L2[7] = L9
L2[8] = L10
L2[9] = L11
L2[10] = L12
L2[11] = L13
L2[12] = L14
L2[13] = L15
L2[14] = L16
L2[15] = L17
L2[16] = L18
L1.AccumulateVariables = L2
L0.SmiteTracker = L1
DataLoggingCategories = L0
L0 = {}
DataLoggingErroredCategories = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6
  L2 = DataLoggingErroredCategories
  L2 = L2[A0]
  if L2 == nil then
    L2 = DataLoggingErroredCategories
    L2[A0] = 1
    L2 = PrintToChat
    L3 = "DataLogging category "
    L4 = A0
    L5 = ": "
    L6 = A1
    L3 = L3 .. L4 .. L5 .. L6
    L2(L3)
  end
end
DataLoggingCategoryError = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L1 = DataLoggingCategories
  L1 = L1[A0]
  if L1 ~= nil then
    L1.Name = A0
    L2 = os
    L2 = L2.time
    L2 = L2()
    L3 = L1.Expiration
    if L3 ~= nil then
      L3 = L1.Expiration
    end
    if L2 > L3 then
      L1 = nil
      L3 = DataLoggingCategoryError
      L4 = A0
      L5 = "Expired Category"
      L3(L4, L5)
    end
  else
    L2 = DataLoggingCategoryError
    L3 = A0
    L4 = "Missing Category"
    L2(L3, L4)
  end
  return L1
end
GetDataLoggingCategory = L0
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15
  L3 = {}
  if L4 ~= nil then
    for L7, L8 in L4, L5, L6 do
      if A1 > L9 then
        L3[L9] = L8
      else
        L10 = A0.Name
        L11 = "Too many variables"
        L9(L10, L11)
      end
    end
  end
  if L5 ~= nil then
    L3.SampleStartIndex = L7
    L3.SampleValueCount = L6
    while A2 > L4 do
      if not (A1 > L7) then
        break
      end
      for L10, L11 in L7, L8, L9 do
        L12 = #L3
        L12 = L12 + 1
        L13 = GetDataLoggingSampleVariableName
        L14 = L11
        L15 = L4
        L13 = L13(L14, L15)
        L3[L12] = L13
      end
    end
    if L4 == 0 then
      L7(L8, L9)
    end
  end
  L3.SampleCount = L4
  return L3
end
GetDataLoggingCategoryValueNames = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  L2 = {}
  if L3 ~= nil then
    for L6, L7 in L3, L4, L5 do
      L8 = #L2
      L8 = L8 + 1
      L9 = GetDataLoggingSampleVariableName
      L10 = L7
      L11 = A1
      L9 = L9(L10, L11)
      L2[L8] = L9
    end
  end
  return L2
end
GetDataLoggingSampleValueNames = L0
L0 = {}
DataLoggingConstructedVariableNames = L0
function L0(A0, A1)
  local L2, L3, L4
  L2 = A0
  L3 = tostring
  L4 = A1
  L3 = L3(L4)
  L2 = L2 .. L3
  L3 = DataLoggingConstructedVariableNames
  L3 = L3[L2]
  if L3 == nil then
    L3 = DataLoggingConstructedVariableNames
    L3[L2] = L2
  end
  L3 = DataLoggingConstructedVariableNames
  L3 = L3[L2]
  return L3
end
GetDataLoggingSampleVariableName = L0
