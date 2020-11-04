NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Nasus_R.dds"
BuffName = "NasusR"
SpellFXOverrideSkins = {
  "NasusSkin05"
}
SpellVOOverrideSkins = {
  "NasusSkin05"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_r_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_r_buf_sound.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "nasusult"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_base_r_avatar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_base_r_aura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_base_r_handglow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_base_r_transform.troy"
    }
  }
}
