NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Xerath_R1.dds"
BuffName = "XerathR"
SpellFXOverrideSkins = {
  "IronForgeXerath"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathlocusofpower2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathrsoftlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathrshots"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_darkiron_magmadrip.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathrmissilewrapper"
    }
  }
}
