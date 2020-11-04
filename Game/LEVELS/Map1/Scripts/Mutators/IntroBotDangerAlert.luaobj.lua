local L0, L1
function L0()
  local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10
  for L3 = L0, L1, L2 do
    L4 = GetPlayerByClientID
    L5 = L3
    L4 = L4(L5)
    if L4 ~= nil then
      L5 = ApplyPersistentBuff
      L6 = L4
      L7 = "IntroBotDangerAlert"
      L8 = false
      L9 = 1
      L10 = 1
      L5(L6, L7, L8, L9, L10)
    end
  end
end
IntroBotDangerAlertOnInit = L0
