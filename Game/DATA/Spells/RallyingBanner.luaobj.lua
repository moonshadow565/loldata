BuffTextureName = "3050_Rallying_Banner.dds"
BuffName = "Stark's Fervor"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "dist",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "dist",
          Value2 = 1200,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
