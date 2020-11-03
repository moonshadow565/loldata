BuffTextureName = "Caitlyn_YordleSnapTrap.dds"
PersistsThroughDeath = true
NonDispellable = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "FizzTempestTrap"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Owner",
          BuffName = "FizzTempestTrap",
          ResetDuration = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizztempesttrap"
    }
  }
}
