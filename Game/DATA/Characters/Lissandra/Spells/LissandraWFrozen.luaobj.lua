NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Lissandra_W.dds"
BuffName = "LissandraW"
SpellDamageRatio = 0.5
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "lissandraSkin02"
}
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_w_root_champion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_w_root_minion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_shards.troy"
    }
  }
}
