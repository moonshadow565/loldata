BuffTextureName = "Voidwalker_NullBlade.dds"
BuffName = "NetherBladeArmorPen"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
SpellToggleSlot = 2
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      DestVarTable = "InstanceVars",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "enrage_buf.troy",
      Flags = 0,
      EffectIDVar = "ChargedBladeEffect",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_hand",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack1",
      OverrideAnim = "Crit",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack2",
      OverrideAnim = "Crit",
      OwnerVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ChargedBladeEffect",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack1", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
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
                Function = BBGetTeamID,
                Params = {TargetVar = "Attacker", DestVar = "TeamID"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "Leona_ShieldOfDaybreak_tar.troy",
                  Flags = 0,
                  EffectIDVar = "Temp",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  PersistsThroughReconnect = false,
                  BindFlexToOwnerPAR = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "BaseDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.25,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffRemoveStacks,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "SejuaniWintersClawBuff",
                  NumStacks = 1
                }
              },
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "Count",
                  TargetVar = "Owner",
                  BuffName = "SejuaniWintersClawBuff"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 0,
                  CompareOp = CO_LESS_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "SejuaniWintersClawBuff",
                      ResetDuration = 0
                    }
                  },
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "SejuaniWintersClawDmg",
                      ResetDuration = 0
                    }
                  }
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
    Function = BBPreloadParticle,
    Params = {
      Name = "enrage_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_shieldofdaybreak_tar.troy"
    }
  }
}
