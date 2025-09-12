; ModuleID = 'RWIP/wdt/wdt_pci_3.c'
source_filename = "RWIP/wdt/wdt_pci_3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@heartbeat = global i32 60, align 4, !dbg !0
@nowayout = global i32 0, align 4, !dbg !6
@wdtpci_write_buf = common global i8 0, align 1, !dbg !9
@expect_close = common global i32 0, align 4, !dbg !22
@count = common global i32 0, align 4, !dbg !46
@cnt1 = common global i32 0, align 4, !dbg !30
@cnt2 = common global i32 0, align 4, !dbg !32
@cnt5 = common global i32 0, align 4, !dbg !38
@cnt8 = common global i32 0, align 4, !dbg !44
@cnt3 = common global i32 0, align 4, !dbg !34
@cnt4 = common global i32 0, align 4, !dbg !36
@cnt6 = common global i32 0, align 4, !dbg !40
@cnt7 = common global i32 0, align 4, !dbg !42
@wdt_dc_port = common global i8 0, align 1, !dbg !12
@dev_count = common global i32 0, align 4, !dbg !14
@open_sem = common global i32 0, align 4, !dbg !16
@wdtpci_lock = common global i8 0, align 1, !dbg !19
@io = common global i32 0, align 4, !dbg !24
@irq = common global i32 0, align 4, !dbg !26
@wd_heartbeat = common global i32 0, align 4, !dbg !28
@buf = common global i32 0, align 4, !dbg !48

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer1() #0 !dbg !55 {
  call void @closer2(), !dbg !58
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !59
  store i32 42, i32* @expect_close, align 4, !dbg !60
  store i32 1, i32* @count, align 4, !dbg !61
  %1 = load i32, i32* @count, align 4, !dbg !62
  %2 = icmp ne i32 %1, 0, !dbg !62
  br i1 %2, label %3, label %13, !dbg !64

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !65
  %5 = icmp ne i32 %4, 0, !dbg !65
  br i1 %5, label %12, label %6, !dbg !68

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !69
  %8 = sext i8 %7 to i32, !dbg !69
  %9 = icmp ne i32 %8, 86, !dbg !72
  br i1 %9, label %10, label %11, !dbg !73

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !74
  br label %11, !dbg !76

11:                                               ; preds = %10, %6
  br label %12, !dbg !77

12:                                               ; preds = %11, %3
  br label %13, !dbg !78

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !79
  %15 = icmp ne i32 %14, 42, !dbg !81
  br i1 %15, label %16, label %17, !dbg !82

16:                                               ; preds = %13
  br label %18, !dbg !83

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !85
  %19 = load i32, i32* @cnt1, align 4, !dbg !86
  %20 = add nsw i32 %19, 1, !dbg !86
  store i32 %20, i32* @cnt1, align 4, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer2() #0 !dbg !88 {
  call void @closer3(), !dbg !89
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !90
  store i32 42, i32* @expect_close, align 4, !dbg !91
  store i32 1, i32* @count, align 4, !dbg !92
  %1 = load i32, i32* @count, align 4, !dbg !93
  %2 = icmp ne i32 %1, 0, !dbg !93
  br i1 %2, label %3, label %13, !dbg !95

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !96
  %5 = icmp ne i32 %4, 0, !dbg !96
  br i1 %5, label %12, label %6, !dbg !99

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !100
  %8 = sext i8 %7 to i32, !dbg !100
  %9 = icmp ne i32 %8, 86, !dbg !103
  br i1 %9, label %10, label %11, !dbg !104

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !105
  br label %11, !dbg !107

11:                                               ; preds = %10, %6
  br label %12, !dbg !108

12:                                               ; preds = %11, %3
  br label %13, !dbg !109

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !110
  %15 = icmp ne i32 %14, 42, !dbg !112
  br i1 %15, label %16, label %17, !dbg !113

16:                                               ; preds = %13
  br label %18, !dbg !114

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !116
  %19 = load i32, i32* @cnt2, align 4, !dbg !117
  %20 = add nsw i32 %19, 1, !dbg !117
  store i32 %20, i32* @cnt2, align 4, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer3() #0 !dbg !119 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !120
  store i32 42, i32* @expect_close, align 4, !dbg !121
  store i32 1, i32* @count, align 4, !dbg !122
  %1 = load i32, i32* @count, align 4, !dbg !123
  %2 = icmp ne i32 %1, 0, !dbg !123
  br i1 %2, label %3, label %13, !dbg !125

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !126
  %5 = icmp ne i32 %4, 0, !dbg !126
  br i1 %5, label %12, label %6, !dbg !129

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !130
  %8 = sext i8 %7 to i32, !dbg !130
  %9 = icmp ne i32 %8, 86, !dbg !133
  br i1 %9, label %10, label %11, !dbg !134

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !135
  br label %11, !dbg !137

11:                                               ; preds = %10, %6
  br label %12, !dbg !138

12:                                               ; preds = %11, %3
  br label %13, !dbg !139

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !140
  %15 = icmp ne i32 %14, 42, !dbg !142
  br i1 %15, label %16, label %17, !dbg !143

16:                                               ; preds = %13
  br label %18, !dbg !144

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !146
  %19 = load i32, i32* @cnt5, align 4, !dbg !147
  %20 = add nsw i32 %19, 1, !dbg !147
  store i32 %20, i32* @cnt5, align 4, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer4() #0 !dbg !149 {
  call void @closer1(), !dbg !150
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !151
  store i32 42, i32* @expect_close, align 4, !dbg !152
  store i32 1, i32* @count, align 4, !dbg !153
  %1 = load i32, i32* @count, align 4, !dbg !154
  %2 = icmp ne i32 %1, 0, !dbg !154
  br i1 %2, label %3, label %13, !dbg !156

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !157
  %5 = icmp ne i32 %4, 0, !dbg !157
  br i1 %5, label %12, label %6, !dbg !160

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !161
  %8 = sext i8 %7 to i32, !dbg !161
  %9 = icmp ne i32 %8, 86, !dbg !164
  br i1 %9, label %10, label %11, !dbg !165

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !166
  br label %11, !dbg !168

11:                                               ; preds = %10, %6
  br label %12, !dbg !169

12:                                               ; preds = %11, %3
  br label %13, !dbg !170

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !171
  %15 = icmp ne i32 %14, 42, !dbg !173
  br i1 %15, label %16, label %17, !dbg !174

16:                                               ; preds = %13
  br label %18, !dbg !175

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !177
  %19 = load i32, i32* @cnt8, align 4, !dbg !178
  %20 = add nsw i32 %19, 1, !dbg !178
  store i32 %20, i32* @cnt8, align 4, !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer1() #0 !dbg !180 {
  store i32 0, i32* @count, align 4, !dbg !181
  store i32 0, i32* @expect_close, align 4, !dbg !182
  %1 = load i32, i32* @count, align 4, !dbg !183
  %2 = icmp ne i32 %1, 0, !dbg !183
  br i1 %2, label %3, label %13, !dbg !185

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !186
  %5 = icmp ne i32 %4, 0, !dbg !186
  br i1 %5, label %12, label %6, !dbg !189

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !190
  %8 = sext i8 %7 to i32, !dbg !190
  %9 = icmp ne i32 %8, 86, !dbg !193
  br i1 %9, label %10, label %11, !dbg !194

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !195
  br label %11, !dbg !197

11:                                               ; preds = %10, %6
  br label %12, !dbg !198

12:                                               ; preds = %11, %3
  br label %13, !dbg !199

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt3, align 4, !dbg !200
  %15 = add nsw i32 %14, 1, !dbg !200
  store i32 %15, i32* @cnt3, align 4, !dbg !200
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_1() #0 !dbg !202 {
  store i32 0, i32* @count, align 4, !dbg !203
  store i32 0, i32* @expect_close, align 4, !dbg !204
  %1 = load i32, i32* @count, align 4, !dbg !205
  %2 = icmp ne i32 %1, 0, !dbg !205
  br i1 %2, label %3, label %13, !dbg !207

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !208
  %5 = icmp ne i32 %4, 0, !dbg !208
  br i1 %5, label %12, label %6, !dbg !211

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !212
  %8 = sext i8 %7 to i32, !dbg !212
  %9 = icmp ne i32 %8, 86, !dbg !215
  br i1 %9, label %10, label %11, !dbg !216

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !217
  br label %11, !dbg !219

11:                                               ; preds = %10, %6
  br label %12, !dbg !220

12:                                               ; preds = %11, %3
  br label %13, !dbg !221

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt4, align 4, !dbg !222
  %15 = add nsw i32 %14, 1, !dbg !222
  store i32 %15, i32* @cnt4, align 4, !dbg !222
  ret void, !dbg !223
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_2() #0 !dbg !224 {
  store i32 0, i32* @count, align 4, !dbg !225
  store i32 0, i32* @expect_close, align 4, !dbg !226
  %1 = load i32, i32* @count, align 4, !dbg !227
  %2 = icmp ne i32 %1, 0, !dbg !227
  br i1 %2, label %3, label %13, !dbg !229

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !230
  %5 = icmp ne i32 %4, 0, !dbg !230
  br i1 %5, label %12, label %6, !dbg !233

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !234
  %8 = sext i8 %7 to i32, !dbg !234
  %9 = icmp ne i32 %8, 86, !dbg !237
  br i1 %9, label %10, label %11, !dbg !238

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !239
  br label %11, !dbg !241

11:                                               ; preds = %10, %6
  br label %12, !dbg !242

12:                                               ; preds = %11, %3
  br label %13, !dbg !243

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt6, align 4, !dbg !244
  %15 = add nsw i32 %14, 1, !dbg !244
  store i32 %15, i32* @cnt6, align 4, !dbg !244
  ret void, !dbg !245
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_3() #0 !dbg !246 {
  store i32 0, i32* @count, align 4, !dbg !247
  store i32 0, i32* @expect_close, align 4, !dbg !248
  %1 = load i32, i32* @count, align 4, !dbg !249
  %2 = icmp ne i32 %1, 0, !dbg !249
  br i1 %2, label %3, label %13, !dbg !251

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !252
  %5 = icmp ne i32 %4, 0, !dbg !252
  br i1 %5, label %12, label %6, !dbg !255

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !256
  %8 = sext i8 %7 to i32, !dbg !256
  %9 = icmp ne i32 %8, 86, !dbg !259
  br i1 %9, label %10, label %11, !dbg !260

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !261
  br label %11, !dbg !263

11:                                               ; preds = %10, %6
  br label %12, !dbg !264

12:                                               ; preds = %11, %3
  br label %13, !dbg !265

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt7, align 4, !dbg !266
  %15 = add nsw i32 %14, 1, !dbg !266
  store i32 %15, i32* @cnt7, align 4, !dbg !266
  ret void, !dbg !267
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_023_001_main(i32 %0, i8** %1) #0 !dbg !268 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !273, metadata !DIExpression()), !dbg !274
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !275, metadata !DIExpression()), !dbg !276
  call void @closer4(), !dbg !277
  call void @writer1(), !dbg !278
  %6 = load i32, i32* %3, align 4, !dbg !279
  ret i32 %6, !dbg !279
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!50, !51, !52, !53}
!llvm.ident = !{!54}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heartbeat", scope: !2, file: !3, line: 199, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "RWIP/wdt/wdt_pci_3.c", directory: "/Users/hehang03/code/clover/tool/Highlight")
!4 = !{}
!5 = !{!0, !6, !9, !12, !14, !16, !19, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "nowayout", scope: !2, file: !3, line: 205, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "wdtpci_write_buf", scope: !2, file: !3, line: 117, type: !11, isLocal: false, isDefinition: true)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "wdt_dc_port", scope: !2, file: !3, line: 120, type: !11, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "dev_count", scope: !2, file: !3, line: 185, type: !8, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "open_sem", scope: !2, file: !3, line: 188, type: !18, isLocal: false, isDefinition: true)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "wdtpci_lock", scope: !2, file: !3, line: 190, type: !21, isLocal: false, isDefinition: true)
!21 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "expect_close", scope: !2, file: !3, line: 191, type: !8, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "io", scope: !2, file: !3, line: 193, type: !8, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "irq", scope: !2, file: !3, line: 194, type: !8, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "wd_heartbeat", scope: !2, file: !3, line: 200, type: !8, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "cnt7", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "cnt8", scope: !2, file: !3, line: 943, type: !8, isLocal: false, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !3, line: 944, type: !8, isLocal: false, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 945, type: !8, isLocal: false, isDefinition: true)
!50 = !{i32 7, !"Dwarf Version", i32 4}
!51 = !{i32 2, !"Debug Info Version", i32 3}
!52 = !{i32 1, !"wchar_size", i32 4}
!53 = !{i32 7, !"PIC Level", i32 2}
!54 = !{!"clang version 10.0.0 "}
!55 = distinct !DISubprogram(name: "closer1", scope: !3, file: !3, line: 955, type: !56, scopeLine: 955, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocation(line: 957, column: 5, scope: !55)
!59 = !DILocation(line: 959, column: 26, scope: !55)
!60 = !DILocation(line: 960, column: 22, scope: !55)
!61 = !DILocation(line: 961, column: 15, scope: !55)
!62 = !DILocation(line: 963, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !55, file: !3, line: 963, column: 13)
!64 = !DILocation(line: 963, column: 13, scope: !55)
!65 = !DILocation(line: 964, column: 18, scope: !66)
!66 = distinct !DILexicalBlock(scope: !67, file: !3, line: 964, column: 17)
!67 = distinct !DILexicalBlock(scope: !63, file: !3, line: 963, column: 20)
!68 = !DILocation(line: 964, column: 17, scope: !67)
!69 = !DILocation(line: 969, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !3, line: 969, column: 21)
!71 = distinct !DILexicalBlock(scope: !66, file: !3, line: 964, column: 28)
!72 = !DILocation(line: 969, column: 38, scope: !70)
!73 = !DILocation(line: 969, column: 21, scope: !71)
!74 = !DILocation(line: 970, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 969, column: 46)
!76 = !DILocation(line: 971, column: 17, scope: !75)
!77 = !DILocation(line: 972, column: 13, scope: !71)
!78 = !DILocation(line: 973, column: 9, scope: !67)
!79 = !DILocation(line: 976, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !55, file: !3, line: 976, column: 13)
!81 = !DILocation(line: 976, column: 26, scope: !80)
!82 = !DILocation(line: 976, column: 13, scope: !55)
!83 = !DILocation(line: 978, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !3, line: 976, column: 33)
!85 = !DILocation(line: 982, column: 22, scope: !55)
!86 = !DILocation(line: 984, column: 13, scope: !55)
!87 = !DILocation(line: 987, column: 1, scope: !55)
!88 = distinct !DISubprogram(name: "closer2", scope: !3, file: !3, line: 989, type: !56, scopeLine: 989, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocation(line: 991, column: 5, scope: !88)
!90 = !DILocation(line: 994, column: 26, scope: !88)
!91 = !DILocation(line: 995, column: 22, scope: !88)
!92 = !DILocation(line: 996, column: 15, scope: !88)
!93 = !DILocation(line: 998, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !3, line: 998, column: 13)
!95 = !DILocation(line: 998, column: 13, scope: !88)
!96 = !DILocation(line: 999, column: 18, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !3, line: 999, column: 17)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 998, column: 20)
!99 = !DILocation(line: 999, column: 17, scope: !98)
!100 = !DILocation(line: 1004, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !3, line: 1004, column: 21)
!102 = distinct !DILexicalBlock(scope: !97, file: !3, line: 999, column: 28)
!103 = !DILocation(line: 1004, column: 38, scope: !101)
!104 = !DILocation(line: 1004, column: 21, scope: !102)
!105 = !DILocation(line: 1005, column: 34, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !3, line: 1004, column: 46)
!107 = !DILocation(line: 1006, column: 17, scope: !106)
!108 = !DILocation(line: 1007, column: 13, scope: !102)
!109 = !DILocation(line: 1008, column: 9, scope: !98)
!110 = !DILocation(line: 1011, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !88, file: !3, line: 1011, column: 13)
!112 = !DILocation(line: 1011, column: 26, scope: !111)
!113 = !DILocation(line: 1011, column: 13, scope: !88)
!114 = !DILocation(line: 1013, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 1011, column: 33)
!116 = !DILocation(line: 1017, column: 22, scope: !88)
!117 = !DILocation(line: 1019, column: 13, scope: !88)
!118 = !DILocation(line: 1022, column: 1, scope: !88)
!119 = distinct !DISubprogram(name: "closer3", scope: !3, file: !3, line: 1025, type: !56, scopeLine: 1025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocation(line: 1029, column: 26, scope: !119)
!121 = !DILocation(line: 1030, column: 22, scope: !119)
!122 = !DILocation(line: 1031, column: 15, scope: !119)
!123 = !DILocation(line: 1033, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !3, line: 1033, column: 13)
!125 = !DILocation(line: 1033, column: 13, scope: !119)
!126 = !DILocation(line: 1034, column: 18, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !3, line: 1034, column: 17)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 1033, column: 20)
!129 = !DILocation(line: 1034, column: 17, scope: !128)
!130 = !DILocation(line: 1039, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !132, file: !3, line: 1039, column: 21)
!132 = distinct !DILexicalBlock(scope: !127, file: !3, line: 1034, column: 28)
!133 = !DILocation(line: 1039, column: 38, scope: !131)
!134 = !DILocation(line: 1039, column: 21, scope: !132)
!135 = !DILocation(line: 1040, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !3, line: 1039, column: 46)
!137 = !DILocation(line: 1041, column: 17, scope: !136)
!138 = !DILocation(line: 1042, column: 13, scope: !132)
!139 = !DILocation(line: 1043, column: 9, scope: !128)
!140 = !DILocation(line: 1046, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !119, file: !3, line: 1046, column: 13)
!142 = !DILocation(line: 1046, column: 26, scope: !141)
!143 = !DILocation(line: 1046, column: 13, scope: !119)
!144 = !DILocation(line: 1048, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !3, line: 1046, column: 33)
!146 = !DILocation(line: 1052, column: 22, scope: !119)
!147 = !DILocation(line: 1054, column: 13, scope: !119)
!148 = !DILocation(line: 1057, column: 1, scope: !119)
!149 = distinct !DISubprogram(name: "closer4", scope: !3, file: !3, line: 1059, type: !56, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocation(line: 1061, column: 5, scope: !149)
!151 = !DILocation(line: 1064, column: 26, scope: !149)
!152 = !DILocation(line: 1065, column: 22, scope: !149)
!153 = !DILocation(line: 1066, column: 15, scope: !149)
!154 = !DILocation(line: 1068, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !3, line: 1068, column: 13)
!156 = !DILocation(line: 1068, column: 13, scope: !149)
!157 = !DILocation(line: 1069, column: 18, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !3, line: 1069, column: 17)
!159 = distinct !DILexicalBlock(scope: !155, file: !3, line: 1068, column: 20)
!160 = !DILocation(line: 1069, column: 17, scope: !159)
!161 = !DILocation(line: 1074, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !163, file: !3, line: 1074, column: 21)
!163 = distinct !DILexicalBlock(scope: !158, file: !3, line: 1069, column: 28)
!164 = !DILocation(line: 1074, column: 38, scope: !162)
!165 = !DILocation(line: 1074, column: 21, scope: !163)
!166 = !DILocation(line: 1075, column: 34, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !3, line: 1074, column: 46)
!168 = !DILocation(line: 1076, column: 17, scope: !167)
!169 = !DILocation(line: 1077, column: 13, scope: !163)
!170 = !DILocation(line: 1078, column: 9, scope: !159)
!171 = !DILocation(line: 1081, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !149, file: !3, line: 1081, column: 13)
!173 = !DILocation(line: 1081, column: 26, scope: !172)
!174 = !DILocation(line: 1081, column: 13, scope: !149)
!175 = !DILocation(line: 1083, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !3, line: 1081, column: 33)
!177 = !DILocation(line: 1086, column: 22, scope: !149)
!178 = !DILocation(line: 1088, column: 13, scope: !149)
!179 = !DILocation(line: 1091, column: 1, scope: !149)
!180 = distinct !DISubprogram(name: "writer1", scope: !3, file: !3, line: 1094, type: !56, scopeLine: 1094, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 1096, column: 15, scope: !180)
!182 = !DILocation(line: 1097, column: 22, scope: !180)
!183 = !DILocation(line: 1099, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !3, line: 1099, column: 13)
!185 = !DILocation(line: 1099, column: 13, scope: !180)
!186 = !DILocation(line: 1100, column: 18, scope: !187)
!187 = distinct !DILexicalBlock(scope: !188, file: !3, line: 1100, column: 17)
!188 = distinct !DILexicalBlock(scope: !184, file: !3, line: 1099, column: 20)
!189 = !DILocation(line: 1100, column: 17, scope: !188)
!190 = !DILocation(line: 1105, column: 21, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !3, line: 1105, column: 21)
!192 = distinct !DILexicalBlock(scope: !187, file: !3, line: 1100, column: 28)
!193 = !DILocation(line: 1105, column: 38, scope: !191)
!194 = !DILocation(line: 1105, column: 21, scope: !192)
!195 = !DILocation(line: 1106, column: 34, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !3, line: 1105, column: 46)
!197 = !DILocation(line: 1107, column: 17, scope: !196)
!198 = !DILocation(line: 1108, column: 13, scope: !192)
!199 = !DILocation(line: 1109, column: 9, scope: !188)
!200 = !DILocation(line: 1110, column: 13, scope: !180)
!201 = !DILocation(line: 1113, column: 1, scope: !180)
!202 = distinct !DISubprogram(name: "writer_isr_1", scope: !3, file: !3, line: 1115, type: !56, scopeLine: 1115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocation(line: 1117, column: 15, scope: !202)
!204 = !DILocation(line: 1118, column: 22, scope: !202)
!205 = !DILocation(line: 1120, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !3, line: 1120, column: 13)
!207 = !DILocation(line: 1120, column: 13, scope: !202)
!208 = !DILocation(line: 1121, column: 18, scope: !209)
!209 = distinct !DILexicalBlock(scope: !210, file: !3, line: 1121, column: 17)
!210 = distinct !DILexicalBlock(scope: !206, file: !3, line: 1120, column: 20)
!211 = !DILocation(line: 1121, column: 17, scope: !210)
!212 = !DILocation(line: 1126, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !3, line: 1126, column: 21)
!214 = distinct !DILexicalBlock(scope: !209, file: !3, line: 1121, column: 28)
!215 = !DILocation(line: 1126, column: 38, scope: !213)
!216 = !DILocation(line: 1126, column: 21, scope: !214)
!217 = !DILocation(line: 1127, column: 34, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !3, line: 1126, column: 46)
!219 = !DILocation(line: 1128, column: 17, scope: !218)
!220 = !DILocation(line: 1129, column: 13, scope: !214)
!221 = !DILocation(line: 1130, column: 9, scope: !210)
!222 = !DILocation(line: 1131, column: 13, scope: !202)
!223 = !DILocation(line: 1134, column: 1, scope: !202)
!224 = distinct !DISubprogram(name: "writer_isr_2", scope: !3, file: !3, line: 1136, type: !56, scopeLine: 1136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!225 = !DILocation(line: 1138, column: 15, scope: !224)
!226 = !DILocation(line: 1139, column: 22, scope: !224)
!227 = !DILocation(line: 1141, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !3, line: 1141, column: 13)
!229 = !DILocation(line: 1141, column: 13, scope: !224)
!230 = !DILocation(line: 1142, column: 18, scope: !231)
!231 = distinct !DILexicalBlock(scope: !232, file: !3, line: 1142, column: 17)
!232 = distinct !DILexicalBlock(scope: !228, file: !3, line: 1141, column: 20)
!233 = !DILocation(line: 1142, column: 17, scope: !232)
!234 = !DILocation(line: 1147, column: 21, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !3, line: 1147, column: 21)
!236 = distinct !DILexicalBlock(scope: !231, file: !3, line: 1142, column: 28)
!237 = !DILocation(line: 1147, column: 38, scope: !235)
!238 = !DILocation(line: 1147, column: 21, scope: !236)
!239 = !DILocation(line: 1148, column: 34, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !3, line: 1147, column: 46)
!241 = !DILocation(line: 1149, column: 17, scope: !240)
!242 = !DILocation(line: 1150, column: 13, scope: !236)
!243 = !DILocation(line: 1151, column: 9, scope: !232)
!244 = !DILocation(line: 1152, column: 13, scope: !224)
!245 = !DILocation(line: 1155, column: 1, scope: !224)
!246 = distinct !DISubprogram(name: "writer_isr_3", scope: !3, file: !3, line: 1157, type: !56, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!247 = !DILocation(line: 1159, column: 15, scope: !246)
!248 = !DILocation(line: 1160, column: 22, scope: !246)
!249 = !DILocation(line: 1162, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !3, line: 1162, column: 13)
!251 = !DILocation(line: 1162, column: 13, scope: !246)
!252 = !DILocation(line: 1163, column: 18, scope: !253)
!253 = distinct !DILexicalBlock(scope: !254, file: !3, line: 1163, column: 17)
!254 = distinct !DILexicalBlock(scope: !250, file: !3, line: 1162, column: 20)
!255 = !DILocation(line: 1163, column: 17, scope: !254)
!256 = !DILocation(line: 1168, column: 21, scope: !257)
!257 = distinct !DILexicalBlock(scope: !258, file: !3, line: 1168, column: 21)
!258 = distinct !DILexicalBlock(scope: !253, file: !3, line: 1163, column: 28)
!259 = !DILocation(line: 1168, column: 38, scope: !257)
!260 = !DILocation(line: 1168, column: 21, scope: !258)
!261 = !DILocation(line: 1169, column: 34, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !3, line: 1168, column: 46)
!263 = !DILocation(line: 1170, column: 17, scope: !262)
!264 = !DILocation(line: 1171, column: 13, scope: !258)
!265 = !DILocation(line: 1172, column: 9, scope: !254)
!266 = !DILocation(line: 1173, column: 13, scope: !246)
!267 = !DILocation(line: 1176, column: 1, scope: !246)
!268 = distinct !DISubprogram(name: "svp_simple_023_001_main", scope: !3, file: !3, line: 1181, type: !269, scopeLine: 1181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!269 = !DISubroutineType(types: !270)
!270 = !{!8, !8, !271}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!273 = !DILocalVariable(name: "argc", arg: 1, scope: !268, file: !3, line: 1181, type: !8)
!274 = !DILocation(line: 1181, column: 33, scope: !268)
!275 = !DILocalVariable(name: "argv", arg: 2, scope: !268, file: !3, line: 1181, type: !271)
!276 = !DILocation(line: 1181, column: 45, scope: !268)
!277 = !DILocation(line: 1187, column: 5, scope: !268)
!278 = !DILocation(line: 1188, column: 5, scope: !268)
!279 = !DILocation(line: 1232, column: 1, scope: !268)
