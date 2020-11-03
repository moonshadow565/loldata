NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "NIdalee_Bushwhack.dds"
BuffName = "Bushwhack"
AutoBuffActivateEffect = "global_Watched.troy"
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
      DestVar = "DamagePerTick",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        20,
        31.25,
        42.5,
        53.75,
        65
      }
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
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Debuff",
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
  },
  {
    Function = BBGetSpellBlock,
    Params = {TargetVar = "Owner", DestVar = "SubjectMR"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Debuff",
      Src1VarTable = "InstanceVars",
      Src2Var = "SubjectMR",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "mrInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
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
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "mrInc",
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
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "DamagePerTick",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.1,
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
      Src1Var = "Debuff",
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
  },
  {
    Function = BBGetSpellBlock,
    Params = {TargetVar = "Owner", DestVar = "SubjectMR"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SubjectMR",
      Src2Var = "mrInc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SubjectMR",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Debuff",
      Src1VarTable = "InstanceVars",
      Src2Var = "SubjectMR",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "mrInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
