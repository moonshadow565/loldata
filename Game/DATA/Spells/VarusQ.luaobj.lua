NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "VarusQCharging.dds"
BuffName = "VarusQ"
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
  "VarusAscended",
  "VarusSkin03"
}
SpellVOOverrideSkins = {
  "VarusAscended"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusqchannel.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusqchannel2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusqanimations"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusqlaunchsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusqlaunch"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "varusq"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusqexpire.troy"
    }
  }
}
