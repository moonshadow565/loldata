NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3.dds"
BuffName = "heal"
SpellDamageRatio = 0.5
IsDeathRecapSource = true
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedshurikenmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedqenergydummy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_q_tar_double.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedshurikenshadowmarker"
    }
  }
}
