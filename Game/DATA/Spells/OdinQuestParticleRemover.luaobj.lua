BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "OdinCenterShrineBuff"
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinquestindicator"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "odinquestindicator"
    }
  }
}
