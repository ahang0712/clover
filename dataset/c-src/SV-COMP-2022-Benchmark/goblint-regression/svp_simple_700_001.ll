; ModuleID = 'svp_simple_700_001.c'
source_filename = "svp_simple_700_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = global i32 42, align 4, !dbg !0
@h = global i32 42, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !14 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !19 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !22, metadata !DIExpression()), !dbg !23
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = icmp ne i32 %3, 0, !dbg !26
  br i1 %4, label %7, label %5, !dbg !27

5:                                                ; preds = %1
  br label %6, !dbg !28

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !29), !dbg !31
  call void @reach_error(), !dbg !32
  call void @abort() #4, !dbg !34
  unreachable, !dbg !34

7:                                                ; preds = %1
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_700_001_isr_1(i8* %0) #0 !dbg !36 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %3, metadata !42, metadata !DIExpression()), !dbg !43
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !44
  store i32 %4, i32* %3, align 4, !dbg !43
  %5 = load i32, i32* %3, align 4, !dbg !45
  %6 = icmp sgt i32 %5, -1000, !dbg !47
  br i1 %6, label %7, label %12, !dbg !48

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4, !dbg !49
  store i32 %8, i32* @g, align 4, !dbg !51
  %9 = load i32, i32* %3, align 4, !dbg !52
  %10 = sub nsw i32 %9, 17, !dbg !53
  store i32 %10, i32* @h, align 4, !dbg !54
  %11 = load i32, i32* %3, align 4, !dbg !55
  store i32 %11, i32* @h, align 4, !dbg !56
  br label %12, !dbg !57

12:                                               ; preds = %7, %1
  ret void, !dbg !58
}

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_700_001_isr_2(i8* %0) #0 !dbg !59 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %3, metadata !62, metadata !DIExpression()), !dbg !63
  %5 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !64
  store i32 %5, i32* %3, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %4, metadata !65, metadata !DIExpression()), !dbg !66
  %6 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !67
  store i32 %6, i32* %4, align 4, !dbg !66
  %7 = load i32, i32* @g, align 4, !dbg !68
  store i32 %7, i32* %3, align 4, !dbg !69
  %8 = load i32, i32* @h, align 4, !dbg !70
  store i32 %8, i32* %4, align 4, !dbg !71
  %9 = load i32, i32* %4, align 4, !dbg !72
  %10 = load i32, i32* %3, align 4, !dbg !73
  %11 = icmp sle i32 %9, %10, !dbg !74
  %12 = zext i1 %11 to i32, !dbg !74
  call void @__VERIFIER_assert(i32 %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_700_001_main() #0 !dbg !77 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !80, metadata !DIExpression()), !dbg !81
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !82
  store i32 %3, i32* %1, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %2, metadata !83, metadata !DIExpression()), !dbg !84
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !85
  store i32 %4, i32* %2, align 4, !dbg !84
  %5 = load i32, i32* @g, align 4, !dbg !86
  store i32 %5, i32* %1, align 4, !dbg !87
  %6 = load i32, i32* @h, align 4, !dbg !88
  store i32 %6, i32* %2, align 4, !dbg !89
  %7 = load i32, i32* %2, align 4, !dbg !90
  %8 = load i32, i32* %1, align 4, !dbg !91
  %9 = icmp eq i32 %7, %8, !dbg !92
  %10 = zext i1 %9 to i32, !dbg !92
  call void @__VERIFIER_assert(i32 %10), !dbg !93
  %11 = load i32, i32* %2, align 4, !dbg !94
  %12 = load i32, i32* %1, align 4, !dbg !95
  %13 = icmp eq i32 %11, %12, !dbg !96
  %14 = zext i1 %13 to i32, !dbg !96
  call void @__VERIFIER_assert(i32 %14), !dbg !97
  ret i32 0, !dbg !98
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 10, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_700_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !3, line: 11, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 3, type: !15, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 3, column: 22, scope: !14)
!18 = !DILocation(line: 3, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 4, type: !20, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !8}
!22 = !DILocalVariable(name: "cond", arg: 1, scope: !19, file: !3, line: 4, type: !8)
!23 = !DILocation(line: 4, column: 28, scope: !19)
!24 = !DILocation(line: 4, column: 41, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !3, line: 4, column: 39)
!26 = !DILocation(line: 4, column: 40, scope: !25)
!27 = !DILocation(line: 4, column: 39, scope: !19)
!28 = !DILocation(line: 4, column: 48, scope: !25)
!29 = !DILabel(scope: !30, name: "ERROR", file: !3, line: 4)
!30 = distinct !DILexicalBlock(scope: !25, file: !3, line: 4, column: 48)
!31 = !DILocation(line: 4, column: 50, scope: !30)
!32 = !DILocation(line: 4, column: 58, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !3, line: 4, column: 57)
!34 = !DILocation(line: 4, column: 72, scope: !33)
!35 = !DILocation(line: 4, column: 84, scope: !19)
!36 = distinct !DISubprogram(name: "svp_simple_700_001_isr_1", scope: !3, file: !3, line: 14, type: !37, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DILocalVariable(name: "arg", arg: 1, scope: !36, file: !3, line: 14, type: !39)
!41 = !DILocation(line: 14, column: 37, scope: !36)
!42 = !DILocalVariable(name: "x", scope: !36, file: !3, line: 15, type: !8)
!43 = !DILocation(line: 15, column: 7, scope: !36)
!44 = !DILocation(line: 15, column: 11, scope: !36)
!45 = !DILocation(line: 16, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !3, line: 16, column: 7)
!47 = !DILocation(line: 16, column: 9, scope: !46)
!48 = !DILocation(line: 16, column: 7, scope: !36)
!49 = !DILocation(line: 17, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 16, column: 18)
!51 = !DILocation(line: 17, column: 7, scope: !50)
!52 = !DILocation(line: 18, column: 9, scope: !50)
!53 = !DILocation(line: 18, column: 11, scope: !50)
!54 = !DILocation(line: 18, column: 7, scope: !50)
!55 = !DILocation(line: 20, column: 9, scope: !50)
!56 = !DILocation(line: 20, column: 7, scope: !50)
!57 = !DILocation(line: 22, column: 3, scope: !50)
!58 = !DILocation(line: 24, column: 1, scope: !36)
!59 = distinct !DISubprogram(name: "svp_simple_700_001_isr_2", scope: !3, file: !3, line: 26, type: !37, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "arg", arg: 1, scope: !59, file: !3, line: 26, type: !39)
!61 = !DILocation(line: 26, column: 37, scope: !59)
!62 = !DILocalVariable(name: "x", scope: !59, file: !3, line: 27, type: !8)
!63 = !DILocation(line: 27, column: 7, scope: !59)
!64 = !DILocation(line: 27, column: 11, scope: !59)
!65 = !DILocalVariable(name: "y", scope: !59, file: !3, line: 28, type: !8)
!66 = !DILocation(line: 28, column: 7, scope: !59)
!67 = !DILocation(line: 28, column: 11, scope: !59)
!68 = !DILocation(line: 30, column: 7, scope: !59)
!69 = !DILocation(line: 30, column: 5, scope: !59)
!70 = !DILocation(line: 31, column: 7, scope: !59)
!71 = !DILocation(line: 31, column: 5, scope: !59)
!72 = !DILocation(line: 33, column: 21, scope: !59)
!73 = !DILocation(line: 33, column: 26, scope: !59)
!74 = !DILocation(line: 33, column: 23, scope: !59)
!75 = !DILocation(line: 33, column: 3, scope: !59)
!76 = !DILocation(line: 35, column: 1, scope: !59)
!77 = distinct !DISubprogram(name: "svp_simple_700_001_main", scope: !3, file: !3, line: 48, type: !78, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DISubroutineType(types: !79)
!79 = !{!8}
!80 = !DILocalVariable(name: "x", scope: !77, file: !3, line: 49, type: !8)
!81 = !DILocation(line: 49, column: 7, scope: !77)
!82 = !DILocation(line: 49, column: 11, scope: !77)
!83 = !DILocalVariable(name: "y", scope: !77, file: !3, line: 50, type: !8)
!84 = !DILocation(line: 50, column: 7, scope: !77)
!85 = !DILocation(line: 50, column: 11, scope: !77)
!86 = !DILocation(line: 53, column: 7, scope: !77)
!87 = !DILocation(line: 53, column: 5, scope: !77)
!88 = !DILocation(line: 54, column: 7, scope: !77)
!89 = !DILocation(line: 54, column: 5, scope: !77)
!90 = !DILocation(line: 56, column: 21, scope: !77)
!91 = !DILocation(line: 56, column: 26, scope: !77)
!92 = !DILocation(line: 56, column: 23, scope: !77)
!93 = !DILocation(line: 56, column: 3, scope: !77)
!94 = !DILocation(line: 58, column: 21, scope: !77)
!95 = !DILocation(line: 58, column: 26, scope: !77)
!96 = !DILocation(line: 58, column: 23, scope: !77)
!97 = !DILocation(line: 58, column: 3, scope: !77)
!98 = !DILocation(line: 59, column: 3, scope: !77)
