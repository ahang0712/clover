; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_643_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !13 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !16
  ret void, !dbg !17
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) local_unnamed_addr #0 !dbg !18 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !21, metadata !DIExpression()), !dbg !22
  %3 = load i32, i32* %2, align 4, !dbg !23
  %4 = icmp ne i32 %3, 0, !dbg !25
  br i1 %4, label %7, label %5, !dbg !26

5:                                                ; preds = %1
  br label %6, !dbg !27

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !28), !dbg !30
  call void @reach_error(), !dbg !31
  call void @abort() #4, !dbg !33
  unreachable, !dbg !33

7:                                                ; preds = %1
  ret void, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_init() local_unnamed_addr #0 !dbg !35 {
  store i32 0, i32* @g, align 4, !dbg !38
  ret i32 0, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_put() local_unnamed_addr #0 !dbg !40 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @g, align 4, !dbg !41
  %3 = icmp slt i32 %2, 1000, !dbg !43
  br i1 %3, label %4, label %8, !dbg !44

4:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %1, metadata !45, metadata !DIExpression()), !dbg !47
  %5 = load i32, i32* @g, align 4, !dbg !48
  %6 = add nsw i32 %5, 1, !dbg !49
  store i32 %6, i32* %1, align 4, !dbg !47
  %7 = load i32, i32* %1, align 4, !dbg !50
  store i32 %7, i32* @g, align 4, !dbg !51
  br label %8, !dbg !52

8:                                                ; preds = %4, %0
  ret i32 1, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_get() local_unnamed_addr #0 !dbg !54 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %1, align 4, !dbg !56
  %3 = load i32, i32* @g, align 4, !dbg !57
  %4 = icmp eq i32 %3, 0, !dbg !58
  %5 = zext i1 %4 to i32, !dbg !58
  call void @__VERIFIER_assert(i32 %5), !dbg !59
  %6 = load i32, i32* @g, align 4, !dbg !60
  %7 = icmp ne i32 %6, 0, !dbg !61
  %8 = zext i1 %7 to i32, !dbg !61
  call void @__VERIFIER_assert(i32 %8), !dbg !62
  %9 = load i32, i32* @g, align 4, !dbg !63
  %10 = icmp sgt i32 %9, 0, !dbg !65
  br i1 %10, label %11, label %15, !dbg !66

11:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %2, metadata !67, metadata !DIExpression()), !dbg !69
  %12 = load i32, i32* @g, align 4, !dbg !70
  %13 = sub nsw i32 %12, 1, !dbg !71
  store i32 %13, i32* %2, align 4, !dbg !69
  %14 = load i32, i32* %2, align 4, !dbg !72
  store i32 %14, i32* @g, align 4, !dbg !73
  store i32 1, i32* %1, align 4, !dbg !74
  br label %15, !dbg !75

15:                                               ; preds = %11, %0
  %16 = load i32, i32* %1, align 4, !dbg !76
  ret i32 %16, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @isr_pqueue_get() local_unnamed_addr #0 !dbg !78 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %1, align 4, !dbg !80
  %2 = load i32, i32* @g, align 4, !dbg !81
  %3 = icmp eq i32 %2, 0, !dbg !82
  %4 = zext i1 %3 to i32, !dbg !82
  call void @__VERIFIER_assert(i32 %4), !dbg !83
  %5 = load i32, i32* @g, align 4, !dbg !84
  %6 = icmp ne i32 %5, 0, !dbg !85
  %7 = zext i1 %6 to i32, !dbg !85
  call void @__VERIFIER_assert(i32 %7), !dbg !86
  %8 = load i32, i32* @g, align 4, !dbg !87
  %9 = icmp sgt i32 %8, 0, !dbg !89
  br i1 %9, label %10, label %13, !dbg !90

10:                                               ; preds = %0
  %11 = load i32, i32* @g, align 4, !dbg !91
  %12 = add nsw i32 %11, -1, !dbg !91
  store i32 %12, i32* @g, align 4, !dbg !91
  store i32 1, i32* %1, align 4, !dbg !93
  br label %13, !dbg !94

13:                                               ; preds = %10, %0
  %14 = load i32, i32* %1, align 4, !dbg !95
  ret i32 %14, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_643_001_isr1(i8* %0) local_unnamed_addr #0 !dbg !97 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !101, metadata !DIExpression()), !dbg !102
  %3 = call i32 @isr_pqueue_get(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_643_001_main(i32 %0, i8** %1) local_unnamed_addr #0 !dbg !105 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !113, metadata !DIExpression()), !dbg !114
  %7 = call i32 @pqueue_init(), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %5, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 5, i32* %5, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i32* %6, metadata !118, metadata !DIExpression()), !dbg !120
  store i32 1, i32* %6, align 4, !dbg !120
  br label %8, !dbg !121

8:                                                ; preds = %13, %2
  %9 = load i32, i32* %6, align 4, !dbg !122
  %10 = icmp slt i32 %9, 5, !dbg !124
  br i1 %10, label %11, label %16, !dbg !125

11:                                               ; preds = %8
  %12 = call i32 @pqueue_put(), !dbg !126
  br label %13, !dbg !128

13:                                               ; preds = %11
  %14 = load i32, i32* %6, align 4, !dbg !129
  %15 = add nsw i32 %14, 1, !dbg !129
  store i32 %15, i32* %6, align 4, !dbg !129
  br label %8, !dbg !130, !llvm.loop !131

16:                                               ; preds = %8
  ret i32 0, !dbg !133
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !6, line: 15, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 2, type: !14, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocation(line: 2, column: 22, scope: !13)
!17 = !DILocation(line: 2, column: 33, scope: !13)
!18 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 3, type: !19, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !7}
!21 = !DILocalVariable(name: "cond", arg: 1, scope: !18, file: !6, line: 3, type: !7)
!22 = !DILocation(line: 3, column: 28, scope: !18)
!23 = !DILocation(line: 5, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !6, line: 5, column: 7)
!25 = !DILocation(line: 5, column: 8, scope: !24)
!26 = !DILocation(line: 5, column: 7, scope: !18)
!27 = !DILocation(line: 6, column: 3, scope: !24)
!28 = !DILabel(scope: !29, name: "ERROR", file: !6, line: 7)
!29 = distinct !DILexicalBlock(scope: !24, file: !6, line: 6, column: 3)
!30 = !DILocation(line: 7, column: 3, scope: !29)
!31 = !DILocation(line: 9, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !6, line: 8, column: 3)
!33 = !DILocation(line: 10, column: 5, scope: !32)
!34 = !DILocation(line: 13, column: 1, scope: !18)
!35 = distinct !DISubprogram(name: "pqueue_init", scope: !6, file: !6, line: 17, type: !36, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!7}
!38 = !DILocation(line: 19, column: 5, scope: !35)
!39 = !DILocation(line: 20, column: 3, scope: !35)
!40 = distinct !DISubprogram(name: "pqueue_put", scope: !6, file: !6, line: 23, type: !36, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 26, column: 7, scope: !42)
!42 = distinct !DILexicalBlock(scope: !40, file: !6, line: 26, column: 7)
!43 = !DILocation(line: 26, column: 9, scope: !42)
!44 = !DILocation(line: 26, column: 7, scope: !40)
!45 = !DILocalVariable(name: "tmp", scope: !46, file: !6, line: 28, type: !7)
!46 = distinct !DILexicalBlock(scope: !42, file: !6, line: 27, column: 3)
!47 = !DILocation(line: 28, column: 9, scope: !46)
!48 = !DILocation(line: 28, column: 15, scope: !46)
!49 = !DILocation(line: 28, column: 17, scope: !46)
!50 = !DILocation(line: 29, column: 9, scope: !46)
!51 = !DILocation(line: 29, column: 7, scope: !46)
!52 = !DILocation(line: 31, column: 3, scope: !46)
!53 = !DILocation(line: 33, column: 3, scope: !40)
!54 = distinct !DISubprogram(name: "pqueue_get", scope: !6, file: !6, line: 36, type: !36, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocalVariable(name: "got", scope: !54, file: !6, line: 38, type: !7)
!56 = !DILocation(line: 38, column: 7, scope: !54)
!57 = !DILocation(line: 40, column: 21, scope: !54)
!58 = !DILocation(line: 40, column: 23, scope: !54)
!59 = !DILocation(line: 40, column: 3, scope: !54)
!60 = !DILocation(line: 42, column: 21, scope: !54)
!61 = !DILocation(line: 42, column: 23, scope: !54)
!62 = !DILocation(line: 42, column: 3, scope: !54)
!63 = !DILocation(line: 43, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !54, file: !6, line: 43, column: 7)
!65 = !DILocation(line: 43, column: 9, scope: !64)
!66 = !DILocation(line: 43, column: 7, scope: !54)
!67 = !DILocalVariable(name: "tmp", scope: !68, file: !6, line: 45, type: !7)
!68 = distinct !DILexicalBlock(scope: !64, file: !6, line: 44, column: 3)
!69 = !DILocation(line: 45, column: 9, scope: !68)
!70 = !DILocation(line: 45, column: 15, scope: !68)
!71 = !DILocation(line: 45, column: 17, scope: !68)
!72 = !DILocation(line: 46, column: 9, scope: !68)
!73 = !DILocation(line: 46, column: 7, scope: !68)
!74 = !DILocation(line: 48, column: 9, scope: !68)
!75 = !DILocation(line: 49, column: 3, scope: !68)
!76 = !DILocation(line: 51, column: 11, scope: !54)
!77 = !DILocation(line: 51, column: 3, scope: !54)
!78 = distinct !DISubprogram(name: "isr_pqueue_get", scope: !6, file: !6, line: 54, type: !36, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "got", scope: !78, file: !6, line: 56, type: !7)
!80 = !DILocation(line: 56, column: 7, scope: !78)
!81 = !DILocation(line: 58, column: 21, scope: !78)
!82 = !DILocation(line: 58, column: 23, scope: !78)
!83 = !DILocation(line: 58, column: 3, scope: !78)
!84 = !DILocation(line: 60, column: 21, scope: !78)
!85 = !DILocation(line: 60, column: 23, scope: !78)
!86 = !DILocation(line: 60, column: 3, scope: !78)
!87 = !DILocation(line: 61, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !6, line: 61, column: 7)
!89 = !DILocation(line: 61, column: 9, scope: !88)
!90 = !DILocation(line: 61, column: 7, scope: !78)
!91 = !DILocation(line: 63, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !6, line: 62, column: 3)
!93 = !DILocation(line: 64, column: 9, scope: !92)
!94 = !DILocation(line: 65, column: 3, scope: !92)
!95 = !DILocation(line: 67, column: 11, scope: !78)
!96 = !DILocation(line: 67, column: 3, scope: !78)
!97 = distinct !DISubprogram(name: "svp_simple_643_001_isr1", scope: !6, file: !6, line: 70, type: !98, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{null, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!101 = !DILocalVariable(name: "arg", arg: 1, scope: !97, file: !6, line: 70, type: !100)
!102 = !DILocation(line: 70, column: 36, scope: !97)
!103 = !DILocation(line: 73, column: 3, scope: !97)
!104 = !DILocation(line: 74, column: 1, scope: !97)
!105 = distinct !DISubprogram(name: "svp_simple_643_001_main", scope: !6, file: !6, line: 76, type: !106, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!7, !7, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !6, line: 76, type: !7)
!112 = !DILocation(line: 76, column: 33, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !6, line: 76, type: !108)
!114 = !DILocation(line: 76, column: 46, scope: !105)
!115 = !DILocation(line: 79, column: 3, scope: !105)
!116 = !DILocalVariable(name: "num", scope: !105, file: !6, line: 81, type: !7)
!117 = !DILocation(line: 81, column: 7, scope: !105)
!118 = !DILocalVariable(name: "i", scope: !119, file: !6, line: 82, type: !7)
!119 = distinct !DILexicalBlock(scope: !105, file: !6, line: 82, column: 3)
!120 = !DILocation(line: 82, column: 12, scope: !119)
!121 = !DILocation(line: 82, column: 8, scope: !119)
!122 = !DILocation(line: 82, column: 19, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !6, line: 82, column: 3)
!124 = !DILocation(line: 82, column: 21, scope: !123)
!125 = !DILocation(line: 82, column: 3, scope: !119)
!126 = !DILocation(line: 84, column: 5, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !6, line: 83, column: 3)
!128 = !DILocation(line: 85, column: 3, scope: !127)
!129 = !DILocation(line: 82, column: 27, scope: !123)
!130 = !DILocation(line: 82, column: 3, scope: !123)
!131 = distinct !{!131, !125, !132}
!132 = !DILocation(line: 85, column: 3, scope: !119)
!133 = !DILocation(line: 86, column: 3, scope: !105)
