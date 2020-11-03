NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "3144_Bilgewater_Cutlass.dds"
BuffName = "BilgewaterCutlass"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "piratecutlass_cas.troy"
    }
  }
}
