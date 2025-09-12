; ModuleID = './i8xx_tco/i8xx_tco_1.c'
source_filename = "./i8xx_tco/i8xx_tco_1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@heartbeat = global i32 30, align 4, !dbg !0
@nowayout = global i32 0, align 4, !dbg !6
@tco_lock = common global i8 0, align 1, !dbg !13
@tco_write_buf = common global i8 0, align 1, !dbg !22
@tco_expect_close = common global i8 0, align 1, !dbg !19
@tco1_rld = common global i8 0, align 1, !dbg !24
@timer_alive = common global i64 0, align 8, !dbg !16
@cnt1 = common global i32 0, align 4, !dbg !42
@cnt2 = common global i32 0, align 4, !dbg !44
@cnt3 = common global i32 0, align 4, !dbg !46
@ACPIBASE = common global i32 0, align 4, !dbg !10
@tco1_cnt_b0 = common global i8 0, align 1, !dbg !26
@tco1_cnt_b1 = common global i8 0, align 1, !dbg !28
@tco1_cnt_b2 = common global i8 0, align 1, !dbg !30
@tco1_cnt_b3 = common global i8 0, align 1, !dbg !32
@tco1_cnt_b4 = common global i8 0, align 1, !dbg !34
@tco1_cnt_b5 = common global i8 0, align 1, !dbg !36
@tco1_cnt_b6 = common global i8 0, align 1, !dbg !38
@tco1_cnt_b7 = common global i8 0, align 1, !dbg !40

; Function Attrs: noinline nounwind optnone ssp uwtable
define zeroext i8 @seconds_to_ticks(i32 %0) #0 !dbg !54 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !58, metadata !DIExpression()), !dbg !59
  %3 = load i32, i32* %2, align 4, !dbg !60
  %4 = mul nsw i32 %3, 10, !dbg !61
  %5 = sdiv i32 %4, 6, !dbg !62
  %6 = trunc i32 %5 to i8, !dbg !63
  ret i8 %6, !dbg !64
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @tco_timer_set_heartbeat(i32 %0) #0 !dbg !65 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8* %4, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8* %5, metadata !72, metadata !DIExpression()), !dbg !73
  %6 = load i32, i32* %3, align 4, !dbg !74
  %7 = call zeroext i8 @seconds_to_ticks(i32 %6), !dbg !75
  store i8 %7, i8* %5, align 1, !dbg !76
  %8 = load i8, i8* %5, align 1, !dbg !77
  %9 = zext i8 %8 to i32, !dbg !77
  %10 = icmp sgt i32 %9, 63, !dbg !79
  br i1 %10, label %15, label %11, !dbg !80

11:                                               ; preds = %1
  %12 = load i8, i8* %5, align 1, !dbg !81
  %13 = zext i8 %12 to i32, !dbg !81
  %14 = icmp slt i32 %13, 4, !dbg !82
  br i1 %14, label %15, label %16, !dbg !83

15:                                               ; preds = %11, %1
  store i32 -22, i32* %2, align 4, !dbg !84
  br label %45, !dbg !84

16:                                               ; preds = %11
  br label %17, !dbg !85

17:                                               ; preds = %16
  br label %18, !dbg !86

18:                                               ; preds = %21, %17
  %19 = load i8, i8* @tco_lock, align 1, !dbg !86
  %20 = trunc i8 %19 to i1, !dbg !86
  br i1 %20, label %21, label %22, !dbg !86

21:                                               ; preds = %18
  br label %18, !dbg !86, !llvm.loop !88

22:                                               ; preds = %18
  br label %23, !dbg !86

23:                                               ; preds = %22
  store i8 0, i8* %4, align 1, !dbg !89
  %24 = load i8, i8* %4, align 1, !dbg !90
  %25 = zext i8 %24 to i32, !dbg !90
  %26 = and i32 %25, 192, !dbg !90
  %27 = trunc i32 %26 to i8, !dbg !90
  store i8 %27, i8* %4, align 1, !dbg !90
  %28 = load i8, i8* %5, align 1, !dbg !91
  %29 = zext i8 %28 to i32, !dbg !91
  %30 = load i8, i8* %4, align 1, !dbg !92
  %31 = zext i8 %30 to i32, !dbg !92
  %32 = or i32 %31, %29, !dbg !92
  %33 = trunc i32 %32 to i8, !dbg !92
  store i8 %33, i8* %4, align 1, !dbg !92
  store i8 0, i8* %4, align 1, !dbg !93
  br label %34, !dbg !94

34:                                               ; preds = %23
  store i8 0, i8* @tco_lock, align 1, !dbg !95
  br label %35, !dbg !95

35:                                               ; preds = %34
  %36 = load i8, i8* %4, align 1, !dbg !97
  %37 = zext i8 %36 to i32, !dbg !97
  %38 = and i32 %37, 63, !dbg !99
  %39 = load i8, i8* %5, align 1, !dbg !100
  %40 = zext i8 %39 to i32, !dbg !100
  %41 = icmp ne i32 %38, %40, !dbg !101
  br i1 %41, label %42, label %43, !dbg !102

42:                                               ; preds = %35
  store i32 -22, i32* %2, align 4, !dbg !103
  br label %45, !dbg !103

43:                                               ; preds = %35
  %44 = load i32, i32* %3, align 4, !dbg !104
  store i32 %44, i32* @heartbeat, align 4, !dbg !105
  store i32 0, i32* %2, align 4, !dbg !106
  br label %45, !dbg !106

45:                                               ; preds = %43, %42, %15
  %46 = load i32, i32* %2, align 4, !dbg !107
  ret i32 %46, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_3() #0 !dbg !108 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !111
  br label %1, !dbg !112

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !113
  %3 = icmp ne i32 %2, 0, !dbg !113
  br i1 %3, label %10, label %4, !dbg !118

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !119
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !121
  %6 = sext i8 %5 to i32, !dbg !121
  %7 = icmp eq i32 %6, 86, !dbg !121
  br i1 %7, label %8, label %9, !dbg !119

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !123
  br label %9, !dbg !123

9:                                                ; preds = %8, %4
  br label %10, !dbg !119

10:                                               ; preds = %9, %1
  br label %11, !dbg !125

11:                                               ; preds = %10
  br label %12, !dbg !126

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !128
  br label %13, !dbg !128

13:                                               ; preds = %12
  br label %14, !dbg !126

14:                                               ; preds = %13
  br label %15, !dbg !125

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !130
  br label %16, !dbg !131

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !132
  %18 = sext i8 %17 to i32, !dbg !132
  %19 = icmp ne i32 %18, 42, !dbg !132
  br i1 %19, label %20, label %21, !dbg !135

20:                                               ; preds = %16
  br label %22, !dbg !136

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !135

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !138
  br label %24, !dbg !138

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !135
  br label %25, !dbg !135

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt1, align 4, !dbg !140
  %27 = add nsw i32 %26, 1, !dbg !140
  store i32 %27, i32* @cnt1, align 4, !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_2() #0 !dbg !142 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !143
  br label %1, !dbg !144

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !145
  %3 = icmp ne i32 %2, 0, !dbg !145
  br i1 %3, label %10, label %4, !dbg !150

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !151
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !153
  %6 = sext i8 %5 to i32, !dbg !153
  %7 = icmp eq i32 %6, 86, !dbg !153
  br i1 %7, label %8, label %9, !dbg !151

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !155
  br label %9, !dbg !155

9:                                                ; preds = %8, %4
  br label %10, !dbg !151

10:                                               ; preds = %9, %1
  br label %11, !dbg !157

11:                                               ; preds = %10
  br label %12, !dbg !158

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !160
  br label %13, !dbg !160

13:                                               ; preds = %12
  br label %14, !dbg !158

14:                                               ; preds = %13
  br label %15, !dbg !157

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !162
  br label %16, !dbg !163

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !164
  %18 = sext i8 %17 to i32, !dbg !164
  %19 = icmp ne i32 %18, 42, !dbg !164
  br i1 %19, label %20, label %21, !dbg !167

20:                                               ; preds = %16
  br label %22, !dbg !168

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !167

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !170
  br label %24, !dbg !170

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !167
  br label %25, !dbg !167

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt2, align 4, !dbg !172
  %27 = add nsw i32 %26, 1, !dbg !172
  store i32 %27, i32* @cnt2, align 4, !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_1() #0 !dbg !174 {
  br label %1, !dbg !175

1:                                                ; preds = %0
  br label %2, !dbg !176

2:                                                ; preds = %1
  br label %3, !dbg !178

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !180
  br label %4, !dbg !180

4:                                                ; preds = %3
  br label %5, !dbg !178

5:                                                ; preds = %4
  br label %6, !dbg !176

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt3, align 4, !dbg !182
  %8 = add nsw i32 %7, 1, !dbg !182
  store i32 %8, i32* @cnt3, align 4, !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_010_001_main(i32 %0, i8** %1) #0 !dbg !184 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !189, metadata !DIExpression()), !dbg !190
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !191, metadata !DIExpression()), !dbg !192
  store i8 0, i8* @tco_expect_close, align 1, !dbg !193
  %6 = load i32, i32* %3, align 4, !dbg !194
  ret i32 %6, !dbg !194
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!48, !49, !50, !51, !52}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!53}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heartbeat", scope: !2, file: !8, line: 162, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "i8xx_tco/i8xx_tco_1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !13, !16, !19, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "nowayout", scope: !2, file: !8, line: 170, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./i8xx_tco/i8xx_tco_1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
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
!43 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!48 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!49 = !{i32 7, !"Dwarf Version", i32 4}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{i32 1, !"wchar_size", i32 4}
!52 = !{i32 7, !"PIC Level", i32 2}
!53 = !{!"clang version 10.0.0 "}
!54 = distinct !DISubprogram(name: "seconds_to_ticks", scope: !8, file: !8, line: 177, type: !55, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !9}
!57 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!58 = !DILocalVariable(name: "seconds", arg: 1, scope: !54, file: !8, line: 177, type: !9)
!59 = !DILocation(line: 177, column: 36, scope: !54)
!60 = !DILocation(line: 181, column: 10, scope: !54)
!61 = !DILocation(line: 181, column: 18, scope: !54)
!62 = !DILocation(line: 181, column: 24, scope: !54)
!63 = !DILocation(line: 181, column: 9, scope: !54)
!64 = !DILocation(line: 181, column: 2, scope: !54)
!65 = distinct !DISubprogram(name: "tco_timer_set_heartbeat", scope: !8, file: !8, line: 265, type: !66, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9}
!68 = !DILocalVariable(name: "t", arg: 1, scope: !65, file: !8, line: 265, type: !9)
!69 = !DILocation(line: 265, column: 34, scope: !65)
!70 = !DILocalVariable(name: "val", scope: !65, file: !8, line: 267, type: !57)
!71 = !DILocation(line: 267, column: 16, scope: !65)
!72 = !DILocalVariable(name: "tmrval", scope: !65, file: !8, line: 268, type: !57)
!73 = !DILocation(line: 268, column: 16, scope: !65)
!74 = !DILocation(line: 270, column: 28, scope: !65)
!75 = !DILocation(line: 270, column: 11, scope: !65)
!76 = !DILocation(line: 270, column: 9, scope: !65)
!77 = !DILocation(line: 273, column: 6, scope: !78)
!78 = distinct !DILexicalBlock(scope: !65, file: !8, line: 273, column: 6)
!79 = !DILocation(line: 273, column: 13, scope: !78)
!80 = !DILocation(line: 273, column: 20, scope: !78)
!81 = !DILocation(line: 273, column: 23, scope: !78)
!82 = !DILocation(line: 273, column: 30, scope: !78)
!83 = !DILocation(line: 273, column: 6, scope: !65)
!84 = !DILocation(line: 274, column: 3, scope: !78)
!85 = !DILocation(line: 277, column: 2, scope: !65)
!86 = !DILocation(line: 277, column: 2, scope: !87)
!87 = distinct !DILexicalBlock(scope: !65, file: !8, line: 277, column: 2)
!88 = distinct !{!88, !86, !86}
!89 = !DILocation(line: 278, column: 6, scope: !65)
!90 = !DILocation(line: 279, column: 6, scope: !65)
!91 = !DILocation(line: 280, column: 9, scope: !65)
!92 = !DILocation(line: 280, column: 6, scope: !65)
!93 = !DILocation(line: 283, column: 6, scope: !65)
!94 = !DILocation(line: 284, column: 2, scope: !65)
!95 = !DILocation(line: 284, column: 2, scope: !96)
!96 = distinct !DILexicalBlock(scope: !65, file: !8, line: 284, column: 2)
!97 = !DILocation(line: 286, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !65, file: !8, line: 286, column: 6)
!99 = !DILocation(line: 286, column: 11, scope: !98)
!100 = !DILocation(line: 286, column: 22, scope: !98)
!101 = !DILocation(line: 286, column: 19, scope: !98)
!102 = !DILocation(line: 286, column: 6, scope: !65)
!103 = !DILocation(line: 287, column: 3, scope: !98)
!104 = !DILocation(line: 289, column: 14, scope: !65)
!105 = !DILocation(line: 289, column: 12, scope: !65)
!106 = !DILocation(line: 290, column: 2, scope: !65)
!107 = !DILocation(line: 291, column: 1, scope: !65)
!108 = distinct !DISubprogram(name: "task_isr_3", scope: !8, file: !8, line: 716, type: !109, scopeLine: 716, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DISubroutineType(types: !110)
!110 = !{null}
!111 = !DILocation(line: 718, column: 23, scope: !108)
!112 = !DILocation(line: 719, column: 9, scope: !108)
!113 = !DILocation(line: 719, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !8, line: 719, column: 9)
!115 = distinct !DILexicalBlock(scope: !116, file: !8, line: 719, column: 9)
!116 = distinct !DILexicalBlock(scope: !117, file: !8, line: 719, column: 9)
!117 = distinct !DILexicalBlock(scope: !108, file: !8, line: 719, column: 9)
!118 = !DILocation(line: 719, column: 9, scope: !115)
!119 = !DILocation(line: 719, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !8, line: 719, column: 9)
!121 = !DILocation(line: 719, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !120, file: !8, line: 719, column: 9)
!123 = !DILocation(line: 719, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !122, file: !8, line: 719, column: 9)
!125 = !DILocation(line: 719, column: 9, scope: !117)
!126 = !DILocation(line: 719, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !8, line: 719, column: 9)
!128 = !DILocation(line: 719, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !127, file: !8, line: 719, column: 9)
!130 = !DILocation(line: 720, column: 26, scope: !108)
!131 = !DILocation(line: 721, column: 9, scope: !108)
!132 = !DILocation(line: 721, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !134, file: !8, line: 721, column: 9)
!134 = distinct !DILexicalBlock(scope: !108, file: !8, line: 721, column: 9)
!135 = !DILocation(line: 721, column: 9, scope: !134)
!136 = !DILocation(line: 721, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !8, line: 721, column: 9)
!138 = !DILocation(line: 721, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !8, line: 721, column: 9)
!140 = !DILocation(line: 722, column: 13, scope: !108)
!141 = !DILocation(line: 725, column: 1, scope: !108)
!142 = distinct !DISubprogram(name: "task_isr_2", scope: !8, file: !8, line: 727, type: !109, scopeLine: 727, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!143 = !DILocation(line: 729, column: 23, scope: !142)
!144 = !DILocation(line: 730, column: 9, scope: !142)
!145 = !DILocation(line: 730, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !8, line: 730, column: 9)
!147 = distinct !DILexicalBlock(scope: !148, file: !8, line: 730, column: 9)
!148 = distinct !DILexicalBlock(scope: !149, file: !8, line: 730, column: 9)
!149 = distinct !DILexicalBlock(scope: !142, file: !8, line: 730, column: 9)
!150 = !DILocation(line: 730, column: 9, scope: !147)
!151 = !DILocation(line: 730, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !8, line: 730, column: 9)
!153 = !DILocation(line: 730, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !152, file: !8, line: 730, column: 9)
!155 = !DILocation(line: 730, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !154, file: !8, line: 730, column: 9)
!157 = !DILocation(line: 730, column: 9, scope: !149)
!158 = !DILocation(line: 730, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !149, file: !8, line: 730, column: 9)
!160 = !DILocation(line: 730, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !159, file: !8, line: 730, column: 9)
!162 = !DILocation(line: 731, column: 26, scope: !142)
!163 = !DILocation(line: 732, column: 9, scope: !142)
!164 = !DILocation(line: 732, column: 9, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !8, line: 732, column: 9)
!166 = distinct !DILexicalBlock(scope: !142, file: !8, line: 732, column: 9)
!167 = !DILocation(line: 732, column: 9, scope: !166)
!168 = !DILocation(line: 732, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !8, line: 732, column: 9)
!170 = !DILocation(line: 732, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !8, line: 732, column: 9)
!172 = !DILocation(line: 733, column: 13, scope: !142)
!173 = !DILocation(line: 736, column: 1, scope: !142)
!174 = distinct !DISubprogram(name: "task_isr_1", scope: !8, file: !8, line: 738, type: !109, scopeLine: 738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!175 = !DILocation(line: 744, column: 9, scope: !174)
!176 = !DILocation(line: 744, column: 9, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !8, line: 744, column: 9)
!178 = !DILocation(line: 744, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !177, file: !8, line: 744, column: 9)
!180 = !DILocation(line: 744, column: 9, scope: !181)
!181 = distinct !DILexicalBlock(scope: !179, file: !8, line: 744, column: 9)
!182 = !DILocation(line: 745, column: 13, scope: !174)
!183 = !DILocation(line: 748, column: 1, scope: !174)
!184 = distinct !DISubprogram(name: "svp_simple_010_001_main", scope: !8, file: !8, line: 751, type: !185, scopeLine: 751, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!185 = !DISubroutineType(types: !186)
!186 = !{!9, !9, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!189 = !DILocalVariable(name: "argc", arg: 1, scope: !184, file: !8, line: 751, type: !9)
!190 = !DILocation(line: 751, column: 33, scope: !184)
!191 = !DILocalVariable(name: "argv", arg: 2, scope: !184, file: !8, line: 751, type: !187)
!192 = !DILocation(line: 751, column: 45, scope: !184)
!193 = !DILocation(line: 753, column: 20, scope: !184)
!194 = !DILocation(line: 767, column: 1, scope: !184)
