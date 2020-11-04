BuffTextureName = "Regeneration_Sigil.dds"
BuffName = "RegenerationAura"
AutoBuffActivateEffect = "regen_rune_new_buf.troy"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "regen_rune_new_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "regenerationrune"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterregenspell"
    }
  }
}
