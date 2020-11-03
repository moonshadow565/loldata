NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "3069_Sword_of_Light_and_Shadow.dds"
BuffName = "Mourning"
AutoBuffActivateEffect = "bleeding_GLB2_tar.troy"
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "executionerscalling_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "executionerscalling_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
