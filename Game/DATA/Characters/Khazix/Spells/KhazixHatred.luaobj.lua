BuffTextureName = "Khazix_RengarHunt.dds"
BuffName = "KhazixHatred"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhuntenemy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "khazixhunt"}
  }
}
