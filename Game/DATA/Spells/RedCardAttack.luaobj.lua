TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Attacker",
      DestVar = "baseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "baseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Dodge,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "HitResult",
              Value2 = HIT_Miss,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 1,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBGetTotalAttackDamage,
                Params = {
                  TargetVar = "Owner",
                  DestVar = "AttackDamage"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BonusDamage",
                  SrcValueByLevel = {
                    30,
                    45,
                    60,
                    75,
                    90
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AttackDamage",
                  Src2Var = "BonusDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "RedCardDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "PickaCard_red_tar.troy",
                  Flags = 0,
                  EffectIDVar = "arrm8y",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "RedCardDamage",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "RedCardDamage"
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Target"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "CardmasterRedCardAOE",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PickACard"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pickacard_red_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterredcardaoe"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pickacard"}
  }
}
