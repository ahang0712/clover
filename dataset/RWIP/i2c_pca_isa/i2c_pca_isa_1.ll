; ModuleID = './i2c_pca_isa/i2c_pca_isa_1.c'
source_filename = "./i2c_pca_isa/i2c_pca_isa_1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@irq = common global i32 0, align 4, !dbg !0
@global_id = common global i32 0, align 4, !dbg !10
@global_dev = common global i32 0, align 4, !dbg !12
@cnt1 = common global i32 0, align 4, !dbg !14
@cnt2 = common global i32 0, align 4, !dbg !16
@cnt3 = common global i32 0, align 4, !dbg !18
@cnt4 = common global i32 0, align 4, !dbg !20
@global_clock = common global i32 0, align 4, !dbg !6
@cnt5 = common global i32 0, align 4, !dbg !22
@cnt6 = common global i32 0, align 4, !dbg !24

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req1() #0 !dbg !32 {
  store i32 1, i32* @irq, align 4, !dbg !35
  store i32 1, i32* @global_id, align 4, !dbg !36
  store i32 1, i32* @global_dev, align 4, !dbg !36
  %1 = load i32, i32* @global_dev, align 4, !dbg !38
  %2 = icmp ne i32 %1, 1, !dbg !38
  br i1 %2, label %3, label %4, !dbg !40

3:                                                ; preds = %0
  br label %4, !dbg !41

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !43
  %6 = icmp sgt i32 %5, -1, !dbg !43
  br i1 %6, label %7, label %12, !dbg !40

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !45
  %9 = icmp ne i32 %8, 1, !dbg !45
  br i1 %9, label %10, label %11, !dbg !48

10:                                               ; preds = %7
  br label %11, !dbg !49

11:                                               ; preds = %10, %7
  br label %12, !dbg !48

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !51
  store i32 -1, i32* @global_dev, align 4, !dbg !51
  %13 = load i32, i32* @cnt1, align 4, !dbg !53
  %14 = add nsw i32 %13, 1, !dbg !53
  store i32 %14, i32* @cnt1, align 4, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_1() #0 !dbg !55 {
  store i32 2, i32* @irq, align 4, !dbg !56
  store i32 2, i32* @global_id, align 4, !dbg !57
  store i32 2, i32* @global_dev, align 4, !dbg !57
  %1 = load i32, i32* @global_dev, align 4, !dbg !59
  %2 = icmp ne i32 %1, 2, !dbg !59
  br i1 %2, label %3, label %4, !dbg !61

3:                                                ; preds = %0
  br label %4, !dbg !62

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !64
  %6 = icmp sgt i32 %5, -1, !dbg !64
  br i1 %6, label %7, label %12, !dbg !61

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !66
  %9 = icmp ne i32 %8, 2, !dbg !66
  br i1 %9, label %10, label %11, !dbg !69

10:                                               ; preds = %7
  br label %11, !dbg !70

11:                                               ; preds = %10, %7
  br label %12, !dbg !69

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !72
  store i32 -1, i32* @global_dev, align 4, !dbg !72
  %13 = load i32, i32* @cnt2, align 4, !dbg !74
  %14 = add nsw i32 %13, 1, !dbg !74
  store i32 %14, i32* @cnt2, align 4, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_2() #0 !dbg !76 {
  store i32 3, i32* @irq, align 4, !dbg !77
  store i32 3, i32* @global_id, align 4, !dbg !78
  store i32 3, i32* @global_dev, align 4, !dbg !78
  %1 = load i32, i32* @global_dev, align 4, !dbg !80
  %2 = icmp ne i32 %1, 3, !dbg !80
  br i1 %2, label %3, label %4, !dbg !82

3:                                                ; preds = %0
  br label %4, !dbg !83

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !85
  %6 = icmp sgt i32 %5, -1, !dbg !85
  br i1 %6, label %7, label %12, !dbg !82

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !87
  %9 = icmp ne i32 %8, 3, !dbg !87
  br i1 %9, label %10, label %11, !dbg !90

10:                                               ; preds = %7
  br label %11, !dbg !91

11:                                               ; preds = %10, %7
  br label %12, !dbg !90

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !93
  store i32 -1, i32* @global_dev, align 4, !dbg !93
  %13 = load i32, i32* @cnt3, align 4, !dbg !95
  %14 = add nsw i32 %13, 1, !dbg !95
  store i32 %14, i32* @cnt3, align 4, !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @req_isr_3() #0 !dbg !97 {
  store i32 -1, i32* @irq, align 4, !dbg !98
  %1 = load i32, i32* @cnt4, align 4, !dbg !99
  %2 = add nsw i32 %1, 1, !dbg !99
  store i32 %2, i32* @cnt4, align 4, !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_007_001_main() #0 !dbg !101 {
  call void @req1(), !dbg !104
  ret i32 0, !dbg !105
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!26, !27, !28, !29, !30}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "irq", scope: !2, file: !8, line: 167, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "i2c_pca_isa/i2c_pca_isa_1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!6, !0, !10, !12, !14, !16, !18, !20, !22, !24}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "global_clock", scope: !2, file: !8, line: 166, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./i2c_pca_isa/i2c_pca_isa_1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "global_id", scope: !2, file: !8, line: 168, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "global_dev", scope: !2, file: !8, line: 169, type: !9, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 254, type: !9, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 254, type: !9, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 254, type: !9, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 254, type: !9, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !8, line: 254, type: !9, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !8, line: 254, type: !9, isLocal: false, isDefinition: true)
!26 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{!"clang version 10.0.0 "}
!32 = distinct !DISubprogram(name: "req1", scope: !8, file: !8, line: 256, type: !33, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocation(line: 258, column: 13, scope: !32)
!36 = !DILocation(line: 259, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !8, line: 259, column: 9)
!38 = !DILocation(line: 260, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !8, line: 260, column: 9)
!40 = !DILocation(line: 260, column: 9, scope: !32)
!41 = !DILocation(line: 260, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !8, line: 260, column: 9)
!43 = !DILocation(line: 260, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !32, file: !8, line: 260, column: 9)
!45 = !DILocation(line: 260, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !8, line: 260, column: 9)
!47 = distinct !DILexicalBlock(scope: !44, file: !8, line: 260, column: 9)
!48 = !DILocation(line: 260, column: 9, scope: !47)
!49 = !DILocation(line: 260, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !8, line: 260, column: 9)
!51 = !DILocation(line: 261, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !32, file: !8, line: 261, column: 9)
!53 = !DILocation(line: 262, column: 13, scope: !32)
!54 = !DILocation(line: 264, column: 1, scope: !32)
!55 = distinct !DISubprogram(name: "req_isr_1", scope: !8, file: !8, line: 266, type: !33, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 268, column: 13, scope: !55)
!57 = !DILocation(line: 269, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !8, line: 269, column: 9)
!59 = !DILocation(line: 270, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !8, line: 270, column: 9)
!61 = !DILocation(line: 270, column: 9, scope: !55)
!62 = !DILocation(line: 270, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !8, line: 270, column: 9)
!64 = !DILocation(line: 270, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !8, line: 270, column: 9)
!66 = !DILocation(line: 270, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !8, line: 270, column: 9)
!68 = distinct !DILexicalBlock(scope: !65, file: !8, line: 270, column: 9)
!69 = !DILocation(line: 270, column: 9, scope: !68)
!70 = !DILocation(line: 270, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !8, line: 270, column: 9)
!72 = !DILocation(line: 271, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !55, file: !8, line: 271, column: 9)
!74 = !DILocation(line: 272, column: 13, scope: !55)
!75 = !DILocation(line: 274, column: 1, scope: !55)
!76 = distinct !DISubprogram(name: "req_isr_2", scope: !8, file: !8, line: 276, type: !33, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 278, column: 13, scope: !76)
!78 = !DILocation(line: 279, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !8, line: 279, column: 9)
!80 = !DILocation(line: 280, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !8, line: 280, column: 9)
!82 = !DILocation(line: 280, column: 9, scope: !76)
!83 = !DILocation(line: 280, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !8, line: 280, column: 9)
!85 = !DILocation(line: 280, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !8, line: 280, column: 9)
!87 = !DILocation(line: 280, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !8, line: 280, column: 9)
!89 = distinct !DILexicalBlock(scope: !86, file: !8, line: 280, column: 9)
!90 = !DILocation(line: 280, column: 9, scope: !89)
!91 = !DILocation(line: 280, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !8, line: 280, column: 9)
!93 = !DILocation(line: 281, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !76, file: !8, line: 281, column: 9)
!95 = !DILocation(line: 282, column: 13, scope: !76)
!96 = !DILocation(line: 284, column: 1, scope: !76)
!97 = distinct !DISubprogram(name: "req_isr_3", scope: !8, file: !8, line: 286, type: !33, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocation(line: 288, column: 13, scope: !97)
!99 = !DILocation(line: 289, column: 13, scope: !97)
!100 = !DILocation(line: 291, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "svp_simple_007_001_main", scope: !8, file: !8, line: 295, type: !102, scopeLine: 296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DISubroutineType(types: !103)
!103 = !{!9}
!104 = !DILocation(line: 299, column: 5, scope: !101)
!105 = !DILocation(line: 313, column: 5, scope: !101)
