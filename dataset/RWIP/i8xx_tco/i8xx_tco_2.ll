; ModuleID = './i8xx_tco/i8xx_tco_2.c'
source_filename = "./i8xx_tco/i8xx_tco_2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@heartbeat = global i32 30, align 4, !dbg !0
@nowayout = global i32 0, align 4, !dbg !6
@tco_lock = common global i8 0, align 1, !dbg !13
@tco_write_buf = common global i8 0, align 1, !dbg !22
@tco_expect_close = common global i8 0, align 1, !dbg !19
@tco1_rld = common global i8 0, align 1, !dbg !24
@cnt1 = common global i32 0, align 4, !dbg !42
@timer_alive = common global i64 0, align 8, !dbg !16
@cnt2 = common global i32 0, align 4, !dbg !44
@cnt3 = common global i32 0, align 4, !dbg !46
@cnt4 = common global i32 0, align 4, !dbg !48
@ACPIBASE = common global i32 0, align 4, !dbg !10
@tco1_cnt_b0 = common global i8 0, align 1, !dbg !26
@tco1_cnt_b1 = common global i8 0, align 1, !dbg !28
@tco1_cnt_b2 = common global i8 0, align 1, !dbg !30
@tco1_cnt_b3 = common global i8 0, align 1, !dbg !32
@tco1_cnt_b4 = common global i8 0, align 1, !dbg !34
@tco1_cnt_b5 = common global i8 0, align 1, !dbg !36
@tco1_cnt_b6 = common global i8 0, align 1, !dbg !38
@tco1_cnt_b7 = common global i8 0, align 1, !dbg !40
@cnt5 = common global i32 0, align 4, !dbg !50

; Function Attrs: noinline nounwind optnone ssp uwtable
define zeroext i8 @seconds_to_ticks(i32 %0) #0 !dbg !58 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !62, metadata !DIExpression()), !dbg !63
  %3 = load i32, i32* %2, align 4, !dbg !64
  %4 = mul nsw i32 %3, 10, !dbg !65
  %5 = sdiv i32 %4, 6, !dbg !66
  %6 = trunc i32 %5 to i8, !dbg !67
  ret i8 %6, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @tco_timer_set_heartbeat(i32 %0) #0 !dbg !69 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8* %4, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8* %5, metadata !76, metadata !DIExpression()), !dbg !77
  %6 = load i32, i32* %3, align 4, !dbg !78
  %7 = call zeroext i8 @seconds_to_ticks(i32 %6), !dbg !79
  store i8 %7, i8* %5, align 1, !dbg !80
  %8 = load i8, i8* %5, align 1, !dbg !81
  %9 = zext i8 %8 to i32, !dbg !81
  %10 = icmp sgt i32 %9, 63, !dbg !83
  br i1 %10, label %15, label %11, !dbg !84

11:                                               ; preds = %1
  %12 = load i8, i8* %5, align 1, !dbg !85
  %13 = zext i8 %12 to i32, !dbg !85
  %14 = icmp slt i32 %13, 4, !dbg !86
  br i1 %14, label %15, label %16, !dbg !87

15:                                               ; preds = %11, %1
  store i32 -22, i32* %2, align 4, !dbg !88
  br label %45, !dbg !88

16:                                               ; preds = %11
  br label %17, !dbg !89

17:                                               ; preds = %16
  br label %18, !dbg !90

18:                                               ; preds = %21, %17
  %19 = load i8, i8* @tco_lock, align 1, !dbg !90
  %20 = trunc i8 %19 to i1, !dbg !90
  br i1 %20, label %21, label %22, !dbg !90

21:                                               ; preds = %18
  br label %18, !dbg !90, !llvm.loop !92

22:                                               ; preds = %18
  br label %23, !dbg !90

23:                                               ; preds = %22
  store i8 0, i8* %4, align 1, !dbg !93
  %24 = load i8, i8* %4, align 1, !dbg !94
  %25 = zext i8 %24 to i32, !dbg !94
  %26 = and i32 %25, 192, !dbg !94
  %27 = trunc i32 %26 to i8, !dbg !94
  store i8 %27, i8* %4, align 1, !dbg !94
  %28 = load i8, i8* %5, align 1, !dbg !95
  %29 = zext i8 %28 to i32, !dbg !95
  %30 = load i8, i8* %4, align 1, !dbg !96
  %31 = zext i8 %30 to i32, !dbg !96
  %32 = or i32 %31, %29, !dbg !96
  %33 = trunc i32 %32 to i8, !dbg !96
  store i8 %33, i8* %4, align 1, !dbg !96
  store i8 0, i8* %4, align 1, !dbg !97
  br label %34, !dbg !98

34:                                               ; preds = %23
  store i8 0, i8* @tco_lock, align 1, !dbg !99
  br label %35, !dbg !99

35:                                               ; preds = %34
  %36 = load i8, i8* %4, align 1, !dbg !101
  %37 = zext i8 %36 to i32, !dbg !101
  %38 = and i32 %37, 63, !dbg !103
  %39 = load i8, i8* %5, align 1, !dbg !104
  %40 = zext i8 %39 to i32, !dbg !104
  %41 = icmp ne i32 %38, %40, !dbg !105
  br i1 %41, label %42, label %43, !dbg !106

42:                                               ; preds = %35
  store i32 -22, i32* %2, align 4, !dbg !107
  br label %45, !dbg !107

43:                                               ; preds = %35
  %44 = load i32, i32* %3, align 4, !dbg !108
  store i32 %44, i32* @heartbeat, align 4, !dbg !109
  store i32 0, i32* %2, align 4, !dbg !110
  br label %45, !dbg !110

45:                                               ; preds = %43, %42, %15
  %46 = load i32, i32* %2, align 4, !dbg !111
  ret i32 %46, !dbg !111
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer1() #0 !dbg !112 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !115
  br label %1, !dbg !116

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !117
  %3 = icmp ne i32 %2, 0, !dbg !117
  br i1 %3, label %10, label %4, !dbg !122

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !123
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !125
  %6 = sext i8 %5 to i32, !dbg !125
  %7 = icmp eq i32 %6, 86, !dbg !125
  br i1 %7, label %8, label %9, !dbg !123

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !127
  br label %9, !dbg !127

9:                                                ; preds = %8, %4
  br label %10, !dbg !123

10:                                               ; preds = %9, %1
  br label %11, !dbg !129

11:                                               ; preds = %10
  br label %12, !dbg !130

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !132
  br label %13, !dbg !132

13:                                               ; preds = %12
  br label %14, !dbg !130

14:                                               ; preds = %13
  br label %15, !dbg !129

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !134
  %16 = load i32, i32* @cnt1, align 4, !dbg !135
  %17 = add nsw i32 %16, 1, !dbg !135
  store i32 %17, i32* @cnt1, align 4, !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_1() #0 !dbg !137 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !138
  br label %1, !dbg !139

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !140
  %3 = icmp ne i32 %2, 0, !dbg !140
  br i1 %3, label %10, label %4, !dbg !145

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !146
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !148
  %6 = sext i8 %5 to i32, !dbg !148
  %7 = icmp eq i32 %6, 86, !dbg !148
  br i1 %7, label %8, label %9, !dbg !146

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !150
  br label %9, !dbg !150

9:                                                ; preds = %8, %4
  br label %10, !dbg !146

10:                                               ; preds = %9, %1
  br label %11, !dbg !152

11:                                               ; preds = %10
  br label %12, !dbg !153

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !155
  br label %13, !dbg !155

13:                                               ; preds = %12
  br label %14, !dbg !153

14:                                               ; preds = %13
  br label %15, !dbg !152

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !157
  br label %16, !dbg !158

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !159
  %18 = sext i8 %17 to i32, !dbg !159
  %19 = icmp ne i32 %18, 42, !dbg !159
  br i1 %19, label %20, label %21, !dbg !162

20:                                               ; preds = %16
  br label %22, !dbg !163

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !162

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !165
  br label %24, !dbg !165

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !162
  br label %25, !dbg !162

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt2, align 4, !dbg !167
  %27 = add nsw i32 %26, 1, !dbg !167
  store i32 %27, i32* @cnt2, align 4, !dbg !167
  ret void, !dbg !168
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_2() #0 !dbg !169 {
  br label %1, !dbg !170

1:                                                ; preds = %0
  br label %2, !dbg !171

2:                                                ; preds = %1
  br label %3, !dbg !173

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !175
  br label %4, !dbg !175

4:                                                ; preds = %3
  br label %5, !dbg !173

5:                                                ; preds = %4
  br label %6, !dbg !171

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt3, align 4, !dbg !177
  %8 = add nsw i32 %7, 1, !dbg !177
  store i32 %8, i32* @cnt3, align 4, !dbg !177
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_3() #0 !dbg !179 {
  br label %1, !dbg !180

1:                                                ; preds = %0
  br label %2, !dbg !181

2:                                                ; preds = %1
  br label %3, !dbg !183

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !185
  br label %4, !dbg !185

4:                                                ; preds = %3
  br label %5, !dbg !183

5:                                                ; preds = %4
  br label %6, !dbg !181

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt4, align 4, !dbg !187
  %8 = add nsw i32 %7, 1, !dbg !187
  store i32 %8, i32* @cnt4, align 4, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_011_001_main(i32 %0, i8** %1) #0 !dbg !189 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !194, metadata !DIExpression()), !dbg !195
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !196, metadata !DIExpression()), !dbg !197
  store i8 0, i8* @tco_expect_close, align 1, !dbg !198
  call void @closer1(), !dbg !199
  %6 = load i32, i32* %3, align 4, !dbg !200
  ret i32 %6, !dbg !200
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!52, !53, !54, !55, !56}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!57}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heartbeat", scope: !2, file: !8, line: 162, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "i8xx_tco/i8xx_tco_2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !13, !16, !19, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "nowayout", scope: !2, file: !8, line: 170, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./i8xx_tco/i8xx_tco_2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "ACPIBASE", scope: !2, file: !8, line: 105, type: !12, isLocal: false, isDefinition: true)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "tco_lock", scope: !2, file: !8, line: 108, type: !15, isLocal: false, isDefinition: true)
!15 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "timer_alive", scope: !2, file: !8, line: 109, type: !18, isLocal: false, isDefinition: true)
!18 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "tco_expect_close", scope: !2, file: !8, line: 110, type: !21, isLocal: false, isDefinition: true)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "tco_write_buf", scope: !2, file: !8, line: 115, type: !21, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "tco1_rld", scope: !2, file: !8, line: 118, type: !21, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tco1_cnt_b0", scope: !2, file: !8, line: 151, type: !15, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "tco1_cnt_b1", scope: !2, file: !8, line: 152, type: !15, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "tco1_cnt_b2", scope: !2, file: !8, line: 153, type: !15, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "tco1_cnt_b3", scope: !2, file: !8, line: 154, type: !15, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "tco1_cnt_b4", scope: !2, file: !8, line: 155, type: !15, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "tco1_cnt_b5", scope: !2, file: !8, line: 156, type: !15, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "tco1_cnt_b6", scope: !2, file: !8, line: 157, type: !15, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "tco1_cnt_b7", scope: !2, file: !8, line: 158, type: !15, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 712, type: !9, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 712, type: !9, isLocal: false, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 712, type: !9, isLocal: false, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 712, type: !9, isLocal: false, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !8, line: 712, type: !9, isLocal: false, isDefinition: true)
!52 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!53 = !{i32 7, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{i32 7, !"PIC Level", i32 2}
!57 = !{!"clang version 10.0.0 "}
!58 = distinct !DISubprogram(name: "seconds_to_ticks", scope: !8, file: !8, line: 177, type: !59, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !9}
!61 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!62 = !DILocalVariable(name: "seconds", arg: 1, scope: !58, file: !8, line: 177, type: !9)
!63 = !DILocation(line: 177, column: 36, scope: !58)
!64 = !DILocation(line: 181, column: 10, scope: !58)
!65 = !DILocation(line: 181, column: 18, scope: !58)
!66 = !DILocation(line: 181, column: 24, scope: !58)
!67 = !DILocation(line: 181, column: 9, scope: !58)
!68 = !DILocation(line: 181, column: 2, scope: !58)
!69 = distinct !DISubprogram(name: "tco_timer_set_heartbeat", scope: !8, file: !8, line: 265, type: !70, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!9, !9}
!72 = !DILocalVariable(name: "t", arg: 1, scope: !69, file: !8, line: 265, type: !9)
!73 = !DILocation(line: 265, column: 34, scope: !69)
!74 = !DILocalVariable(name: "val", scope: !69, file: !8, line: 267, type: !61)
!75 = !DILocation(line: 267, column: 16, scope: !69)
!76 = !DILocalVariable(name: "tmrval", scope: !69, file: !8, line: 268, type: !61)
!77 = !DILocation(line: 268, column: 16, scope: !69)
!78 = !DILocation(line: 270, column: 28, scope: !69)
!79 = !DILocation(line: 270, column: 11, scope: !69)
!80 = !DILocation(line: 270, column: 9, scope: !69)
!81 = !DILocation(line: 273, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !69, file: !8, line: 273, column: 6)
!83 = !DILocation(line: 273, column: 13, scope: !82)
!84 = !DILocation(line: 273, column: 20, scope: !82)
!85 = !DILocation(line: 273, column: 23, scope: !82)
!86 = !DILocation(line: 273, column: 30, scope: !82)
!87 = !DILocation(line: 273, column: 6, scope: !69)
!88 = !DILocation(line: 274, column: 3, scope: !82)
!89 = !DILocation(line: 277, column: 2, scope: !69)
!90 = !DILocation(line: 277, column: 2, scope: !91)
!91 = distinct !DILexicalBlock(scope: !69, file: !8, line: 277, column: 2)
!92 = distinct !{!92, !90, !90}
!93 = !DILocation(line: 278, column: 6, scope: !69)
!94 = !DILocation(line: 279, column: 6, scope: !69)
!95 = !DILocation(line: 280, column: 9, scope: !69)
!96 = !DILocation(line: 280, column: 6, scope: !69)
!97 = !DILocation(line: 283, column: 6, scope: !69)
!98 = !DILocation(line: 284, column: 2, scope: !69)
!99 = !DILocation(line: 284, column: 2, scope: !100)
!100 = distinct !DILexicalBlock(scope: !69, file: !8, line: 284, column: 2)
!101 = !DILocation(line: 286, column: 7, scope: !102)
!102 = distinct !DILexicalBlock(scope: !69, file: !8, line: 286, column: 6)
!103 = !DILocation(line: 286, column: 11, scope: !102)
!104 = !DILocation(line: 286, column: 22, scope: !102)
!105 = !DILocation(line: 286, column: 19, scope: !102)
!106 = !DILocation(line: 286, column: 6, scope: !69)
!107 = !DILocation(line: 287, column: 3, scope: !102)
!108 = !DILocation(line: 289, column: 14, scope: !69)
!109 = !DILocation(line: 289, column: 12, scope: !69)
!110 = !DILocation(line: 290, column: 2, scope: !69)
!111 = !DILocation(line: 291, column: 1, scope: !69)
!112 = distinct !DISubprogram(name: "closer1", scope: !8, file: !8, line: 718, type: !113, scopeLine: 718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DISubroutineType(types: !114)
!114 = !{null}
!115 = !DILocation(line: 725, column: 23, scope: !112)
!116 = !DILocation(line: 726, column: 9, scope: !112)
!117 = !DILocation(line: 726, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !8, line: 726, column: 9)
!119 = distinct !DILexicalBlock(scope: !120, file: !8, line: 726, column: 9)
!120 = distinct !DILexicalBlock(scope: !121, file: !8, line: 726, column: 9)
!121 = distinct !DILexicalBlock(scope: !112, file: !8, line: 726, column: 9)
!122 = !DILocation(line: 726, column: 9, scope: !119)
!123 = !DILocation(line: 726, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !8, line: 726, column: 9)
!125 = !DILocation(line: 726, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !124, file: !8, line: 726, column: 9)
!127 = !DILocation(line: 726, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !126, file: !8, line: 726, column: 9)
!129 = !DILocation(line: 726, column: 9, scope: !121)
!130 = !DILocation(line: 726, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !8, line: 726, column: 9)
!132 = !DILocation(line: 726, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !131, file: !8, line: 726, column: 9)
!134 = !DILocation(line: 727, column: 26, scope: !112)
!135 = !DILocation(line: 729, column: 13, scope: !112)
!136 = !DILocation(line: 732, column: 1, scope: !112)
!137 = distinct !DISubprogram(name: "task_isr_1", scope: !8, file: !8, line: 733, type: !113, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!138 = !DILocation(line: 735, column: 23, scope: !137)
!139 = !DILocation(line: 736, column: 9, scope: !137)
!140 = !DILocation(line: 736, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !8, line: 736, column: 9)
!142 = distinct !DILexicalBlock(scope: !143, file: !8, line: 736, column: 9)
!143 = distinct !DILexicalBlock(scope: !144, file: !8, line: 736, column: 9)
!144 = distinct !DILexicalBlock(scope: !137, file: !8, line: 736, column: 9)
!145 = !DILocation(line: 736, column: 9, scope: !142)
!146 = !DILocation(line: 736, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !8, line: 736, column: 9)
!148 = !DILocation(line: 736, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !147, file: !8, line: 736, column: 9)
!150 = !DILocation(line: 736, column: 9, scope: !151)
!151 = distinct !DILexicalBlock(scope: !149, file: !8, line: 736, column: 9)
!152 = !DILocation(line: 736, column: 9, scope: !144)
!153 = !DILocation(line: 736, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !144, file: !8, line: 736, column: 9)
!155 = !DILocation(line: 736, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !154, file: !8, line: 736, column: 9)
!157 = !DILocation(line: 737, column: 26, scope: !137)
!158 = !DILocation(line: 738, column: 9, scope: !137)
!159 = !DILocation(line: 738, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !161, file: !8, line: 738, column: 9)
!161 = distinct !DILexicalBlock(scope: !137, file: !8, line: 738, column: 9)
!162 = !DILocation(line: 738, column: 9, scope: !161)
!163 = !DILocation(line: 738, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !8, line: 738, column: 9)
!165 = !DILocation(line: 738, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !8, line: 738, column: 9)
!167 = !DILocation(line: 739, column: 13, scope: !137)
!168 = !DILocation(line: 742, column: 1, scope: !137)
!169 = distinct !DISubprogram(name: "task_isr_2", scope: !8, file: !8, line: 744, type: !113, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DILocation(line: 748, column: 9, scope: !169)
!171 = !DILocation(line: 748, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !8, line: 748, column: 9)
!173 = !DILocation(line: 748, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !172, file: !8, line: 748, column: 9)
!175 = !DILocation(line: 748, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !174, file: !8, line: 748, column: 9)
!177 = !DILocation(line: 749, column: 13, scope: !169)
!178 = !DILocation(line: 752, column: 1, scope: !169)
!179 = distinct !DISubprogram(name: "task_isr_3", scope: !8, file: !8, line: 754, type: !113, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!180 = !DILocation(line: 756, column: 9, scope: !179)
!181 = !DILocation(line: 756, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !8, line: 756, column: 9)
!183 = !DILocation(line: 756, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !182, file: !8, line: 756, column: 9)
!185 = !DILocation(line: 756, column: 9, scope: !186)
!186 = distinct !DILexicalBlock(scope: !184, file: !8, line: 756, column: 9)
!187 = !DILocation(line: 757, column: 13, scope: !179)
!188 = !DILocation(line: 760, column: 1, scope: !179)
!189 = distinct !DISubprogram(name: "svp_simple_011_001_main", scope: !8, file: !8, line: 907, type: !190, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!190 = !DISubroutineType(types: !191)
!191 = !{!9, !9, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!194 = !DILocalVariable(name: "argc", arg: 1, scope: !189, file: !8, line: 907, type: !9)
!195 = !DILocation(line: 907, column: 33, scope: !189)
!196 = !DILocalVariable(name: "argv", arg: 2, scope: !189, file: !8, line: 907, type: !192)
!197 = !DILocation(line: 907, column: 45, scope: !189)
!198 = !DILocation(line: 909, column: 20, scope: !189)
!199 = !DILocation(line: 914, column: 5, scope: !189)
!200 = !DILocation(line: 942, column: 1, scope: !189)
