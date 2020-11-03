NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDiplomaticImmunity"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyditarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diplomaticimmunity_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diplomaticimmunity_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyditargetdmg"
    }
  }
}
