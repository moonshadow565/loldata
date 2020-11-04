BuffTextureName = "Caitlyn_YordleSnapTrap.dds"
PersistsThroughDeath = true
NonDispellable = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "CaitlynYordleTrap"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Owner",
          BuffName = "CaitlynYordleTrap"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynyordletrap"
    }
  }
}
