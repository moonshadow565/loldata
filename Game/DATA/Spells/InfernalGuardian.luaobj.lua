NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
SpellDamageRatio = 0.5
IsPetDurationBuff = true
function UpdateBuffs(A0_0, A1_1, A2_2, A3_3)
  if A2_2 < 1 then
    SetScaleSkinCoef(A2_2, A1_1)
  end
end
