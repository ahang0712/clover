; ModuleID = 'i2c_pca_isa_3_simple.c'
source_filename = "i2c_pca_isa_3_simple.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx15.0.0"

@irq = common global i32 0, align 4, !dbg !0
@global_id = common global i32 0, align 4, !dbg !8
@global_dev = common global i32 0, align 4, !dbg !10
@cnt1 = common global i32 0, align 4, !dbg !12
@cnt2 = common global i32 0, align 4, !dbg !14
@cnt3 = common global i32 0, align 4, !dbg !16
@cnt4 = common global i32 0, align 4, !dbg !18
@cnt5 = common global i32 0, align 4, !dbg !20
@cnt6 = common global i32 0, align 4, !dbg !22
@cnt7 = common global i32 0, align 4, !dbg !24
@cnt8 = common global i32 0, align 4, !dbg !26
@global_clock = common global i32 0, align 4, !dbg !5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req1() #0 !dbg !36 {
  call void @req6(), !dbg !39
  store i32 0, ptr @irq, align 4, !dbg !40
  store i32 1, ptr @global_id, align 4, !dbg !41
  store i32 1, ptr @global_dev, align 4, !dbg !41
  store i32 1, ptr @global_id, align 4, !dbg !43
  store i32 1, ptr @global_dev, align 4, !dbg !44
  %1 = load i32, ptr @global_dev, align 4, !dbg !45
  %2 = icmp ne i32 %1, 1, !dbg !47
  br i1 %2, label %3, label %4, !dbg !48

3:                                                ; preds = %0
  br label %4, !dbg !49

4:                                                ; preds = %3, %0
  %5 = load i32, ptr @irq, align 4, !dbg !51
  %6 = icmp sgt i32 %5, -1, !dbg !53
  br i1 %6, label %7, label %12, !dbg !54

7:                                                ; preds = %4
  %8 = load i32, ptr @global_id, align 4, !dbg !55
  %9 = icmp ne i32 %8, 1, !dbg !58
  br i1 %9, label %10, label %11, !dbg !59

10:                                               ; preds = %7
  br label %11, !dbg !60

11:                                               ; preds = %10, %7
  br label %12, !dbg !62

12:                                               ; preds = %11, %4
  store i32 -1, ptr @global_id, align 4, !dbg !63
  store i32 -1, ptr @global_dev, align 4, !dbg !64
  %13 = load i32, ptr @cnt1, align 4, !dbg !65
  %14 = add nsw i32 %13, 1, !dbg !65
  store i32 %14, ptr @cnt1, align 4, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req2() #0 !dbg !67 {
  store i32 0, ptr @irq, align 4, !dbg !68
  store i32 2, ptr @global_id, align 4, !dbg !69
  store i32 2, ptr @global_dev, align 4, !dbg !70
  %1 = load i32, ptr @cnt2, align 4, !dbg !71
  %2 = add nsw i32 %1, 1, !dbg !71
  store i32 %2, ptr @cnt2, align 4, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req3() #0 !dbg !73 {
  store i32 0, ptr @irq, align 4, !dbg !74
  store i32 3, ptr @global_id, align 4, !dbg !75
  store i32 3, ptr @global_dev, align 4, !dbg !76
  %1 = load i32, ptr @cnt3, align 4, !dbg !77
  %2 = add nsw i32 %1, 1, !dbg !77
  store i32 %2, ptr @cnt3, align 4, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req4() #0 !dbg !79 {
  store i32 0, ptr @irq, align 4, !dbg !80
  store i32 4, ptr @global_id, align 4, !dbg !81
  store i32 4, ptr @global_dev, align 4, !dbg !81
  store i32 -1, ptr @global_id, align 4, !dbg !83
  store i32 -1, ptr @global_dev, align 4, !dbg !83
  %1 = load i32, ptr @cnt4, align 4, !dbg !85
  %2 = add nsw i32 %1, 1, !dbg !85
  store i32 %2, ptr @cnt4, align 4, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_1() #0 !dbg !87 {
  store i32 0, ptr @irq, align 4, !dbg !88
  store i32 5, ptr @global_id, align 4, !dbg !89
  store i32 5, ptr @global_dev, align 4, !dbg !89
  store i32 5, ptr @global_id, align 4, !dbg !91
  store i32 5, ptr @global_dev, align 4, !dbg !92
  %1 = load i32, ptr @global_dev, align 4, !dbg !93
  %2 = icmp ne i32 %1, 2, !dbg !95
  br i1 %2, label %3, label %4, !dbg !96

3:                                                ; preds = %0
  br label %4, !dbg !97

4:                                                ; preds = %3, %0
  %5 = load i32, ptr @irq, align 4, !dbg !99
  %6 = icmp sgt i32 %5, -1, !dbg !101
  br i1 %6, label %7, label %12, !dbg !102

7:                                                ; preds = %4
  %8 = load i32, ptr @global_id, align 4, !dbg !103
  %9 = icmp ne i32 %8, 2, !dbg !106
  br i1 %9, label %10, label %11, !dbg !107

10:                                               ; preds = %7
  br label %11, !dbg !108

11:                                               ; preds = %10, %7
  br label %12, !dbg !110

12:                                               ; preds = %11, %4
  store i32 -1, ptr @global_id, align 4, !dbg !111
  store i32 -1, ptr @global_dev, align 4, !dbg !111
  store i32 -1, ptr @global_id, align 4, !dbg !113
  store i32 -1, ptr @global_dev, align 4, !dbg !114
  %13 = load i32, ptr @cnt5, align 4, !dbg !115
  %14 = add nsw i32 %13, 1, !dbg !115
  store i32 %14, ptr @cnt5, align 4, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req6() #0 !dbg !117 {
  store i32 -1, ptr @irq, align 4, !dbg !118
  %1 = load i32, ptr @cnt6, align 4, !dbg !119
  %2 = add nsw i32 %1, 1, !dbg !119
  store i32 %2, ptr @cnt6, align 4, !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_2() #0 !dbg !121 {
  store i32 0, ptr @irq, align 4, !dbg !122
  store i32 7, ptr @global_id, align 4, !dbg !123
  store i32 7, ptr @global_dev, align 4, !dbg !124
  %1 = load i32, ptr @global_dev, align 4, !dbg !125
  %2 = icmp ne i32 %1, 7, !dbg !127
  br i1 %2, label %3, label %4, !dbg !128

3:                                                ; preds = %0
  br label %4, !dbg !129

4:                                                ; preds = %3, %0
  %5 = load i32, ptr @cnt7, align 4, !dbg !131
  %6 = add nsw i32 %5, 1, !dbg !131
  store i32 %6, ptr @cnt7, align 4, !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_3() #0 !dbg !133 {
  store i32 0, ptr @irq, align 4, !dbg !134
  store i32 8, ptr @global_id, align 4, !dbg !135
  store i32 8, ptr @global_dev, align 4, !dbg !135
  store i32 8, ptr @global_id, align 4, !dbg !137
  store i32 8, ptr @global_dev, align 4, !dbg !138
  %1 = load i32, ptr @cnt8, align 4, !dbg !139
  %2 = add nsw i32 %1, 1, !dbg !139
  store i32 %2, ptr @cnt8, align 4, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_009_001_main() #0 !dbg !141 {
  call void @req1(), !dbg !144
  call void @req2(), !dbg !145
  ret i32 0, !dbg !146
}

attributes #0 = { noinline nounwind optnone ssp uwtable "darwin-stkchk-strong-link" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cmov,+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!28, !29, !30, !31, !32, !33, !34}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "irq", scope: !2, file: !3, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Apple clang version 16.0.0 (clang-1600.0.26.6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!3 = !DIFile(filename: "i2c_pca_isa_3_simple.c", directory: "/Users/hehang03/code/clover/dataset/RWIP/i2c_pca_isa", checksumkind: CSK_MD5, checksum: "41b1ee5cbeb3948d23dfcbb042512977")
!4 = !{!5, !0, !8, !10, !12, !14, !16, !18, !20, !22, !24, !26}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "global_clock", scope: !2, file: !3, line: 6, type: !7, isLocal: false, isDefinition: true)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "global_id", scope: !2, file: !3, line: 8, type: !7, isLocal: false, isDefinition: true)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "global_dev", scope: !2, file: !3, line: 9, type: !7, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "cnt7", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "cnt8", scope: !2, file: !3, line: 30, type: !7, isLocal: false, isDefinition: true)
!28 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!29 = !{i32 7, !"Dwarf Version", i32 5}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 8, !"PIC Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 2}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
!36 = distinct !DISubprogram(name: "req1", scope: !3, file: !3, line: 34, type: !37, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocation(line: 35, column: 5, scope: !36)
!40 = !DILocation(line: 36, column: 9, scope: !36)
!41 = !DILocation(line: 37, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 15, scope: !36)
!44 = !DILocation(line: 39, column: 16, scope: !36)
!45 = !DILocation(line: 40, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !3, line: 40, column: 9)
!47 = !DILocation(line: 40, column: 20, scope: !46)
!48 = !DILocation(line: 40, column: 9, scope: !36)
!49 = !DILocation(line: 41, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 40, column: 26)
!51 = !DILocation(line: 42, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !36, file: !3, line: 42, column: 9)
!53 = !DILocation(line: 42, column: 13, scope: !52)
!54 = !DILocation(line: 42, column: 9, scope: !36)
!55 = !DILocation(line: 43, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !3, line: 43, column: 13)
!57 = distinct !DILexicalBlock(scope: !52, file: !3, line: 42, column: 19)
!58 = !DILocation(line: 43, column: 23, scope: !56)
!59 = !DILocation(line: 43, column: 13, scope: !57)
!60 = !DILocation(line: 44, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !3, line: 43, column: 29)
!62 = !DILocation(line: 45, column: 5, scope: !57)
!63 = !DILocation(line: 46, column: 15, scope: !36)
!64 = !DILocation(line: 47, column: 16, scope: !36)
!65 = !DILocation(line: 48, column: 9, scope: !36)
!66 = !DILocation(line: 49, column: 1, scope: !36)
!67 = distinct !DISubprogram(name: "req2", scope: !3, file: !3, line: 51, type: !37, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!68 = !DILocation(line: 52, column: 9, scope: !67)
!69 = !DILocation(line: 53, column: 15, scope: !67)
!70 = !DILocation(line: 54, column: 16, scope: !67)
!71 = !DILocation(line: 55, column: 9, scope: !67)
!72 = !DILocation(line: 56, column: 1, scope: !67)
!73 = distinct !DISubprogram(name: "req3", scope: !3, file: !3, line: 58, type: !37, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!74 = !DILocation(line: 59, column: 9, scope: !73)
!75 = !DILocation(line: 60, column: 15, scope: !73)
!76 = !DILocation(line: 61, column: 16, scope: !73)
!77 = !DILocation(line: 62, column: 9, scope: !73)
!78 = !DILocation(line: 63, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "req4", scope: !3, file: !3, line: 65, type: !37, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!80 = !DILocation(line: 66, column: 9, scope: !79)
!81 = !DILocation(line: 67, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !3, line: 67, column: 5)
!83 = !DILocation(line: 68, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !3, line: 68, column: 5)
!85 = !DILocation(line: 69, column: 9, scope: !79)
!86 = !DILocation(line: 70, column: 1, scope: !79)
!87 = distinct !DISubprogram(name: "req_isr_1", scope: !3, file: !3, line: 72, type: !37, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!88 = !DILocation(line: 73, column: 9, scope: !87)
!89 = !DILocation(line: 74, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !3, line: 74, column: 5)
!91 = !DILocation(line: 75, column: 15, scope: !87)
!92 = !DILocation(line: 76, column: 16, scope: !87)
!93 = !DILocation(line: 77, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !3, line: 77, column: 9)
!95 = !DILocation(line: 77, column: 20, scope: !94)
!96 = !DILocation(line: 77, column: 9, scope: !87)
!97 = !DILocation(line: 78, column: 5, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 77, column: 26)
!99 = !DILocation(line: 79, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !87, file: !3, line: 79, column: 9)
!101 = !DILocation(line: 79, column: 13, scope: !100)
!102 = !DILocation(line: 79, column: 9, scope: !87)
!103 = !DILocation(line: 80, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !3, line: 80, column: 13)
!105 = distinct !DILexicalBlock(scope: !100, file: !3, line: 79, column: 19)
!106 = !DILocation(line: 80, column: 23, scope: !104)
!107 = !DILocation(line: 80, column: 13, scope: !105)
!108 = !DILocation(line: 81, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !3, line: 80, column: 29)
!110 = !DILocation(line: 82, column: 5, scope: !105)
!111 = !DILocation(line: 83, column: 5, scope: !112)
!112 = distinct !DILexicalBlock(scope: !87, file: !3, line: 83, column: 5)
!113 = !DILocation(line: 84, column: 15, scope: !87)
!114 = !DILocation(line: 85, column: 16, scope: !87)
!115 = !DILocation(line: 86, column: 9, scope: !87)
!116 = !DILocation(line: 87, column: 1, scope: !87)
!117 = distinct !DISubprogram(name: "req6", scope: !3, file: !3, line: 89, type: !37, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !2)
!118 = !DILocation(line: 90, column: 9, scope: !117)
!119 = !DILocation(line: 91, column: 9, scope: !117)
!120 = !DILocation(line: 92, column: 1, scope: !117)
!121 = distinct !DISubprogram(name: "req_isr_2", scope: !3, file: !3, line: 94, type: !37, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!122 = !DILocation(line: 95, column: 9, scope: !121)
!123 = !DILocation(line: 96, column: 15, scope: !121)
!124 = !DILocation(line: 97, column: 16, scope: !121)
!125 = !DILocation(line: 98, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !3, line: 98, column: 9)
!127 = !DILocation(line: 98, column: 20, scope: !126)
!128 = !DILocation(line: 98, column: 9, scope: !121)
!129 = !DILocation(line: 99, column: 5, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 98, column: 26)
!131 = !DILocation(line: 100, column: 9, scope: !121)
!132 = !DILocation(line: 101, column: 1, scope: !121)
!133 = distinct !DISubprogram(name: "req_isr_3", scope: !3, file: !3, line: 103, type: !37, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!134 = !DILocation(line: 104, column: 9, scope: !133)
!135 = !DILocation(line: 105, column: 5, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !3, line: 105, column: 5)
!137 = !DILocation(line: 106, column: 15, scope: !133)
!138 = !DILocation(line: 107, column: 16, scope: !133)
!139 = !DILocation(line: 108, column: 9, scope: !133)
!140 = !DILocation(line: 109, column: 1, scope: !133)
!141 = distinct !DISubprogram(name: "svp_simple_009_001_main", scope: !3, file: !3, line: 111, type: !142, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!142 = !DISubroutineType(types: !143)
!143 = !{!7}
!144 = !DILocation(line: 112, column: 5, scope: !141)
!145 = !DILocation(line: 113, column: 5, scope: !141)
!146 = !DILocation(line: 114, column: 5, scope: !141)
