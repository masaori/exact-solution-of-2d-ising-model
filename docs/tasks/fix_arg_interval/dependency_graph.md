# fix_arg_interval タスク依存関係と並列実行ガイド

## 依存関係グラフ

```
Level 0 (基盤定義 — 最初に修正):
  017_definition_角度表現の切断
  018_definition_RRの角度表現

Level 1 (017に依存):
  030_definition_絶対値と偏角_abs_arg
  037_definition_CCのsqrt

Level 2 (030, 037 に依存):
  031_claim_複素数の積のarg          ← コメントアウト削除のみ
  032_claim_複素数の商のarg
  033_claim_複素数の積のargがpi
  034_claim_CCの自乗のarg
  035_claim_CCの逆数のarg
  036_note_arg計算のコツ
  038_claim_CCのsqrtの極座標表現
  023_claim_gamma2_theta_muの積のarg

Level 3 (Level 2 の結果に依存):
  039_claim_sqrtと積が可換になる条件   ← 030, 037 に依存
  042_claim_CCの逆数のsqrt            ← 035 に依存
  024_claim_gamma2...のarg             ← 023, 033 に依存
  025_claim_gamma2の商のarg            ← 033, 035 に依存

Level 4 (Level 3 の結果に依存):
  041_claim_自乗のsqrtとremark         ← 039 に依存
  043_claim_CCのsqrtの逆数             ← 042 に依存
  026_claim_A_thetaの対角化            ← 039, 042 に依存

Level 5 (最後に修正):
  028_claim_a_theta_mu                 ← 034, 023, 035, 039, 041 に依存
```

## 並列実行可能グループ

### グループ A（並列可能）— Level 0
| タスク | ファイル |
|--------|----------|
| task_017 | 017_definition_角度表現の切断.typ |
| task_018 | 018_definition_RRの角度表現.typ |

### グループ B（並列可能）— Level 1（グループA完了後）
| タスク | ファイル |
|--------|----------|
| task_030 | 030_definition_絶対値と偏角_abs_arg.typ |
| task_037 | 037_definition_CCのsqrt_複素数の平方根の定義.typ |

### グループ C（並列可能）— Level 2（グループB完了後）
| タスク | ファイル |
|--------|----------|
| task_031 | 031_claim_複素数の積のarg.typ（コメントアウト削除のみ） |
| task_032 | 032_claim_複素数の商のarg_TODO条件未定.typ |
| task_033 | 033_claim_複素数の積のargがpiのときのarg同士の関係.typ |
| task_034 | 034_claim_CCの自乗のarg.typ |
| task_035 | 035_claim_CCの逆数のarg.typ |
| task_036 | 036_note_arg計算のコツ.typ |
| task_038 | 038_claim_CCのsqrtの極座標表現による展開.typ |
| task_023 | 023_claim_gamma2_theta_muの積のarg.typ |

### グループ D（並列可能）— Level 3（依存先が完了していること）
| タスク | ファイル | 依存先 |
|--------|----------|--------|
| task_039 | 039_claim_sqrtと積が可換になる条件.typ | 030, 037 |
| task_042 | 042_claim_CCの逆数のsqrtとremark.typ | 035 |
| task_024 | 024_claim_gamma2...のarg.typ | 023, 033 |
| task_025 | 025_claim_gamma2の商のarg.typ | 033, 035 |

### グループ E（並列可能）— Level 4（依存先が完了していること）
| タスク | ファイル | 依存先 |
|--------|----------|--------|
| task_041 | 041_claim_自乗のsqrtとremark.typ | 039 |
| task_043 | 043_claim_CCのsqrtの逆数とremark.typ | 042 |
| task_026 | 026_claim_A_thetaの対角化.typ | 039, 042 |

### グループ F（最後）— Level 5（全ての依存先が完了してから）
| タスク | ファイル | 依存先 |
|--------|----------|--------|
| task_028 | 028_claim_a_theta_mu.typ | 034, 023, 035, 039, 041 |

## 注意
- 同じグループ内のタスクは並列実行可能
- グループは上から順に（A→B→C→D→E→F）実行すること
- 各タスクの詳細は対応する `task_*.md` ファイルを参照
