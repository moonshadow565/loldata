EOG_SCOREBOARD_PHASE_DELAY_TIME = 1.2
MAX_MINIONS_EVER = 180
TEAM_UNKNOWN = 0
TEAM_ORDER = 100
TEAM_CHAOS = 200
TEAM_NEUTRAL = 300
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
INCREASE_CANNON_RATE_TIMER = 1200
INCREASE_CANNON_RATE_TIMER2 = 2100
MINION_HEALTH_DENIAL_PERCENT = 0
UPGRADE_MINION_TIMER = 90
UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING = 6
TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION = 3
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11.67
ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
UpgradedMinionIterations = 0
DoLuaLevel("BBLuaConversionLibrary")
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
  HPUpgrade = 13,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 2,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 19.8,
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
  HPUpgrade = 10,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 1,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 14.8,
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
  HPUpgrade = 23,
  HPUpgradeGrowth = 0.3,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 3,
  HPUpgradeGrowthLate = 0,
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
  HPUpgradeGrowth = 0,
  HPUpgradeLate = 0,
  HPUpgradeGrowthLate = 0,
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
  MinionName = "SRU_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "SRU_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "SRU_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "SRU_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "SRU_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "SRU_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "SRU_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "SRU_ChaosMinionSuper",
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
  "SRU_Dragon",
  "SRU_Krug",
  "SRU_KrugMini",
  "SRU_Red",
  "SRU_RedMini",
  "SRU_Razorbeak",
  "SRU_RazorbeakMini",
  "SRU_Murkwolf",
  "SRU_MurkwolfMini",
  "SRU_Blue",
  "SRU_BlueMini",
  "SRU_Gromp",
  "SRU_Baron"
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
function SuppressMinionSpawnForBarrack(A0_26)
  for _FORV_4_, _FORV_5_ in pairs(DefaultBarrackInfo.SpawnOrderMinionNames) do
    A0_26.MinionInfoTable[_FORV_5_].NumPerWave = 0
  end
end
function SetMutatorGlobals()
  local L0_27, L1_28
end
function OnLevelInit()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  L2_31()
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L6_35 = L3_32()
  L2_31(L3_32, L4_33, L5_34, L6_35, L3_32())
  L2_31(L3_32)
  L2_31()
  L2_31(L3_32)
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("IncreaseCannonMinionSpawnRateAgain", INCREASE_CANNON_RATE_TIMER2, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
end
function OnPostLevelLoad()
  local L0_36, L1_37, L2_38, L3_39, L4_40
  L0_36(L1_37)
  L0_36()
  for L3_39 = RIGHT_LANE, LEFT_LANE do
    L4_40 = GetDampener
    L4_40 = L4_40(TEAM_ORDER, L3_39)
    SetDampenerRespawnAnimationDuration(L4_40, ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    L4_40 = GetDampener(TEAM_CHAOS, L3_39)
    SetDampenerRespawnAnimationDuration(L4_40, CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    SetLaneExposed(TEAM_ORDER, L3_39, false)
    SetLaneExposed(TEAM_CHAOS, L3_39, false)
    SetLaneTowerCount(TEAM_ORDER, L3_39, 3)
    SetLaneTowerCount(TEAM_CHAOS, L3_39, 3)
  end
  L0_36(L1_37)
  L0_36(L1_37)
  L0_36(L1_37, L2_38)
  L0_36(L1_37, L2_38)
  L0_36(L1_37, L2_38)
end
function OnGameStartup()
  local L0_41
  L0_41 = 0
  OrderHQPos = GetKeyLocation(L0_41, TEAM_ORDER)
  ChaosHQPos = GetKeyLocation(L0_41, TEAM_CHAOS)
end
function SetShieldBuffsOnSecondaryTurrets(A0_42)
  local L1_43, L2_44, L3_45, L4_46
  for L4_46 = RIGHT_LANE, LEFT_LANE do
    if L4_46 ~= CENTER_LANE then
      innerTurret = GetTurret(A0_42, L4_46, MIDDLE_TOWER)
      ApplyPersistentBuff(innerTurret, "SRTurretSecondaryShielder", false, 1, 1)
      AddBuffCounter(innerTurret, "SRTurretSecondaryShielder", L4_46, 2)
    end
  end
end
SPELLBOOK_SUMMONER = 1
function ApplyJungleTracker(A0_47)
  if GetSlotSpellName(A0_47, 0, SPELLBOOK_SUMMONER, 0) == "summonersmite" or GetSlotSpellName(A0_47, 1, SPELLBOOK_SUMMONER, 0) == "summonersmite" then
    ApplyPersistentBuff(A0_47, "ItemJungleStatsTracker", true, 1, 1)
  end
end
function ApplyBaseBuffToAllChampions()
  LuaForEachChampion(TEAM_CHAOS, "ApplyBaseBuffChaos")
  LuaForEachChampion(TEAM_ORDER, "ApplyBaseBuffOrder")
end
function ApplyBaseBuffChaos(A0_48)
  ApplyBaseBuff(A0_48, ChaosHQPos)
end
function ApplyBaseBuffOrder(A0_49)
  ApplyBaseBuff(A0_49, OrderHQPos)
end
baseBuffRadiusSquared = 12250000
BUFF_Aura = 1
function ApplyBaseBuff(A0_50, A1_51)
  if (GetPosition(A0_50) - A1_51):lengthSq() < baseBuffRadiusSquared then
    SpellBuffAdd(A0_50, A0_50, "S5Test_BaseBuff", BUFF_Aura, 1, 0.5, nil)
  end
end
function OppositeTeam(A0_52)
  if A0_52 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  local L0_53, L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64
  UpgradedMinionIterations = L1_54
  L1_54(L2_55, L3_56)
  for L4_57 = 1, 2 do
    if L4_57 == 1 then
      L0_53 = OrderBarracksBonuses
    else
      L0_53 = ChaosBarracksBonuses
    end
    for L8_61 = 1, 3 do
      L9_62, L10_63 = nil, nil
      L11_64 = L0_53[L8_61]
      L11_64 = L11_64.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_64) do
        if UpgradedMinionIterations >= UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING then
        end
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + (_FORV_16_.HPUpgrade + _FORV_16_.HPUpgradeLate)
        _FORV_16_.HPUpgrade = _FORV_16_.HPUpgrade + (_FORV_16_.HPUpgradeGrowth + _FORV_16_.HPUpgradeGrowthLate)
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function AllowDamageOnBuildings()
  local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72
  for L3_68 = RIGHT_LANE, LEFT_LANE do
    for L7_72 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_68, L7_72)
      if orderTurret ~= nil then
        if L7_72 == FRONT_TOWER then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_68, L7_72)
      if chaosTurret ~= nil then
        if L7_72 == FRONT_TOWER then
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
function ResetToDefaultWaveCounts(A0_73)
  local L1_74, L2_75
  for _FORV_6_, _FORV_7_ in pairs(A0_73) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_76)
  local L1_77, L2_78
  for _FORV_6_, _FORV_7_ in pairs(A0_76) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_79, A1_80)
  local L2_81, L3_82, L4_83
  L2_81 = 0
  L3_82 = TEAM_ORDER
  if A1_80 == L3_82 then
    L3_82 = OrderBarracksBonuses
    L4_83 = A0_79 + 1
    L2_81 = L3_82[L4_83]
  else
    L3_82 = ChaosBarracksBonuses
    L4_83 = A0_79 + 1
    L2_81 = L3_82[L4_83]
  end
  L3_82 = {}
  L4_83 = SpawnTable
  L4_83 = L4_83.WaveSpawnRate
  L3_82.WaveSpawnRate = L4_83
  L4_83 = SpawnTable
  L4_83 = L4_83.SingleMinionSpawnDelay
  L3_82.SingleMinionSpawnDelay = L4_83
  L4_83 = L2_81.IsDestroyed
  L3_82.IsDestroyed = L4_83
  L4_83 = L2_81.MinionInfoTable
  L3_82.MinionInfoTable = L4_83
  ReturnTable = L3_82
  L3_82 = ReturnTable
  return L3_82
end
function GetMinionSpawnInfo(A0_84, A1_85, A2_86, A3_87, A4_88)
  local L5_89, L6_90, L7_91
  L5_89 = 0
  L6_90 = TEAM_ORDER
  if A3_87 == L6_90 then
    L6_90 = OrderBarracksBonuses
    L7_91 = A0_84 + 1
    L5_89 = L6_90[L7_91]
  else
    L6_90 = ChaosBarracksBonuses
    L7_91 = A0_84 + 1
    L5_89 = L6_90[L7_91]
  end
  L6_90 = L5_89.MinionInfoTable
  L6_90 = L6_90.Super
  L7_91 = L5_89.MinionInfoTable
  L7_91 = L7_91.Cannon
  ResetToDefaultWaveCounts(L5_89.MinionInfoTable)
  if A1_85 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_91.NumPerWave = L7_91.NumPerWave + 1
  end
  if A4_88 ~= LAST_WAVE then
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
    LAST_WAVE = A4_88
  end
  if L5_89.WillSpawnSuperMinion == 1 then
    if A3_87 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_87 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_90.NumPerWave = 2
    else
      L6_90.NumPerWave = 1
    end
    L7_91.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_89.MinionInfoTable)
    L6_90.NumPerWave = L5_89.MinionInfoTable.Super.NumPerWave
    L5_89.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_89.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_89.MinionInfoTable)
  end
  if GetMutatorParameterBool("SuppressMinionSpawn") then
    SuppressMinionSpawnForBarrack(L5_89)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_89.SpawnOrderMinionNames,
    IsDestroyed = L5_89.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_89.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_92, A1_93, A2_94)
  local L3_95, L4_96
  L4_96 = TEAM_ORDER
  if A0_92 == L4_96 then
    L3_95 = OrderBuildingStatus
  else
    L3_95 = ChaosBuildingStatus
  end
  L4_96 = FRONT_TOWER
  if A2_94 == L4_96 then
    L4_96 = A1_93 + 1
    L4_96 = L3_95[L4_96]
    L4_96.Turret3 = false
    L4_96 = GetTurret
    L4_96 = L4_96(A0_92, A1_93, MIDDLE_TOWER)
    SetInvulnerable(L4_96, false)
    SetTargetable(L4_96, true)
    SetLaneTowerCount(A0_92, A1_93, 2)
  else
    L4_96 = MIDDLE_TOWER
    if A2_94 == L4_96 then
      L4_96 = A1_93 + 1
      L4_96 = L3_95[L4_96]
      L4_96.Turret2 = false
      L4_96 = GetTurret
      L4_96 = L4_96(A0_92, A1_93, BACK_TOWER)
      SetInvulnerable(L4_96, false)
      SetTargetable(L4_96, true)
      SetLaneTowerCount(A0_92, A1_93, 1)
    else
      L4_96 = BACK_TOWER
      if A2_94 == L4_96 then
        L4_96 = A1_93 + 1
        L4_96 = L3_95[L4_96]
        L4_96.Turret1 = false
        L4_96 = GetDampener
        L4_96 = L4_96(A0_92, A1_93)
        SetInvulnerable(L4_96, false)
        SetTargetable(L4_96, true)
        SetLaneTowerCount(A0_92, A1_93, 0)
      else
        L4_96 = HQ_TOWER2
        if A2_94 == L4_96 then
          L3_95.HQTower2 = false
          L4_96 = L3_95.HQTower1
          if L4_96 == false then
            L4_96 = GetHQ
            L4_96 = L4_96(A0_92)
            SetInvulnerable(L4_96, false)
            SetTargetable(L4_96, true)
          end
        else
          L4_96 = HQ_TOWER1
          if A2_94 == L4_96 then
            L3_95.HQTower1 = false
            L4_96 = L3_95.HQTower2
            if L4_96 == false then
              L4_96 = GetHQ
              L4_96 = L4_96(A0_92)
              SetInvulnerable(L4_96, false)
              SetTargetable(L4_96, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_97, A1_98)
  local L2_99, L3_100, L4_101
  L3_100 = TEAM_ORDER
  if A0_97 == L3_100 then
    L3_100 = OrderBarracksBonuses
    L4_101 = A1_98 + 1
    L2_99 = L3_100[L4_101]
  else
    L3_100 = ChaosBarracksBonuses
    L4_101 = A1_98 + 1
    L2_99 = L3_100[L4_101]
  end
  return L2_99
end
function GetDisableMinionSpawnTime(A0_102, A1_103)
  barrack = GetLuaBarracks(A1_103, A0_102)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_104, A1_105)
  cLangBarracks = GetBarracks(A1_105, A0_104)
  luaBarrack = GetLuaBarracks(A1_105, A0_104)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_104, A1_105))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_106, A1_107)
  local L2_108, L3_109, L4_110, L5_111, L6_112, L7_113, L8_114, L9_115, L10_116
  BonusesCounter = L2_108
  for L5_111 = 1, 3 do
    L6_112, L7_113 = nil, nil
    L8_114 = TEAM_ORDER
    if A0_106 == L8_114 then
      L7_113 = TEAM_CHAOS
      L6_112 = OrderBarracksBonuses
      L8_114 = ChaosBarracksBonuses
      EnemyBarracks = L8_114
    else
      L7_113 = TEAM_ORDER
      L6_112 = ChaosBarracksBonuses
      L8_114 = OrderBarracksBonuses
      EnemyBarracks = L8_114
    end
    L8_114, L9_115 = nil, nil
    L10_116 = L6_112[L5_111]
    L10_116 = L10_116.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_116) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_111 == A1_107 + 1 then
      L6_112[L5_111].WillSpawnSuperMinion = 1
      if A0_106 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_117, A1_118)
  local L2_119, L3_120, L4_121, L5_122, L6_123, L7_124, L8_125, L9_126, L10_127, L11_128, L12_129, L13_130, L14_131, L15_132, L16_133, L17_134, L18_135
  ReductionCounter = L2_119
  for L5_122 = 1, 3 do
    L6_123, L7_124, L8_125 = nil, nil, nil
    L9_126 = TEAM_ORDER
    if A0_117 == L9_126 then
      L8_125 = TEAM_CHAOS
      L6_123 = OrderBarracksBonuses
      L7_124 = ChaosBarracksBonuses
    else
      L8_125 = TEAM_ORDER
      L6_123 = ChaosBarracksBonuses
      L7_124 = OrderBarracksBonuses
    end
    L9_126, L10_127 = nil, nil
    L11_128 = L6_123[L5_122]
    L11_128 = L11_128.MinionInfoTable
    for L15_132, L16_133 in L12_129(L13_130) do
      L17_134 = L16_133.HPBonus
      L18_135 = L16_133.HPInhibitor
      L17_134 = L17_134 - L18_135
      L16_133.HPBonus = L17_134
      L17_134 = L16_133.DamageBonus
      L18_135 = L16_133.DamageInhibitor
      L17_134 = L17_134 - L18_135
      L16_133.DamageBonus = L17_134
      L17_134 = L16_133.ExpGiven
      L18_135 = L16_133.ExpInhibitor
      L17_134 = L17_134 + L18_135
      L16_133.ExpGiven = L17_134
      L17_134 = L16_133.GoldGiven
      L18_135 = L16_133.GoldInhibitor
      L17_134 = L17_134 + L18_135
      L16_133.GoldGiven = L17_134
    end
    if L5_122 == L13_130 then
      if A0_117 == L13_130 then
        totalNumberOfChaosBarracks = L13_130
      else
        totalNumberOfOrderBarracks = L13_130
      end
      L13_130.WillSpawnSuperMinion = 0
      L16_133 = false
      L13_130(L14_131, L15_132, L16_133)
    end
    if L12_129 == 3 then
      HQ = L13_130
      L13_130(L14_131, L15_132)
      L13_130(L14_131, L15_132)
      for L16_133 = RIGHT_LANE, LEFT_LANE do
        L17_134 = GetTurret
        L18_135 = L8_125
        L17_134 = L17_134(L18_135, L16_133, HQ_TOWER1)
        L18_135 = GetTurret
        L18_135 = L18_135(L8_125, L16_133, HQ_TOWER2)
        if L17_134 ~= Nil then
          SetInvulnerable(L17_134, true)
          SetNotTargetableToTeam(L17_134, true, A0_117)
        end
        if L18_135 ~= Nil then
          SetInvulnerable(L18_135, true)
          SetNotTargetableToTeam(L18_135, true, A0_117)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_136, A1_137)
  local L2_138
  ReactiveCounter = ReactiveCounter + 1
  L2_138 = OppositeTeam(A0_136)
  dampener = GetDampener(A0_136, A1_137)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_138, A1_137)
end
function DisableSuperMinions(A0_139, A1_140)
  local L2_141, L3_142
  if A0_139 == TEAM_ORDER then
    L2_141 = OrderBarracksBonuses[A1_140 + 1]
    L3_142 = ChaosBarracksBonuses[A1_140 + 1]
  elseif A0_139 == TEAM_CHAOS then
    L2_141 = ChaosBarracksBonuses[A1_140 + 1]
    L3_142 = OrderBarracksBonuses[A1_140 + 1]
  end
  if L3_142 then
    L3_142.WillSpawnSuperMinion = 0
  end
end
function OnJumpToMidGameCheat(A0_143)
  local L1_144
  L1_144 = GetTurret
  L1_144 = L1_144(TEAM_ORDER, 1, HQ_TOWER1)
  if A0_143 == 0 then
    ApplyPersistentBuff(L1_144, "DebugMidGameBuff", false, 1, 1)
  else
    ApplyPersistentBuff(L1_144, "DebugLateGameBuff", false, 1, 1)
  end
end
function OnBarracksToggled(A0_145)
  local L1_146
  if A0_145 == 0 then
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_147)
  local L1_148, L2_149, L3_150
  L1_148 = GetHQType
  L2_149 = A0_147
  L1_148 = L1_148(L2_149)
  HQType = L1_148
  L1_148 = HQType
  L2_149 = ORDER_HQ
  if L1_148 ~= L2_149 then
    L1_148 = HQType
    L2_149 = CHAOS_HQ
  elseif L1_148 == L2_149 then
    L1_148 = HQType
    L2_149 = CHAOS_HQ
    if L1_148 == L2_149 then
      L1_148 = EndOfGameCeremony
      L2_149 = TEAM_ORDER
      L3_150 = A0_147
      L1_148(L2_149, L3_150)
    else
      L1_148 = EndOfGameCeremony
      L2_149 = TEAM_CHAOS
      L3_150 = A0_147
      L1_148(L2_149, L3_150)
    end
    return
  end
  L1_148 = IsDampener
  L2_149 = A0_147
  L1_148 = L1_148(L2_149)
  if L1_148 then
    L1_148 = GetLinkedBarrack
    L2_149 = A0_147
    L1_148 = L1_148(L2_149)
    barrack = L1_148
    L1_148 = GetTeamID
    L2_149 = barrack
    L1_148 = L1_148(L2_149)
    barrackTeam = L1_148
    L1_148 = GetLane
    L2_149 = A0_147
    L1_148 = L1_148(L2_149)
    barrackLane = L1_148
    L1_148 = SetLaneExposed
    L2_149 = barrackTeam
    L3_150 = barrackLane
    L1_148(L2_149, L3_150, true)
    L1_148 = DisableBarracksSpawn
    L2_149 = barrackLane
    L3_150 = barrackTeam
    L1_148(L2_149, L3_150)
    L1_148 = SetDampenerState
    L2_149 = A0_147
    L3_150 = DampenerRegenerationState
    L1_148(L2_149, L3_150)
    L1_148 = SetInvulnerable
    L2_149 = A0_147
    L3_150 = true
    L1_148(L2_149, L3_150)
    L1_148 = SetTargetable
    L2_149 = A0_147
    L3_150 = false
    L1_148(L2_149, L3_150)
    L1_148 = DisactivatedCounter
    L1_148 = L1_148 + 1
    DisactivatedCounter = L1_148
    L1_148 = GetTurret
    L2_149 = barrackTeam
    L3_150 = 1
    L1_148 = L1_148(L2_149, L3_150, HQ_TOWER1)
    L2_149 = GetTurret
    L3_150 = barrackTeam
    L2_149 = L2_149(L3_150, 1, HQ_TOWER2)
    L3_150 = Nil
    if L1_148 ~= L3_150 then
      L3_150 = SetInvulnerable
      L3_150(L1_148, false)
      L3_150 = SetTargetable
      L3_150(L1_148, true)
    end
    L3_150 = Nil
    if L2_149 ~= L3_150 then
      L3_150 = SetInvulnerable
      L3_150(L2_149, false)
      L3_150 = SetTargetable
      L3_150(L2_149, true)
    end
    L3_150 = Nil
    if L1_148 == L3_150 then
      L3_150 = Nil
      if L2_149 == L3_150 then
        L3_150 = GetHQ
        L3_150 = L3_150(barrackTeam)
        SetInvulnerable(L3_150, false)
        SetTargetable(L3_150, true)
      end
    end
    L3_150 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_150 = TEAM_ORDER
    else
      L3_150 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_150, barrackLane)
  end
  L1_148 = IsTurretAI
  L2_149 = A0_147
  L1_148 = L1_148(L2_149)
  if L1_148 then
    L1_148 = GetTeamID
    L2_149 = A0_147
    L1_148 = L1_148(L2_149)
    L2_149 = GetObjectLaneId
    L3_150 = A0_147
    L2_149 = L2_149(L3_150)
    L3_150 = GetTurretPosition
    L3_150 = L3_150(A0_147)
    DeactivateCorrectStructure(L1_148, L2_149, L3_150)
    return
  end
  L1_148 = GetDampenerType
  L2_149 = A0_147
  L1_148 = L1_148(L2_149)
  if L1_148 > -1 then
    L2_149 = 0
    L3_150 = TEAM_ORDER
    if L1_148 % TEAM_CHAOS >= RIGHT_LANE and L1_148 % TEAM_CHAOS <= LEFT_LANE then
      L2_149 = ChaosBarracksBonuses[L1_148 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_148 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_150 = TEAM_CHAOS
      L2_149 = OrderBarracksBonuses[L1_148 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_148 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_149 = Log
    L3_150 = "Could not find Linking barracks!"
    L2_149(L3_150)
  end
  L2_149 = true
  return L2_149
end
function SetLaneExposed(A0_151, A1_152, A2_153)
  if A0_151 == TEAM_ORDER then
    if A1_152 == LEFT_LANE then
      SetWorldVar("OrderTopLaneExposed", A2_153)
    elseif A1_152 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneExposed", A2_153)
    else
      SetWorldVar("OrderMidLaneExposed", A2_153)
    end
  elseif A1_152 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneExposed", A2_153)
  elseif A1_152 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneExposed", A2_153)
  else
    SetWorldVar("ChaosMidLaneExposed", A2_153)
  end
end
function SetLaneTowerCount(A0_154, A1_155, A2_156)
  if A0_154 == TEAM_ORDER then
    if A1_155 == LEFT_LANE then
      SetWorldVar("OrderTopLaneTowerCount", A2_156)
    elseif A1_155 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneTowerCount", A2_156)
    else
      SetWorldVar("OrderMidLaneTowerCount", A2_156)
    end
  elseif A1_155 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneTowerCount", A2_156)
  elseif A1_155 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneTowerCount", A2_156)
  else
    SetWorldVar("ChaosMidLaneTowerCount", A2_156)
  end
end
function IncreaseCannonMinionSpawnRate()
  local L1_157
  L1_157 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_157
end
function IncreaseCannonMinionSpawnRateAgain()
  local L1_158
  L1_158 = 1
  CANNON_MINION_SPAWN_FREQUENCY = L1_158
end
function PostGameSetup(A0_159)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_160, A1_161)
  local L2_162, L3_163, L4_164, L5_165, L6_166, L7_167
  for L7_167, _FORV_8_ in L4_164(L5_165) do
    if A0_160 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_167)
      break
    end
  end
end
