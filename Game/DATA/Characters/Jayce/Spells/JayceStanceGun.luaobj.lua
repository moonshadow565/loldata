NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Jayce_R1.dds"
BuffName = "JayceStanceGun"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jayceshockblast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycehypercharge"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jayceaccelerationgate"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycestancegth"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_stance_range.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_stance_range_hammer.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassiverangedattack"
    }
  }
}
