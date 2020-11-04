OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "RushDamage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 200,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Unit",
          CasterVar = "Owner",
          BuffName = "KennenLightningRushMarker"
        },
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Owner",
              DestVar = "APValue"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "APValue",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "APMod",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "RushDamage",
              Src1VarTable = "InstanceVars",
              Src2Var = "APMod",
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
              Src2Value = 2,
              DestVar = "MinionDamage",
              MathOp = MO_DIVIDE
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "KennenLightningRushMarker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2.2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMarkofStorm",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 5,
                  NumberOfStacks = 1,
                  Duration = 12,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "TotalDamage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "kennen_lr_tar.troy",
                  Flags = 0,
                  EffectIDVar = "Kennenss",
                  TargetObjectVar = "Target",
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMarkofStorm",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 5,
                  NumberOfStacks = 1,
                  Duration = 12,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "MinionDamage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "kennen_lr_tar.troy",
                  Flags = 0,
                  EffectIDVar = "Kennenss",
                  TargetObjectVar = "Target",
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
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "KennenLREnergy"
            },
            SubBlocks = {
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 40,
                  PARType = PAR_ENERGY
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "KennenLREnergy",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenlightningrushmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenmarkofstorm"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_lr_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenlrenergy"
    }
  }
}
