NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Lissandra_Q.dds"
BuffName = "LissandraQ"
AutoBuffActivateEffect = "Global_Freeze.troy"
SpellDamageRatio = 1
PopupMessage1 = "game_floatingtext_Slowed"
SpellFXOverrideSkins = {
  "Lissandra_skin01"
}
SpellVOOverrideSkins = {
  "ZombieBrand"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandraqshards"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandraqmissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_Q_Tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_Q_slow.troy"
    }
  }
}
