BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "Caster Minion Aura"
AutoBuffActivateEffect = ""
function InitSpell()
end
function UpdateBuffs(A0_0, A1_1, A2_2, A3_3)
  IncPercentPhysicalDamageMod(A3_3.DamageModPercentage)
  IncPercentMagicDamageMod(A3_3.DamageModPercentage)
end
