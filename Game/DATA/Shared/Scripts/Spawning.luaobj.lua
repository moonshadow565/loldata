local L0, L1
function L0(A0, A1, A2, A3, A4)
  local L5, L6, L7, L8, L9, L10
  L5 = CreateChildTurret
  L6 = A0
  L7 = A1
  L8 = A2
  L9 = A3
  L10 = A4
  L5 = L5(L6, L7, L8, L9, L10)
  turret = L5
  L5 = SetWorldVar
  L6 = A0
  L7 = turret
  L5(L6, L7)
  L5 = turret
  return L5
end
SpawnTurret = L0
