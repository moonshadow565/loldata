BuffName = "Minotaur Immunity"
BuffTextureName = "Minotaur_FerociousHowl.tga"
function OnBuffActivate(A0_0, A1_1, A2_2)
  SetStunned(A0_0, false)
  SpellEffectCreate("FerosciousHowl_cas.prt", nil, owner, 0)
end
function OnBuffDeactivate(A0_3, A1_4, A2_5)
  SetStunned(A0_3, false)
end
function UpdateBuffs(A0_6, A1_7, A2_8, A3_9)
  SpellBuffRemoveType(A0_6, BUFF_Stun)
  SpellBuffRemoveType(A0_6, BUFF_Slow)
  SpellBuffRemoveType(A0_6, BUFF_Snare)
  SpellBuffRemoveType(A0_6, BUFF_Sleep)
  SpellBuffRemoveType(A0_6, BUFF_Taunt)
  SpellBuffRemoveType(A0_6, BUFF_Polymorph)
  SpellBuffRemoveType(A0_6, BUFF_Net)
  SetStunned(A0_6, false)
end
