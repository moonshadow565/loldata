PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MordekaiserParticle",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "MordekaiserParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBGetIsZombie,
        Params = {UnitVar = "Attacker", ResultVar = "zombie"}
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
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 3,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Attacker", PositionVar = "Pos"}
          },
          {
            Function = BBCloneUnitPet,
            Params = {
              UnitToCloneVar = "Attacker",
              Buff = "MordekaiserCotgPetSlow",
              Duration = 0,
              PosVar = "Pos",
              HealthBonus = 0,
              DamageBonus = 0,
              DestVar = "Other1"
            }
          },
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "Temp1",
              OwnerVar = "Other1",
              Function = GetMaxHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Other1",
              Delta = 0,
              DeltaVar = "Temp1",
              HealerVar = "Other1"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other1",
              AttackerVar = "Owner",
              BuffName = "MordekaiserCOTGPetBuff2",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 30,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "MordekaiserCOTGRevive"
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
      Name = "mordekaisercotgpetslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgpetbuff2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgrevive"
    }
  }
}
