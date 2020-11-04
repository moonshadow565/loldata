NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Fiddlesticks_DarkWind.dds"
BuffName = "Silence"
AutoBuffActivateEffect = "LOC_Silence.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks",
  "CandyCaneFiddlesticks"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "fleeslow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_darkwind_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darkwind_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotfiddlesticksdarkwind"
    }
  }
}
