NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "NIdalee_Bushwhack.dds"
BuffName = "Bushwhack"
AutoBuffActivateEffect = "nidalee_bushwhack_sentry_tar.troy"
AutoBuffActivateAttachBoneName = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Debuff",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        -0.2,
        -0.25,
        -0.3,
        -0.35,
        -0.4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        80,
        125,
        170,
        215,
        260
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "AP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AP",
      Src1Value = 0,
      Src2Value = 0.4,
      DestVar = "APBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "APBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalDamage",
      Src1Value = 0,
      Src2Value = 4,
      DestVar = "DamagePerTick",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DOTCounter",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "Team"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "Team",
      Radius = 400,
      TargetVar = "Owner",
      Duration = 20,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "Team",
      Radius = 50,
      TargetVar = "Owner",
      Duration = 20,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "BubbleID2",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatArmorMod,
      TargetVar = "Owner",
      DestVar = "BaseArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Debuff",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -100,
      DestVar = "TooltipDebuff",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TooltipDebuff",
      Index = 1
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID2",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      DeltaVar = "Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DOTCounter",
          Src1VarTable = "InstanceVars",
          Value2 = 4,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DOTCounter",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "DOTCounter",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "DamagePerTick",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetArmor,
    Params = {TargetVar = "Owner", DestVar = "BaseArmor"}
  },
  {
    Function = BBGetSpellBlock,
    Params = {TargetVar = "Owner", DestVar = "BaseMR"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseArmor",
      Src2Var = "Debuff",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ArmorDebuff",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseMR",
      Src2Var = "Debuff",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MRDebuff",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
