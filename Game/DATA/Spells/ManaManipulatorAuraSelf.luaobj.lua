BuffTextureName = "3037_Mana_Manipulator.dds"
BuffName = "Mana Regeneration Aura"
AutoBuffActivateEffect = "ZettasManaManipulator_itm.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaRegenBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "ManaRegenBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
