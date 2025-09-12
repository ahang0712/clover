; ModuleID = './blink/blink3.c'
source_filename = "./blink/blink3.c"
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
@cnt5 = common global i32 0, align 4, !dbg !44
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
define void @Timer_isr_1() #0 !dbg !53 {
  call void @Timer_Force(), !dbg !56
  store i32 1, i32* @timerCount, align 4, !dbg !57
  %1 = load i32, i32* @timerCount, align 4, !dbg !58
  %2 = icmp ne i32 %1, 0, !dbg !60
  br i1 %2, label %3, label %4, !dbg !61

3:                                                ; preds = %0
  br label %4, !dbg !62

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !64
  %6 = icmp eq i32 %5, 0, !dbg !66
  br i1 %6, label %7, label %11, !dbg !67

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !68
  %9 = load i32, i32* @LED_1, align 4, !dbg !70
  %10 = add nsw i32 %8, %9, !dbg !71
  store i32 %10, i32* @P1OUT, align 4, !dbg !72
  br label %11, !dbg !73

11:                                               ; preds = %7, %4
  %12 = load i32, i32* @cnt1, align 4, !dbg !74
  %13 = add nsw i32 %12, 1, !dbg !74
  store i32 %13, i32* @cnt1, align 4, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_2() #0 !dbg !76 {
  store i32 1, i32* @timerCount, align 4, !dbg !77
  %1 = load i32, i32* @timerCount, align 4, !dbg !78
  %2 = icmp ne i32 %1, 0, !dbg !80
  br i1 %2, label %3, label %4, !dbg !81

3:                                                ; preds = %0
  br label %4, !dbg !82

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !84
  %6 = icmp eq i32 %5, 0, !dbg !86
  br i1 %6, label %7, label %9, !dbg !87

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !88
  store i32 %8, i32* @P1OUT, align 4, !dbg !90
  br label %9, !dbg !91

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt2, align 4, !dbg !92
  %11 = add nsw i32 %10, 1, !dbg !92
  store i32 %11, i32* @cnt2, align 4, !dbg !92
  call void @Timer_Reset(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_isr_3() #0 !dbg !95 {
  store i32 1, i32* @timerCount, align 4, !dbg !96
  %1 = load i32, i32* @timerCount, align 4, !dbg !97
  %2 = icmp ne i32 %1, 0, !dbg !99
  br i1 %2, label %3, label %4, !dbg !100

3:                                                ; preds = %0
  br label %4, !dbg !101

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !103
  %6 = icmp eq i32 %5, 0, !dbg !105
  br i1 %6, label %7, label %9, !dbg !106

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !107
  store i32 %8, i32* @P1OUT, align 4, !dbg !109
  br label %9, !dbg !110

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt3, align 4, !dbg !111
  %11 = add nsw i32 %10, 1, !dbg !111
  store i32 %11, i32* @cnt3, align 4, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_Force() #0 !dbg !113 {
  %1 = load i32, i32* @timerCount, align 4, !dbg !114
  %2 = add i32 %1, 1, !dbg !114
  store i32 %2, i32* @timerCount, align 4, !dbg !114
  %3 = load i32, i32* @cnt4, align 4, !dbg !115
  %4 = add nsw i32 %3, 1, !dbg !115
  store i32 %4, i32* @cnt4, align 4, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Timer_Reset() #0 !dbg !117 {
  store i32 0, i32* @timerCount, align 4, !dbg !118
  %1 = load i32, i32* @timerCount, align 4, !dbg !119
  %2 = icmp ne i32 %1, 0, !dbg !121
  br i1 %2, label %3, label %4, !dbg !122

3:                                                ; preds = %0
  br label %4, !dbg !123

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @cnt5, align 4, !dbg !125
  %6 = add nsw i32 %5, 1, !dbg !125
  store i32 %6, i32* @cnt5, align 4, !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_003_001_main() #0 !dbg !127 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @WDTPW, align 4, !dbg !130
  %3 = load i32, i32* @WDTHOLD, align 4, !dbg !131
  %4 = add nsw i32 %2, %3, !dbg !132
  store i32 %4, i32* @WDTCTL, align 4, !dbg !133
  %5 = load i32, i32* @LED_0, align 4, !dbg !134
  %6 = load i32, i32* @LED_1, align 4, !dbg !135
  %7 = add nsw i32 %5, %6, !dbg !136
  store i32 %7, i32* @LED_DIR, align 4, !dbg !137
  %8 = load i32, i32* @LED_0, align 4, !dbg !138
  %9 = load i32, i32* @LED_1, align 4, !dbg !139
  %10 = add nsw i32 %8, %9, !dbg !140
  %11 = add nsw i32 1, %10, !dbg !141
  store i32 %11, i32* @LED_OUT, align 4, !dbg !142
  %12 = load i32, i32* @CCIE, align 4, !dbg !143
  store i32 %12, i32* @CCTL0, align 4, !dbg !144
  %13 = load i32, i32* @TASSEL_2, align 4, !dbg !145
  %14 = load i32, i32* @MC_2, align 4, !dbg !146
  %15 = add nsw i32 %13, %14, !dbg !147
  store i32 %15, i32* @TACTL, align 4, !dbg !148
  store i32 0, i32* @timerCount, align 4, !dbg !149
  %16 = load i32, i32* %1, align 4, !dbg !150
  ret i32 %16, !dbg !150
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!47, !48, !49, !50, !51}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!52}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "timerCount", scope: !2, file: !8, line: 5, type: !46, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "blink/blink3.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !12, !14, !16, !18, !20, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "P1OUT", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./blink/blink3.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "LED_0", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "LED_1", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "WDTCLT", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "WDTPW", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "WDTCTL", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "WDTHOLD", scope: !2, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "LED_DIR", scope: !2, file: !8, line: 13, type: !9, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "LED_OUT", scope: !2, file: !8, line: 14, type: !9, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "CCTL0", scope: !2, file: !8, line: 15, type: !9, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "CCIE", scope: !2, file: !8, line: 16, type: !9, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "TACTL", scope: !2, file: !8, line: 17, type: !9, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "TASSEL_2", scope: !2, file: !8, line: 18, type: !9, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "MC_2", scope: !2, file: !8, line: 19, type: !9, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !8, line: 22, type: !9, isLocal: false, isDefinition: true)
!46 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!47 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!48 = !{i32 7, !"Dwarf Version", i32 4}
!49 = !{i32 2, !"Debug Info Version", i32 3}
!50 = !{i32 1, !"wchar_size", i32 4}
!51 = !{i32 7, !"PIC Level", i32 2}
!52 = !{!"clang version 10.0.0 "}
!53 = distinct !DISubprogram(name: "Timer_isr_1", scope: !8, file: !8, line: 31, type: !54, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{null}
!56 = !DILocation(line: 34, column: 5, scope: !53)
!57 = !DILocation(line: 35, column: 16, scope: !53)
!58 = !DILocation(line: 36, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !8, line: 36, column: 9)
!60 = !DILocation(line: 36, column: 20, scope: !59)
!61 = !DILocation(line: 36, column: 9, scope: !53)
!62 = !DILocation(line: 37, column: 5, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 36, column: 26)
!64 = !DILocation(line: 38, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !53, file: !8, line: 38, column: 8)
!66 = !DILocation(line: 38, column: 19, scope: !65)
!67 = !DILocation(line: 38, column: 8, scope: !53)
!68 = !DILocation(line: 39, column: 18, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !8, line: 38, column: 25)
!70 = !DILocation(line: 39, column: 26, scope: !69)
!71 = !DILocation(line: 39, column: 24, scope: !69)
!72 = !DILocation(line: 39, column: 15, scope: !69)
!73 = !DILocation(line: 40, column: 5, scope: !69)
!74 = !DILocation(line: 41, column: 13, scope: !53)
!75 = !DILocation(line: 42, column: 1, scope: !53)
!76 = distinct !DISubprogram(name: "Timer_isr_2", scope: !8, file: !8, line: 45, type: !54, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 49, column: 20, scope: !76)
!78 = !DILocation(line: 53, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !8, line: 53, column: 13)
!80 = !DILocation(line: 53, column: 24, scope: !79)
!81 = !DILocation(line: 53, column: 13, scope: !76)
!82 = !DILocation(line: 55, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !8, line: 53, column: 30)
!84 = !DILocation(line: 56, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !8, line: 56, column: 13)
!86 = !DILocation(line: 56, column: 24, scope: !85)
!87 = !DILocation(line: 56, column: 13, scope: !76)
!88 = !DILocation(line: 57, column: 22, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 56, column: 30)
!90 = !DILocation(line: 57, column: 20, scope: !89)
!91 = !DILocation(line: 58, column: 9, scope: !89)
!92 = !DILocation(line: 59, column: 13, scope: !76)
!93 = !DILocation(line: 61, column: 9, scope: !76)
!94 = !DILocation(line: 63, column: 1, scope: !76)
!95 = distinct !DISubprogram(name: "Timer_isr_3", scope: !8, file: !8, line: 66, type: !54, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 72, column: 20, scope: !95)
!97 = !DILocation(line: 76, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !8, line: 76, column: 13)
!99 = !DILocation(line: 76, column: 24, scope: !98)
!100 = !DILocation(line: 76, column: 13, scope: !95)
!101 = !DILocation(line: 78, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !8, line: 76, column: 30)
!103 = !DILocation(line: 79, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !8, line: 79, column: 13)
!105 = !DILocation(line: 79, column: 24, scope: !104)
!106 = !DILocation(line: 79, column: 13, scope: !95)
!107 = !DILocation(line: 80, column: 22, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !8, line: 79, column: 30)
!109 = !DILocation(line: 80, column: 20, scope: !108)
!110 = !DILocation(line: 81, column: 9, scope: !108)
!111 = !DILocation(line: 82, column: 13, scope: !95)
!112 = !DILocation(line: 84, column: 1, scope: !95)
!113 = distinct !DISubprogram(name: "Timer_Force", scope: !8, file: !8, line: 87, type: !54, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocation(line: 92, column: 20, scope: !113)
!115 = !DILocation(line: 93, column: 13, scope: !113)
!116 = !DILocation(line: 96, column: 1, scope: !113)
!117 = distinct !DISubprogram(name: "Timer_Reset", scope: !8, file: !8, line: 99, type: !54, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocation(line: 102, column: 20, scope: !117)
!119 = !DILocation(line: 106, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !8, line: 106, column: 13)
!121 = !DILocation(line: 106, column: 24, scope: !120)
!122 = !DILocation(line: 106, column: 13, scope: !117)
!123 = !DILocation(line: 108, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !8, line: 106, column: 30)
!125 = !DILocation(line: 109, column: 13, scope: !117)
!126 = !DILocation(line: 111, column: 1, scope: !117)
!127 = distinct !DISubprogram(name: "svp_simple_003_001_main", scope: !8, file: !8, line: 113, type: !128, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DISubroutineType(types: !129)
!129 = !{!9}
!130 = !DILocation(line: 115, column: 14, scope: !127)
!131 = !DILocation(line: 115, column: 22, scope: !127)
!132 = !DILocation(line: 115, column: 20, scope: !127)
!133 = !DILocation(line: 115, column: 12, scope: !127)
!134 = !DILocation(line: 117, column: 15, scope: !127)
!135 = !DILocation(line: 117, column: 23, scope: !127)
!136 = !DILocation(line: 117, column: 21, scope: !127)
!137 = !DILocation(line: 117, column: 13, scope: !127)
!138 = !DILocation(line: 119, column: 20, scope: !127)
!139 = !DILocation(line: 119, column: 26, scope: !127)
!140 = !DILocation(line: 119, column: 25, scope: !127)
!141 = !DILocation(line: 119, column: 17, scope: !127)
!142 = !DILocation(line: 119, column: 13, scope: !127)
!143 = !DILocation(line: 121, column: 13, scope: !127)
!144 = !DILocation(line: 121, column: 11, scope: !127)
!145 = !DILocation(line: 122, column: 13, scope: !127)
!146 = !DILocation(line: 122, column: 24, scope: !127)
!147 = !DILocation(line: 122, column: 22, scope: !127)
!148 = !DILocation(line: 122, column: 11, scope: !127)
!149 = !DILocation(line: 124, column: 16, scope: !127)
!150 = !DILocation(line: 138, column: 1, scope: !127)
