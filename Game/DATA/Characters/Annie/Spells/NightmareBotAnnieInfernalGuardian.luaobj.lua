NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
IsPetDurationBuff = true
function UpdateBuffs(A0_0, A1_1, A2_2, A3_3)
  if A2_2 < 1 then
    SetScaleSkinCoef(A2_2, A1_1)
  end
end
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "annie_skin05_r_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "annie_skin02_r_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "annie_skin09_r_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "annie_r_cas.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "annietibbers"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardian"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardianguide"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotannieinfernalguardianburning"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardiantimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotannieinfernalguardiangrowth"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pyromania"}
  }
}
