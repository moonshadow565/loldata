NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = false
BuffTextureName = "Xerath_Q1.dds"
SpellToggleSlot = 1
OnPreDamagePriority = 3
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
SpellFXOverrideSkins = {
  "IronForgeXerath"
}
SpellVOOverrideSkins = {
  "XerathDarkIron"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathqanimations"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathqlaunchsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathqlaunchmovespeedreduction"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulsechargeup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "xerathqvfx"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulse2"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_q_expire.troy"
    }
  }
}
