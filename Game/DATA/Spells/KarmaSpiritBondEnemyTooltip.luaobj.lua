BuffTextureName = "KarmaSpiritBond.dds"
BuffName = "KarmaSpiritBondEnemy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Attacker",
      CasterVar = "Owner",
      BuffName = "KarmaSpiritBondC"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbondc"
    }
  }
}
