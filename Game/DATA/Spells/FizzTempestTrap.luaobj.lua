NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Caitlyn_YordleSnapTrap.dds"
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "caitlyn_yordleTrap_set.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_idle_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_idle_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_trigger_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_trigger_sound.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "caitlyntrap"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizztempesttrapcount"
    }
  }
}
