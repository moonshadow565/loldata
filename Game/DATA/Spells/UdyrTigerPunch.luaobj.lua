BuffTextureName = "Udyr_TigerStance.dds"
BuffName = "UdyrTigerPunch"
AutoBuffActivateEffect = "Udyr_Tiger_buf.troy"
AutoBuffActivateAttachBoneName = "L_Finger"
AutoBuffActivateEffect2 = "Udyr_Tiger_buf_R.troy"
AutoBuffActivateAttachBoneName2 = "R_Finger"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateAttachBoneName4 = ""
BuffOnHitUnitBuildingBlocks = {
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
      DestVar = "DamageMultiplier",
      SrcValueByLevel = {
        1.8,
        2.1,
        2.4,
        2.7,
        3
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
      Src1Var = "DamageMultiplier",
      Src2Var = "TAD",
      Src1Value = 0,
      Src2Value = 0,
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "udyr_tiger_claw_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
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
              Duration = 3,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
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
      Name = "udyr_tiger_claw_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunchbleed"
    }
  }
}
