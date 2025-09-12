; ModuleID = './blink/blink2.c'
source_filename = "./blink/blink2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@timerCount = global i32 0, align 4, !dbg !0
@LED_0 = common global i32 0, align 4, !dbg !10
@LED_1 = common global i32 0, align 4, !dbg !12
@P1OUT = common global i32 0, align 4, !dbg !6
@cnt1 = common global i32 0, align 4, !dbg !36
@cnt2 = common global i32 0, align 4, !dbg !38
@cnt3 = common global i32 0, align 4, !dbg !40
@cnt4 = common global i32 0, align 4, !dbg !42
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
define void @Timer_isr_1() #0 !dbg !51 {
  %1 = load i32, i32* @timerCount, align 4, !dbg !54
  %2 = add i32 %1, 1, !dbg !55
  store i32 %2, i32* @timerCount, align 4, !dbg !56
  %3 = load i32, i32* @timerCount, align 4, !dbg !57
  %4 = icmp ne i32 %3, 0, !dbg !59
  br i1 %4, label %5, label %6, !dbg !60

5:                                                ; preds = %0
  br label %6, !dbg !61

6:                                                ; preds = %5, %0
  %7 = load i32, i32* @timerCount, align 4, !dbg !63
  %8 = icmp eq i32 %7, 0, !dbg !65
  br i1 %8, label %9, label %13, !dbg !66

9:                                                ; preds = %6
  %10 = load i32, i32* @LED_0, align 4, !dbg !67
  %11 = load i32, i32* @LED_1, align 4, !dbg !69
  %12 = add nsw i32 %10, %11, !dbg !70
  store i32 %12, i32* @P1OUT, align 4, !dbg !71
  br label %13, !dbg !72

13:                                               ; preds = %9, %6
  %14 = load i32, i32* @cnt1, align 4, !dbg !73
  %15 = add nsw i32 %14, 1, !dbg !73
  store i32 %15, i32* @cnt1, align 4, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_B() #0 !dbg !75 {
  store i32 0, i32* @timerCount, align 4, !dbg !76
  %1 = load i32, i32* @timerCount, align 4, !dbg !77
  %2 = icmp ne i32 %1, 0, !dbg !79
  br i1 %2, label %3, label %4, !dbg !80

3:                                                ; preds = %0
  br label %4, !dbg !81

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !83
  %6 = icmp eq i32 %5, 0, !dbg !85
  br i1 %6, label %7, label %9, !dbg !86

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !87
  store i32 %8, i32* @P1OUT, align 4, !dbg !89
  br label %9, !dbg !90

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt2, align 4, !dbg !91
  %11 = add nsw i32 %10, 1, !dbg !91
  store i32 %11, i32* @cnt2, align 4, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_3() #0 !dbg !93 {
  store i32 0, i32* @timerCount, align 4, !dbg !94
  %1 = load i32, i32* @timerCount, align 4, !dbg !95
  %2 = icmp ne i32 %1, 0, !dbg !97
  br i1 %2, label %3, label %4, !dbg !98

3:                                                ; preds = %0
  br label %4, !dbg !99

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !101
  %6 = icmp eq i32 %5, 0, !dbg !103
  br i1 %6, label %7, label %9, !dbg !104

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !105
  store i32 %8, i32* @P1OUT, align 4, !dbg !107
  br label %9, !dbg !108

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt3, align 4, !dbg !109
  %11 = add nsw i32 %10, 1, !dbg !109
  store i32 %11, i32* @cnt3, align 4, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_2() #0 !dbg !111 {
  store i32 1, i32* @timerCount, align 4, !dbg !112
  %1 = load i32, i32* @cnt4, align 4, !dbg !113
  %2 = add nsw i32 %1, 1, !dbg !113
  store i32 %2, i32* @cnt4, align 4, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_002_001_main() #0 !dbg !115 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @WDTPW, align 4, !dbg !118
  %3 = load i32, i32* @WDTHOLD, align 4, !dbg !119
  %4 = add nsw i32 %2, %3, !dbg !120
  store i32 %4, i32* @WDTCTL, align 4, !dbg !121
  %5 = load i32, i32* @LED_0, align 4, !dbg !122
  %6 = load i32, i32* @LED_1, align 4, !dbg !123
  %7 = add nsw i32 %5, %6, !dbg !124
  store i32 %7, i32* @LED_DIR, align 4, !dbg !125
  %8 = load i32, i32* @LED_0, align 4, !dbg !126
  %9 = load i32, i32* @LED_1, align 4, !dbg !127
  %10 = add nsw i32 %8, %9, !dbg !128
  %11 = add nsw i32 1, %10, !dbg !129
  store i32 %11, i32* @LED_OUT, align 4, !dbg !130
  %12 = load i32, i32* @CCIE, align 4, !dbg !131
  store i32 %12, i32* @CCTL0, align 4, !dbg !132
  %13 = load i32, i32* @TASSEL_2, align 4, !dbg !133
  %14 = load i32, i32* @MC_2, align 4, !dbg !134
  %15 = add nsw i32 %13, %14, !dbg !135
  store i32 %15, i32* @TACTL, align 4, !dbg !136
  store i32 0, i32* @timerCount, align 4, !dbg !137
  call void @Timer_B(), !dbg !138
  %16 = load i32, i32* %1, align 4, !dbg !139
  ret i32 %16, !dbg !139
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!45, !46, !47, !48, !49}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!50}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "timerCount", scope: !2, file: !8, line: 4, type: !44, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "blink/blink2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !12, !14, !16, !18, !20, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "P1OUT", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./blink/blink2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "LED_0", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "LED_1", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "WDTCLT", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "WDTPW", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "WDTCTL", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "WDTHOLD", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "LED_DIR", scope: !2, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "LED_OUT", scope: !2, file: !8, line: 13, type: !9, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "CCTL0", scope: !2, file: !8, line: 14, type: !9, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "CCIE", scope: !2, file: !8, line: 15, type: !9, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "TACTL", scope: !2, file: !8, line: 16, type: !9, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "TASSEL_2", scope: !2, file: !8, line: 17, type: !9, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "MC_2", scope: !2, file: !8, line: 18, type: !9, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 21, type: !9, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 21, type: !9, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 21, type: !9, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 21, type: !9, isLocal: false, isDefinition: true)
!44 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!45 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!46 = !{i32 7, !"Dwarf Version", i32 4}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{i32 7, !"PIC Level", i32 2}
!50 = !{!"clang version 10.0.0 "}
!51 = distinct !DISubprogram(name: "Timer_isr_1", scope: !8, file: !8, line: 29, type: !52, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{null}
!54 = !DILocation(line: 35, column: 23, scope: !51)
!55 = !DILocation(line: 35, column: 34, scope: !51)
!56 = !DILocation(line: 35, column: 20, scope: !51)
!57 = !DILocation(line: 39, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !8, line: 39, column: 13)
!59 = !DILocation(line: 39, column: 24, scope: !58)
!60 = !DILocation(line: 39, column: 13, scope: !51)
!61 = !DILocation(line: 41, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !8, line: 39, column: 30)
!63 = !DILocation(line: 42, column: 12, scope: !64)
!64 = distinct !DILexicalBlock(scope: !51, file: !8, line: 42, column: 12)
!65 = !DILocation(line: 42, column: 23, scope: !64)
!66 = !DILocation(line: 42, column: 12, scope: !51)
!67 = !DILocation(line: 43, column: 22, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !8, line: 42, column: 29)
!69 = !DILocation(line: 43, column: 30, scope: !68)
!70 = !DILocation(line: 43, column: 28, scope: !68)
!71 = !DILocation(line: 43, column: 19, scope: !68)
!72 = !DILocation(line: 44, column: 9, scope: !68)
!73 = !DILocation(line: 45, column: 13, scope: !51)
!74 = !DILocation(line: 47, column: 1, scope: !51)
!75 = distinct !DISubprogram(name: "Timer_B", scope: !8, file: !8, line: 50, type: !52, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 55, column: 20, scope: !75)
!77 = !DILocation(line: 59, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !8, line: 59, column: 13)
!79 = !DILocation(line: 59, column: 24, scope: !78)
!80 = !DILocation(line: 59, column: 13, scope: !75)
!81 = !DILocation(line: 61, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !8, line: 59, column: 30)
!83 = !DILocation(line: 62, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !8, line: 62, column: 13)
!85 = !DILocation(line: 62, column: 24, scope: !84)
!86 = !DILocation(line: 62, column: 13, scope: !75)
!87 = !DILocation(line: 63, column: 22, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !8, line: 62, column: 30)
!89 = !DILocation(line: 63, column: 20, scope: !88)
!90 = !DILocation(line: 64, column: 9, scope: !88)
!91 = !DILocation(line: 65, column: 13, scope: !75)
!92 = !DILocation(line: 67, column: 1, scope: !75)
!93 = distinct !DISubprogram(name: "Timer_isr_3", scope: !8, file: !8, line: 70, type: !52, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocation(line: 73, column: 20, scope: !93)
!95 = !DILocation(line: 77, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !8, line: 77, column: 13)
!97 = !DILocation(line: 77, column: 24, scope: !96)
!98 = !DILocation(line: 77, column: 13, scope: !93)
!99 = !DILocation(line: 79, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !8, line: 77, column: 30)
!101 = !DILocation(line: 80, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !93, file: !8, line: 80, column: 13)
!103 = !DILocation(line: 80, column: 24, scope: !102)
!104 = !DILocation(line: 80, column: 13, scope: !93)
!105 = !DILocation(line: 81, column: 22, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !8, line: 80, column: 30)
!107 = !DILocation(line: 81, column: 20, scope: !106)
!108 = !DILocation(line: 82, column: 9, scope: !106)
!109 = !DILocation(line: 83, column: 13, scope: !93)
!110 = !DILocation(line: 85, column: 1, scope: !93)
!111 = distinct !DISubprogram(name: "Timer_isr_2", scope: !8, file: !8, line: 88, type: !52, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 94, column: 20, scope: !111)
!113 = !DILocation(line: 95, column: 13, scope: !111)
!114 = !DILocation(line: 97, column: 1, scope: !111)
!115 = distinct !DISubprogram(name: "svp_simple_002_001_main", scope: !8, file: !8, line: 99, type: !116, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DISubroutineType(types: !117)
!117 = !{!9}
!118 = !DILocation(line: 101, column: 14, scope: !115)
!119 = !DILocation(line: 101, column: 22, scope: !115)
!120 = !DILocation(line: 101, column: 20, scope: !115)
!121 = !DILocation(line: 101, column: 12, scope: !115)
!122 = !DILocation(line: 103, column: 15, scope: !115)
!123 = !DILocation(line: 103, column: 23, scope: !115)
!124 = !DILocation(line: 103, column: 21, scope: !115)
!125 = !DILocation(line: 103, column: 13, scope: !115)
!126 = !DILocation(line: 105, column: 20, scope: !115)
!127 = !DILocation(line: 105, column: 26, scope: !115)
!128 = !DILocation(line: 105, column: 25, scope: !115)
!129 = !DILocation(line: 105, column: 17, scope: !115)
!130 = !DILocation(line: 105, column: 13, scope: !115)
!131 = !DILocation(line: 107, column: 13, scope: !115)
!132 = !DILocation(line: 107, column: 11, scope: !115)
!133 = !DILocation(line: 108, column: 13, scope: !115)
!134 = !DILocation(line: 108, column: 24, scope: !115)
!135 = !DILocation(line: 108, column: 22, scope: !115)
!136 = !DILocation(line: 108, column: 11, scope: !115)
!137 = !DILocation(line: 110, column: 16, scope: !115)
!138 = !DILocation(line: 113, column: 5, scope: !115)
!139 = !DILocation(line: 123, column: 1, scope: !115)
