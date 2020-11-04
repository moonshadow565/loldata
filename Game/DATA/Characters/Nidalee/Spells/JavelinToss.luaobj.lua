NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Nidalee_JavelinThrow.dds"
BuffName = "JavelinToss"
AutoBuffActivateEffect = "Nidalee_Base_Q_Buf.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_Overhead_LOC"
AutoBuffActivateEffect2 = "Volibear_maxStack_indicator_cast.troy"
AutoBuffActivateAttachBoneName2 = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect3 = "Volibear_maxStack_indicator_cast.troy"
AutoBuffActivateAttachBoneName3 = "R_BUFFBONE_GLB_HAND_LOC"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "HeadhunterNidalee"
}
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nidaleepassivehunted"
    }
  }
}
