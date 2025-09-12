; ModuleID = 'i2c_pca_isa_3_simple.c'
source_filename = "i2c_pca_isa_3_simple.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@irq = common global i32 0, align 4, !dbg !0
@global_id = common global i32 0, align 4, !dbg !9
@global_dev = common global i32 0, align 4, !dbg !11
@cnt1 = common global i32 0, align 4, !dbg !13
@cnt2 = common global i32 0, align 4, !dbg !15
@cnt3 = common global i32 0, align 4, !dbg !17
@cnt4 = common global i32 0, align 4, !dbg !19
@cnt5 = common global i32 0, align 4, !dbg !21
@cnt6 = common global i32 0, align 4, !dbg !23
@cnt7 = common global i32 0, align 4, !dbg !25
@cnt8 = common global i32 0, align 4, !dbg !27
@global_clock = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req1() #0 !dbg !34 {
  call void @req6(), !dbg !37
  store i32 0, i32* @irq, align 4, !dbg !38
  store i32 1, i32* @global_id, align 4, !dbg !39
  store i32 1, i32* @global_dev, align 4, !dbg !39
  store i32 1, i32* @global_id, align 4, !dbg !41
  store i32 1, i32* @global_dev, align 4, !dbg !42
  %1 = load i32, i32* @global_dev, align 4, !dbg !43
  %2 = icmp ne i32 %1, 1, !dbg !45
  br i1 %2, label %3, label %4, !dbg !46

3:                                                ; preds = %0
  br label %4, !dbg !47

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !49
  %6 = icmp sgt i32 %5, -1, !dbg !51
  br i1 %6, label %7, label %12, !dbg !52

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !53
  %9 = icmp ne i32 %8, 1, !dbg !56
  br i1 %9, label %10, label %11, !dbg !57

10:                                               ; preds = %7
  br label %11, !dbg !58

11:                                               ; preds = %10, %7
  br label %12, !dbg !60

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !61
  store i32 -1, i32* @global_dev, align 4, !dbg !62
  %13 = load i32, i32* @cnt1, align 4, !dbg !63
  %14 = add nsw i32 %13, 1, !dbg !63
  store i32 %14, i32* @cnt1, align 4, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req2() #0 !dbg !65 {
  store i32 0, i32* @irq, align 4, !dbg !66
  store i32 2, i32* @global_id, align 4, !dbg !67
  store i32 2, i32* @global_dev, align 4, !dbg !68
  %1 = load i32, i32* @cnt2, align 4, !dbg !69
  %2 = add nsw i32 %1, 1, !dbg !69
  store i32 %2, i32* @cnt2, align 4, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req3() #0 !dbg !71 {
  store i32 0, i32* @irq, align 4, !dbg !72
  store i32 3, i32* @global_id, align 4, !dbg !73
  store i32 3, i32* @global_dev, align 4, !dbg !74
  %1 = load i32, i32* @cnt3, align 4, !dbg !75
  %2 = add nsw i32 %1, 1, !dbg !75
  store i32 %2, i32* @cnt3, align 4, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req4() #0 !dbg !77 {
  store i32 0, i32* @irq, align 4, !dbg !78
  store i32 4, i32* @global_id, align 4, !dbg !79
  store i32 4, i32* @global_dev, align 4, !dbg !79
  store i32 -1, i32* @global_id, align 4, !dbg !81
  store i32 -1, i32* @global_dev, align 4, !dbg !81
  %1 = load i32, i32* @cnt4, align 4, !dbg !83
  %2 = add nsw i32 %1, 1, !dbg !83
  store i32 %2, i32* @cnt4, align 4, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_1() #0 !dbg !85 {
  store i32 0, i32* @irq, align 4, !dbg !86
  store i32 5, i32* @global_id, align 4, !dbg !87
  store i32 5, i32* @global_dev, align 4, !dbg !87
  store i32 5, i32* @global_id, align 4, !dbg !89
  store i32 5, i32* @global_dev, align 4, !dbg !90
  %1 = load i32, i32* @global_dev, align 4, !dbg !91
  %2 = icmp ne i32 %1, 2, !dbg !93
  br i1 %2, label %3, label %4, !dbg !94

3:                                                ; preds = %0
  br label %4, !dbg !95

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !97
  %6 = icmp sgt i32 %5, -1, !dbg !99
  br i1 %6, label %7, label %12, !dbg !100

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !101
  %9 = icmp ne i32 %8, 2, !dbg !104
  br i1 %9, label %10, label %11, !dbg !105

10:                                               ; preds = %7
  br label %11, !dbg !106

11:                                               ; preds = %10, %7
  br label %12, !dbg !108

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !109
  store i32 -1, i32* @global_dev, align 4, !dbg !109
  store i32 -1, i32* @global_id, align 4, !dbg !111
  store i32 -1, i32* @global_dev, align 4, !dbg !112
  %13 = load i32, i32* @cnt5, align 4, !dbg !113
  %14 = add nsw i32 %13, 1, !dbg !113
  store i32 %14, i32* @cnt5, align 4, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req6() #0 !dbg !115 {
  store i32 -1, i32* @irq, align 4, !dbg !116
  %1 = load i32, i32* @cnt6, align 4, !dbg !117
  %2 = add nsw i32 %1, 1, !dbg !117
  store i32 %2, i32* @cnt6, align 4, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_2() #0 !dbg !119 {
  store i32 0, i32* @irq, align 4, !dbg !120
  store i32 7, i32* @global_id, align 4, !dbg !121
  store i32 7, i32* @global_dev, align 4, !dbg !122
  %1 = load i32, i32* @global_dev, align 4, !dbg !123
  %2 = icmp ne i32 %1, 7, !dbg !125
  br i1 %2, label %3, label %4, !dbg !126

3:                                                ; preds = %0
  br label %4, !dbg !127

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @cnt7, align 4, !dbg !129
  %6 = add nsw i32 %5, 1, !dbg !129
  store i32 %6, i32* @cnt7, align 4, !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_3() #0 !dbg !131 {
  store i32 0, i32* @irq, align 4, !dbg !132
  store i32 8, i32* @global_id, align 4, !dbg !133
  store i32 8, i32* @global_dev, align 4, !dbg !133
  store i32 8, i32* @global_id, align 4, !dbg !135
  store i32 8, i32* @global_dev, align 4, !dbg !136
  %1 = load i32, i32* @cnt8, align 4, !dbg !137
  %2 = add nsw i32 %1, 1, !dbg !137
  store i32 %2, i32* @cnt8, align 4, !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_009_001_main() #0 !dbg !139 {
  call void @req1(), !dbg !142
  call void @req2(), !dbg !143
  ret i32 0, !dbg !144
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "irq", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "i2c_pca_isa_3_simple.c", directory: "/Users/hehang03/code/clover/dataset/RWIP/i2c_pca_isa")
!4 = !{}
!5 = !{!6, !0, !9, !11, !13, !15, !17, !19, !21, !23, !25, !27}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "global_clock", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "global_id", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "global_dev", scope: !2, file: !3, line: 9, type: !8, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "cnt7", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "cnt8", scope: !2, file: !3, line: 30, type: !8, isLocal: false, isDefinition: true)
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"PIC Level", i32 2}
!33 = !{!"clang version 10.0.0 "}
!34 = distinct !DISubprogram(name: "req1", scope: !3, file: !3, line: 34, type: !35, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocation(line: 35, column: 5, scope: !34)
!38 = !DILocation(line: 36, column: 9, scope: !34)
!39 = !DILocation(line: 37, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !3, line: 37, column: 5)
!41 = !DILocation(line: 38, column: 15, scope: !34)
!42 = !DILocation(line: 39, column: 16, scope: !34)
!43 = !DILocation(line: 40, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !34, file: !3, line: 40, column: 9)
!45 = !DILocation(line: 40, column: 20, scope: !44)
!46 = !DILocation(line: 40, column: 9, scope: !34)
!47 = !DILocation(line: 41, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !3, line: 40, column: 26)
!49 = !DILocation(line: 42, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !34, file: !3, line: 42, column: 9)
!51 = !DILocation(line: 42, column: 13, scope: !50)
!52 = !DILocation(line: 42, column: 9, scope: !34)
!53 = !DILocation(line: 43, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !3, line: 43, column: 13)
!55 = distinct !DILexicalBlock(scope: !50, file: !3, line: 42, column: 19)
!56 = !DILocation(line: 43, column: 23, scope: !54)
!57 = !DILocation(line: 43, column: 13, scope: !55)
!58 = !DILocation(line: 44, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !3, line: 43, column: 29)
!60 = !DILocation(line: 45, column: 5, scope: !55)
!61 = !DILocation(line: 46, column: 15, scope: !34)
!62 = !DILocation(line: 47, column: 16, scope: !34)
!63 = !DILocation(line: 48, column: 9, scope: !34)
!64 = !DILocation(line: 49, column: 1, scope: !34)
!65 = distinct !DISubprogram(name: "req2", scope: !3, file: !3, line: 51, type: !35, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 52, column: 9, scope: !65)
!67 = !DILocation(line: 53, column: 15, scope: !65)
!68 = !DILocation(line: 54, column: 16, scope: !65)
!69 = !DILocation(line: 55, column: 9, scope: !65)
!70 = !DILocation(line: 56, column: 1, scope: !65)
!71 = distinct !DISubprogram(name: "req3", scope: !3, file: !3, line: 58, type: !35, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 59, column: 9, scope: !71)
!73 = !DILocation(line: 60, column: 15, scope: !71)
!74 = !DILocation(line: 61, column: 16, scope: !71)
!75 = !DILocation(line: 62, column: 9, scope: !71)
!76 = !DILocation(line: 63, column: 1, scope: !71)
!77 = distinct !DISubprogram(name: "req4", scope: !3, file: !3, line: 65, type: !35, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 66, column: 9, scope: !77)
!79 = !DILocation(line: 67, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !3, line: 67, column: 5)
!81 = !DILocation(line: 68, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !3, line: 68, column: 5)
!83 = !DILocation(line: 69, column: 9, scope: !77)
!84 = !DILocation(line: 70, column: 1, scope: !77)
!85 = distinct !DISubprogram(name: "req_isr_1", scope: !3, file: !3, line: 72, type: !35, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocation(line: 73, column: 9, scope: !85)
!87 = !DILocation(line: 74, column: 5, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 74, column: 5)
!89 = !DILocation(line: 75, column: 15, scope: !85)
!90 = !DILocation(line: 76, column: 16, scope: !85)
!91 = !DILocation(line: 77, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !3, line: 77, column: 9)
!93 = !DILocation(line: 77, column: 20, scope: !92)
!94 = !DILocation(line: 77, column: 9, scope: !85)
!95 = !DILocation(line: 78, column: 5, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 77, column: 26)
!97 = !DILocation(line: 79, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !3, line: 79, column: 9)
!99 = !DILocation(line: 79, column: 13, scope: !98)
!100 = !DILocation(line: 79, column: 9, scope: !85)
!101 = !DILocation(line: 80, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !3, line: 80, column: 13)
!103 = distinct !DILexicalBlock(scope: !98, file: !3, line: 79, column: 19)
!104 = !DILocation(line: 80, column: 23, scope: !102)
!105 = !DILocation(line: 80, column: 13, scope: !103)
!106 = !DILocation(line: 81, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !3, line: 80, column: 29)
!108 = !DILocation(line: 82, column: 5, scope: !103)
!109 = !DILocation(line: 83, column: 5, scope: !110)
!110 = distinct !DILexicalBlock(scope: !85, file: !3, line: 83, column: 5)
!111 = !DILocation(line: 84, column: 15, scope: !85)
!112 = !DILocation(line: 85, column: 16, scope: !85)
!113 = !DILocation(line: 86, column: 9, scope: !85)
!114 = !DILocation(line: 87, column: 1, scope: !85)
!115 = distinct !DISubprogram(name: "req6", scope: !3, file: !3, line: 89, type: !35, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocation(line: 90, column: 9, scope: !115)
!117 = !DILocation(line: 91, column: 9, scope: !115)
!118 = !DILocation(line: 92, column: 1, scope: !115)
!119 = distinct !DISubprogram(name: "req_isr_2", scope: !3, file: !3, line: 94, type: !35, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocation(line: 95, column: 9, scope: !119)
!121 = !DILocation(line: 96, column: 15, scope: !119)
!122 = !DILocation(line: 97, column: 16, scope: !119)
!123 = !DILocation(line: 98, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !3, line: 98, column: 9)
!125 = !DILocation(line: 98, column: 20, scope: !124)
!126 = !DILocation(line: 98, column: 9, scope: !119)
!127 = !DILocation(line: 99, column: 5, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 98, column: 26)
!129 = !DILocation(line: 100, column: 9, scope: !119)
!130 = !DILocation(line: 101, column: 1, scope: !119)
!131 = distinct !DISubprogram(name: "req_isr_3", scope: !3, file: !3, line: 103, type: !35, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocation(line: 104, column: 9, scope: !131)
!133 = !DILocation(line: 105, column: 5, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !3, line: 105, column: 5)
!135 = !DILocation(line: 106, column: 15, scope: !131)
!136 = !DILocation(line: 107, column: 16, scope: !131)
!137 = !DILocation(line: 108, column: 9, scope: !131)
!138 = !DILocation(line: 109, column: 1, scope: !131)
!139 = distinct !DISubprogram(name: "svp_simple_009_001_main", scope: !3, file: !3, line: 111, type: !140, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DISubroutineType(types: !141)
!141 = !{!8}
!142 = !DILocation(line: 112, column: 5, scope: !139)
!143 = !DILocation(line: 113, column: 5, scope: !139)
!144 = !DILocation(line: 114, column: 5, scope: !139)
