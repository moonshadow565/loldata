NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Lissandra_W.dds"
BuffName = "LissandraW"
SpellDamageRatio = 0.5
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Snared"
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_W_Root_Champion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_w_root_minion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_shards.troy"
    }
  }
}
