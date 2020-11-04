NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "KogMaw_IcathianSurprise.dds"
BuffName = "KogMawIcathianSurprise"
AutoBuffActivateEffect = "KogMawIcathianSurprise_foam.troy"
AutoBuffActivateAttachBoneName = "C_Mouth_d"
AutoBuffActivateEffect2 = "KogMawIcathianSurprise_splats.troy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurprisesound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawdeathproc.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawdeathbackbeam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "untargetable"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "kogmawdead"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawdeath_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawdead_idle.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurprise"
    }
  }
}
