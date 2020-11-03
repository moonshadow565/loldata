OnBuffActivateBuildingBlocks = {}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Nothing",
      BuffName = "MonkeyKingCloneFull"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 100,
              OffsetAngle = 0,
              PositionVar = "Pos1"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Level", SrcValue = 1}
          },
          {
            Function = BBCloneUnitPet,
            Params = {
              UnitToCloneVar = "Owner",
              Buff = "MonkeyKingClone",
              Duration = 25000,
              PosVar = "Pos1",
              HealthBonus = 0,
              DamageBonus = 0,
              ShowMinimapIcon = false,
              DestVar = "Other1"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Other1",
              BuffName = "MonkeyKingCloneSpellCast",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other1",
              AttackerVar = "Owner",
              BuffName = "MonkeyKingCloneFull",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Other1",
              EffectName = "LeBlanc_MirrorImagePoof.troy",
              Flags = 0,
              EffectIDVar = "FadeParticle",
              TargetObjectVar = "Other1",
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "LeBlanc_MirrorImagePoof.troy",
              Flags = 0,
              EffectIDVar = "FadeParticle",
              TargetObjectVar = "Owner",
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
      Name = "monkeykingclonefull"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingclone"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "monkeykingclone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingclonespellcast"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_mirrorimagepoof.troy"
    }
  }
}
