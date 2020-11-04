BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "Holy Fervor"
AutoBuffActivateEffect = "HolyFervor_buf.troy"
AutoBuffActivateAttachBoneName = "spine"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedIncrease",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
