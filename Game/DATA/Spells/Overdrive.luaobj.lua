NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_Overdrive.dds"
BuffName = "Overdrive"
AutoCooldownByLevel = {
  90,
  90,
  90,
  18,
  14
}
SpellFXOverrideSkins = {
  "PiltoverCustomsBlitz",
  "iBlitz",
  "BlitzcrankSkin07"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolem_piltover_overdrive.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "overdrive_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolem_piltover_overdrive_tires.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "overdrive_buf_blitzcrank_skin07.troy"
    }
  }
}
