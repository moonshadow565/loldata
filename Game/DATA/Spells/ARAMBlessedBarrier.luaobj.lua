NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "JarvanIV_GoldenAegis.dds"
BuffName = "JarvanIVGoldenAegis"
AutoBuffActivateEffect = ""
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
    Params = {
      Name = "aramblessedbarriermanager"
    }
  }
}
