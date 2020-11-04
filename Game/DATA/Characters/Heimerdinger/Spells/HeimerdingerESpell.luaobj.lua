NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Heimerdinger_E1.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoBuffActivateAttachBoneName = "Buffbone_Glb_Ground_Loc"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_e_explosion.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingeremarker"
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretlockon"
    }
  }
}
