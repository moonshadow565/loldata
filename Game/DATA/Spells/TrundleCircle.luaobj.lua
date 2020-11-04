NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "XinZhao_CrescentSweep.dds"
BuffName = "TrundleCircle"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_plagueblock_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_plagueblock_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalwallpush"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "trundlewall"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlecircle"
    }
  }
}
