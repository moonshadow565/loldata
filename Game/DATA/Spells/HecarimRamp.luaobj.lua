NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Armordillo_Powerball.dds"
BuffName = "PowerBall"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_e_speed_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimrampattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimramp"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimrampspeed"
    }
  }
}
