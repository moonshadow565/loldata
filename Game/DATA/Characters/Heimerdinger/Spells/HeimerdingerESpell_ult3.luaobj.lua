NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Heimerdinger_E2.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "GLOBAL_SLOW.troy"
AutoBuffActivateAttachBoneName = "Buffbone_Glb_Ground_Loc"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_e_explosion_ult_end.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingeremarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretlockon"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_e_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
