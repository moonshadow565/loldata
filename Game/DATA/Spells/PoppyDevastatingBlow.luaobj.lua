NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "PoppyDevastatingBlow.dds"
BuffName = "PoppyDevastatingBlow"
AutoBuffActivateEffect = "Poppy_DevastatingBlow_buf.troy"
AutoBuffActivateAttachBoneName = "hammer_b"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
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
      Name = "poppy_devastatingblow_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydevastatingblow"
    }
  }
}
