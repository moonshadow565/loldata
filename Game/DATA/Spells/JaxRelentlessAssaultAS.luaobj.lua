NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armsmaster_MasterOfArms.dds"
BuffName = "JaxRelentlessAssaultAS"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
TriggersSpellCasts = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "JaxRelentlessAttack",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "JaxRelentlessAssaultDebuff"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AS",
      SrcValueByLevel = {
        4,
        4,
        5,
        5,
        5,
        6,
        6,
        6,
        7,
        7,
        7,
        8,
        8,
        8,
        9,
        9,
        9,
        10
      }
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "JaxRelentlessAssaultAS"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src2Var = "AS",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AS",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "AS",
      Index = 1
    }
  }
}
