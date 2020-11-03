NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Armordillo_Powerball.dds"
BuffName = "PowerBall"
AutoBuffActivateEffect = "ArmordilloSpin.troy"
AutoBuffActivateEffect2 = "Powerball_buf.troy"
SpellToggleSlot = 1
SpellFXOverrideSkins = {
  "MetalRammus",
  "RoboRammus"
}
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "rammuspb"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "powerballstop.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "powerballhit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerballstunself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerballslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerballstun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "powerball"}
  }
}
