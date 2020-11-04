BuffTextureName = "35.dds"
BuffName = "ExhaustDebuff"
AutoBuffActivateEffect = "summoner_banish.troy"
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ArmorMod",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyAssistMarker,
        Params = {
          Duration = 10,
          TargetVar = "Owner",
          SourceVar = "Attacker"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "ArmorMod",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
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
        Function = BBIncStat,
        Params = {
          Stat = IncFlatSpellBlockMod,
          TargetVar = "Owner",
          DeltaVar = "ArmorMod",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
