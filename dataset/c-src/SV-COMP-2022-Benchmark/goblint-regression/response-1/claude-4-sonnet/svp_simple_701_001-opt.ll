; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_701_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_701_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = local_unnamed_addr global i32 0, align 4, !dbg !0
@h = local_unnamed_addr global i32 0, align 4, !dbg !6
@i = local_unnamed_addr global i32 0, align 4, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !17 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !20
  ret void, !dbg !21
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) local_unnamed_addr #0 !dbg !22 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !25, metadata !DIExpression()), !dbg !26
  %3 = load i32, i32* %2, align 4, !dbg !27
  %4 = icmp ne i32 %3, 0, !dbg !29
  br i1 %4, label %7, label %5, !dbg !30

5:                                                ; preds = %1
  br label %6, !dbg !31

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !32), !dbg !34
  call void @reach_error(), !dbg !35
  call void @abort() #4, !dbg !37
  unreachable, !dbg !37

7:                                                ; preds = %1
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_701_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !39 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !47
  store i32 %6, i32* %3, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %4, metadata !48, metadata !DIExpression()), !dbg !49
  %7 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !50
  store i32 %7, i32* %4, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %5, metadata !51, metadata !DIExpression()), !dbg !52
  %8 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !53
  store i32 %8, i32* %5, align 4, !dbg !52
  %9 = load i32, i32* %3, align 4, !dbg !54
  %10 = icmp slt i32 %9, 1000, !dbg !56
  br i1 %10, label %11, label %29, !dbg !57

11:                                               ; preds = %1
  %12 = load i32, i32* @g, align 4, !dbg !58
  store i32 %12, i32* %3, align 4, !dbg !60
  %13 = load i32, i32* @h, align 4, !dbg !61
  store i32 %13, i32* %4, align 4, !dbg !62
  %14 = load i32, i32* %4, align 4, !dbg !63
  %15 = load i32, i32* %3, align 4, !dbg !64
  %16 = icmp sle i32 %14, %15, !dbg !65
  %17 = zext i1 %16 to i32, !dbg !65
  call void @__VERIFIER_assert(i32 %17), !dbg !66
  %18 = load i32, i32* %3, align 4, !dbg !67
  %19 = load i32, i32* %4, align 4, !dbg !68
  %20 = icmp eq i32 %18, %19, !dbg !69
  %21 = zext i1 %20 to i32, !dbg !69
  call void @__VERIFIER_assert(i32 %21), !dbg !70
  %22 = load i32, i32* %3, align 4, !dbg !71
  %23 = add nsw i32 %22, 31, !dbg !72
  store i32 %23, i32* @i, align 4, !dbg !73
  %24 = load i32, i32* @i, align 4, !dbg !74
  store i32 %24, i32* %5, align 4, !dbg !75
  %25 = load i32, i32* %5, align 4, !dbg !76
  %26 = load i32, i32* %3, align 4, !dbg !77
  %27 = icmp sge i32 %25, %26, !dbg !78
  %28 = zext i1 %27 to i32, !dbg !78
  call void @__VERIFIER_assert(i32 %28), !dbg !79
  br label %29, !dbg !80

29:                                               ; preds = %11, %1
  ret void, !dbg !81
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_701_001_main() local_unnamed_addr #0 !dbg !82 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !87
  store i32 %2, i32* %1, align 4, !dbg !86
  %3 = load i32, i32* %1, align 4, !dbg !88
  %4 = icmp sgt i32 %3, -1000, !dbg !90
  br i1 %4, label %5, label %10, !dbg !91

5:                                                ; preds = %0
  store i32 11, i32* @i, align 4, !dbg !92
  %6 = load i32, i32* %1, align 4, !dbg !94
  store i32 %6, i32* @g, align 4, !dbg !95
  %7 = load i32, i32* %1, align 4, !dbg !96
  %8 = sub nsw i32 %7, 17, !dbg !97
  store i32 %8, i32* @h, align 4, !dbg !98
  %9 = load i32, i32* %1, align 4, !dbg !99
  store i32 %9, i32* @h, align 4, !dbg !100
  store i32 3, i32* @i, align 4, !dbg !101
  br label %10, !dbg !102

10:                                               ; preds = %5, %0
  ret i32 0, !dbg !103
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_701_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6, !10}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_701_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "i", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{!"clang version 10.0.0 "}
!17 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !18, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 2, column: 22, scope: !17)
!21 = !DILocation(line: 2, column: 33, scope: !17)
!22 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !23, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !9}
!25 = !DILocalVariable(name: "cond", arg: 1, scope: !22, file: !8, line: 3, type: !9)
!26 = !DILocation(line: 3, column: 28, scope: !22)
!27 = !DILocation(line: 3, column: 41, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !8, line: 3, column: 39)
!29 = !DILocation(line: 3, column: 40, scope: !28)
!30 = !DILocation(line: 3, column: 39, scope: !22)
!31 = !DILocation(line: 3, column: 48, scope: !28)
!32 = !DILabel(scope: !33, name: "ERROR", file: !8, line: 3)
!33 = distinct !DILexicalBlock(scope: !28, file: !8, line: 3, column: 48)
!34 = !DILocation(line: 3, column: 50, scope: !33)
!35 = !DILocation(line: 3, column: 58, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !8, line: 3, column: 57)
!37 = !DILocation(line: 3, column: 72, scope: !36)
!38 = !DILocation(line: 3, column: 84, scope: !22)
!39 = distinct !DISubprogram(name: "svp_simple_701_001_isr_1", scope: !8, file: !8, line: 14, type: !40, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!43 = !DILocalVariable(name: "arg", arg: 1, scope: !39, file: !8, line: 14, type: !42)
!44 = !DILocation(line: 14, column: 37, scope: !39)
!45 = !DILocalVariable(name: "x", scope: !39, file: !8, line: 15, type: !9)
!46 = !DILocation(line: 15, column: 7, scope: !39)
!47 = !DILocation(line: 15, column: 11, scope: !39)
!48 = !DILocalVariable(name: "y", scope: !39, file: !8, line: 16, type: !9)
!49 = !DILocation(line: 16, column: 7, scope: !39)
!50 = !DILocation(line: 16, column: 11, scope: !39)
!51 = !DILocalVariable(name: "z", scope: !39, file: !8, line: 17, type: !9)
!52 = !DILocation(line: 17, column: 7, scope: !39)
!53 = !DILocation(line: 17, column: 11, scope: !39)
!54 = !DILocation(line: 18, column: 7, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !8, line: 18, column: 7)
!56 = !DILocation(line: 18, column: 9, scope: !55)
!57 = !DILocation(line: 18, column: 7, scope: !39)
!58 = !DILocation(line: 19, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !8, line: 18, column: 17)
!60 = !DILocation(line: 19, column: 7, scope: !59)
!61 = !DILocation(line: 20, column: 9, scope: !59)
!62 = !DILocation(line: 20, column: 7, scope: !59)
!63 = !DILocation(line: 21, column: 23, scope: !59)
!64 = !DILocation(line: 21, column: 28, scope: !59)
!65 = !DILocation(line: 21, column: 25, scope: !59)
!66 = !DILocation(line: 21, column: 5, scope: !59)
!67 = !DILocation(line: 23, column: 23, scope: !59)
!68 = !DILocation(line: 23, column: 28, scope: !59)
!69 = !DILocation(line: 23, column: 25, scope: !59)
!70 = !DILocation(line: 23, column: 5, scope: !59)
!71 = !DILocation(line: 25, column: 9, scope: !59)
!72 = !DILocation(line: 25, column: 11, scope: !59)
!73 = !DILocation(line: 25, column: 7, scope: !59)
!74 = !DILocation(line: 26, column: 9, scope: !59)
!75 = !DILocation(line: 26, column: 7, scope: !59)
!76 = !DILocation(line: 27, column: 23, scope: !59)
!77 = !DILocation(line: 27, column: 28, scope: !59)
!78 = !DILocation(line: 27, column: 25, scope: !59)
!79 = !DILocation(line: 27, column: 5, scope: !59)
!80 = !DILocation(line: 29, column: 3, scope: !59)
!81 = !DILocation(line: 31, column: 1, scope: !39)
!82 = distinct !DISubprogram(name: "svp_simple_701_001_main", scope: !8, file: !8, line: 33, type: !83, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!9}
!85 = !DILocalVariable(name: "x", scope: !82, file: !8, line: 34, type: !9)
!86 = !DILocation(line: 34, column: 7, scope: !82)
!87 = !DILocation(line: 34, column: 11, scope: !82)
!88 = !DILocation(line: 35, column: 7, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !8, line: 35, column: 7)
!90 = !DILocation(line: 35, column: 9, scope: !89)
!91 = !DILocation(line: 35, column: 7, scope: !82)
!92 = !DILocation(line: 37, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 35, column: 18)
!94 = !DILocation(line: 38, column: 9, scope: !93)
!95 = !DILocation(line: 38, column: 7, scope: !93)
!96 = !DILocation(line: 39, column: 9, scope: !93)
!97 = !DILocation(line: 39, column: 11, scope: !93)
!98 = !DILocation(line: 39, column: 7, scope: !93)
!99 = !DILocation(line: 41, column: 9, scope: !93)
!100 = !DILocation(line: 41, column: 7, scope: !93)
!101 = !DILocation(line: 43, column: 7, scope: !93)
!102 = !DILocation(line: 45, column: 3, scope: !93)
!103 = !DILocation(line: 46, column: 3, scope: !82)
