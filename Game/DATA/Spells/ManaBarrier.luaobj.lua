NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_ManaBarrier.dds"
BuffName = "ManaBarrier"
AutoBuffActivateEffect = "SteamGolemShield.troy"
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "CurMana",
      OwnerVar = "Owner",
      Function = GetMana
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurMana",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "ManaShield",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaShield",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "ManaBurn",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncMana,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "ManaBurn"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaShield",
      DestVarTable = "InstanceVars",
      SrcVar = "ManaShield"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncMana,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "ManaShield",
      DeltaVarTable = "InstanceVars"
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "ManaShield",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ManaShield",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ManaShield",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SteamGolemShield_hit.troy",
          Flags = 0,
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "ManaShield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaShield",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SteamGolemShield_hit.troy",
          Flags = 0,
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  }
}
