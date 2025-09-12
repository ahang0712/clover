; ModuleID = 'svp_simple_701_001.c'
source_filename = "svp_simple_701_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = global i32 0, align 4, !dbg !0
@h = global i32 0, align 4, !dbg !6
@i = global i32 0, align 4, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !16 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !19
  ret void, !dbg !20
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !21 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !24, metadata !DIExpression()), !dbg !25
  %3 = load i32, i32* %2, align 4, !dbg !26
  %4 = icmp ne i32 %3, 0, !dbg !28
  br i1 %4, label %7, label %5, !dbg !29

5:                                                ; preds = %1
  br label %6, !dbg !30

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !31), !dbg !33
  call void @reach_error(), !dbg !34
  call void @abort() #4, !dbg !36
  unreachable, !dbg !36

7:                                                ; preds = %1
  ret void, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_701_001_isr_1(i8* %0) #0 !dbg !38 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %3, metadata !44, metadata !DIExpression()), !dbg !45
  %6 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !46
  store i32 %6, i32* %3, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %4, metadata !47, metadata !DIExpression()), !dbg !48
  %7 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !49
  store i32 %7, i32* %4, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %5, metadata !50, metadata !DIExpression()), !dbg !51
  %8 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !52
  store i32 %8, i32* %5, align 4, !dbg !51
  %9 = load i32, i32* %3, align 4, !dbg !53
  %10 = icmp slt i32 %9, 1000, !dbg !55
  br i1 %10, label %11, label %29, !dbg !56

11:                                               ; preds = %1
  %12 = load i32, i32* @g, align 4, !dbg !57
  store i32 %12, i32* %3, align 4, !dbg !59
  %13 = load i32, i32* @h, align 4, !dbg !60
  store i32 %13, i32* %4, align 4, !dbg !61
  %14 = load i32, i32* %4, align 4, !dbg !62
  %15 = load i32, i32* %3, align 4, !dbg !63
  %16 = icmp sle i32 %14, %15, !dbg !64
  %17 = zext i1 %16 to i32, !dbg !64
  call void @__VERIFIER_assert(i32 %17), !dbg !65
  %18 = load i32, i32* %3, align 4, !dbg !66
  %19 = load i32, i32* %4, align 4, !dbg !67
  %20 = icmp eq i32 %18, %19, !dbg !68
  %21 = zext i1 %20 to i32, !dbg !68
  call void @__VERIFIER_assert(i32 %21), !dbg !69
  %22 = load i32, i32* %3, align 4, !dbg !70
  %23 = add nsw i32 %22, 31, !dbg !71
  store i32 %23, i32* @i, align 4, !dbg !72
  %24 = load i32, i32* @i, align 4, !dbg !73
  store i32 %24, i32* %5, align 4, !dbg !74
  %25 = load i32, i32* %5, align 4, !dbg !75
  %26 = load i32, i32* %3, align 4, !dbg !76
  %27 = icmp sge i32 %25, %26, !dbg !77
  %28 = zext i1 %27 to i32, !dbg !77
  call void @__VERIFIER_assert(i32 %28), !dbg !78
  br label %29, !dbg !79

29:                                               ; preds = %11, %1
  ret void, !dbg !80
}

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_701_001_main() #0 !dbg !81 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !86
  store i32 %2, i32* %1, align 4, !dbg !85
  %3 = load i32, i32* %1, align 4, !dbg !87
  %4 = icmp sgt i32 %3, -1000, !dbg !89
  br i1 %4, label %5, label %10, !dbg !90

5:                                                ; preds = %0
  store i32 11, i32* @i, align 4, !dbg !91
  %6 = load i32, i32* %1, align 4, !dbg !93
  store i32 %6, i32* @g, align 4, !dbg !94
  %7 = load i32, i32* %1, align 4, !dbg !95
  %8 = sub nsw i32 %7, 17, !dbg !96
  store i32 %8, i32* @h, align 4, !dbg !97
  %9 = load i32, i32* %1, align 4, !dbg !98
  store i32 %9, i32* @h, align 4, !dbg !99
  store i32 3, i32* @i, align 4, !dbg !100
  br label %10, !dbg !101

10:                                               ; preds = %5, %0
  ret i32 0, !dbg !102
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 9, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_701_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0, !6, !9}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !3, line: 10, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "i", scope: !2, file: !3, line: 11, type: !8, isLocal: false, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 2, type: !17, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 2, column: 22, scope: !16)
!20 = !DILocation(line: 2, column: 33, scope: !16)
!21 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 3, type: !22, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !8}
!24 = !DILocalVariable(name: "cond", arg: 1, scope: !21, file: !3, line: 3, type: !8)
!25 = !DILocation(line: 3, column: 28, scope: !21)
!26 = !DILocation(line: 3, column: 41, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !3, line: 3, column: 39)
!28 = !DILocation(line: 3, column: 40, scope: !27)
!29 = !DILocation(line: 3, column: 39, scope: !21)
!30 = !DILocation(line: 3, column: 48, scope: !27)
!31 = !DILabel(scope: !32, name: "ERROR", file: !3, line: 3)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 3, column: 48)
!33 = !DILocation(line: 3, column: 50, scope: !32)
!34 = !DILocation(line: 3, column: 58, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !3, line: 3, column: 57)
!36 = !DILocation(line: 3, column: 72, scope: !35)
!37 = !DILocation(line: 3, column: 84, scope: !21)
!38 = distinct !DISubprogram(name: "svp_simple_701_001_isr_1", scope: !3, file: !3, line: 14, type: !39, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DILocalVariable(name: "arg", arg: 1, scope: !38, file: !3, line: 14, type: !41)
!43 = !DILocation(line: 14, column: 37, scope: !38)
!44 = !DILocalVariable(name: "x", scope: !38, file: !3, line: 15, type: !8)
!45 = !DILocation(line: 15, column: 7, scope: !38)
!46 = !DILocation(line: 15, column: 11, scope: !38)
!47 = !DILocalVariable(name: "y", scope: !38, file: !3, line: 16, type: !8)
!48 = !DILocation(line: 16, column: 7, scope: !38)
!49 = !DILocation(line: 16, column: 11, scope: !38)
!50 = !DILocalVariable(name: "z", scope: !38, file: !3, line: 17, type: !8)
!51 = !DILocation(line: 17, column: 7, scope: !38)
!52 = !DILocation(line: 17, column: 11, scope: !38)
!53 = !DILocation(line: 18, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !38, file: !3, line: 18, column: 7)
!55 = !DILocation(line: 18, column: 9, scope: !54)
!56 = !DILocation(line: 18, column: 7, scope: !38)
!57 = !DILocation(line: 19, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 18, column: 17)
!59 = !DILocation(line: 19, column: 7, scope: !58)
!60 = !DILocation(line: 20, column: 9, scope: !58)
!61 = !DILocation(line: 20, column: 7, scope: !58)
!62 = !DILocation(line: 21, column: 23, scope: !58)
!63 = !DILocation(line: 21, column: 28, scope: !58)
!64 = !DILocation(line: 21, column: 25, scope: !58)
!65 = !DILocation(line: 21, column: 5, scope: !58)
!66 = !DILocation(line: 23, column: 23, scope: !58)
!67 = !DILocation(line: 23, column: 28, scope: !58)
!68 = !DILocation(line: 23, column: 25, scope: !58)
!69 = !DILocation(line: 23, column: 5, scope: !58)
!70 = !DILocation(line: 25, column: 9, scope: !58)
!71 = !DILocation(line: 25, column: 11, scope: !58)
!72 = !DILocation(line: 25, column: 7, scope: !58)
!73 = !DILocation(line: 26, column: 9, scope: !58)
!74 = !DILocation(line: 26, column: 7, scope: !58)
!75 = !DILocation(line: 27, column: 23, scope: !58)
!76 = !DILocation(line: 27, column: 28, scope: !58)
!77 = !DILocation(line: 27, column: 25, scope: !58)
!78 = !DILocation(line: 27, column: 5, scope: !58)
!79 = !DILocation(line: 29, column: 3, scope: !58)
!80 = !DILocation(line: 31, column: 1, scope: !38)
!81 = distinct !DISubprogram(name: "svp_simple_701_001_main", scope: !3, file: !3, line: 33, type: !82, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!8}
!84 = !DILocalVariable(name: "x", scope: !81, file: !3, line: 34, type: !8)
!85 = !DILocation(line: 34, column: 7, scope: !81)
!86 = !DILocation(line: 34, column: 11, scope: !81)
!87 = !DILocation(line: 35, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !3, line: 35, column: 7)
!89 = !DILocation(line: 35, column: 9, scope: !88)
!90 = !DILocation(line: 35, column: 7, scope: !81)
!91 = !DILocation(line: 37, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 35, column: 18)
!93 = !DILocation(line: 38, column: 9, scope: !92)
!94 = !DILocation(line: 38, column: 7, scope: !92)
!95 = !DILocation(line: 39, column: 9, scope: !92)
!96 = !DILocation(line: 39, column: 11, scope: !92)
!97 = !DILocation(line: 39, column: 7, scope: !92)
!98 = !DILocation(line: 41, column: 9, scope: !92)
!99 = !DILocation(line: 41, column: 7, scope: !92)
!100 = !DILocation(line: 43, column: 7, scope: !92)
!101 = !DILocation(line: 45, column: 3, scope: !92)
!102 = !DILocation(line: 46, column: 3, scope: !81)
