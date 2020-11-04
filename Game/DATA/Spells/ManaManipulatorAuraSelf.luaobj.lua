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
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIncFlatPARRegenMod,
        Params = {
          PARType = PAR_MANA,
          TargetVar = "Owner",
          DeltaVar = "ManaRegenBonus",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
