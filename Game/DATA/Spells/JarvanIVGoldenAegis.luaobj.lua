NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "JarvanIV_GoldenAegis.dds"
BuffName = "JarvanIVGoldenAegis"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
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
  CanHitSameTargetConsecutively = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvangoldenaegis_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvangoldenaegis_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvangoldenaegis_tar.troy"
    }
  }
}
