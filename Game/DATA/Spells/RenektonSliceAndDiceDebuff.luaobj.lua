NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Renekton_Dice.dds"
BuffName = "RenektonSliceAndDiceShred"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorShred",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorShred",
      Src1VarTable = "InstanceVars",
      Src2Var = "SubjectArmor",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "armorInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "armorInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SubjectArmor",
      Src2Var = "armorInc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SubjectArmor",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorShred",
      Src1VarTable = "InstanceVars",
      Src2Var = "SubjectArmor",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "armorInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
