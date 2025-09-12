; ModuleID = './blink/blink1.c'
source_filename = "./blink/blink1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@timerCount = global i32 0, align 4, !dbg !0
@LED_0 = common global i32 0, align 4, !dbg !10
@LED_1 = common global i32 0, align 4, !dbg !12
@P1OUT = common global i32 0, align 4, !dbg !6
@cnt1 = common global i32 0, align 4, !dbg !36
@cnt2 = common global i32 0, align 4, !dbg !38
@cnt3 = common global i32 0, align 4, !dbg !40
@WDTPW = common global i32 0, align 4, !dbg !16
@WDTHOLD = common global i32 0, align 4, !dbg !20
@WDTCTL = common global i32 0, align 4, !dbg !18
@LED_DIR = common global i32 0, align 4, !dbg !22
@LED_OUT = common global i32 0, align 4, !dbg !24
@CCIE = common global i32 0, align 4, !dbg !28
@CCTL0 = common global i32 0, align 4, !dbg !26
@TASSEL_2 = common global i32 0, align 4, !dbg !32
@MC_2 = common global i32 0, align 4, !dbg !34
@TACTL = common global i32 0, align 4, !dbg !30
@WDTCLT = common global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_1() #0 !dbg !49 {
  store i32 1, i32* @timerCount, align 4, !dbg !52
  %1 = load i32, i32* @timerCount, align 4, !dbg !53
  %2 = icmp ne i32 %1, 0, !dbg !55
  br i1 %2, label %3, label %4, !dbg !56

3:                                                ; preds = %0
  br label %4, !dbg !57

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !59
  %6 = icmp eq i32 %5, 0, !dbg !61
  br i1 %6, label %7, label %11, !dbg !62

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !63
  %9 = load i32, i32* @LED_1, align 4, !dbg !65
  %10 = add nsw i32 %8, %9, !dbg !66
  store i32 %10, i32* @P1OUT, align 4, !dbg !67
  br label %11, !dbg !68

11:                                               ; preds = %7, %4
  %12 = load i32, i32* @cnt1, align 4, !dbg !69
  %13 = add nsw i32 %12, 1, !dbg !69
  store i32 %13, i32* @cnt1, align 4, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_2() #0 !dbg !71 {
  store i32 1, i32* @timerCount, align 4, !dbg !72
  %1 = load i32, i32* @timerCount, align 4, !dbg !73
  %2 = icmp ne i32 %1, 0, !dbg !75
  br i1 %2, label %3, label %4, !dbg !76

3:                                                ; preds = %0
  br label %4, !dbg !77

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !79
  %6 = icmp eq i32 %5, 0, !dbg !81
  br i1 %6, label %7, label %9, !dbg !82

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !83
  store i32 %8, i32* @P1OUT, align 4, !dbg !85
  br label %9, !dbg !86

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt2, align 4, !dbg !87
  %11 = add nsw i32 %10, 1, !dbg !87
  store i32 %11, i32* @cnt2, align 4, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_3() #0 !dbg !89 {
  store i32 0, i32* @timerCount, align 4, !dbg !90
  %1 = load i32, i32* @timerCount, align 4, !dbg !91
  %2 = icmp ne i32 %1, 0, !dbg !93
  br i1 %2, label %3, label %4, !dbg !94

3:                                                ; preds = %0
  br label %4, !dbg !95

4:                                                ; preds = %3, %0
  store i32 1, i32* @timerCount, align 4, !dbg !97
  %5 = load i32, i32* @cnt3, align 4, !dbg !98
  %6 = add nsw i32 %5, 1, !dbg !98
  store i32 %6, i32* @cnt3, align 4, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !100 {
  %1 = load i32, i32* @WDTPW, align 4, !dbg !103
  %2 = load i32, i32* @WDTHOLD, align 4, !dbg !104
  %3 = add nsw i32 %1, %2, !dbg !105
  store i32 %3, i32* @WDTCTL, align 4, !dbg !106
  %4 = load i32, i32* @LED_0, align 4, !dbg !107
  %5 = load i32, i32* @LED_1, align 4, !dbg !108
  %6 = add nsw i32 %4, %5, !dbg !109
  store i32 %6, i32* @LED_DIR, align 4, !dbg !110
  %7 = load i32, i32* @LED_0, align 4, !dbg !111
  %8 = load i32, i32* @LED_1, align 4, !dbg !112
  %9 = add nsw i32 %7, %8, !dbg !113
  %10 = add nsw i32 1, %9, !dbg !114
  store i32 %10, i32* @LED_OUT, align 4, !dbg !115
  %11 = load i32, i32* @CCIE, align 4, !dbg !116
  store i32 %11, i32* @CCTL0, align 4, !dbg !117
  %12 = load i32, i32* @TASSEL_2, align 4, !dbg !118
  %13 = load i32, i32* @MC_2, align 4, !dbg !119
  %14 = add nsw i32 %12, %13, !dbg !120
  store i32 %14, i32* @TACTL, align 4, !dbg !121
  store i32 0, i32* @timerCount, align 4, !dbg !122
  ret i32 0, !dbg !123
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!43, !44, !45, !46, !47}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "timerCount", scope: !2, file: !8, line: 6, type: !42, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "blink/blink1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !12, !14, !16, !18, !20, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "P1OUT", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./blink/blink1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "LED_0", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "LED_1", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "WDTCLT", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "WDTPW", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "WDTCTL", scope: !2, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "WDTHOLD", scope: !2, file: !8, line: 13, type: !9, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "LED_DIR", scope: !2, file: !8, line: 14, type: !9, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "LED_OUT", scope: !2, file: !8, line: 15, type: !9, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "CCTL0", scope: !2, file: !8, line: 16, type: !9, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "CCIE", scope: !2, file: !8, line: 17, type: !9, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "TACTL", scope: !2, file: !8, line: 18, type: !9, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "TASSEL_2", scope: !2, file: !8, line: 19, type: !9, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "MC_2", scope: !2, file: !8, line: 20, type: !9, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!44 = !{i32 7, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{i32 7, !"PIC Level", i32 2}
!48 = !{!"clang version 10.0.0 "}
!49 = distinct !DISubprogram(name: "Timer_isr_1", scope: !8, file: !8, line: 30, type: !50, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{null}
!52 = !DILocation(line: 36, column: 20, scope: !49)
!53 = !DILocation(line: 41, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !8, line: 41, column: 13)
!55 = !DILocation(line: 41, column: 24, scope: !54)
!56 = !DILocation(line: 41, column: 13, scope: !49)
!57 = !DILocation(line: 43, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !8, line: 41, column: 30)
!59 = !DILocation(line: 44, column: 12, scope: !60)
!60 = distinct !DILexicalBlock(scope: !49, file: !8, line: 44, column: 12)
!61 = !DILocation(line: 44, column: 23, scope: !60)
!62 = !DILocation(line: 44, column: 12, scope: !49)
!63 = !DILocation(line: 45, column: 22, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !8, line: 44, column: 29)
!65 = !DILocation(line: 45, column: 30, scope: !64)
!66 = !DILocation(line: 45, column: 28, scope: !64)
!67 = !DILocation(line: 45, column: 19, scope: !64)
!68 = !DILocation(line: 46, column: 9, scope: !64)
!69 = !DILocation(line: 47, column: 13, scope: !49)
!70 = !DILocation(line: 49, column: 1, scope: !49)
!71 = distinct !DISubprogram(name: "Timer_isr_2", scope: !8, file: !8, line: 52, type: !50, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 56, column: 20, scope: !71)
!73 = !DILocation(line: 60, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !8, line: 60, column: 13)
!75 = !DILocation(line: 60, column: 24, scope: !74)
!76 = !DILocation(line: 60, column: 13, scope: !71)
!77 = !DILocation(line: 62, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !8, line: 60, column: 30)
!79 = !DILocation(line: 63, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !8, line: 63, column: 13)
!81 = !DILocation(line: 63, column: 24, scope: !80)
!82 = !DILocation(line: 63, column: 13, scope: !71)
!83 = !DILocation(line: 64, column: 22, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !8, line: 63, column: 30)
!85 = !DILocation(line: 64, column: 20, scope: !84)
!86 = !DILocation(line: 65, column: 9, scope: !84)
!87 = !DILocation(line: 66, column: 13, scope: !71)
!88 = !DILocation(line: 68, column: 1, scope: !71)
!89 = distinct !DISubprogram(name: "Timer_isr_3", scope: !8, file: !8, line: 71, type: !50, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocation(line: 76, column: 20, scope: !89)
!91 = !DILocation(line: 77, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !8, line: 77, column: 13)
!93 = !DILocation(line: 77, column: 24, scope: !92)
!94 = !DILocation(line: 77, column: 13, scope: !89)
!95 = !DILocation(line: 79, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !8, line: 77, column: 30)
!97 = !DILocation(line: 80, column: 20, scope: !89)
!98 = !DILocation(line: 81, column: 13, scope: !89)
!99 = !DILocation(line: 83, column: 1, scope: !89)
!100 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 86, type: !101, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{!9}
!103 = !DILocation(line: 88, column: 14, scope: !100)
!104 = !DILocation(line: 88, column: 22, scope: !100)
!105 = !DILocation(line: 88, column: 20, scope: !100)
!106 = !DILocation(line: 88, column: 12, scope: !100)
!107 = !DILocation(line: 90, column: 15, scope: !100)
!108 = !DILocation(line: 90, column: 23, scope: !100)
!109 = !DILocation(line: 90, column: 21, scope: !100)
!110 = !DILocation(line: 90, column: 13, scope: !100)
!111 = !DILocation(line: 92, column: 20, scope: !100)
!112 = !DILocation(line: 92, column: 26, scope: !100)
!113 = !DILocation(line: 92, column: 25, scope: !100)
!114 = !DILocation(line: 92, column: 17, scope: !100)
!115 = !DILocation(line: 92, column: 13, scope: !100)
!116 = !DILocation(line: 94, column: 13, scope: !100)
!117 = !DILocation(line: 94, column: 11, scope: !100)
!118 = !DILocation(line: 95, column: 13, scope: !100)
!119 = !DILocation(line: 95, column: 24, scope: !100)
!120 = !DILocation(line: 95, column: 22, scope: !100)
!121 = !DILocation(line: 95, column: 11, scope: !100)
!122 = !DILocation(line: 97, column: 16, scope: !100)
!123 = !DILocation(line: 111, column: 1, scope: !100)
