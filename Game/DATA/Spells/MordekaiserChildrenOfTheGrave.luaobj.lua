BuffTextureName = "Mordekaiser_COTG.dds"
BuffName = "MordekaiserCOTGDot"
AutoBuffActivateEffect = "mordekeiser_cotg_tar.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LifestealPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHealth",
      Src2Var = "LifestealPercent",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageToDeal",
          DestVarTable = "NextBuffVars",
          SrcVar = "DamageToDeal",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Owner",
          BuffName = "MordekaiserCOTGDot",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.01,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBGetIsZombie,
    Params = {UnitVar = "Owner", ResultVar = "zombie"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "zombie",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "VladimirSanguinePool"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VladimirSanguinePool"
            }
          }
        }
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "KogMawIcathianSurpriseReady"
        },
        SubBlocks = {
          {
            Function = BBSetBuffCasterUnit,
            Params = {CasterVar = "Caster"}
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Caster",
              TargetVar = "Owner",
              PosVar = "Owner",
              EndPosVar = "Owner",
              OverrideCastPosition = false,
              SlotNumber = 0,
              SlotType = ExtraSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LifestealPercent",
      SrcValueByLevel = {
        0.03,
        0.035,
        0.04
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "MordAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MordAP",
      Src1Value = 0,
      Src2Value = 50000,
      DestVar = "MordAP",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LifestealPercent",
      Src2Var = "MordAP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "LifestealPercent",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LifestealPercent",
      DestVarTable = "NextBuffVars",
      SrcVar = "LifestealPercent"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 8,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgdot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirsanguinepool"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurpriseready"
    }
  }
}
