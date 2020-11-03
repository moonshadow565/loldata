NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBDispellNegativeBuffs,
    Params = {AttackerVar = "Owner"}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "slotCheck", SrcValue = 0}
  },
  {
    Function = BBWhile,
    Params = {
      Src1Var = "slotCheck",
      Value2 = 5,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "name",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = InventorySlots,
          SpellSlotVar = "slotCheck",
          OwnerVar = "Owner",
          Function = GetSlotSpellName
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "name",
          Value2 = "QuicksilverSash",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 60,
              SlotNumber = 0,
              SlotNumberVar = "slotCheck",
              SlotType = InventorySlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "slotCheck",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "slotCheck",
          MathOp = MO_ADD
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  }
}
