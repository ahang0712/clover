; ModuleID = './i2c_pca_isa/i2c_pca_isa_2.c'
source_filename = "./i2c_pca_isa/i2c_pca_isa_2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@irq = common global i32 0, align 4, !dbg !0
@global_id = common global i32 0, align 4, !dbg !10
@global_dev = common global i32 0, align 4, !dbg !12
@cnt1 = common global i32 0, align 4, !dbg !14
@cnt2 = common global i32 0, align 4, !dbg !16
@cnt3 = common global i32 0, align 4, !dbg !18
@cnt4 = common global i32 0, align 4, !dbg !20
@cnt5 = common global i32 0, align 4, !dbg !22
@cnt6 = common global i32 0, align 4, !dbg !24
@global_clock = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req1() #0 !dbg !32 {
  store i32 1, i32* @irq, align 4, !dbg !35
  store i32 1, i32* @global_id, align 4, !dbg !36
  store i32 1, i32* @global_dev, align 4, !dbg !37
  %1 = load i32, i32* @global_dev, align 4, !dbg !38
  %2 = icmp ne i32 %1, 1, !dbg !40
  br i1 %2, label %3, label %4, !dbg !41

3:                                                ; preds = %0
  br label %4, !dbg !42

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !44
  %6 = icmp sgt i32 %5, -1, !dbg !46
  br i1 %6, label %7, label %12, !dbg !47

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !48
  %9 = icmp ne i32 %8, 1, !dbg !51
  br i1 %9, label %10, label %11, !dbg !52

10:                                               ; preds = %7
  br label %11, !dbg !53

11:                                               ; preds = %10, %7
  br label %12, !dbg !55

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !56
  store i32 -1, i32* @global_dev, align 4, !dbg !57
  %13 = load i32, i32* @cnt1, align 4, !dbg !58
  %14 = add nsw i32 %13, 1, !dbg !58
  store i32 %14, i32* @cnt1, align 4, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req2() #0 !dbg !60 {
  store i32 2, i32* @irq, align 4, !dbg !61
  store i32 2, i32* @global_id, align 4, !dbg !62
  store i32 2, i32* @global_dev, align 4, !dbg !63
  %1 = load i32, i32* @global_dev, align 4, !dbg !64
  %2 = icmp ne i32 %1, 2, !dbg !66
  br i1 %2, label %3, label %4, !dbg !67

3:                                                ; preds = %0
  br label %4, !dbg !68

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !70
  %6 = icmp sgt i32 %5, -1, !dbg !72
  br i1 %6, label %7, label %12, !dbg !73

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !74
  %9 = icmp ne i32 %8, 2, !dbg !77
  br i1 %9, label %10, label %11, !dbg !78

10:                                               ; preds = %7
  br label %11, !dbg !79

11:                                               ; preds = %10, %7
  br label %12, !dbg !81

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt2, align 4, !dbg !82
  %14 = add nsw i32 %13, 1, !dbg !82
  store i32 %14, i32* @cnt2, align 4, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_1() #0 !dbg !84 {
  store i32 3, i32* @irq, align 4, !dbg !85
  store i32 3, i32* @global_id, align 4, !dbg !86
  store i32 3, i32* @global_dev, align 4, !dbg !87
  %1 = load i32, i32* @global_dev, align 4, !dbg !88
  %2 = icmp ne i32 %1, 3, !dbg !90
  br i1 %2, label %3, label %4, !dbg !91

3:                                                ; preds = %0
  br label %4, !dbg !92

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !94
  %6 = icmp sgt i32 %5, -1, !dbg !96
  br i1 %6, label %7, label %12, !dbg !97

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !98
  %9 = icmp ne i32 %8, 3, !dbg !101
  br i1 %9, label %10, label %11, !dbg !102

10:                                               ; preds = %7
  br label %11, !dbg !103

11:                                               ; preds = %10, %7
  br label %12, !dbg !105

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt3, align 4, !dbg !106
  %14 = add nsw i32 %13, 1, !dbg !106
  store i32 %14, i32* @cnt3, align 4, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_2() #0 !dbg !108 {
  store i32 0, i32* @irq, align 4, !dbg !109
  store i32 4, i32* @global_id, align 4, !dbg !110
  store i32 4, i32* @global_dev, align 4, !dbg !111
  %1 = load i32, i32* @global_dev, align 4, !dbg !112
  %2 = icmp ne i32 %1, 4, !dbg !114
  br i1 %2, label %3, label %4, !dbg !115

3:                                                ; preds = %0
  br label %4, !dbg !116

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !118
  %6 = icmp sgt i32 %5, -1, !dbg !120
  br i1 %6, label %7, label %12, !dbg !121

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !122
  %9 = icmp ne i32 %8, 4, !dbg !125
  br i1 %9, label %10, label %11, !dbg !126

10:                                               ; preds = %7
  br label %11, !dbg !127

11:                                               ; preds = %10, %7
  br label %12, !dbg !129

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt4, align 4, !dbg !130
  %14 = add nsw i32 %13, 1, !dbg !130
  store i32 %14, i32* @cnt4, align 4, !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_3() #0 !dbg !132 {
  store i32 0, i32* @irq, align 4, !dbg !133
  store i32 5, i32* @global_id, align 4, !dbg !134
  store i32 5, i32* @global_dev, align 4, !dbg !134
  store i32 5, i32* @global_id, align 4, !dbg !136
  store i32 5, i32* @global_dev, align 4, !dbg !137
  %1 = load i32, i32* @cnt5, align 4, !dbg !138
  %2 = add nsw i32 %1, 1, !dbg !138
  store i32 %2, i32* @cnt5, align 4, !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req6() #0 !dbg !140 {
  store i32 -1, i32* @irq, align 4, !dbg !141
  %1 = load i32, i32* @cnt6, align 4, !dbg !142
  %2 = add nsw i32 %1, 1, !dbg !142
  store i32 %2, i32* @cnt6, align 4, !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_008_001_main() #0 !dbg !144 {
  call void @req1(), !dbg !147
  call void @req6(), !dbg !148
  ret i32 0, !dbg !149
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!26, !27, !28, !29, !30}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "irq", scope: !2, file: !8, line: 186, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "i2c_pca_isa/i2c_pca_isa_2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!6, !0, !10, !12, !14, !16, !18, !20, !22, !24}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "global_clock", scope: !2, file: !8, line: 185, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./i2c_pca_isa/i2c_pca_isa_2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "global_id", scope: !2, file: !8, line: 187, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "global_dev", scope: !2, file: !8, line: 188, type: !9, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 268, type: !9, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 268, type: !9, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 268, type: !9, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 268, type: !9, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !8, line: 268, type: !9, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !8, line: 268, type: !9, isLocal: false, isDefinition: true)
!26 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{!"clang version 10.0.0 "}
!32 = distinct !DISubprogram(name: "req1", scope: !8, file: !8, line: 277, type: !33, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocation(line: 281, column: 9, scope: !32)
!36 = !DILocation(line: 283, column: 15, scope: !32)
!37 = !DILocation(line: 284, column: 16, scope: !32)
!38 = !DILocation(line: 286, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !8, line: 286, column: 9)
!40 = !DILocation(line: 286, column: 20, scope: !39)
!41 = !DILocation(line: 286, column: 9, scope: !32)
!42 = !DILocation(line: 287, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !8, line: 286, column: 26)
!44 = !DILocation(line: 288, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !32, file: !8, line: 288, column: 9)
!46 = !DILocation(line: 288, column: 13, scope: !45)
!47 = !DILocation(line: 288, column: 9, scope: !32)
!48 = !DILocation(line: 289, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !8, line: 289, column: 13)
!50 = distinct !DILexicalBlock(scope: !45, file: !8, line: 288, column: 19)
!51 = !DILocation(line: 289, column: 23, scope: !49)
!52 = !DILocation(line: 289, column: 13, scope: !50)
!53 = !DILocation(line: 290, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !8, line: 289, column: 29)
!55 = !DILocation(line: 291, column: 5, scope: !50)
!56 = !DILocation(line: 293, column: 15, scope: !32)
!57 = !DILocation(line: 294, column: 16, scope: !32)
!58 = !DILocation(line: 295, column: 9, scope: !32)
!59 = !DILocation(line: 297, column: 1, scope: !32)
!60 = distinct !DISubprogram(name: "req2", scope: !8, file: !8, line: 299, type: !33, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 303, column: 9, scope: !60)
!62 = !DILocation(line: 305, column: 15, scope: !60)
!63 = !DILocation(line: 306, column: 16, scope: !60)
!64 = !DILocation(line: 308, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !8, line: 308, column: 9)
!66 = !DILocation(line: 308, column: 20, scope: !65)
!67 = !DILocation(line: 308, column: 9, scope: !60)
!68 = !DILocation(line: 309, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !8, line: 308, column: 26)
!70 = !DILocation(line: 310, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !60, file: !8, line: 310, column: 9)
!72 = !DILocation(line: 310, column: 13, scope: !71)
!73 = !DILocation(line: 310, column: 9, scope: !60)
!74 = !DILocation(line: 311, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !8, line: 311, column: 13)
!76 = distinct !DILexicalBlock(scope: !71, file: !8, line: 310, column: 19)
!77 = !DILocation(line: 311, column: 23, scope: !75)
!78 = !DILocation(line: 311, column: 13, scope: !76)
!79 = !DILocation(line: 312, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !8, line: 311, column: 29)
!81 = !DILocation(line: 313, column: 5, scope: !76)
!82 = !DILocation(line: 317, column: 9, scope: !60)
!83 = !DILocation(line: 319, column: 1, scope: !60)
!84 = distinct !DISubprogram(name: "req_isr_1", scope: !8, file: !8, line: 321, type: !33, scopeLine: 321, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 325, column: 9, scope: !84)
!86 = !DILocation(line: 327, column: 15, scope: !84)
!87 = !DILocation(line: 328, column: 16, scope: !84)
!88 = !DILocation(line: 330, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !8, line: 330, column: 9)
!90 = !DILocation(line: 330, column: 20, scope: !89)
!91 = !DILocation(line: 330, column: 9, scope: !84)
!92 = !DILocation(line: 331, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 330, column: 26)
!94 = !DILocation(line: 332, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !84, file: !8, line: 332, column: 9)
!96 = !DILocation(line: 332, column: 13, scope: !95)
!97 = !DILocation(line: 332, column: 9, scope: !84)
!98 = !DILocation(line: 333, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !8, line: 333, column: 13)
!100 = distinct !DILexicalBlock(scope: !95, file: !8, line: 332, column: 19)
!101 = !DILocation(line: 333, column: 23, scope: !99)
!102 = !DILocation(line: 333, column: 13, scope: !100)
!103 = !DILocation(line: 334, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !8, line: 333, column: 29)
!105 = !DILocation(line: 335, column: 5, scope: !100)
!106 = !DILocation(line: 337, column: 9, scope: !84)
!107 = !DILocation(line: 339, column: 1, scope: !84)
!108 = distinct !DISubprogram(name: "req_isr_2", scope: !8, file: !8, line: 341, type: !33, scopeLine: 341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocation(line: 345, column: 9, scope: !108)
!110 = !DILocation(line: 347, column: 15, scope: !108)
!111 = !DILocation(line: 348, column: 16, scope: !108)
!112 = !DILocation(line: 350, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !8, line: 350, column: 9)
!114 = !DILocation(line: 350, column: 20, scope: !113)
!115 = !DILocation(line: 350, column: 9, scope: !108)
!116 = !DILocation(line: 351, column: 5, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 350, column: 26)
!118 = !DILocation(line: 352, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !108, file: !8, line: 352, column: 9)
!120 = !DILocation(line: 352, column: 13, scope: !119)
!121 = !DILocation(line: 352, column: 9, scope: !108)
!122 = !DILocation(line: 353, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !8, line: 353, column: 13)
!124 = distinct !DILexicalBlock(scope: !119, file: !8, line: 352, column: 19)
!125 = !DILocation(line: 353, column: 23, scope: !123)
!126 = !DILocation(line: 353, column: 13, scope: !124)
!127 = !DILocation(line: 354, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !8, line: 353, column: 29)
!129 = !DILocation(line: 355, column: 5, scope: !124)
!130 = !DILocation(line: 357, column: 9, scope: !108)
!131 = !DILocation(line: 359, column: 1, scope: !108)
!132 = distinct !DISubprogram(name: "req_isr_3", scope: !8, file: !8, line: 361, type: !33, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocation(line: 363, column: 9, scope: !132)
!134 = !DILocation(line: 364, column: 5, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !8, line: 364, column: 5)
!136 = !DILocation(line: 365, column: 15, scope: !132)
!137 = !DILocation(line: 366, column: 16, scope: !132)
!138 = !DILocation(line: 369, column: 9, scope: !132)
!139 = !DILocation(line: 371, column: 1, scope: !132)
!140 = distinct !DISubprogram(name: "req6", scope: !8, file: !8, line: 373, type: !33, scopeLine: 373, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocation(line: 375, column: 9, scope: !140)
!142 = !DILocation(line: 376, column: 9, scope: !140)
!143 = !DILocation(line: 378, column: 1, scope: !140)
!144 = distinct !DISubprogram(name: "svp_simple_008_001_main", scope: !8, file: !8, line: 380, type: !145, scopeLine: 380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DISubroutineType(types: !146)
!146 = !{!9}
!147 = !DILocation(line: 382, column: 5, scope: !144)
!148 = !DILocation(line: 384, column: 5, scope: !144)
!149 = !DILocation(line: 394, column: 5, scope: !144)
