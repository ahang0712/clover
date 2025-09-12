; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_700_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_700_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = local_unnamed_addr global i32 42, align 4, !dbg !0
@h = local_unnamed_addr global i32 42, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !15 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !18
  ret void, !dbg !19
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) local_unnamed_addr #0 !dbg !20 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !23, metadata !DIExpression()), !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !25
  %4 = icmp ne i32 %3, 0, !dbg !27
  br i1 %4, label %7, label %5, !dbg !28

5:                                                ; preds = %1
  br label %6, !dbg !29

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !30), !dbg !32
  call void @reach_error(), !dbg !33
  call void @abort() #4, !dbg !35
  unreachable, !dbg !35

7:                                                ; preds = %1
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_700_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !37 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %3, metadata !43, metadata !DIExpression()), !dbg !44
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !45
  store i32 %4, i32* %3, align 4, !dbg !44
  %5 = load i32, i32* %3, align 4, !dbg !46
  %6 = icmp sgt i32 %5, -1000, !dbg !48
  br i1 %6, label %7, label %12, !dbg !49

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4, !dbg !50
  store i32 %8, i32* @g, align 4, !dbg !52
  %9 = load i32, i32* %3, align 4, !dbg !53
  %10 = sub nsw i32 %9, 17, !dbg !54
  store i32 %10, i32* @h, align 4, !dbg !55
  %11 = load i32, i32* %3, align 4, !dbg !56
  store i32 %11, i32* @h, align 4, !dbg !57
  br label %12, !dbg !58

12:                                               ; preds = %7, %1
  ret void, !dbg !59
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_700_001_isr_2(i8* %0) local_unnamed_addr #0 !dbg !60 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %3, metadata !63, metadata !DIExpression()), !dbg !64
  %5 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !65
  store i32 %5, i32* %3, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %4, metadata !66, metadata !DIExpression()), !dbg !67
  %6 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !68
  store i32 %6, i32* %4, align 4, !dbg !67
  %7 = load i32, i32* @g, align 4, !dbg !69
  store i32 %7, i32* %3, align 4, !dbg !70
  %8 = load i32, i32* @h, align 4, !dbg !71
  store i32 %8, i32* %4, align 4, !dbg !72
  %9 = load i32, i32* %4, align 4, !dbg !73
  %10 = load i32, i32* %3, align 4, !dbg !74
  %11 = icmp sle i32 %9, %10, !dbg !75
  %12 = zext i1 %11 to i32, !dbg !75
  call void @__VERIFIER_assert(i32 %12), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_700_001_main() local_unnamed_addr #0 !dbg !78 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !81, metadata !DIExpression()), !dbg !82
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !83
  store i32 %3, i32* %1, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %2, metadata !84, metadata !DIExpression()), !dbg !85
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !86
  store i32 %4, i32* %2, align 4, !dbg !85
  %5 = load i32, i32* @g, align 4, !dbg !87
  store i32 %5, i32* %1, align 4, !dbg !88
  %6 = load i32, i32* @h, align 4, !dbg !89
  store i32 %6, i32* %2, align 4, !dbg !90
  %7 = load i32, i32* %2, align 4, !dbg !91
  %8 = load i32, i32* %1, align 4, !dbg !92
  %9 = icmp eq i32 %7, %8, !dbg !93
  %10 = zext i1 %9 to i32, !dbg !93
  call void @__VERIFIER_assert(i32 %10), !dbg !94
  %11 = load i32, i32* %2, align 4, !dbg !95
  %12 = load i32, i32* %1, align 4, !dbg !96
  %13 = icmp eq i32 %11, %12, !dbg !97
  %14 = zext i1 %13 to i32, !dbg !97
  call void @__VERIFIER_assert(i32 %14), !dbg !98
  ret i32 0, !dbg !99
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_700_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_700_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !16, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 3, column: 22, scope: !15)
!19 = !DILocation(line: 3, column: 33, scope: !15)
!20 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 4, type: !21, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !9}
!23 = !DILocalVariable(name: "cond", arg: 1, scope: !20, file: !8, line: 4, type: !9)
!24 = !DILocation(line: 4, column: 28, scope: !20)
!25 = !DILocation(line: 4, column: 41, scope: !26)
!26 = distinct !DILexicalBlock(scope: !20, file: !8, line: 4, column: 39)
!27 = !DILocation(line: 4, column: 40, scope: !26)
!28 = !DILocation(line: 4, column: 39, scope: !20)
!29 = !DILocation(line: 4, column: 48, scope: !26)
!30 = !DILabel(scope: !31, name: "ERROR", file: !8, line: 4)
!31 = distinct !DILexicalBlock(scope: !26, file: !8, line: 4, column: 48)
!32 = !DILocation(line: 4, column: 50, scope: !31)
!33 = !DILocation(line: 4, column: 58, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !8, line: 4, column: 57)
!35 = !DILocation(line: 4, column: 72, scope: !34)
!36 = !DILocation(line: 4, column: 84, scope: !20)
!37 = distinct !DISubprogram(name: "svp_simple_700_001_isr_1", scope: !8, file: !8, line: 14, type: !38, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!41 = !DILocalVariable(name: "arg", arg: 1, scope: !37, file: !8, line: 14, type: !40)
!42 = !DILocation(line: 14, column: 37, scope: !37)
!43 = !DILocalVariable(name: "x", scope: !37, file: !8, line: 15, type: !9)
!44 = !DILocation(line: 15, column: 7, scope: !37)
!45 = !DILocation(line: 15, column: 11, scope: !37)
!46 = !DILocation(line: 16, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !37, file: !8, line: 16, column: 7)
!48 = !DILocation(line: 16, column: 9, scope: !47)
!49 = !DILocation(line: 16, column: 7, scope: !37)
!50 = !DILocation(line: 17, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 16, column: 18)
!52 = !DILocation(line: 17, column: 7, scope: !51)
!53 = !DILocation(line: 18, column: 9, scope: !51)
!54 = !DILocation(line: 18, column: 11, scope: !51)
!55 = !DILocation(line: 18, column: 7, scope: !51)
!56 = !DILocation(line: 20, column: 9, scope: !51)
!57 = !DILocation(line: 20, column: 7, scope: !51)
!58 = !DILocation(line: 22, column: 3, scope: !51)
!59 = !DILocation(line: 24, column: 1, scope: !37)
!60 = distinct !DISubprogram(name: "svp_simple_700_001_isr_2", scope: !8, file: !8, line: 26, type: !38, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "arg", arg: 1, scope: !60, file: !8, line: 26, type: !40)
!62 = !DILocation(line: 26, column: 37, scope: !60)
!63 = !DILocalVariable(name: "x", scope: !60, file: !8, line: 27, type: !9)
!64 = !DILocation(line: 27, column: 7, scope: !60)
!65 = !DILocation(line: 27, column: 11, scope: !60)
!66 = !DILocalVariable(name: "y", scope: !60, file: !8, line: 28, type: !9)
!67 = !DILocation(line: 28, column: 7, scope: !60)
!68 = !DILocation(line: 28, column: 11, scope: !60)
!69 = !DILocation(line: 30, column: 7, scope: !60)
!70 = !DILocation(line: 30, column: 5, scope: !60)
!71 = !DILocation(line: 31, column: 7, scope: !60)
!72 = !DILocation(line: 31, column: 5, scope: !60)
!73 = !DILocation(line: 33, column: 21, scope: !60)
!74 = !DILocation(line: 33, column: 26, scope: !60)
!75 = !DILocation(line: 33, column: 23, scope: !60)
!76 = !DILocation(line: 33, column: 3, scope: !60)
!77 = !DILocation(line: 35, column: 1, scope: !60)
!78 = distinct !DISubprogram(name: "svp_simple_700_001_main", scope: !8, file: !8, line: 48, type: !79, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!9}
!81 = !DILocalVariable(name: "x", scope: !78, file: !8, line: 49, type: !9)
!82 = !DILocation(line: 49, column: 7, scope: !78)
!83 = !DILocation(line: 49, column: 11, scope: !78)
!84 = !DILocalVariable(name: "y", scope: !78, file: !8, line: 50, type: !9)
!85 = !DILocation(line: 50, column: 7, scope: !78)
!86 = !DILocation(line: 50, column: 11, scope: !78)
!87 = !DILocation(line: 53, column: 7, scope: !78)
!88 = !DILocation(line: 53, column: 5, scope: !78)
!89 = !DILocation(line: 54, column: 7, scope: !78)
!90 = !DILocation(line: 54, column: 5, scope: !78)
!91 = !DILocation(line: 56, column: 21, scope: !78)
!92 = !DILocation(line: 56, column: 26, scope: !78)
!93 = !DILocation(line: 56, column: 23, scope: !78)
!94 = !DILocation(line: 56, column: 3, scope: !78)
!95 = !DILocation(line: 58, column: 21, scope: !78)
!96 = !DILocation(line: 58, column: 26, scope: !78)
!97 = !DILocation(line: 58, column: 23, scope: !78)
!98 = !DILocation(line: 58, column: 3, scope: !78)
!99 = !DILocation(line: 59, column: 3, scope: !78)
