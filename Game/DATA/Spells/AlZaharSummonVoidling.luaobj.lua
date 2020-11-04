BuffTextureName = "Averdrian_AstralBarrier.dds"
BuffName = "AlZaharSummonVoidlingReady"
AutoBuffActivateEffect = "Voidling_Ready.troy"
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoesntTriggerSpellCasts",
      Src1VarTable = "SpellVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 100,
          OffsetAngle = 0,
          PositionVar = "CastPos"
        }
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "Voidling",
          Skin = "AlZaharVoidling",
          AiScript = "UncontrollablePet.lua",
          PosVar = "CastPos",
          Team = TEAM_CASTER,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = false,
          Silenced = true,
          Invulnerable = false,
          MagicImmune = false,
          IgnoreCollision = true,
          Placemarker = false,
          VisibilitySize = 500,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Owner"
        }
      },
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 5,
          DestVar = "BonusDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 50,
          DestVar = "BonusHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusHealth",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusHealth"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusDamage",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusDamage"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "AlZaharVoidling",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 21,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "IfHasBuffCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AlZaharSummonVoidling"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidling"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "alzaharvoidling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharsummonvoidling"
    }
  }
}
