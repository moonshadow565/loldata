BuffTextureName = "Lucian_R.dds"
BuffName = "LucianR"
AutoBuffActivateEffect = "Lucian_R_self.troy"
SpellToggleSlot = 4
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "LucianSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "lucianr"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lucianrdisable"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lucianpassivebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_r_refresh.troy"
    }
  }
}
