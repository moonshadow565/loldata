NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Trundle_Bite.dds"
BuffName = "TrundleTrollSmash"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Trundle_TrollSmash_buf.troy",
      Flags = 0,
      EffectIDVar = "Geeves1",
      EffectIDVarTable = "InstanceVars",
      BoneName = "C_Mouth",
      TargetObjectVar = "Owner",
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
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      SrcVar = "SpellCooldown",
      SrcVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "SpellCooldown",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Geeves1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
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
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Target", PositionVar = "TargetPos"}
          },
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
          },
          {
            Function = BBSkipNextAutoAttack,
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Target",
              OverrideCastPosition = false,
              SlotNumber = 0,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = false,
              FireWithoutCasting = false,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "TrundleTrollSmash"
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        4,
        4,
        4,
        4,
        4
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_trollsmash_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundletrollsmash"
    }
  }
}
