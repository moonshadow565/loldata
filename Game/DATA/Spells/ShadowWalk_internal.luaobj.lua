OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StunDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StealthDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StealthDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "InitialTime",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TimeLastHit",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.2,
      fadeTime = 1.5,
      IDVar = "ID"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillFade",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StunDuration",
      DestVarTable = "NextBuffVars",
      SrcVar = "StunDuration",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ShadowWalk",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Invisibility,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "StealthDuration",
      DurationVarTable = "InstanceVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {DestVar = "CurTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurTime",
      Src2Var = "TimeLastHit",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TimeSinceLastHit",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TimeSinceLastHit",
      Value2 = 1.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "WillFade",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBPushCharacterFade,
        Params = {
          TargetVar = "Owner",
          FadeAmount = 0.2,
          fadeTime = 1,
          IDVar = "ID"
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {
      DestVar = "TimeLastHit",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 1,
      fadeTime = 0,
      IDVar = "ID"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillFade",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {
      DestVar = "TimeLastHit",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 1,
      fadeTime = 0,
      IDVar = "ID"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillFade",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "shadowwalk"}
  }
}
