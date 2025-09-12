; ModuleID = './wdt/wdt_pci_2.c'
source_filename = "./wdt/wdt_pci_2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

%struct._opaque_pthread_t = type { i64, %struct.__darwin_pthread_handler_rec*, [8176 x i8] }
%struct.__darwin_pthread_handler_rec = type { void (i8*)*, i8*, %struct.__darwin_pthread_handler_rec* }

@heartbeat = global i32 60, align 4, !dbg !0
@nowayout = global i32 0, align 4, !dbg !6
@wdtpci_write_buf = common global i8 0, align 1, !dbg !10
@expect_close = common global i32 0, align 4, !dbg !21
@count = common global i32 0, align 4, !dbg !41
@cnt1 = common global i32 0, align 4, !dbg !29
@cnt2 = common global i32 0, align 4, !dbg !31
@cnt5 = common global i32 0, align 4, !dbg !37
@cnt3 = common global i32 0, align 4, !dbg !33
@cnt4 = common global i32 0, align 4, !dbg !35
@cnt6 = common global i32 0, align 4, !dbg !39
@dev_count = common global i32 0, align 4, !dbg !13
@open_sem = common global i32 0, align 4, !dbg !15
@wdtpci_lock = common global i8 0, align 1, !dbg !18
@io = common global i32 0, align 4, !dbg !23
@irq = common global i32 0, align 4, !dbg !25
@wd_heartbeat = common global i32 0, align 4, !dbg !27
@buf = common global i32 0, align 4, !dbg !43

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer_isr_1() #0 !dbg !51 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !54
  store i32 42, i32* @expect_close, align 4, !dbg !55
  store i32 1, i32* @count, align 4, !dbg !56
  %1 = load i32, i32* @count, align 4, !dbg !57
  %2 = icmp ne i32 %1, 0, !dbg !57
  br i1 %2, label %3, label %13, !dbg !59

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !60
  %5 = icmp ne i32 %4, 0, !dbg !60
  br i1 %5, label %12, label %6, !dbg !63

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !64
  %8 = sext i8 %7 to i32, !dbg !64
  %9 = icmp ne i32 %8, 86, !dbg !67
  br i1 %9, label %10, label %11, !dbg !68

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !69
  br label %11, !dbg !71

11:                                               ; preds = %10, %6
  br label %12, !dbg !72

12:                                               ; preds = %11, %3
  br label %13, !dbg !73

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !74
  %15 = icmp ne i32 %14, 42, !dbg !76
  br i1 %15, label %16, label %17, !dbg !77

16:                                               ; preds = %13
  br label %18, !dbg !78

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !80
  %19 = load i32, i32* @cnt1, align 4, !dbg !81
  %20 = add nsw i32 %19, 1, !dbg !81
  store i32 %20, i32* @cnt1, align 4, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer_isr_2() #0 !dbg !83 {
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !84
  store i32 42, i32* @expect_close, align 4, !dbg !85
  store i32 1, i32* @count, align 4, !dbg !86
  %1 = load i32, i32* @count, align 4, !dbg !87
  %2 = icmp ne i32 %1, 0, !dbg !87
  br i1 %2, label %3, label %13, !dbg !89

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !90
  %5 = icmp ne i32 %4, 0, !dbg !90
  br i1 %5, label %12, label %6, !dbg !93

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !94
  %8 = sext i8 %7 to i32, !dbg !94
  %9 = icmp ne i32 %8, 86, !dbg !97
  br i1 %9, label %10, label %11, !dbg !98

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !99
  br label %11, !dbg !101

11:                                               ; preds = %10, %6
  br label %12, !dbg !102

12:                                               ; preds = %11, %3
  br label %13, !dbg !103

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !104
  %15 = icmp ne i32 %14, 42, !dbg !106
  br i1 %15, label %16, label %17, !dbg !107

16:                                               ; preds = %13
  br label %18, !dbg !108

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !110
  %19 = load i32, i32* @cnt2, align 4, !dbg !111
  %20 = add nsw i32 %19, 1, !dbg !111
  store i32 %20, i32* @cnt2, align 4, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @closer3() #0 !dbg !113 {
  call void @writer1(), !dbg !114
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !115
  store i32 42, i32* @expect_close, align 4, !dbg !116
  store i32 1, i32* @count, align 4, !dbg !117
  %1 = load i32, i32* @count, align 4, !dbg !118
  %2 = icmp ne i32 %1, 0, !dbg !118
  br i1 %2, label %3, label %13, !dbg !120

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !121
  %5 = icmp ne i32 %4, 0, !dbg !121
  br i1 %5, label %12, label %6, !dbg !124

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !125
  %8 = sext i8 %7 to i32, !dbg !125
  %9 = icmp ne i32 %8, 86, !dbg !128
  br i1 %9, label %10, label %11, !dbg !129

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !130
  br label %11, !dbg !132

11:                                               ; preds = %10, %6
  br label %12, !dbg !133

12:                                               ; preds = %11, %3
  br label %13, !dbg !134

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !135
  %15 = icmp ne i32 %14, 42, !dbg !137
  br i1 %15, label %16, label %17, !dbg !138

16:                                               ; preds = %13
  br label %18, !dbg !139

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !141
  %19 = load i32, i32* @cnt5, align 4, !dbg !142
  %20 = add nsw i32 %19, 1, !dbg !142
  store i32 %20, i32* @cnt5, align 4, !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer1() #0 !dbg !144 {
  store i32 0, i32* @count, align 4, !dbg !145
  store i32 0, i32* @expect_close, align 4, !dbg !146
  %1 = load i32, i32* @count, align 4, !dbg !147
  %2 = icmp ne i32 %1, 0, !dbg !147
  br i1 %2, label %3, label %13, !dbg !149

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !150
  %5 = icmp ne i32 %4, 0, !dbg !150
  br i1 %5, label %12, label %6, !dbg !153

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !154
  %8 = sext i8 %7 to i32, !dbg !154
  %9 = icmp ne i32 %8, 86, !dbg !157
  br i1 %9, label %10, label %11, !dbg !158

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !159
  br label %11, !dbg !161

11:                                               ; preds = %10, %6
  br label %12, !dbg !162

12:                                               ; preds = %11, %3
  br label %13, !dbg !163

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt3, align 4, !dbg !164
  %15 = add nsw i32 %14, 1, !dbg !164
  store i32 %15, i32* @cnt3, align 4, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer2() #0 !dbg !166 {
  store i32 0, i32* @count, align 4, !dbg !167
  store i32 0, i32* @expect_close, align 4, !dbg !168
  %1 = load i32, i32* @count, align 4, !dbg !169
  %2 = icmp ne i32 %1, 0, !dbg !169
  br i1 %2, label %3, label %13, !dbg !171

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !172
  %5 = icmp ne i32 %4, 0, !dbg !172
  br i1 %5, label %12, label %6, !dbg !175

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !176
  %8 = sext i8 %7 to i32, !dbg !176
  %9 = icmp ne i32 %8, 86, !dbg !179
  br i1 %9, label %10, label %11, !dbg !180

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !181
  br label %11, !dbg !183

11:                                               ; preds = %10, %6
  br label %12, !dbg !184

12:                                               ; preds = %11, %3
  br label %13, !dbg !185

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt4, align 4, !dbg !186
  %15 = add nsw i32 %14, 1, !dbg !186
  store i32 %15, i32* @cnt4, align 4, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @writer_isr_3() #0 !dbg !188 {
  store i32 0, i32* @count, align 4, !dbg !189
  store i32 0, i32* @expect_close, align 4, !dbg !190
  %1 = load i32, i32* @count, align 4, !dbg !191
  %2 = icmp ne i32 %1, 0, !dbg !191
  br i1 %2, label %3, label %13, !dbg !193

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !194
  %5 = icmp ne i32 %4, 0, !dbg !194
  br i1 %5, label %12, label %6, !dbg !197

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !198
  %8 = sext i8 %7 to i32, !dbg !198
  %9 = icmp ne i32 %8, 86, !dbg !201
  br i1 %9, label %10, label %11, !dbg !202

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !203
  br label %11, !dbg !205

11:                                               ; preds = %10, %6
  br label %12, !dbg !206

12:                                               ; preds = %11, %3
  br label %13, !dbg !207

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt6, align 4, !dbg !208
  %15 = add nsw i32 %14, 1, !dbg !208
  store i32 %15, i32* @cnt6, align 4, !dbg !208
  ret void, !dbg !209
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_022_001_main(i32 %0, i8** %1) #0 !dbg !210 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca %struct._opaque_pthread_t*, align 8
  %6 = alloca %struct._opaque_pthread_t*, align 8
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !215, metadata !DIExpression()), !dbg !216
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata %struct._opaque_pthread_t** %5, metadata !219, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.declare(metadata %struct._opaque_pthread_t** %6, metadata !245, metadata !DIExpression()), !dbg !246
  call void @closer3(), !dbg !247
  ret i32 0, !dbg !248
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!45, !46, !47, !48, !49}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!50}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heartbeat", scope: !2, file: !8, line: 199, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "wdt/wdt_pci_2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !13, !15, !18, !21, !23, !25, !27, !29, !31, !33, !35, !37, !39, !41, !43}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "nowayout", scope: !2, file: !8, line: 205, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./wdt/wdt_pci_2.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "wdtpci_write_buf", scope: !2, file: !8, line: 117, type: !12, isLocal: false, isDefinition: true)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "dev_count", scope: !2, file: !8, line: 185, type: !9, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "open_sem", scope: !2, file: !8, line: 188, type: !17, isLocal: false, isDefinition: true)
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "wdtpci_lock", scope: !2, file: !8, line: 190, type: !20, isLocal: false, isDefinition: true)
!20 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "expect_close", scope: !2, file: !8, line: 191, type: !9, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "io", scope: !2, file: !8, line: 193, type: !9, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "irq", scope: !2, file: !8, line: 194, type: !9, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "wd_heartbeat", scope: !2, file: !8, line: 200, type: !9, isLocal: false, isDefinition: true)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 943, type: !9, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 943, type: !9, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 943, type: !9, isLocal: false, isDefinition: true)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !8, line: 943, type: !9, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "cnt5", scope: !2, file: !8, line: 943, type: !9, isLocal: false, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "cnt6", scope: !2, file: !8, line: 943, type: !9, isLocal: false, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !8, line: 944, type: !9, isLocal: false, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !8, line: 945, type: !9, isLocal: false, isDefinition: true)
!45 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!46 = !{i32 7, !"Dwarf Version", i32 4}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{i32 7, !"PIC Level", i32 2}
!50 = !{!"clang version 10.0.0 "}
!51 = distinct !DISubprogram(name: "closer_isr_1", scope: !8, file: !8, line: 954, type: !52, scopeLine: 954, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{null}
!54 = !DILocation(line: 957, column: 26, scope: !51)
!55 = !DILocation(line: 958, column: 22, scope: !51)
!56 = !DILocation(line: 959, column: 15, scope: !51)
!57 = !DILocation(line: 961, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !8, line: 961, column: 13)
!59 = !DILocation(line: 961, column: 13, scope: !51)
!60 = !DILocation(line: 962, column: 18, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !8, line: 962, column: 17)
!62 = distinct !DILexicalBlock(scope: !58, file: !8, line: 961, column: 20)
!63 = !DILocation(line: 962, column: 17, scope: !62)
!64 = !DILocation(line: 967, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !66, file: !8, line: 967, column: 21)
!66 = distinct !DILexicalBlock(scope: !61, file: !8, line: 962, column: 28)
!67 = !DILocation(line: 967, column: 38, scope: !65)
!68 = !DILocation(line: 967, column: 21, scope: !66)
!69 = !DILocation(line: 968, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !8, line: 967, column: 46)
!71 = !DILocation(line: 969, column: 17, scope: !70)
!72 = !DILocation(line: 970, column: 13, scope: !66)
!73 = !DILocation(line: 971, column: 9, scope: !62)
!74 = !DILocation(line: 974, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !51, file: !8, line: 974, column: 13)
!76 = !DILocation(line: 974, column: 26, scope: !75)
!77 = !DILocation(line: 974, column: 13, scope: !51)
!78 = !DILocation(line: 976, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !8, line: 974, column: 33)
!80 = !DILocation(line: 979, column: 22, scope: !51)
!81 = !DILocation(line: 981, column: 13, scope: !51)
!82 = !DILocation(line: 984, column: 1, scope: !51)
!83 = distinct !DISubprogram(name: "closer_isr_2", scope: !8, file: !8, line: 986, type: !52, scopeLine: 986, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 989, column: 26, scope: !83)
!85 = !DILocation(line: 990, column: 22, scope: !83)
!86 = !DILocation(line: 991, column: 15, scope: !83)
!87 = !DILocation(line: 993, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !8, line: 993, column: 13)
!89 = !DILocation(line: 993, column: 13, scope: !83)
!90 = !DILocation(line: 994, column: 18, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !8, line: 994, column: 17)
!92 = distinct !DILexicalBlock(scope: !88, file: !8, line: 993, column: 20)
!93 = !DILocation(line: 994, column: 17, scope: !92)
!94 = !DILocation(line: 999, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !8, line: 999, column: 21)
!96 = distinct !DILexicalBlock(scope: !91, file: !8, line: 994, column: 28)
!97 = !DILocation(line: 999, column: 38, scope: !95)
!98 = !DILocation(line: 999, column: 21, scope: !96)
!99 = !DILocation(line: 1000, column: 34, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !8, line: 999, column: 46)
!101 = !DILocation(line: 1001, column: 17, scope: !100)
!102 = !DILocation(line: 1002, column: 13, scope: !96)
!103 = !DILocation(line: 1003, column: 9, scope: !92)
!104 = !DILocation(line: 1006, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !83, file: !8, line: 1006, column: 13)
!106 = !DILocation(line: 1006, column: 26, scope: !105)
!107 = !DILocation(line: 1006, column: 13, scope: !83)
!108 = !DILocation(line: 1008, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !8, line: 1006, column: 33)
!110 = !DILocation(line: 1011, column: 22, scope: !83)
!111 = !DILocation(line: 1013, column: 13, scope: !83)
!112 = !DILocation(line: 1016, column: 1, scope: !83)
!113 = distinct !DISubprogram(name: "closer3", scope: !8, file: !8, line: 1019, type: !52, scopeLine: 1019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocation(line: 1021, column: 5, scope: !113)
!115 = !DILocation(line: 1024, column: 26, scope: !113)
!116 = !DILocation(line: 1025, column: 22, scope: !113)
!117 = !DILocation(line: 1026, column: 15, scope: !113)
!118 = !DILocation(line: 1028, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !8, line: 1028, column: 13)
!120 = !DILocation(line: 1028, column: 13, scope: !113)
!121 = !DILocation(line: 1029, column: 18, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !8, line: 1029, column: 17)
!123 = distinct !DILexicalBlock(scope: !119, file: !8, line: 1028, column: 20)
!124 = !DILocation(line: 1029, column: 17, scope: !123)
!125 = !DILocation(line: 1034, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !8, line: 1034, column: 21)
!127 = distinct !DILexicalBlock(scope: !122, file: !8, line: 1029, column: 28)
!128 = !DILocation(line: 1034, column: 38, scope: !126)
!129 = !DILocation(line: 1034, column: 21, scope: !127)
!130 = !DILocation(line: 1035, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !8, line: 1034, column: 46)
!132 = !DILocation(line: 1036, column: 17, scope: !131)
!133 = !DILocation(line: 1037, column: 13, scope: !127)
!134 = !DILocation(line: 1038, column: 9, scope: !123)
!135 = !DILocation(line: 1041, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !113, file: !8, line: 1041, column: 13)
!137 = !DILocation(line: 1041, column: 26, scope: !136)
!138 = !DILocation(line: 1041, column: 13, scope: !113)
!139 = !DILocation(line: 1043, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !8, line: 1041, column: 33)
!141 = !DILocation(line: 1046, column: 22, scope: !113)
!142 = !DILocation(line: 1048, column: 13, scope: !113)
!143 = !DILocation(line: 1051, column: 1, scope: !113)
!144 = distinct !DISubprogram(name: "writer1", scope: !8, file: !8, line: 1054, type: !52, scopeLine: 1054, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocation(line: 1056, column: 15, scope: !144)
!146 = !DILocation(line: 1057, column: 22, scope: !144)
!147 = !DILocation(line: 1059, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !8, line: 1059, column: 13)
!149 = !DILocation(line: 1059, column: 13, scope: !144)
!150 = !DILocation(line: 1060, column: 18, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !8, line: 1060, column: 17)
!152 = distinct !DILexicalBlock(scope: !148, file: !8, line: 1059, column: 20)
!153 = !DILocation(line: 1060, column: 17, scope: !152)
!154 = !DILocation(line: 1065, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !156, file: !8, line: 1065, column: 21)
!156 = distinct !DILexicalBlock(scope: !151, file: !8, line: 1060, column: 28)
!157 = !DILocation(line: 1065, column: 38, scope: !155)
!158 = !DILocation(line: 1065, column: 21, scope: !156)
!159 = !DILocation(line: 1066, column: 34, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !8, line: 1065, column: 46)
!161 = !DILocation(line: 1067, column: 17, scope: !160)
!162 = !DILocation(line: 1068, column: 13, scope: !156)
!163 = !DILocation(line: 1069, column: 9, scope: !152)
!164 = !DILocation(line: 1070, column: 13, scope: !144)
!165 = !DILocation(line: 1073, column: 1, scope: !144)
!166 = distinct !DISubprogram(name: "writer2", scope: !8, file: !8, line: 1075, type: !52, scopeLine: 1075, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocation(line: 1077, column: 15, scope: !166)
!168 = !DILocation(line: 1078, column: 22, scope: !166)
!169 = !DILocation(line: 1080, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !8, line: 1080, column: 13)
!171 = !DILocation(line: 1080, column: 13, scope: !166)
!172 = !DILocation(line: 1081, column: 18, scope: !173)
!173 = distinct !DILexicalBlock(scope: !174, file: !8, line: 1081, column: 17)
!174 = distinct !DILexicalBlock(scope: !170, file: !8, line: 1080, column: 20)
!175 = !DILocation(line: 1081, column: 17, scope: !174)
!176 = !DILocation(line: 1086, column: 21, scope: !177)
!177 = distinct !DILexicalBlock(scope: !178, file: !8, line: 1086, column: 21)
!178 = distinct !DILexicalBlock(scope: !173, file: !8, line: 1081, column: 28)
!179 = !DILocation(line: 1086, column: 38, scope: !177)
!180 = !DILocation(line: 1086, column: 21, scope: !178)
!181 = !DILocation(line: 1087, column: 34, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !8, line: 1086, column: 46)
!183 = !DILocation(line: 1088, column: 17, scope: !182)
!184 = !DILocation(line: 1089, column: 13, scope: !178)
!185 = !DILocation(line: 1090, column: 9, scope: !174)
!186 = !DILocation(line: 1091, column: 13, scope: !166)
!187 = !DILocation(line: 1094, column: 1, scope: !166)
!188 = distinct !DISubprogram(name: "writer_isr_3", scope: !8, file: !8, line: 1096, type: !52, scopeLine: 1096, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocation(line: 1100, column: 15, scope: !188)
!190 = !DILocation(line: 1101, column: 22, scope: !188)
!191 = !DILocation(line: 1103, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !8, line: 1103, column: 13)
!193 = !DILocation(line: 1103, column: 13, scope: !188)
!194 = !DILocation(line: 1104, column: 18, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !8, line: 1104, column: 17)
!196 = distinct !DILexicalBlock(scope: !192, file: !8, line: 1103, column: 20)
!197 = !DILocation(line: 1104, column: 17, scope: !196)
!198 = !DILocation(line: 1109, column: 21, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !8, line: 1109, column: 21)
!200 = distinct !DILexicalBlock(scope: !195, file: !8, line: 1104, column: 28)
!201 = !DILocation(line: 1109, column: 38, scope: !199)
!202 = !DILocation(line: 1109, column: 21, scope: !200)
!203 = !DILocation(line: 1110, column: 34, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !8, line: 1109, column: 46)
!205 = !DILocation(line: 1111, column: 17, scope: !204)
!206 = !DILocation(line: 1112, column: 13, scope: !200)
!207 = !DILocation(line: 1113, column: 9, scope: !196)
!208 = !DILocation(line: 1114, column: 13, scope: !188)
!209 = !DILocation(line: 1117, column: 1, scope: !188)
!210 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 1121, type: !211, scopeLine: 1121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!211 = !DISubroutineType(types: !212)
!212 = !{!9, !9, !213}
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!215 = !DILocalVariable(name: "argc", arg: 1, scope: !210, file: !8, line: 1121, type: !9)
!216 = !DILocation(line: 1121, column: 33, scope: !210)
!217 = !DILocalVariable(name: "argv", arg: 2, scope: !210, file: !8, line: 1121, type: !213)
!218 = !DILocation(line: 1121, column: 45, scope: !210)
!219 = !DILocalVariable(name: "t1", scope: !210, file: !8, line: 1123, type: !220)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !221, line: 31, baseType: !222)
!221 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_t.h", directory: "")
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_t", file: !223, line: 118, baseType: !224)
!223 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h", directory: "")
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_t", file: !223, line: 103, size: 65536, elements: !226)
!226 = !{!227, !229, !240}
!227 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !225, file: !223, line: 104, baseType: !228, size: 64)
!228 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "__cleanup_stack", scope: !225, file: !223, line: 105, baseType: !230, size: 64, offset: 64)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 64)
!231 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_pthread_handler_rec", file: !223, line: 57, size: 192, elements: !232)
!232 = !{!233, !238, !239}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "__routine", scope: !231, file: !223, line: 58, baseType: !234, size: 64)
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DISubroutineType(types: !236)
!236 = !{null, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "__arg", scope: !231, file: !223, line: 59, baseType: !237, size: 64, offset: 64)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !231, file: !223, line: 60, baseType: !230, size: 64, offset: 128)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !225, file: !223, line: 106, baseType: !241, size: 65408, offset: 128)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 65408, elements: !242)
!242 = !{!243}
!243 = !DISubrange(count: 8176)
!244 = !DILocation(line: 1123, column: 13, scope: !210)
!245 = !DILocalVariable(name: "t2", scope: !210, file: !8, line: 1124, type: !220)
!246 = !DILocation(line: 1124, column: 13, scope: !210)
!247 = !DILocation(line: 1126, column: 3, scope: !210)
!248 = !DILocation(line: 1127, column: 3, scope: !210)
