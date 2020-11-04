BuffTextureName = "3032_Innervating_Locket.dds"
BuffName = "InnervatingLocketAuraFriend"
AutoBuffActivateEffect = "ZettasManaManipulator_itm.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaRegenBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealthRegenBonus",
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
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPRegenMod,
          TargetVar = "Owner",
          DeltaVar = "HealthRegenBonus",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
