NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Lissandra_R.dds"
BuffName = "LissandraRSelf"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "Lissandra_skin01",
  "lissandraSkin02"
}
SpellVOOverrideSkins = {
  "ZombieBrand"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_r_iceblock_lulu.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_r_iceblock.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_r_skin.troy"
    }
  }
}
