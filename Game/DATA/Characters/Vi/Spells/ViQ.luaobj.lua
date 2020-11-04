NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "VarusQCharging.dds"
BuffName = "ViQ"
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viqanimations"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viqlaunchsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "viqlaunch"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "viq"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "viqvfx"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "viqdash"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "viqrefresh"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_q_expire.troy"
    }
  }
}
