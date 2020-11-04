DoLuaLevel("GlobalLevelScript")
MAX_MINIONS_EVER = 180
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 3
MIDDLE_TOWER = 2
BACK_TOWER = 1
HQ_TOWER2 = 4
HQ_TOWER1 = 5
RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2
INITIAL_TIME_TO_SPAWN = 90
CANNON_MINION_SPAWN_FREQUENCY = 3
INCREASE_CANNON_RATE_TIMER = 2090
MINION_HEALTH_DENIAL_PERCENT = 0
UPGRADE_MINION_TIMER = 90
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 240
DISABLE_MINION_SPAWN_MAG_TIME = 0
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
SpawnTable = {
  WaveSpawnRate = 30000,
  SingleMinionSpawnDelay = 800,
  ExpRadius = EXP_GIVEN_RADIUS,
  GoldRadius = GOLD_GIVEN_RADIUS
}
MeleeDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 1,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0.625,
  HPBonus = 0,
  HPUpgrade = 10,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 18.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 12,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CasterDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 0.625,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1,
  HPBonus = 0,
  HPUpgrade = 7.5,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 13.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 8,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CannonDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 1.5,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1.5,
  HPBonus = 0,
  HPUpgrade = 13.5,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1.5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
SuperDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "Blue_Minion_Basic",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "Red_Minion_Basic",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "Blue_Minion_Wizard",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "Red_Minion_Wizard",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "Blue_Minion_MechCannon",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "Red_Minion_MechCannon",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "Blue_Minion_MechMelee",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "Red_Minion_MechMelee",
  DefaultInfo = SuperDefaultMinionInfo
}
DefaultBarrackInfo = {
  IsDestroyed = false,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  SpawnOrderMinionNames = {
    "Super",
    "Melee",
    "Cannon",
    "Caster"
  }
}
DefaultOrderMinionInfoTable = {
  Melee = OrderMeleeMinionInfo,
  Caster = OrderCasterMinionInfo,
  Cannon = OrderCannonMinionInfo,
  Super = OrderSuperMinionInfo
}
DefaultChaosMinionInfoTable = {
  Melee = ChaosMeleeMinionInfo,
  Caster = ChaosCasterMinionInfo,
  Cannon = ChaosCannonMinionInfo,
  Super = ChaosSuperMinionInfo
}
OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
function AppendTable(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  if A1_1 ~= nil then
    L4_4 = type
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    if L4_4 == "table" then
      L4_4, L5_5 = nil, nil
      if A0_0 == nil then
        A0_0 = L6_6
      end
      for L9_9, L10_10 in L6_6(L7_7) do
        if A2_2 == true and type(L10_10) == "table" then
          A0_0[L9_9] = AppendTable(A0_0[L9_9], L10_10, A3_3, A3_3)
        else
          A0_0[L9_9] = L10_10
        end
      end
    end
  end
  return A0_0
end
function InitBarrackInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = AppendTable
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11 = L1_12
  L1_12 = AppendTable
  L2_13 = A0_11.MinionInfoTable
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11.MinionInfoTable = L1_12
  L1_12 = A0_11.MinionInfoTable
  if L1_12 ~= nil then
    L1_12 = A0_11.MinionInfoTable
    L2_13 = nil
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L1_12[L7_18]
      if L9_20.DefaultInfo ~= nil then
        AppendTable(L9_20, L9_20.DefaultInfo, true, true)
        L9_20.NumPerWave = L9_20.DefaultNumPerWave
        L9_20.GoldGivenBase = L9_20.GoldGiven
        L9_20.ExpGivenBase = L9_20.ExpGiven
      end
    end
  end
  L1_12 = A0_11.Overrides
  if L1_12 ~= nil then
    L1_12, L2_13 = nil, nil
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = type
      L9_20 = A0_11[L6_17]
      L8_19 = L8_19(L9_20)
      if L8_19 == "table" then
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 == "table" then
          L8_19 = AppendTable
          L9_20 = A0_11[L6_17]
          L8_19(L9_20, L7_18, true, true)
        end
      else
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 ~= "table" then
          A0_11[L6_17] = L7_18
        end
      end
    end
  end
  return A0_11
end
OrderBarracksBonuses = {
  InitBarrackInfo(OrderBarrack0),
  InitBarrackInfo(OrderBarrack1),
  InitBarrackInfo(OrderBarrack2)
}
ChaosBarracksBonuses = {
  InitBarrackInfo(ChaosBarrack0),
  InitBarrackInfo(ChaosBarrack1),
  InitBarrackInfo(ChaosBarrack2)
}
NeutralMinionNames = {
  "Dragon",
  "Golem",
  "wolf",
  "AncientGolem",
  "LesserWraith",
  "GiantWolf",
  "LizardElder",
  "YoungLizard",
  "Wraith",
  "Worm",
  "SmallGolem",
  "GreatWraith"
}
function CreateLaneBuildingTable()
  local L0_21, L1_22
  L0_21 = {}
  L0_21.Turret3 = true
  L0_21.Turret2 = true
  L0_21.Turret1 = true
  L0_21.Barracks = true
  return L0_21
end
OrderBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
ChaosBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3
function PreloadBarrackCharacters(A0_23)
  local L1_24, L2_25
  for _FORV_6_, _FORV_7_ in pairs(A0_23.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function OnLevelInit()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  for L5_31, L6_32 in L2_28(L3_29) do
    PreloadBarrackCharacters(L6_32)
  end
  for L5_31, L6_32 in L2_28(L3_29) do
    PreloadBarrackCharacters(L6_32)
  end
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L6_32 = L3_29()
  L2_28(L3_29, L4_30, L5_31, L6_32, L3_29())
  L2_28(L3_29)
  L2_28()
  L2_28(L3_29)
  L2_28.WaveSpawnRate = 30000
  L2_28.SingleMinionSpawnDelay = 800
  L2_28.ExpRadius = L3_29
  L2_28.GoldRadius = L3_29
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
end
function OnPostLevelLoad()
  LoadLevelScriptIntoScript("CreateLevelProps.lua")
  CreateLevelProps()
end
function OppositeTeam(A0_33)
  if A0_33 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  local L0_34, L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42, L9_43, L10_44, L11_45
  for L4_38 = 1, 2 do
    if L4_38 == 1 then
      L0_34 = OrderBarracksBonuses
    else
      L0_34 = ChaosBarracksBonuses
    end
    for L8_42 = 1, 3 do
      L9_43, L10_44 = nil, nil
      L11_45 = L0_34[L8_42]
      L11_45 = L11_45.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_45) do
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + _FORV_16_.HPUpgrade
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor + _FORV_16_.ArmorUpgrade
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance + _FORV_16_.MagicResistanceUpgrade
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function AllowDamageOnBuildings()
  local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53
  for L3_49 = RIGHT_LANE, LEFT_LANE do
    for L7_53 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_49, L7_53)
      if orderTurret ~= nil then
        if L7_53 == FRONT_TOWER then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_49, L7_53)
      if chaosTurret ~= nil then
        if L7_53 == FRONT_TOWER then
          SetInvulnerable(chaosTurret, false)
          SetTargetable(chaosTurret, true)
        else
          SetInvulnerable(chaosTurret, true)
          SetNotTargetableToTeam(chaosTurret, true, TEAM_ORDER)
        end
      end
    end
  end
end
function ResetToDefaultWaveCounts(A0_54)
  local L1_55, L2_56
  for _FORV_6_, _FORV_7_ in pairs(A0_54) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_57)
  local L1_58, L2_59
  for _FORV_6_, _FORV_7_ in pairs(A0_57) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_60, A1_61)
  local L2_62, L3_63, L4_64
  L2_62 = 0
  L3_63 = TEAM_ORDER
  if A1_61 == L3_63 then
    L3_63 = OrderBarracksBonuses
    L4_64 = A0_60 + 1
    L2_62 = L3_63[L4_64]
  else
    L3_63 = ChaosBarracksBonuses
    L4_64 = A0_60 + 1
    L2_62 = L3_63[L4_64]
  end
  L3_63 = {}
  L4_64 = SpawnTable
  L4_64 = L4_64.WaveSpawnRate
  L3_63.WaveSpawnRate = L4_64
  L4_64 = SpawnTable
  L4_64 = L4_64.SingleMinionSpawnDelay
  L3_63.SingleMinionSpawnDelay = L4_64
  L4_64 = L2_62.IsDestroyed
  L3_63.IsDestroyed = L4_64
  L4_64 = L2_62.MinionInfoTable
  L3_63.MinionInfoTable = L4_64
  ReturnTable = L3_63
  L3_63 = ReturnTable
  return L3_63
end
function GetMinionSpawnInfo(A0_65, A1_66, A2_67, A3_68, A4_69)
  local L5_70, L6_71, L7_72
  L5_70 = 0
  L6_71 = TEAM_ORDER
  if A3_68 == L6_71 then
    L6_71 = OrderBarracksBonuses
    L7_72 = A0_65 + 1
    L5_70 = L6_71[L7_72]
  else
    L6_71 = ChaosBarracksBonuses
    L7_72 = A0_65 + 1
    L5_70 = L6_71[L7_72]
  end
  L6_71 = L5_70.MinionInfoTable
  L6_71 = L6_71.Super
  L7_72 = L5_70.MinionInfoTable
  L7_72 = L7_72.Cannon
  ResetToDefaultWaveCounts(L5_70.MinionInfoTable)
  if A1_66 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_72.NumPerWave = L7_72.NumPerWave + 1
  end
  if A4_69 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "2MeleeMinions"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = A4_69
  end
  if L5_70.WillSpawnSuperMinion == 1 then
    if A3_68 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_68 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_71.NumPerWave = 2
    else
      L6_71.NumPerWave = 1
    end
    L7_72.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_70.MinionInfoTable)
    L6_71.NumPerWave = L5_70.MinionInfoTable.Super.NumPerWave
    L5_70.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_70.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_70.MinionInfoTable)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_70.SpawnOrderMinionNames,
    IsDestroyed = L5_70.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_70.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_73, A1_74, A2_75)
  local L3_76, L4_77
  L4_77 = TEAM_ORDER
  if A0_73 == L4_77 then
    L3_76 = OrderBuildingStatus
  else
    L3_76 = ChaosBuildingStatus
  end
  L4_77 = FRONT_TOWER
  if A2_75 == L4_77 then
    L4_77 = A1_74 + 1
    L4_77 = L3_76[L4_77]
    L4_77.Turret3 = false
    L4_77 = GetTurret
    L4_77 = L4_77(A0_73, A1_74, MIDDLE_TOWER)
    SetInvulnerable(L4_77, false)
    SetTargetable(L4_77, true)
  else
    L4_77 = MIDDLE_TOWER
    if A2_75 == L4_77 then
      L4_77 = A1_74 + 1
      L4_77 = L3_76[L4_77]
      L4_77.Turret2 = false
      L4_77 = GetTurret
      L4_77 = L4_77(A0_73, A1_74, BACK_TOWER)
      SetInvulnerable(L4_77, false)
      SetTargetable(L4_77, true)
    else
      L4_77 = BACK_TOWER
      if A2_75 == L4_77 then
        L4_77 = A1_74 + 1
        L4_77 = L3_76[L4_77]
        L4_77.Turret1 = false
        L4_77 = GetDampener
        L4_77 = L4_77(A0_73, A1_74)
        SetInvulnerable(L4_77, false)
        SetTargetable(L4_77, true)
      else
        L4_77 = HQ_TOWER2
        if A2_75 == L4_77 then
          L3_76.HQTower2 = false
          L4_77 = L3_76.HQTower1
          if L4_77 == false then
            L4_77 = GetHQ
            L4_77 = L4_77(A0_73)
            SetInvulnerable(L4_77, false)
            SetTargetable(L4_77, true)
          end
        else
          L4_77 = HQ_TOWER1
          if A2_75 == L4_77 then
            L3_76.HQTower1 = false
            L4_77 = L3_76.HQTower2
            if L4_77 == false then
              L4_77 = GetHQ
              L4_77 = L4_77(A0_73)
              SetInvulnerable(L4_77, false)
              SetTargetable(L4_77, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_78, A1_79)
  local L2_80, L3_81, L4_82
  L3_81 = TEAM_ORDER
  if A0_78 == L3_81 then
    L3_81 = OrderBarracksBonuses
    L4_82 = A1_79 + 1
    L2_80 = L3_81[L4_82]
  else
    L3_81 = ChaosBarracksBonuses
    L4_82 = A1_79 + 1
    L2_80 = L3_81[L4_82]
  end
  return L2_80
end
function GetDisableMinionSpawnTime(A0_83, A1_84)
  barrack = GetLuaBarracks(A1_84, A0_83)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_85, A1_86)
  cLangBarracks = GetBarracks(A1_86, A0_85)
  luaBarrack = GetLuaBarracks(A1_86, A0_85)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_85, A1_86))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_87, A1_88)
  local L2_89, L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96, L10_97
  BonusesCounter = L2_89
  for L5_92 = 1, 3 do
    L6_93, L7_94 = nil, nil
    L8_95 = TEAM_ORDER
    if A0_87 == L8_95 then
      L7_94 = TEAM_CHAOS
      L6_93 = OrderBarracksBonuses
      L8_95 = ChaosBarracksBonuses
      EnemyBarracks = L8_95
    else
      L7_94 = TEAM_ORDER
      L6_93 = ChaosBarracksBonuses
      L8_95 = OrderBarracksBonuses
      EnemyBarracks = L8_95
    end
    L8_95, L9_96 = nil, nil
    L10_97 = L6_93[L5_92]
    L10_97 = L10_97.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_97) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_92 == A1_88 + 1 then
      L6_93[L5_92].WillSpawnSuperMinion = 1
      if A0_87 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_98, A1_99)
  local L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110, L13_111, L14_112, L15_113, L16_114, L17_115, L18_116
  ReductionCounter = L2_100
  for L5_103 = 1, 3 do
    L6_104, L7_105, L8_106 = nil, nil, nil
    L9_107 = TEAM_ORDER
    if A0_98 == L9_107 then
      L8_106 = TEAM_CHAOS
      L6_104 = OrderBarracksBonuses
      L7_105 = ChaosBarracksBonuses
    else
      L8_106 = TEAM_ORDER
      L6_104 = ChaosBarracksBonuses
      L7_105 = OrderBarracksBonuses
    end
    L9_107, L10_108 = nil, nil
    L11_109 = L6_104[L5_103]
    L11_109 = L11_109.MinionInfoTable
    for L15_113, L16_114 in L12_110(L13_111) do
      L17_115 = L16_114.HPBonus
      L18_116 = L16_114.HPInhibitor
      L17_115 = L17_115 - L18_116
      L16_114.HPBonus = L17_115
      L17_115 = L16_114.DamageBonus
      L18_116 = L16_114.DamageInhibitor
      L17_115 = L17_115 - L18_116
      L16_114.DamageBonus = L17_115
      L17_115 = L16_114.ExpGiven
      L18_116 = L16_114.ExpInhibitor
      L17_115 = L17_115 + L18_116
      L16_114.ExpGiven = L17_115
      L17_115 = L16_114.GoldGiven
      L18_116 = L16_114.GoldInhibitor
      L17_115 = L17_115 + L18_116
      L16_114.GoldGiven = L17_115
    end
    if L5_103 == L13_111 then
      if A0_98 == L13_111 then
        totalNumberOfChaosBarracks = L13_111
      else
        totalNumberOfOrderBarracks = L13_111
      end
      L13_111.WillSpawnSuperMinion = 0
    end
    if L12_110 == 3 then
      HQ = L13_111
      L13_111(L14_112, L15_113)
      L13_111(L14_112, L15_113)
      for L16_114 = RIGHT_LANE, LEFT_LANE do
        L17_115 = GetTurret
        L18_116 = L8_106
        L17_115 = L17_115(L18_116, L16_114, HQ_TOWER1)
        L18_116 = GetTurret
        L18_116 = L18_116(L8_106, L16_114, HQ_TOWER2)
        if L17_115 ~= Nil then
          SetInvulnerable(L17_115, true)
          SetNotTargetableToTeam(L17_115, true, A0_98)
        end
        if L18_116 ~= Nil then
          SetInvulnerable(L18_116, true)
          SetNotTargetableToTeam(L18_116, true, A0_98)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_117, A1_118)
  local L2_119
  ReactiveCounter = ReactiveCounter + 1
  L2_119 = OppositeTeam(A0_117)
  dampener = GetDampener(A0_117, A1_118)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_119, A1_118)
end
function DisableSuperMinions(A0_120, A1_121)
  local L2_122, L3_123
  if A0_120 == TEAM_ORDER then
    L2_122 = OrderBarracksBonuses[A1_121 + 1]
    L3_123 = ChaosBarracksBonuses[A1_121 + 1]
  elseif A0_120 == TEAM_CHAOS then
    L2_122 = ChaosBarracksBonuses[A1_121 + 1]
    L3_123 = OrderBarracksBonuses[A1_121 + 1]
  end
  if L3_123 then
    L3_123.WillSpawnSuperMinion = 0
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_124)
  local L1_125, L2_126, L3_127
  L1_125 = GetHQType
  L2_126 = A0_124
  L1_125 = L1_125(L2_126)
  HQType = L1_125
  L1_125 = HQType
  L2_126 = ORDER_HQ
  if L1_125 ~= L2_126 then
    L1_125 = HQType
    L2_126 = CHAOS_HQ
  elseif L1_125 == L2_126 then
    L1_125 = HQType
    L2_126 = CHAOS_HQ
    if L1_125 == L2_126 then
      L1_125 = EndOfGameCeremony
      L2_126 = TEAM_ORDER
      L3_127 = A0_124
      L1_125(L2_126, L3_127)
    else
      L1_125 = EndOfGameCeremony
      L2_126 = TEAM_CHAOS
      L3_127 = A0_124
      L1_125(L2_126, L3_127)
    end
    return
  end
  L1_125 = IsDampener
  L2_126 = A0_124
  L1_125 = L1_125(L2_126)
  if L1_125 then
    L1_125 = GetLinkedBarrack
    L2_126 = A0_124
    L1_125 = L1_125(L2_126)
    barrack = L1_125
    L1_125 = GetTeamID
    L2_126 = barrack
    L1_125 = L1_125(L2_126)
    barrackTeam = L1_125
    L1_125 = GetLane
    L2_126 = A0_124
    L1_125 = L1_125(L2_126)
    barrackLane = L1_125
    L1_125 = DisableBarracksSpawn
    L2_126 = barrackLane
    L3_127 = barrackTeam
    L1_125(L2_126, L3_127)
    L1_125 = SetDampenerState
    L2_126 = A0_124
    L3_127 = DampenerRegenerationState
    L1_125(L2_126, L3_127)
    L1_125 = SetInvulnerable
    L2_126 = A0_124
    L3_127 = true
    L1_125(L2_126, L3_127)
    L1_125 = SetTargetable
    L2_126 = A0_124
    L3_127 = false
    L1_125(L2_126, L3_127)
    L1_125 = DisactivatedCounter
    L1_125 = L1_125 + 1
    DisactivatedCounter = L1_125
    L1_125 = GetTurret
    L2_126 = barrackTeam
    L3_127 = 1
    L1_125 = L1_125(L2_126, L3_127, HQ_TOWER1)
    L2_126 = GetTurret
    L3_127 = barrackTeam
    L2_126 = L2_126(L3_127, 1, HQ_TOWER2)
    L3_127 = Nil
    if L1_125 ~= L3_127 then
      L3_127 = SetInvulnerable
      L3_127(L1_125, false)
      L3_127 = SetTargetable
      L3_127(L1_125, true)
    end
    L3_127 = Nil
    if L2_126 ~= L3_127 then
      L3_127 = SetInvulnerable
      L3_127(L2_126, false)
      L3_127 = SetTargetable
      L3_127(L2_126, true)
    end
    L3_127 = Nil
    if L1_125 == L3_127 then
      L3_127 = Nil
      if L2_126 == L3_127 then
        L3_127 = GetHQ
        L3_127 = L3_127(barrackTeam)
        SetInvulnerable(L3_127, false)
        SetTargetable(L3_127, true)
      end
    end
    L3_127 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_127 = TEAM_ORDER
    else
      L3_127 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_127, barrackLane)
  end
  L1_125 = IsTurretAI
  L2_126 = A0_124
  L1_125 = L1_125(L2_126)
  if L1_125 then
    L1_125 = GetTeamID
    L2_126 = A0_124
    L1_125 = L1_125(L2_126)
    L2_126 = GetObjectLaneId
    L3_127 = A0_124
    L2_126 = L2_126(L3_127)
    L3_127 = GetTurretPosition
    L3_127 = L3_127(A0_124)
    DeactivateCorrectStructure(L1_125, L2_126, L3_127)
    return
  end
  L1_125 = GetDampenerType
  L2_126 = A0_124
  L1_125 = L1_125(L2_126)
  if L1_125 > -1 then
    L2_126 = 0
    L3_127 = TEAM_ORDER
    if L1_125 % TEAM_CHAOS >= RIGHT_LANE and L1_125 % TEAM_CHAOS <= LEFT_LANE then
      L2_126 = ChaosBarracksBonuses[L1_125 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_125 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_127 = TEAM_CHAOS
      L2_126 = OrderBarracksBonuses[L1_125 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_125 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_126 = Log
    L3_127 = "Could not find Linking barracks!"
    L2_126(L3_127)
  end
  L2_126 = true
  return L2_126
end
function IncreaseCannonMinionSpawnRate()
  local L1_128
  L1_128 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_128
end
function PostGameSetup(A0_129)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_130, A1_131)
  local L2_132, L3_133, L4_134, L5_135, L6_136, L7_137
  for L7_137, _FORV_8_ in L4_134(L5_135) do
    if A0_130 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_137)
      break
    end
  end
end
