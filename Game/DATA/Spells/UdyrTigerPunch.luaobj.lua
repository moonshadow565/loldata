BuffTextureName = "Udyr_TigerStance.dds"
BuffName = "UdyrTigerPunch"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = "L_Finger"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = "R_Finger"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateAttachBoneName4 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "activeAttackSpeed",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "hitOnce",
      Src1VarTable = "CharVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {EffectIDVar = "lhand", EffectIDVarTable = "CharVars"}
      },
      {
        Function = BBSpellEffectRemove,
        Params = {EffectIDVar = "rhand", EffectIDVarTable = "CharVars"}
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "activeAttackSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "hitOnce",
      Src1VarTable = "CharVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "hitOnce",
          DestVarTable = "CharVars",
          SrcValue = false
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "baseDamage",
          SrcValueByLevel = {
            30,
            80,
            130,
            180,
            230
          }
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {TargetVar = "Owner", DestVar = "TAD"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TAD",
          Src1Value = 0,
          Src2Value = 1.7,
          DestVar = "DotDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DotDamage",
          Src2Var = "baseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DotDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DotDamage",
          Src1Value = 0,
          Src2Value = 0.25,
          DestVar = "DotDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DotDamage",
          DestVarTable = "NextBuffVars",
          SrcVar = "DotDamage"
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "UdyrTigerPunchBleed",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Damage,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {EffectIDVar = "lhand", EffectIDVarTable = "CharVars"}
      },
      {
        Function = BBSpellEffectRemove,
        Params = {EffectIDVar = "rhand", EffectIDVarTable = "CharVars"}
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunchbleed"
    }
  }
}
