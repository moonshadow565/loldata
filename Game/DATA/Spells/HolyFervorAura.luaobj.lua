BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "Holy Fervor Aura"
AutoBuffActivateEffect = "Divineblessing_buf.troy"
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
Nondispellable = true
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
