; ModuleID = './i8xx_tco/i8xx_tco_3.c'
source_filename = "./i8xx_tco/i8xx_tco_3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@heartbeat = global i32 30, align 4, !dbg !0
@nowayout = global i32 0, align 4, !dbg !6
@tco_lock = common global i8 0, align 1, !dbg !13
@tco_write_buf = common global i8 0, align 1, !dbg !22
@tco_expect_close = common global i8 0, align 1, !dbg !19
@tco1_rld = common global i8 0, align 1, !dbg !24
@cnt1 = common global i32 0, align 4, !dbg !42
@cnt2 = common global i32 0, align 4, !dbg !44
@timer_alive = common global i64 0, align 8, !dbg !16
@cnt3 = common global i32 0, align 4, !dbg !46
@cnt4 = common global i32 0, align 4, !dbg !48
@cnt5 = common global i32 0, align 4, !dbg !50
@cnt6 = common global i32 0, align 4, !dbg !52
@ACPIBASE = common global i32 0, align 4, !dbg !10
@tco1_cnt_b0 = common global i8 0, align 1, !dbg !26
@tco1_cnt_b1 = common global i8 0, align 1, !dbg !28
@tco1_cnt_b2 = common global i8 0, align 1, !dbg !30
@tco1_cnt_b3 = common global i8 0, align 1, !dbg !32
@tco1_cnt_b4 = common global i8 0, align 1, !dbg !34
@tco1_cnt_b5 = common global i8 0, align 1, !dbg !36
@tco1_cnt_b6 = common global i8 0, align 1, !dbg !38
@tco1_cnt_b7 = common global i8 0, align 1, !dbg !40
@cnt7 = common global i32 0, align 4, !dbg !54
@cnt8 = common global i32 0, align 4, !dbg !56

; Function Attrs: noinline nounwind optnone ssp uwtable
define zeroext i8 @seconds_to_ticks(i32 %0) #0 !dbg !64 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !68, metadata !DIExpression()), !dbg !69
  %3 = load i32, i32* %2, align 4, !dbg !70
  %4 = mul nsw i32 %3, 10, !dbg !71
  %5 = sdiv i32 %4, 6, !dbg !72
  %6 = trunc i32 %5 to i8, !dbg !73
  ret i8 %6, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @tco_timer_set_heartbeat(i32 %0) #0 !dbg !75 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8* %4, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8* %5, metadata !82, metadata !DIExpression()), !dbg !83
  %6 = load i32, i32* %3, align 4, !dbg !84
  %7 = call zeroext i8 @seconds_to_ticks(i32 %6), !dbg !85
  store i8 %7, i8* %5, align 1, !dbg !86
  %8 = load i8, i8* %5, align 1, !dbg !87
  %9 = zext i8 %8 to i32, !dbg !87
  %10 = icmp sgt i32 %9, 63, !dbg !89
  br i1 %10, label %15, label %11, !dbg !90

11:                                               ; preds = %1
  %12 = load i8, i8* %5, align 1, !dbg !91
  %13 = zext i8 %12 to i32, !dbg !91
  %14 = icmp slt i32 %13, 4, !dbg !92
  br i1 %14, label %15, label %16, !dbg !93

15:                                               ; preds = %11, %1
  store i32 -22, i32* %2, align 4, !dbg !94
  br label %45, !dbg !94

16:                                               ; preds = %11
  br label %17, !dbg !95

17:                                               ; preds = %16
  br label %18, !dbg !96

18:                                               ; preds = %21, %17
  %19 = load i8, i8* @tco_lock, align 1, !dbg !96
  %20 = trunc i8 %19 to i1, !dbg !96
  br i1 %20, label %21, label %22, !dbg !96

21:                                               ; preds = %18
  br label %18, !dbg !96, !llvm.loop !98

22:                                               ; preds = %18
  br label %23, !dbg !96

23:                                               ; preds = %22
  store i8 0, i8* %4, align 1, !dbg !99
  %24 = load i8, i8* %4, align 1, !dbg !100
  %25 = zext i8 %24 to i32, !dbg !100
  %26 = and i32 %25, 192, !dbg !100
  %27 = trunc i32 %26 to i8, !dbg !100
  store i8 %27, i8* %4, align 1, !dbg !100
  %28 = load i8, i8* %5, align 1, !dbg !101
  %29 = zext i8 %28 to i32, !dbg !101
  %30 = load i8, i8* %4, align 1, !dbg !102
  %31 = zext i8 %30 to i32, !dbg !102
  %32 = or i32 %31, %29, !dbg !102
  %33 = trunc i32 %32 to i8, !dbg !102
  store i8 %33, i8* %4, align 1, !dbg !102
  store i8 0, i8* %4, align 1, !dbg !103
  br label %34, !dbg !104

34:                                               ; preds = %23
  store i8 0, i8* @tco_lock, align 1, !dbg !105
  br label %35, !dbg !105

35:                                               ; preds = %34
  %36 = load i8, i8* %4, align 1, !dbg !107
  %37 = zext i8 %36 to i32, !dbg !107
  %38 = and i32 %37, 63, !dbg !109
  %39 = load i8, i8* %5, align 1, !dbg !110
  %40 = zext i8 %39 to i32, !dbg !110
  %41 = icmp ne i32 %38, %40, !dbg !111
  br i1 %41, label %42, label %43, !dbg !112

42:                                               ; preds = %35
  store i32 -22, i32* %2, align 4, !dbg !113
  br label %45, !dbg !113

43:                                               ; preds = %35
  %44 = load i32, i32* %3, align 4, !dbg !114
  store i32 %44, i32* @heartbeat, align 4, !dbg !115
  store i32 0, i32* %2, align 4, !dbg !116
  br label %45, !dbg !116

45:                                               ; preds = %43, %42, %15
  %46 = load i32, i32* %2, align 4, !dbg !117
  ret i32 %46, !dbg !117
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer1() #0 !dbg !118 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !121
  br label %1, !dbg !122

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !123
  %3 = icmp ne i32 %2, 0, !dbg !123
  br i1 %3, label %10, label %4, !dbg !128

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !129
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !131
  %6 = sext i8 %5 to i32, !dbg !131
  %7 = icmp eq i32 %6, 86, !dbg !131
  br i1 %7, label %8, label %9, !dbg !129

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !133
  br label %9, !dbg !133

9:                                                ; preds = %8, %4
  br label %10, !dbg !129

10:                                               ; preds = %9, %1
  br label %11, !dbg !135

11:                                               ; preds = %10
  br label %12, !dbg !136

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !138
  br label %13, !dbg !138

13:                                               ; preds = %12
  br label %14, !dbg !136

14:                                               ; preds = %13
  br label %15, !dbg !135

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !140
  %16 = load i32, i32* @cnt1, align 4, !dbg !141
  %17 = add nsw i32 %16, 1, !dbg !141
  store i32 %17, i32* @cnt1, align 4, !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer2() #0 !dbg !143 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !144
  br label %1, !dbg !145

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !146
  %3 = icmp ne i32 %2, 0, !dbg !146
  br i1 %3, label %10, label %4, !dbg !151

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !152
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !154
  %6 = sext i8 %5 to i32, !dbg !154
  %7 = icmp eq i32 %6, 86, !dbg !154
  br i1 %7, label %8, label %9, !dbg !152

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !156
  br label %9, !dbg !156

9:                                                ; preds = %8, %4
  br label %10, !dbg !152

10:                                               ; preds = %9, %1
  br label %11, !dbg !158

11:                                               ; preds = %10
  br label %12, !dbg !159

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !161
  br label %13, !dbg !161

13:                                               ; preds = %12
  br label %14, !dbg !159

14:                                               ; preds = %13
  br label %15, !dbg !158

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !163
  %16 = load i32, i32* @cnt2, align 4, !dbg !164
  %17 = add nsw i32 %16, 1, !dbg !164
  store i32 %17, i32* @cnt2, align 4, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer3() #0 !dbg !166 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !167
  br label %1, !dbg !168

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !169
  %3 = icmp ne i32 %2, 0, !dbg !169
  br i1 %3, label %10, label %4, !dbg !174

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !175
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !177
  %6 = sext i8 %5 to i32, !dbg !177
  %7 = icmp eq i32 %6, 86, !dbg !177
  br i1 %7, label %8, label %9, !dbg !175

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !179
  br label %9, !dbg !179

9:                                                ; preds = %8, %4
  br label %10, !dbg !175

10:                                               ; preds = %9, %1
  br label %11, !dbg !181

11:                                               ; preds = %10
  br label %12, !dbg !182

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !184
  br label %13, !dbg !184

13:                                               ; preds = %12
  br label %14, !dbg !182

14:                                               ; preds = %13
  br label %15, !dbg !181

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !186
  br label %16, !dbg !187

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !188
  %18 = sext i8 %17 to i32, !dbg !188
  %19 = icmp ne i32 %18, 42, !dbg !188
  br i1 %19, label %20, label %21, !dbg !191

20:                                               ; preds = %16
  br label %22, !dbg !192

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !191

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !194
  br label %24, !dbg !194

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !191
  br label %25, !dbg !191

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt3, align 4, !dbg !196
  %27 = add nsw i32 %26, 1, !dbg !196
  store i32 %27, i32* @cnt3, align 4, !dbg !196
  ret void, !dbg !197
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_1() #0 !dbg !198 {
  br label %1, !dbg !199

1:                                                ; preds = %0
  br label %2, !dbg !200

2:                                                ; preds = %1
  br label %3, !dbg !202

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !204
  br label %4, !dbg !204

4:                                                ; preds = %3
  br label %5, !dbg !202

5:                                                ; preds = %4
  br label %6, !dbg !200

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt4, align 4, !dbg !206
  %8 = add nsw i32 %7, 1, !dbg !206
  store i32 %8, i32* @cnt4, align 4, !dbg !206
  ret void, !dbg !207
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_2() #0 !dbg !208 {
  br label %1, !dbg !209

1:                                                ; preds = %0
  br label %2, !dbg !210

2:                                                ; preds = %1
  br label %3, !dbg !212

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !214
  br label %4, !dbg !214

4:                                                ; preds = %3
  br label %5, !dbg !212

5:                                                ; preds = %4
  br label %6, !dbg !210

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt5, align 4, !dbg !216
  %8 = add nsw i32 %7, 1, !dbg !216
  store i32 %8, i32* @cnt5, align 4, !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_3() #0 !dbg !218 {
  br label %1, !dbg !219

1:                                                ; preds = %0
  br label %2, !dbg !220

2:                                                ; preds = %1
  br label %3, !dbg !222

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !224
  br label %4, !dbg !224

4:                                                ; preds = %3
  br label %5, !dbg !222

5:                                                ; preds = %4
  br label %6, !dbg !220

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt6, align 4, !dbg !226
  %8 = add nsw i32 %7, 1, !dbg !226
  store i32 %8, i32* @cnt6, align 4, !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_012_001_main(i32 %0, i8** %1) #0 !dbg !228 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !233, metadata !DIExpression()), !dbg !234
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !235, metadata !DIExpression()), !dbg !236
  store i8 0, i8* @tco_expect_close, align 1, !dbg !237
  call void @closer1(), !dbg !238
  call void @closer2(), !dbg !239
  call void @closer3(), !dbg !240
  %6 = load i32, i32* %3, align 4, !dbg !241
  ret i32 %6, !dbg !241
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!58, !59, !60, !61, !62}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!63}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heartbeat", scope: !2, file: !8, line: 162, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "i8xx_tco/i8xx_tco_3.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !13, !16, !19, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "nowayout", scope: !2, file: !8, line: 170, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./i8xx_tco/i8xx_tco_3.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
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
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "cnt7", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "cnt8", scope: !2, file: !8, line: 711, type: !9, isLocal: false, isDefinition: true)
!58 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"PIC Level", i32 2}
!63 = !{!"clang version 10.0.0 "}
!64 = distinct !DISubprogram(name: "seconds_to_ticks", scope: !8, file: !8, line: 177, type: !65, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !9}
!67 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!68 = !DILocalVariable(name: "seconds", arg: 1, scope: !64, file: !8, line: 177, type: !9)
!69 = !DILocation(line: 177, column: 36, scope: !64)
!70 = !DILocation(line: 181, column: 10, scope: !64)
!71 = !DILocation(line: 181, column: 18, scope: !64)
!72 = !DILocation(line: 181, column: 24, scope: !64)
!73 = !DILocation(line: 181, column: 9, scope: !64)
!74 = !DILocation(line: 181, column: 2, scope: !64)
!75 = distinct !DISubprogram(name: "tco_timer_set_heartbeat", scope: !8, file: !8, line: 265, type: !76, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!9, !9}
!78 = !DILocalVariable(name: "t", arg: 1, scope: !75, file: !8, line: 265, type: !9)
!79 = !DILocation(line: 265, column: 34, scope: !75)
!80 = !DILocalVariable(name: "val", scope: !75, file: !8, line: 267, type: !67)
!81 = !DILocation(line: 267, column: 16, scope: !75)
!82 = !DILocalVariable(name: "tmrval", scope: !75, file: !8, line: 268, type: !67)
!83 = !DILocation(line: 268, column: 16, scope: !75)
!84 = !DILocation(line: 270, column: 28, scope: !75)
!85 = !DILocation(line: 270, column: 11, scope: !75)
!86 = !DILocation(line: 270, column: 9, scope: !75)
!87 = !DILocation(line: 273, column: 6, scope: !88)
!88 = distinct !DILexicalBlock(scope: !75, file: !8, line: 273, column: 6)
!89 = !DILocation(line: 273, column: 13, scope: !88)
!90 = !DILocation(line: 273, column: 20, scope: !88)
!91 = !DILocation(line: 273, column: 23, scope: !88)
!92 = !DILocation(line: 273, column: 30, scope: !88)
!93 = !DILocation(line: 273, column: 6, scope: !75)
!94 = !DILocation(line: 274, column: 3, scope: !88)
!95 = !DILocation(line: 277, column: 2, scope: !75)
!96 = !DILocation(line: 277, column: 2, scope: !97)
!97 = distinct !DILexicalBlock(scope: !75, file: !8, line: 277, column: 2)
!98 = distinct !{!98, !96, !96}
!99 = !DILocation(line: 278, column: 6, scope: !75)
!100 = !DILocation(line: 279, column: 6, scope: !75)
!101 = !DILocation(line: 280, column: 9, scope: !75)
!102 = !DILocation(line: 280, column: 6, scope: !75)
!103 = !DILocation(line: 283, column: 6, scope: !75)
!104 = !DILocation(line: 284, column: 2, scope: !75)
!105 = !DILocation(line: 284, column: 2, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !8, line: 284, column: 2)
!107 = !DILocation(line: 286, column: 7, scope: !108)
!108 = distinct !DILexicalBlock(scope: !75, file: !8, line: 286, column: 6)
!109 = !DILocation(line: 286, column: 11, scope: !108)
!110 = !DILocation(line: 286, column: 22, scope: !108)
!111 = !DILocation(line: 286, column: 19, scope: !108)
!112 = !DILocation(line: 286, column: 6, scope: !75)
!113 = !DILocation(line: 287, column: 3, scope: !108)
!114 = !DILocation(line: 289, column: 14, scope: !75)
!115 = !DILocation(line: 289, column: 12, scope: !75)
!116 = !DILocation(line: 290, column: 2, scope: !75)
!117 = !DILocation(line: 291, column: 1, scope: !75)
!118 = distinct !DISubprogram(name: "closer1", scope: !8, file: !8, line: 719, type: !119, scopeLine: 719, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DISubroutineType(types: !120)
!120 = !{null}
!121 = !DILocation(line: 723, column: 23, scope: !118)
!122 = !DILocation(line: 724, column: 9, scope: !118)
!123 = !DILocation(line: 724, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !8, line: 724, column: 9)
!125 = distinct !DILexicalBlock(scope: !126, file: !8, line: 724, column: 9)
!126 = distinct !DILexicalBlock(scope: !127, file: !8, line: 724, column: 9)
!127 = distinct !DILexicalBlock(scope: !118, file: !8, line: 724, column: 9)
!128 = !DILocation(line: 724, column: 9, scope: !125)
!129 = !DILocation(line: 724, column: 9, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !8, line: 724, column: 9)
!131 = !DILocation(line: 724, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !130, file: !8, line: 724, column: 9)
!133 = !DILocation(line: 724, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !132, file: !8, line: 724, column: 9)
!135 = !DILocation(line: 724, column: 9, scope: !127)
!136 = !DILocation(line: 724, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !8, line: 724, column: 9)
!138 = !DILocation(line: 724, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !137, file: !8, line: 724, column: 9)
!140 = !DILocation(line: 725, column: 26, scope: !118)
!141 = !DILocation(line: 727, column: 13, scope: !118)
!142 = !DILocation(line: 730, column: 1, scope: !118)
!143 = distinct !DISubprogram(name: "closer2", scope: !8, file: !8, line: 732, type: !119, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!144 = !DILocation(line: 734, column: 23, scope: !143)
!145 = !DILocation(line: 735, column: 9, scope: !143)
!146 = !DILocation(line: 735, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !148, file: !8, line: 735, column: 9)
!148 = distinct !DILexicalBlock(scope: !149, file: !8, line: 735, column: 9)
!149 = distinct !DILexicalBlock(scope: !150, file: !8, line: 735, column: 9)
!150 = distinct !DILexicalBlock(scope: !143, file: !8, line: 735, column: 9)
!151 = !DILocation(line: 735, column: 9, scope: !148)
!152 = !DILocation(line: 735, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !8, line: 735, column: 9)
!154 = !DILocation(line: 735, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !153, file: !8, line: 735, column: 9)
!156 = !DILocation(line: 735, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !155, file: !8, line: 735, column: 9)
!158 = !DILocation(line: 735, column: 9, scope: !150)
!159 = !DILocation(line: 735, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !150, file: !8, line: 735, column: 9)
!161 = !DILocation(line: 735, column: 9, scope: !162)
!162 = distinct !DILexicalBlock(scope: !160, file: !8, line: 735, column: 9)
!163 = !DILocation(line: 736, column: 26, scope: !143)
!164 = !DILocation(line: 738, column: 13, scope: !143)
!165 = !DILocation(line: 741, column: 1, scope: !143)
!166 = distinct !DISubprogram(name: "closer3", scope: !8, file: !8, line: 743, type: !119, scopeLine: 743, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocation(line: 745, column: 23, scope: !166)
!168 = !DILocation(line: 746, column: 9, scope: !166)
!169 = !DILocation(line: 746, column: 9, scope: !170)
!170 = distinct !DILexicalBlock(scope: !171, file: !8, line: 746, column: 9)
!171 = distinct !DILexicalBlock(scope: !172, file: !8, line: 746, column: 9)
!172 = distinct !DILexicalBlock(scope: !173, file: !8, line: 746, column: 9)
!173 = distinct !DILexicalBlock(scope: !166, file: !8, line: 746, column: 9)
!174 = !DILocation(line: 746, column: 9, scope: !171)
!175 = !DILocation(line: 746, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !8, line: 746, column: 9)
!177 = !DILocation(line: 746, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !176, file: !8, line: 746, column: 9)
!179 = !DILocation(line: 746, column: 9, scope: !180)
!180 = distinct !DILexicalBlock(scope: !178, file: !8, line: 746, column: 9)
!181 = !DILocation(line: 746, column: 9, scope: !173)
!182 = !DILocation(line: 746, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !8, line: 746, column: 9)
!184 = !DILocation(line: 746, column: 9, scope: !185)
!185 = distinct !DILexicalBlock(scope: !183, file: !8, line: 746, column: 9)
!186 = !DILocation(line: 747, column: 26, scope: !166)
!187 = !DILocation(line: 748, column: 9, scope: !166)
!188 = !DILocation(line: 748, column: 9, scope: !189)
!189 = distinct !DILexicalBlock(scope: !190, file: !8, line: 748, column: 9)
!190 = distinct !DILexicalBlock(scope: !166, file: !8, line: 748, column: 9)
!191 = !DILocation(line: 748, column: 9, scope: !190)
!192 = !DILocation(line: 748, column: 9, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !8, line: 748, column: 9)
!194 = !DILocation(line: 748, column: 9, scope: !195)
!195 = distinct !DILexicalBlock(scope: !190, file: !8, line: 748, column: 9)
!196 = !DILocation(line: 749, column: 13, scope: !166)
!197 = !DILocation(line: 752, column: 1, scope: !166)
!198 = distinct !DISubprogram(name: "writer_isr_1", scope: !8, file: !8, line: 754, type: !119, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!199 = !DILocation(line: 758, column: 9, scope: !198)
!200 = !DILocation(line: 758, column: 9, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !8, line: 758, column: 9)
!202 = !DILocation(line: 758, column: 9, scope: !203)
!203 = distinct !DILexicalBlock(scope: !201, file: !8, line: 758, column: 9)
!204 = !DILocation(line: 758, column: 9, scope: !205)
!205 = distinct !DILexicalBlock(scope: !203, file: !8, line: 758, column: 9)
!206 = !DILocation(line: 759, column: 13, scope: !198)
!207 = !DILocation(line: 762, column: 1, scope: !198)
!208 = distinct !DISubprogram(name: "writer_isr_2", scope: !8, file: !8, line: 764, type: !119, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!209 = !DILocation(line: 768, column: 9, scope: !208)
!210 = !DILocation(line: 768, column: 9, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !8, line: 768, column: 9)
!212 = !DILocation(line: 768, column: 9, scope: !213)
!213 = distinct !DILexicalBlock(scope: !211, file: !8, line: 768, column: 9)
!214 = !DILocation(line: 768, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !213, file: !8, line: 768, column: 9)
!216 = !DILocation(line: 769, column: 13, scope: !208)
!217 = !DILocation(line: 772, column: 1, scope: !208)
!218 = distinct !DISubprogram(name: "writer_isr_3", scope: !8, file: !8, line: 774, type: !119, scopeLine: 774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!219 = !DILocation(line: 776, column: 9, scope: !218)
!220 = !DILocation(line: 776, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !8, line: 776, column: 9)
!222 = !DILocation(line: 776, column: 9, scope: !223)
!223 = distinct !DILexicalBlock(scope: !221, file: !8, line: 776, column: 9)
!224 = !DILocation(line: 776, column: 9, scope: !225)
!225 = distinct !DILexicalBlock(scope: !223, file: !8, line: 776, column: 9)
!226 = !DILocation(line: 777, column: 13, scope: !218)
!227 = !DILocation(line: 780, column: 1, scope: !218)
!228 = distinct !DISubprogram(name: "svp_simple_012_001_main", scope: !8, file: !8, line: 921, type: !229, scopeLine: 921, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!229 = !DISubroutineType(types: !230)
!230 = !{!9, !9, !231}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!233 = !DILocalVariable(name: "argc", arg: 1, scope: !228, file: !8, line: 921, type: !9)
!234 = !DILocation(line: 921, column: 33, scope: !228)
!235 = !DILocalVariable(name: "argv", arg: 2, scope: !228, file: !8, line: 921, type: !231)
!236 = !DILocation(line: 921, column: 45, scope: !228)
!237 = !DILocation(line: 923, column: 20, scope: !228)
!238 = !DILocation(line: 928, column: 5, scope: !228)
!239 = !DILocation(line: 930, column: 5, scope: !228)
!240 = !DILocation(line: 932, column: 5, scope: !228)
!241 = !DILocation(line: 962, column: 1, scope: !228)
