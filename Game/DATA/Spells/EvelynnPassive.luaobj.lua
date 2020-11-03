BuffTextureName = "Evelynn_ShadowWalk.dds"
BuffName = "EvelynnPassive"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalkrevealeddebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "shadowwalk"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnhatespikemarker"
    }
  }
}
