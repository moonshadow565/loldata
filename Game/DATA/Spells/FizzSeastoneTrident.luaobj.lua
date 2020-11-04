BuffTextureName = "FizzSeastoneActive.dds"
BuffName = "FizzMalison"
AutoBuffActivateEffect = "Fizz_SeastoneTrident.troy"
AutoBuffActivateAttachBoneName = "root"
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzseastonetridentactive"
    }
  }
}
